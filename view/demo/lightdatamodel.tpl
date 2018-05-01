{extends file='template/demo.tpl'}

{block name=content}
{capture name=view}
{literal}
	{{sf_view id="datamodel" template=$template}} 
	{sf_form}
		{sf_in name=bean class=LightDataModelView}
		{sf_status}
		{$countries=$bean->countries}
		
		Name: {sf_inputtext value="#[\$bean->countries->filter['name']]"}
		Numeric code: {sf_inputtext value="#[\$bean->countries->filter['numcode']]"}
		
		<br/>
		{sf_commandbutton value="Search" action="#[\$bean->countries->search()]"}
		{sf_commandbutton value="Reset search" action="#[\$bean->countries->resetSearch()]"}
		
		{sf_datatable value=$countries var=country datamodel='$bean->countries' index=row}
			{sf_facet name=header}
				<h3>Countries table</h3>
				{sf_paginator}
			{/sf_facet}
			{sf_column}
				{*sf_checkbox value="#[\$bean->countries->selected['{$country.iso}']['selected']]" action=""*}
				{sf_checkbox value=$bean->countries->isSelected($country) action="#[\$bean->countries->toggleSelect('{$country.iso}')]"}
			{/sf_column}
			{sf_column header="Position" sortby="position"}
				{$country.position}
			{/sf_column}
			{sf_column header="ISO" sortby="iso"}
				{$country.iso}
			{/sf_column}
			{sf_column header=Name sortby="name"}
				{$country.name}
			{/sf_column}
			{sf_column header=ISO3 sortby="iso3"}
				{$country.iso3}
			{/sf_column}
			{sf_column header="Numeric code" sortby="numcode"}
				{$country.numcode}
			{/sf_column}
			{sf_column header="Active[view]" sortby="active"}
				{sf_commandlink value=$country.active action="#[\$bean->countries->toggleActive2('{$country.iso}')]"}
			{/sf_column}
			{sf_column header="Active[region]" sortby="active"}
				{sf_region id="active_{$row}" assign=['country','row'] value='
					{sf_commandlink id="cl_{$row}" value=$country.active action="#[\$bean->countries->toggleActive1(\'{$country.iso}\',{$row})]"
						update="active_{$row}"}
				'}
			{/sf_column}
			{sf_facet name=footer rendered=($bean->countries->count gt 0)}
					Select
					{$selected_count=$bean->countries->selectedCount()}
					{sf_commandlink value="All" action="#[\$bean->countries->selectAll()]"}
					{sf_commandlink value="None" action="#[\$bean->countries->selectNone()]"}
					{sf_commandlink value="Invert" action="#[\$bean->countries->selectInvert()]"}
					{sf_commandlink value="Select All Pages" rendered=($selected_count gt 0) 
						action='#[$bean->countries->selectAllPages()]' rendered=$bean->countries->canSelectAll()}
					 | 
					Selected: <strong>{$selected_count}</strong>
					{sf_commandlink value="Clear" action="#[\$bean->countries->clearSelected()]" 
						rendered=($selected_count gt 0)}
				{sf_paginator}
             {/sf_facet}
		{/sf_datatable}
	
	{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}

{$template="{Smartyfaces::$config['root_path']}/view/demo/lightdatamodel.tpl"}
{eval $smarty.capture.view}

<div id="tabs">
	<ul>
		<li><a href="#tabs-1">Source</a></li>
		<li><a href="#tabs-2">PHP code - LightDataModelView</a></li>
		<li><a href="#tabs-3">PHP code - LightCountryDataModel</a></li>
	</ul>
	<div id="tabs-1">
		<textarea id="code">
			{htmlspecialchars($smarty.capture.view)}
		</textarea>
	</div>
	<div id="tabs-2">
		<pre class="brush: php">{DemoFunctions::getClassNameSource('LightDataModelView')}</pre>
	</div>
	<div id="tabs-3">
		<pre class="brush: php">{DemoFunctions::getClassNameSource('LightCountryDataModel')}</pre>
	</div>
</div>



{/block}

{block name=js_bottom}
<script type="text/javascript">
	$(function() {
		$( "#tabs" ).tabs();
	});
    SyntaxHighlighter.all();
    var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        lineNumbers: true,
        mode: "smarty",
        readOnly : true,
        viewportMargin: Infinity
    });
</script>
{/block}