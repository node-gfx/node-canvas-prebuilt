const https = require('https');
const fs = require('fs');
const parseUrl = require('url').parse;

const httpErrors = [400, 401, 403, 404];
const httpEmptyOk = [201, 204];

// Promisified version of https.request that provides GH auth from the
// environment (which makes it useless outside of prebuilt)
const request = (method, host, path, buffer, contentType) => {
  const r = https.request({
    method: method,
    hostname: host,
    path: path,
    auth: process.env['PREBUILD_AUTH'],
    headers: {
      'User-Agent': 'prebuild',
      'Accept': 'application/json',
      'Host': host,
      'Content-Length': '0'
    }
  });

  if (buffer != null) {
    r.setHeader('Content-Type', contentType);
    r.setHeader('Content-Length', buffer.length);
    r.write(buffer);
  }

  r.end();

  console.log(method + ' ' + path);

  return new Promise((accept, reject) => {
    r.on('response', resp => {
      let s = '';
      resp.on('readable', () => {
        let buf = resp.read();
        if (buf) s += buf.toString('utf-8');
      });
      resp.on('error', reject);
      resp.on('end', () => {
        if (httpErrors.indexOf(resp.statusCode) > -1) {
          reject({path: path, json: JSON.parse(s)});
        } else if (httpEmptyOk.indexOf(resp.statusCode) > -1) {
          accept();
        } else {
          accept(JSON.parse(s))
        }
      });
    });
  });
};

// Same as request, but the host and path can be passed as a (HTTPS) URL
const requestUrl = (method, url, buffer, contentType) => {
  let path, parsed = parseUrl(url), host = parsed.hostname;
  path = parsed.pathname + (parsed.search ? parsed.search : '');
  return request(method, host, path, buffer, contentType);
};

// Promisified fs.readdir but only returns files with an extension
const readdir = (dir, ext) => {
  let rExt = new RegExp(ext + '$');
  return new Promise((accept, reject) => {
    fs.readdir(dir, (err, result) => {
      if (err) return reject(err);
      accept(result.filter(file => file.match(rExt)));
    });
  });
};

// Promisified fs.readFile
const readfile = (filename) => {
  return new Promise((accept, reject) => {
    fs.readFile(filename, (err, buf) => err ? reject(err) : accept(buf));
  });
};

const getRelease = async function (tag) {
  let urlParts = ['/repos', process.env['PREBUILD_SLUG'], 'releases'];
  let all = await request('GET', 'api.github.com', urlParts.join('/'));
  return all.find(r => r.tag_name === tag);
};

const uploadAssets = async function (tag) {
  let files, buffers, toDelete, release = await getRelease(tag);

  if (!release) {
    console.error('Could not find release with tag ' + tag + '! Did you create it?');
    process.exit(1);
  }

  files = await readdir('.', '.tar.gz');
  console.log('Uploading ' + files.length + ' asset' + (files.length === 1 ? '' : 's'));
  buffers = await Promise.all(files.map(readfile));
  toDelete = release.assets.filter(asset => files.indexOf(asset.name) > -1);

  await Promise.all(toDelete.map(asset => requestUrl('DELETE', asset.url)));
  await Promise.all(files.map((name, i) => {
    let url = release.upload_url.match(/[^{]*/)[0] + '?name=' + encodeURIComponent(name);
    return requestUrl('POST', url, buffers[i], 'application/x-gzip');
  }));

  return 'OK!';
};

// Unfortunately the NPM package looks for the tag 1.4.0 and that can't be changed
const tag = process.argv[2] === '1.4.0' ? '1.4.0' : 'v' + process.argv[2];
uploadAssets(tag).then(console.log, e => {
  console.error(e);
  process.exit(1);
});
