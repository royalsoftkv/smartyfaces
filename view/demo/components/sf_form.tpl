{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form id="my-form" class="my-form"}
		{sf_in name=bean class=FormView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						Form demo...
					</div>
					<div class="col-sm-4">
						
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}