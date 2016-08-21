{
  'targets': [
    {
      'target_name': 'canvas',
      'sources': [
        'src/Canvas.cc',
        'src/CanvasGradient.cc',
        'src/CanvasPattern.cc',
        'src/CanvasRenderingContext2d.cc',
        'src/color.cc',
        'src/Image.cc',
        'src/ImageData.cc',
        'src/init.cc',
        'src/FontFace.cc'
      ],
      'defines': [
        'HAVE_GIF',
        'HAVE_JPEG',
        'HAVE_FREETYPE',
        'HAVE_PANGO'
      ],
      'libraries': [
        '<!@(pkg-config pixman-1 --libs)',
        '<!@(pkg-config cairo --libs)',
        '<!@(pkg-config libpng --libs)',
        '<!@(pkg-config pangocairo --libs)',
        '-ljpeg',
        '-lgif'
      ],
      'include_dirs': [
        '<!(node -e "require(\'nan\')")',
        '<!@(pkg-config cairo --cflags-only-I | sed s/-I//g)',
        '<!@(pkg-config libpng --cflags-only-I | sed s/-I//g)',
        '<!@(pkg-config pangocairo --cflags-only-I | sed s/-I//g)'
      ]
    }
  ]
}
