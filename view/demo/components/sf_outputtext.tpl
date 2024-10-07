{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=OutputtextView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						Current time: 
						{sf_outputtext
							id="out-text"
							value=$bean->now()
							class="{if $bean->class}my-class{/if}"
							converter="{if $bean->converter}OutputtextConverter{/if}"
							rendered=$bean->rendered
							style="{if $bean->style}color:red;{/if}"
						}
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$bean->class]' action="" immediate=true label="Add custom class"}
							{sf_checkbox value='#[$bean->converter]' action="" immediate=true label="Use converter"}
							{sf_checkbox value='#[$bean->rendered]' action="" immediate=true label="Rendered"}
							{sf_checkbox value='#[$bean->style]' action="" immediate=true label="Set style"}
							
						</div>
					</div>
			</div>
		
		{/sf_form}
	{/sf_view}

	<style>
		.my-class {
			background-color: #66afe9;
			color: #fff;
			padding: 5px;
		}
	</style>


{/literal}
{/capture}