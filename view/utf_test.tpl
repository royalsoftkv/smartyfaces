<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
</head>
<body>
{{sf_view id="utf_test"}}
{sf_form}
{sf_in name=bean class=UtfTest}

{sf_commandbutton value="Get String" action="#[\$bean->getString()]"}
{sf_commandbutton value="Clear" action="#[\$bean->clear()]"}
<br/>
String:<br/>
{$bean->string}
<br/>
Chars:
<br/>
{$bean->chars()}
{/sf_form}
{{/sf_view}}
</body>
</html>