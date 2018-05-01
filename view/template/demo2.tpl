{{sf_view id="demo2_temp" template="template.demo2.tpl"}}
	{sf_form}
		{sf_status}
		{sf_in name=bean class=ViewView}
		
			This is sf_view in template file
			<br/>
		
			Counter = 
			{sf_outputtext value=$bean->counter}
					
			{sf_commandlink value="Increment" action='#[$bean->increment()]'}
	
	{/sf_form}
{{/sf_view}}


{block name=view2}

	Here id view 2

{/block}

{SmartyFaces::loadJs()}