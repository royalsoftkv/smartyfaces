<!doctype html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>SmartyFaces Showcase</title>
		{SmartyFaces::loadCss()}
		<link href="lib/SyntaxHighlighter/styles/shCore.css" rel="stylesheet"/>
		<link href="lib/SyntaxHighlighter/styles/shThemeDefault.css" rel="stylesheet"/>
		<link href="lib/codemirror/codemirror.css" rel="stylesheet"/>
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
		<script type="text/javascript" src="lib/SyntaxHighlighter/scripts/XRegExp.js"></script>
		<script type="text/javascript" src="lib/SyntaxHighlighter/scripts/shCore.js"></script>
		<script type="text/javascript" src="lib/SyntaxHighlighter/scripts/shLegacy.js"></script>
		<script type="text/javascript" src="lib/SyntaxHighlighter/scripts/shBrushPhp.js"></script>
		<script type="text/javascript" src="lib/SyntaxHighlighter/scripts/shBrushXml.js"></script>
		<script src="lib/codemirror/codemirror.js"></script>
		<script src="lib/codemirror/smarty.js"></script>
		<script type="text/javascript">
            $(function() {
                $('#tabs-tabs').tabs();
                SyntaxHighlighter.all();
                var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
                    lineNumbers: true,
                    mode: "smarty",
                    readOnly : true,
                    viewportMargin: Infinity
                });
                $('#tabs-tabs').on('shown.bs.tab', function (e) {
                    editor.refresh();
                })
            });
		</script>
		{block name=js_bottom}
		
		{/block}
		
	</body>
</html>