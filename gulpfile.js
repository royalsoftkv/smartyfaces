var gulp = require('gulp');
var exec = require('child_process').exec;
var rename = require('gulp-rename');

var concat = require('gulp-concat');
var uglify = require('gulp-uglify');

gulp.task('default', function () {
    gulp.start('copy-resources');
    gulp.start('scripts');

});

gulp.task('copy-resources', function () {
    gulp.src('bower_components/bootstrap/dist/**/*').pipe(gulp.dest('public/lib/bootstrap'));
    gulp.src('bower_components/bootstrap-combobox/css/*').pipe(gulp.dest('public/lib/bootstrap-combobox'));
    gulp.src('bower_components/bootstrap-combobox/js/*').pipe(gulp.dest('public/lib/bootstrap-combobox'));
    gulp.src('bower_components/eonasdan-bootstrap-datetimepicker/build/css/*').pipe(gulp.dest('public/lib/bootstrap-datetimepicker/css'));
    gulp.src('bower_components/eonasdan-bootstrap-datetimepicker/build/js/*').pipe(gulp.dest('public/lib/bootstrap-datetimepicker/js'));
    gulp.src('bower_components/ckeditor/**/*').pipe(gulp.dest('public/lib/ckeditor'));
    gulp.src('bower_components/font-awesome/css/*').pipe(gulp.dest('public/lib/font-awesome/css'));
    gulp.src('bower_components/font-awesome/fonts/*').pipe(gulp.dest('public/lib/font-awesome/fonts'));
    gulp.src('bower_components/font-awesome/less/*').pipe(gulp.dest('public/lib/font-awesome/less'));
    gulp.src('bower_components/font-awesome/scss/*').pipe(gulp.dest('public/lib/font-awesome/scss'));
    gulp.src('bower_components/jquery-php/javascript/jquery.php.js').pipe(gulp.dest('public/lib/jquery-php'));
    gulp.src('bower_components/jquery-php/library/jQuery.php').pipe(gulp.dest('./'));
    gulp.src('bower_components/jquery/dist/jquery.min.js').pipe(gulp.dest('public/lib/jquery'));
    gulp.src('bower_components/jquery-ui/ui/minified/jquery-ui.custom.min.js').pipe(rename('jquery-ui-1.10.4.custom.min.js')).pipe(gulp.dest('resources/js'));
    gulp.src('bower_components/moment/min/moment.min.js').pipe(gulp.dest('public/lib/moment'));
    gulp.src('bower_components/summernote/dist/*').pipe(gulp.dest('public/lib/summernote'));
    gulp.src('vendor/royalsoftkv/smartyfaces-core/assets/**/*').pipe(gulp.dest('public/lib/smartyfaces'));
    gulp.src('vendor/royalsoftkv/smartyfaces-core/css/smartyfaces.css').pipe(gulp.dest('public/lib/smartyfaces'));
    gulp.src('vendor/royalsoftkv/smartyfaces-core/img/*').pipe(gulp.dest('public/lib/smartyfaces/img'));
    gulp.src('assets/summernote/summernote-copypaste.js').pipe(gulp.dest('public/lib/summernote'));
    gulp.src('bower_components/codemirror/lib/*').pipe(gulp.dest('public/lib/codemirror'));
    gulp.src('bower_components/codemirror/mode/smarty/smarty.js').pipe(gulp.dest('public/lib/codemirror'));
    gulp.src('assets/js/*').pipe(gulp.dest('public/js'));
    gulp.src('assets/css/*').pipe(gulp.dest('public/css'));
    gulp.src('assets/img/*').pipe(gulp.dest('public/img'));
    gulp.src('bower_components/SyntaxHighlighter/styles/*').pipe(gulp.dest('public/lib/SyntaxHighlighter/styles'));
    gulp.src('bower_components/SyntaxHighlighter/scripts/*').pipe(gulp.dest('public/lib/SyntaxHighlighter/scripts'));
});

gulp.task('exec', function () {
    exec('ls', function (err, stdout, stderr) {
        console.log(stdout);
        console.log(stderr);
    });
});

gulp.task('scripts', function () {
    return gulp.src([
        'bower_components/jquery-ui/ui/jquery.ui.core.js',
        'bower_components/jquery-ui/ui/jquery.ui.widget.js',
        'bower_components/jquery-ui/ui/jquery.ui.mouse.js',
        'bower_components/jquery-ui/ui/jquery.ui.position.js',
        'bower_components/jquery-ui/ui/jquery.ui.draggable.js',
        'bower_components/jquery-ui/ui/jquery.ui.droppable.js',
        'bower_components/jquery-ui/ui/jquery.ui.resizable.js',
        'bower_components/jquery-ui/ui/jquery.ui.selectable.js',
        'bower_components/jquery-ui/ui/jquery.ui.sortable.js',
        'bower_components/jquery-ui/ui/jquery.ui.accordion.js',
        'bower_components/jquery-ui/ui/jquery.ui.autocomplete.js',
        'bower_components/jquery-ui/ui/jquery.ui.button.js',
        'bower_components/jquery-ui/ui/jquery.ui.datepicker.js',
        'bower_components/jquery-ui/ui/jquery.ui.dialog.js',
        'bower_components/jquery-ui/ui/jquery.ui.menu.js',
        'bower_components/jquery-ui/ui/jquery.ui.progressbar.js',
        'bower_components/jquery-ui/ui/jquery.ui.slider.js',
        'bower_components/jquery-ui/ui/jquery.ui.spinner.js',
        'bower_components/jquery-ui/ui/jquery.ui.tabs.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect-blind.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect-bounce.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect-clip.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect-drop.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect-explode.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect-fade.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect-fold.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect-highlight.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect-pulsate.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect-scale.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect-shake.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect-slide.js',
        'bower_components/jquery-ui/ui/jquery.ui.effect-transfer.js'
    ])
        .pipe(concat('jquery-ui-notooltip.custom.js'))
        .pipe(gulp.dest('public/lib/jquery-ui'))
        .pipe(rename('jquery-ui-notooltip.custom.min.js'))
        .pipe(uglify())
        .pipe(gulp.dest('public/lib/jquery-ui'));
});