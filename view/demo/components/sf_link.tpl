{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
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
						{sf_link value="link" disabled=$bean->disabled view="demo/components/component&tag=sf_inputtext"
						viewvar=page class="my-link" title="I am link"} 
						to page for sf_inputtext component.
						</p>
						<p>
						This is smartyfaces 
						{sf_link value="link" disabled=$bean->disabled action="LinkView::action()"} 
						which can execute some action and reload page.
						<br/>
						You reloaded this page with this link {$smarty.session.LinkView.counter|default:0} times.
						{sf_link value="Clear" action='LinkView::clear()' confirm="Are you sure to do this?"}
						</p>
						<p>
						Here is {sf_link value="link" action='LinkView::actionWithParams()' actionparams=['param1'=>'a','param2'=>3]} with array of parameters: param1='a', param2=3
						</p>
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_checkbox value='#[$bean->disabled]' action="" immediate=true label="Disabled"} 
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}