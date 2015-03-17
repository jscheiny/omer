module.exports = (grunt) ->

  fileSet = (dir, ext, newExt=undefined) -> if newExt? then [
    expand : true
    cwd    : dir
    src    : ["**/*#{ext}"]
    dest   : "build/#{dir}"
    ext    : newExt
  ] else [
    expand : true
    cwd    : dir
    src    : ["**/*#{ext}"]
    dest   : "build/#{dir}"
  ]

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    clean:
      build:
        src: ['build']
    coffee:
      compile:
        files: fileSet 'src', '.coffee', '.js'
    copy:
      external:
        files: fileSet 'ext', '.js'
      html:
        src: 'omer.html'
        dest: 'build/index.html'
    less:
      compile:
        files: fileSet 'style', '.less', '.css'

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-less'

  grunt.registerTask 'default', [
    'clean'
    'coffee'
    'copy'
    'less'
  ]
