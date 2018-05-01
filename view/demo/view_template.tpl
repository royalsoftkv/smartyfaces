{extends file='template/demo2.tpl'} 

{block name=view2}

{{sf_view id="demo2_view"}}
	{sf_form}
		{sf_status}
		{sf_in name=bean2 class=ViewView}
		
			This is sf_view in block file
			<br/>
		
			Counter = 
			{sf_outputtext value=$bean2->counter} 
					
			{sf_commandlink value="Increment" action='#[$bean2->increment()]'}
	
	{/sf_form}
{{/sf_view}}


{/block}

 