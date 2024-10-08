{capture name=desc}

{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=RadiogroupView}
			{sf_status}
			{sf_messages global=true}
			<style>
				.my-class{
					border:1px solid red;
					padding:5px;
				}
			</style>
			<div class="row">
				<div class="col-sm-8">
						Select option:
						<br/>
						Name: {sf_inputtext value='#[$bean->name]' required=true attachMessage=true}
						<br/>
						{sf_radiogroup
							id="radio-group"
							value='#[$bean->value]'
							required=$bean->required
							action="{if $bean->action}#[\$bean->select()]{else}null{/if}"
							immediate=$bean->immediate
							rendered=$bean->rendered
							attachMessage=true
							disabled=$bean->disabled
							class="{if $bean->class}my-class{/if}"
							values=$bean->values()
							var=option
							val='$option["number"]'
							label='$option["text"]'
							direction=$bean->direction
						}
						<br/>
						<div class="mt-2">
							{sf_commandbutton value="Submit" action='#[$bean->submit()]'}
							{sf_commandbutton value="Reset" action='#[$bean->reset()]' immediate=true}
						</div>
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$bean->required]' action="" immediate=true label="Required"}
							{sf_checkbox value='#[$bean->action]' action="" immediate=true label="Action on select"}
							{sf_checkbox value='#[$bean->immediate]' action="" immediate=true label="Immediate" disabled=!$bean->action}
							{sf_checkbox value='#[$bean->rendered]' action="" immediate=true label="Rendered"}
							{sf_checkbox value='#[$bean->disabled]' action="" immediate=true label="Disabled"}
							{sf_checkbox value='#[$bean->class]' action="" immediate=true label="Use custom class"}
							<div class="d-flex gap-2">
								Direction
								{sf_radiogroup value='#[$bean->direction]' values=['horizontal','vertical'] var=dir
									val='$dir' label='$dir' immediate=true direction=horizontal action=""}
							</div>

						</div>
					</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}