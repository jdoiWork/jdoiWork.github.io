gulp = require('gulp')
shell = require('gulp-shell')
gulp.task 'default', shell.task('elm make src/Main.elm --output dst/main.js', verbose: true)
