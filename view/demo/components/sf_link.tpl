{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=LinkView}
			{sf_status}
			<style>
			.my-link{ font-weight:bold; color:red }
			</style>
			<div class="row">
				<div class="col-sm-8">
						<p>
						This is smartyfaces 
						{sf_link
							value="link"
							disabled=$bean->disabled
							rendered=$bean->rendered
							class="{if $bean->class}my-link{/if}"
							title="I am link"
							view="demo/components/component&tag=sf_inputtext"
							confirm="{if $bean->confirm}Confirm navigation?{/if}"
						}
						to page for sf_inputtext component.
						</p>
						<p>
						This is smartyfaces 
						{sf_link
							value="link"
							action="LinkView::action()"
							disabled=$bean->disabled
						}
						which can execute some action and reload page.
						<br/>
							You reloaded this page with this link <strong>{LinkView::counter()}</strong> times.
						{sf_link value="Clear" action='LinkView::clear()' confirm="Are you sure to do this?"}
						</p>
						<p>
						Here is
						{sf_link
							value="link"
							action='LinkView::actionWithParams()'
							actionparams=['param1'=>'a','param2'=>3]
						}
						with array of parameters: param1='a', param2=3
						</p>
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$bean->disabled]' action="" immediate=true label="Disabled"} 
							{sf_checkbox value='#[$bean->rendered]' action="" immediate=true label="Rendered"}
							{sf_checkbox value='#[$bean->class]' action="" immediate=true label="Add custom class"}
							{sf_checkbox value='#[$bean->confirm]' action="" immediate=true label="Confirm on click"}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}