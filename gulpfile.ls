require! <[gulp gulp-jade gulp-ruby-sass]>

build-path = \public

gulp.task \jade !->
  opt =
   lib:
    jquery: true
    semantic: true
  gulp.src \views/*.jade
    .pipe gulp-jade locals: opt
    .pipe gulp.dest build-path

gulp.task \sass !->
  gulp.src \sass/*.sass
    .pipe gulp-ruby-sass compass: true
    .pipe gulp.dest "#build-path/css"

gulp.task \watch, !->
  gulp.watch \views/*.jade, <[jade]>
  gulp.watch \sass/*.sass, <[sass]>

gulp.task \build <[jade sass]>
gulp.task \default <[build]>
gulp.task \dev <[build watch]>

# vi:et:ft=ls:nowrap:sw=2:ts=2
