{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{$out_var=10}
	{{sf_view id="demo" stateless=true template=$template}}
		{sf_form}
		{sf_in name=bean class=VarView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						{sf_var name=counter default=SmartyFaces::getSmartyVar('out_var')}
						Counter={$counter}
						{sf_commandbutton value="Increment" action="VarView::increment()"}
						{sf_var name=array default=VarView::get_array()}
						Array:
						<pre>
						{print_r($array)}						
						</pre>
						{sf_commandbutton value="Add element" action="VarView::addToArray()"}
						{sf_commandbutton value="Reset" action="VarView::resetArray()"}
					</div>
					<div class="col-sm-4">
					
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}