{extends file='template/demo.tpl'}
{block name=content}
	{$tag=$smarty.get.tag}
	
	<div class="row">
		<div class="col-sm-9">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="?page=demo/home">Components</a></li>
					<li class="breadcrumb-item active" aria-current="page">{$tag}</li>
				</ol>
			</nav>
		</div>
	</div>
	
	
	
	
	{if DemoFunctions::tagExists($tag)}
		{include file="./{$tag}.tpl"}
	
	
		<hr/>
		
		{$smarty.capture.desc|default:''}
	
		<hr/>
		{$template="{Smartyfaces::$config['root_path']}/view/demo/components/{$tag}.tpl"}
		{eval $smarty.capture.view}
		
		{$smarty.capture.text2|default:''}
		
		<hr/>


		
		{sf_tabs id="tabs"}
			{sf_tab header="Attributes"}
				{include file="demo/components/attributes_table.tpl"}
			{/sf_tab}
			{sf_tab header="Source"}
				<textarea id="code">{htmlspecialchars($smarty.capture.view)}</textarea>
			{/sf_tab}
			{sf_tab header="PHP code"}
				<textarea id="code_php">{DemoFunctions::getClassSource($tag)}</textarea>
			{/sf_tab}
		{/sf_tabs}

		{$smarty.capture.text3|default:''}
		
	{/if}

{/block}

{block name=js_bottom}

{/block}