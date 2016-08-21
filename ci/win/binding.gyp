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
        # can't have pango on windows because strndup() is used
        # see https://ci.appveyor.com/project/chearon/node-canvas-prebuilt/build/0.0.10
        #'HAVE_PANGO',
        'HAVE_BOOLEAN', # or jmorecfg.h tries to define it
        '_USE_MATH_DEFINES' # for M_PI
      ],
      'libraries': [
        'C:/msys64/mingw64/lib/libcairo-2.lib',
        'C:/msys64/mingw64/lib/libpng16-16.lib',
        'C:/msys64/mingw64/lib/libjpeg-8.lib',
        'C:/msys64/mingw64/lib/libpango-1.0-0.lib',
        'C:/msys64/mingw64/lib/libpangocairo-1.0-0.lib',
        'C:/msys64/mingw64/lib/libgobject-2.0-0.lib',
        'C:/msys64/mingw64/lib/libglib-2.0-0.lib',
        'C:/msys64/mingw64/lib/libturbojpeg-0.lib',
        'C:/msys64/mingw64/lib/libgif-7.lib',
        'C:/msys64/mingw64/lib/libfreetype-6.lib'
      ],
      'include_dirs': [
        '<!(node -e "require(\'nan\')")',
        'C:/msys64/mingw64/include',
        'C:/msys64/mingw64/include/pango-1.0',
        'C:/msys64/mingw64/include/cairo',
        'C:/msys64/mingw64/include/libpng16',
        'C:/msys64/mingw64/include/glib-2.0',
        'C:/msys64/mingw64/lib/glib-2.0/include',
        'C:/msys64/mingw64/include/pixman-1',
        'C:/msys64/mingw64/include/freetype2',
        'C:/msys64/mingw64/include/fontconfig'
      ],
      'configurations': {
        'Debug': {
          'msvs_settings': {
            'VCCLCompilerTool': {
              'WarningLevel': 4,
              'ExceptionHandling': 1,
              'DisableSpecificWarnings': [4100, 4127, 4201, 4244, 4267, 4506, 4611, 4714, 4512]
            }
          }
        },
        'Release': {
          'msvs_settings': {
            'VCCLCompilerTool': {
              'WarningLevel': 4,
              'ExceptionHandling': 1,
              'DisableSpecificWarnings': [4100, 4127, 4201, 4244, 4267, 4506, 4611, 4714, 4512]
            }
          }
        }
      }
    }
  ]
}
