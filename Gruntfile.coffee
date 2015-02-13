module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    coffee:
      compileSrc:
        files: [
          expand: true
          cwd: 'src'
          src: ['**/*.coffee']
          dest: 'target/app'
          rename: (dest, src) ->
            dest + '/' + src.substring(0, src.lastIndexOf('.')) + '.js'
        ]
      compileTest:
        files: [
          expand: true
          cwd: 'test'
          src: ['**/*.coffee']
          dest: 'target/test'
          rename: (dest, src) ->
            dest + '/' + src.substring(0, src.lastIndexOf('.')) + '.js'
        ]
    copy:
      views:
        files: [
          expand: true
          cwd: 'src/views'
          src: ['**']
          dest: 'target/app/views'
        ]
      templates:
        files: [
          expand: true
          cwd: 'src/public/templates'
          src: ['**']
          dest: 'target/app/public/templates'
        ]
      styles:
        files: [
          expand: true
          cwd: 'src/public/css'
          src: ['**']
          dest: 'target/app/public/css'
        ]
    protractor_webdriver:
      start:
        options:
          path: 'node_modules/protractor/bin/'
          command: 'webdriver-manager start'
    protractor:
      options:
        configFile: 'protractor.conf.js'
      run: {}
    watch:
      compileSrc:
        files: 'src/**/*.coffee'
        tasks: 'coffee:compileSrc'
      compileTest:
        files: 'test/**/*.coffee'
        tasks: 'coffee:compileTest'
      views:
        files: 'src/views/**'
        tasks: 'copy:views'
      templates:
        files: 'src/public/templates/**'
        tasks: 'copy:templates'
      styles:
        files: 'src/public/css/**'
        tasks: 'copy:styles'

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-protractor-webdriver')
  grunt.loadNpmTasks('grunt-protractor-runner')

  grunt.registerTask('compile', ['coffee', 'copy'])
  grunt.registerTask('test', ['protractor_webdriver', 'protractor'])
