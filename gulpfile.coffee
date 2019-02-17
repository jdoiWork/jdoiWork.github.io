gulp     = require('gulp')
shell    = require('gulp-shell')
sass     = require('gulp-sass')
prettify = require('gulp-jsbeautifier')

opts =
  prettify:
    indent_size: 2
    end_with_newline: true

gulp.task 'elm',
  shell.task('elm make src/Main.elm --output tmp/main.js', verbose: true)

gulp.task 'sass', ->
  gulp
    .src('./src/*.sass')
    .pipe(sass().on('error', sass.logError))
    .pipe(prettify(opts.prettify))
    .pipe(gulp.dest('./dst'))

gulp.task 'json', ->
  gulp
    .src('./src/*.json')
    .pipe(prettify(opts.prettify))
    .pipe(gulp.dest('./dst'))

gulp.task 'js', ->
  gulp
    .src(['./tmp/*.js', './src/*.js'])
    .pipe(prettify(opts.prettify))
    .pipe(gulp.dest('./dst'))

gulp.task 'watch', ->
  gulp.watch './src/*.elm',  gulp.task('elm')
  gulp.watch './src/*.sass', gulp.task('sass')
  gulp.watch './src/*.json', gulp.task('json')
  gulp.watch './tmp/*.json', gulp.task('js'  )
  return

gulp.task 'default', gulp.series('elm', 'sass', 'json', 'js')
