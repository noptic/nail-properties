module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffee:
      source:
        expand: true
        cwd: 'src'
        src: ['*.coffee']
        dest: 'lib'
        ext: '.js'
      specs:
        expand: true
        cwd: 'specs'
        src: ['*.coffee.md']
        dest: 'test'
        ext: '_spec.js'

    nodeunit:
      specs: ['test/**/*_spec.js']

    watch:
      src:
        files: ['src/**/*.coffee']
        tasks: ['coffee']
      lib:
        files: ['lib/**/*.js']
        tasks: ['nodeunit']
      test:
        files: ['test/**/*.coffee']
        tasks: ['nodeunit']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-nodeunit'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffee', 'nodeunit']
