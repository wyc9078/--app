const gulp = require('gulp');
const zip = require('gulp-zip');
const ftp = require('gulp-ftp');
const gutil = require('gulp-util');

gulp.task('copy', function () {
    return gulp.src('run/*')
        .pipe(gulp.dest('dist/'))
});



gulp.task('zip', () =>
    gulp.src('dist/**/*')
        .pipe(zip('code.zip'))
        .pipe(gulp.dest('./'))
);


gulp.task('ftp', function () {
    return gulp.src('code.zip')
        .pipe(ftp({
            host: '103.95.207.27',
            user: 'shops',
            pass: 'AWWyWBXww8'
        }))
        .pipe(gutil.noop());
});