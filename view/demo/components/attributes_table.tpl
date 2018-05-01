
{$attributes=DemoFunctions::getAttributes($tag)}
{sf_datatable value=$attributes var=attribute styled=false class="table table-striped table-condensed"}
	{sf_column header="Attribute name"}
		{$attribute.name}		
	{/sf_column}
	{sf_column header="Attribute type"}
		{$attribute.type|default:'string'}		
	{/sf_column}
	{sf_column header="Required"}
		{if $attribute.required}Yes{else}No{/if}		
	{/sf_column}
	{sf_column header="Default value"}
		{if isset($attribute.default)}
			{if is_bool($attribute.default)}
				{if $attribute.default===true}true{else}false{/if}
			{elseif is_array($attribute.default)}
				{print_r($attribute.default,true)}
			{else}
				{$attribute.default}	
			{/if}
		{/if}	
	{/sf_column}
	{sf_column header="Description"}
		{$attribute.desc|default:''}		
	{/sf_column}
{/sf_datatable}
