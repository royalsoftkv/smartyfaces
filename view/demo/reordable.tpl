{extends file='template/demo.tpl'}

{block name=content}
{capture name=view}
{literal}
	{{sf_view id="reordable" template=$template}} 
	{sf_form}
		{sf_in name=bean class=ReordableView}
		{sf_status}
		{$countries=$bean->countries}
		
		{sf_commandbutton value="Refresh" action=""}
		
		{sf_datatable value=$countries->list var=country index=row}
			{sf_facet name=header}
				<h3>Countries table</h3>
			{/sf_facet}
			{sf_column header="ISO"}
				{$country->iso}
			{/sf_column}
			{sf_column header=Name}
				{$country->name}
			{/sf_column}
			{sf_column header=ISO3}
				{$country->iso3}
			{/sf_column}
			{sf_column header="Numeric code"}
				{$country->numcode}
			{/sf_column}
			{sf_column reorder=true reorderlist='$bean->countries'}
				{$country->numcode}
			{/sf_column}
		{/sf_datatable}
	
	{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}

{$template="{Smartyfaces::$config['root_path']}/view/demo/reordable.tpl"}
{eval $smarty.capture.view}



	{sf_tabs id="tabs"}
	{sf_tab header="Source"}
		<textarea id="code">{htmlspecialchars($smarty.capture.view)}</textarea>
	{/sf_tab}
	{sf_tab header="PHP code"}
		<textarea id="code_php">{DemoFunctions::getClassNameSource('ReordableView')}</textarea>
	{/sf_tab}
	{/sf_tabs}

{/block}

