gulp  = require('gulp')
shell = require('gulp-shell')
sass  = require('gulp-sass')

gulp.task 'default', ['elm', 'sass', 'json']

gulp.task 'elm',
  shell.task('elm make src/Main.elm --output dst/main.js', verbose: true)

gulp.task 'sass', ->
  gulp
    .src('./src/*.sass')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./dst'))

gulp.task 'json', ->
  gulp
    .src('./src/*.json')
    .pipe(gulp.dest('./dst'))

gulp.task 'watch', ->
  gulp.watch './src/*.elm', [ 'elm' ]
  gulp.watch './src/*.sass', [ 'sass' ]
  gulp.watch './src/*.json', [ 'json' ]
  return