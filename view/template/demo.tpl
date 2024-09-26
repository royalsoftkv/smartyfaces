<!doctype html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>SmartyFaces Showcase</title>
		{SmartyFaces::loadCss()}
		<link href="lib/codemirror/lib/codemirror.css" rel="stylesheet"/>
		<link href="css/demo.css" rel="stylesheet"/>
	</head>
	<body class="container-fluid">
		<div class="page-header" style="margin-top:20px">
		  <h1>SmartyFaces <small>Showcase</small></h1>
		</div>
		<div class="row">
			<div class="col-sm-2">
				{include file='template/menu.tpl'}
			</div>
			<div class="col-sm-10">
				{block name=content}
					
				{/block}
			</div>
		</div>

		<hr/>
		View info:
		<pre>
			{SmartyFacesContext::getStateInfo()}
		</pre>
		<hr/>
		SmartyFaces {SmartyFaces::$signature}
		<span style="float:right; font-style: italic;">
			{SmartyFaces::$versions}
		</span>
		<hr/>
		
		{SmartyFaces::loadJs()}
		<script src="lib/codemirror/lib/codemirror.js"></script>
		<script src="lib/codemirror/addon/edit/matchbrackets.js"></script>
		<script src="lib/codemirror/mode/htmlmixed/htmlmixed.js"></script>
		<script src="lib/codemirror/mode/xml/xml.js"></script>
		<script src="lib/codemirror/mode/javascript/javascript.js"></script>
		<script src="lib/codemirror/mode/css/css.js"></script>
		<script src="lib/codemirror/mode/clike/clike.js"></script>
		<script src="lib/codemirror/mode/php/php.js"></script>
		<script src="lib/codemirror/mode/smarty/smarty.js"></script>
		<script type="text/javascript">
            $(function() {
                var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
                    lineNumbers: true,
                    mode: "smarty",
                    readOnly : true,
                    viewportMargin: Infinity
                });
				var editor2 = CodeMirror.fromTextArea(document.getElementById("code_php"), {
					lineNumbers: true,
					matchBrackets: true,
					mode: "application/x-httpd-php",
					readOnly : true,
					viewportMargin: Infinity
				});
                $('#tabs-tabs').on('shown.bs.tab', function (e) {
                    editor.refresh();
					editor2.refresh();
                })
            });
		</script>
		{block name=js_bottom}
		
		{/block}
		
	</body>
</html>