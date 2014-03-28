exports.config =
  modules: [
    "server"
    "browserify"
    "csslint"
    "jshint"
    "live-reload"
    "bower"
    "minify-js"
    "minify-css"
    "coffeescript"
    "ember-handlebars"
    "copy"
    "sass"
    "combine"]
  template:
    wrapType: 'common'
    commonLibPath: 'ember'
  browserify:
    bundles:
      [
        entries: ['javascripts/main.js']
        outputFile: 'bundle.js'
      ]
    shims:
      jquery:
        path: 'javascripts/vendor/jquery/jquery'
        exports: '$'
      handlebars:
        path: 'javascripts/vendor/handlebars/handlebars'
        exports: 'Handlebars'
      ember:
        path: 'javascripts/vendor/ember/ember'
        exports: 'Ember'
        depends:
          handlebars: 'Handlebars'
          jquery: '$'
      emberdata:
        path: 'javascripts/vendor/ember-data/ember-data'
        exports: 'DS'
        depends:
          ember: 'Ember'
      bootstrap: 
        path: 'javascripts/vendor/bootstrap/bootstrap'
        exports: 'bootstrap'
        depends:
          jquery: '$'
      moment:
        path: 'javascripts/vendor/momentjs/moment'
        exports: 'moment'
      config:
        exports: 'config'
        path: 'javascripts/config/development'
    noParse:
      [
        'javascripts/vendor/jquery/jquery'
        'javascripts/vendor/ember/handlebars'
        'javascripts/vendor/ember/ember'
      ]
  bower:
    copy:
      mainOverrides:
        'bootstrap-sass-official': [
           {'vendor/assets/javascripts': './'}
           {'vendor/assets/stylesheets': './'}
           {'vendor/assets/fonts': '../../fonts'}
        ]
  combine:
    folders: [
        folder: 'javascripts/vendor/bootstrap'
        output: 'javascripts/vendor/bootstrap/bootstrap.js'
        order: [
          'affix.js',
          'alert.js',
          'button.js',
          'carousel.js',
          'collapse.js',
          'dropdown.js',
          'tab.js',
          'transition.js',
          'scrollspy.js',
          'modal.js',
          'tooltip.js',
          'popover.js'
        ]
      ]