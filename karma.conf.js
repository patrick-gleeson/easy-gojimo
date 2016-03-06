module.exports = function(config){
  config.set({

    basePath : './',

    files : [
      'vendor/assets/bower_components/angular/angular.js',
      'vendor/assets/bower_components/angular-route/angular-route.js',
      'vendor/assets/bower_components/angular-mocks/angular-mocks.js',
      'vendor/assets/bower_components/angular-http-etag/release/angular-http-etag.js',
      'app/assets/javascripts/qualifications/**/*.js',
      'unit_tests/**/*.js'
    ],

    autoWatch : true,

    frameworks: ['jasmine'],

    browsers : ['Chrome'],

    plugins : [
            'karma-chrome-launcher',
            'karma-firefox-launcher',
            'karma-jasmine',
            'karma-junit-reporter'
            ],

    junitReporter : {
      outputFile: 'test_out/unit.xml',
      suite: 'unit'
    }

  });
};
