{capture name=desc}

{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=RadioView}
			{sf_status}
			{sf_messages global=true}
			<style>
				.my-radio{
					border:1px solid green;
					padding: 5px;
				}
			</style>
			<div class="row">
				<div class="col-sm-8">
					{sf_inputtext value="" class="m-2" rendered=!$bean->immediate placeholder="Required" required=1 attachMessage=1}
						{sf_radio
							id="single-radio"
							value='#[$bean->selected]'
							required=$bean->required
							action="{if $bean->action}#[\$bean->execAction()]{/if}"
							immediate=$bean->immediate
							attachMessage=true
							class="{if $bean->class}my-radio{/if}"
							disabled=$bean->disabled
							checkedValue="{if $bean->check}Y{else}1{/if}"
							unCheckedValue="{if $bean->check}N{else}0{/if}"
							confirm="{if $bean->confirm}Are you sure to check this?{/if}"
							label="Single radio"
						}
						<div class="my-2">
							{sf_commandbutton value="Submit" action="#[\$bean->submit()]"}
							{sf_commandbutton value="Reset" action="#[\$bean->reset()]"}
						</div>
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$bean->required]' action="" immediate=true label="Required"}
							{sf_checkbox value='#[$bean->action]' action="" immediate=true label="Add ajax action"}
							{sf_checkbox value='#[$bean->immediate]' action="" immediate=true label="Immediate" disabled=!$bean->action}
							{sf_checkbox value='#[$bean->class]' action="" immediate=true label="Add custom class"}
							{sf_checkbox value='#[$bean->disabled]' action="" immediate=true label="Disabled"}
							{sf_checkbox value='#[$bean->confirm]' action="" immediate=true label="Confirm message" disabled=!$bean->action}
							{sf_checkbox value='#[$bean->check]' action="" immediate=true label="Use different check/uncheck values"}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}