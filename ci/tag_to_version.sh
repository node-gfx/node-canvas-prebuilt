# the tag for 1.4.0 does not have a 'v', but the ones after it
# do, so we need this conversion script to make both versions
# work. 1.4.0 cannot simply be changed because the npm package
# uses the URL without the 'v' in it

if [ "${1:0:1}" = "v" ]; then
  echo ${1:1}
else
  echo $1;
fi

