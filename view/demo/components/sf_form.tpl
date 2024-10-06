{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
	{sf_in name=view class=FormView}
	{sf_status}
		{sf_form
			id="my-form"
			class="{if $view->class}my-form{/if}"
		}
			<div class="row">
				<div class="col-sm-8">
					<div class="bg-light border p-2 d-flex gap-2 align-items-center">
						<span class="h5 mb-0">Counter={$view->counter}</span>
						{sf_commandbutton value="Increment" action='#[$view->increment()]'}
					</div>
				</div>
				<div class="col-sm-4">
					<div class="bg-light border p-2">
						{sf_checkbox value='#[$view->class]' immediate=true action="" label="Use custom class"}
					</div>
				</div>
			</div>
		
		{/sf_form}
	{/sf_view}

	<style>
		.my-form {
			padding: 10px;
			border: 1px solid red;
		}
	</style>
{/literal}
{/capture}