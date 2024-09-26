const gulp = require('gulp');
const exec = require('child_process').exec;
const rename = require('gulp-rename');

const concat = require('gulp-concat');
const uglify = require('gulp-uglify');

const fs = require("fs-extra");
const path = require('path');

const cp = (src, dest) => {
    gulp.src(src).pipe(gulp.dest(dest));
}
const cpr = (src, dest, cb) => {
    // const source = path.join(__dirname, src);
    // const destination = path.join(__dirname, dest);
    // console.log(source, destination);
    fs.copy(src, dest, (err) => {
        if(cb) cb();
    });
}


gulp.task('copy-resources',  (done) => {
    cpr('bower_components/bootstrap/dist','public/lib/bootstrap');
    cpr('bower_components/bootstrap-combobox/css/bootstrap-combobox.css','public/lib/bootstrap-combobox/bootstrap-combobox.css');
    cpr('bower_components/bootstrap-combobox/js/bootstrap-combobox.js','public/lib/bootstrap-combobox/bootstrap-combobox.js');
    cpr('node_modules/ckeditor','public/lib/ckeditor');
    cpr('bower_components/font-awesome/css','public/lib/font-awesome/css');
    cpr('bower_components/font-awesome/fonts','public/lib/font-awesome/fonts');
    cpr('bower_components/font-awesome/less','public/lib/font-awesome/less');
    cpr('bower_components/font-awesome/scss','public/lib/font-awesome/scss');
    cp('bower_components/jquery-php/javascript/jquery.php.js','public/lib/jquery-php');
    cp('bower_components/jquery-php/library/jQuery.php','./');
    cp('node_modules/jquery/dist/jquery.min.js','public/lib/jquery');
    cp('bower_components/moment/min/moment.min.js','public/lib/moment');
    cpr('node_modules/summernote/dist','public/lib/summernote', () => {
        cpr('node_modules/summernote/dist/plugin/hello/summernote-ext-hello.js','public/lib/summernote/summernote-ext-hello.js');
    });
    cpr('vendor/royalsoftkv/smartyfaces-core/assets','public/lib/smartyfaces', () => {
        cpr('vendor/royalsoftkv/smartyfaces-core/assets/css/smartyfaces.css','public/lib/smartyfaces/smartyfaces.css');
    });
    // cp('vendor/royalsoftkv/smartyfaces-core/img/*','public/lib/smartyfaces/img'));
    cpr('bower_components/codemirror/lib','public/lib/codemirror', () => {
        cpr('bower_components/codemirror/mode/smarty/smarty.js','public/lib/codemirror/smarty.js');
    });

    cpr('assets/js','public/js');
    cpr('assets/css','public/css');
    cpr('assets/img','public/img');
    cpr('bower_components/SyntaxHighlighter/styles','public/lib/SyntaxHighlighter/styles');
    cpr('bower_components/SyntaxHighlighter/scripts','public/lib/SyntaxHighlighter/scripts');
    cp('bower_components/socket.io-client/dist/socket.io.js','public/lib/socket.io');
    done();
});

gulp.task('exec',  (done) => {
    exec('ls', function (err, stdout, stderr) {
        console.log(stdout);
        console.log(stderr);
    });
});

gulp.task('clean',  (done) => {
    fs.remove('public/lib', done)
});

gulp.task('default', gulp.series('clean','copy-resources'));

gulp.task('test', (done) => {
    cp('bower_components/bootstrap/dist','public/lib/bootstrap');
    done();
});
