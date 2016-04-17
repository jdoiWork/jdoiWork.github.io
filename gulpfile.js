var gulp = require('gulp');
var shell = require('gulp-shell');

gulp.task('default', shell.task(
  'elm make src/Main.elm --output dst/main.js' 
));
