{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=CheckboxView}
			{sf_status}
			<style>
				.my-class{
					margin:10px;
					border:1px solid red;
				}
			</style>
			<div class="row">
				<div class="col-sm-8">
					Name:
					{sf_inputtext value='#[$bean->name]' required=true attachMessage=true}
					<br/>
					{sf_checkbox
						id="chk1"
						value='#[$bean->checked]'
						required=$bean->required
						action="{if $bean->ajaxAction}#[\$bean->action(){else}null{/if}"
						immediate=$bean->immediate
						attachMessage=true
						class=$bean->get_class()
						title="Click if you agree with terms"
						disabled=$bean->disabled
						rendered=$bean->rendered
						validator="{if $bean->validator}CheckboxView::validateCheck{/if}"
						checkedValue="{if $bean->check}Y{else}1{/if}"
						unCheckedValue="{if $bean->check}N{else}0{/if}"
						boolean=$bean->boolean
						label="I agree with terms"
						confirm="{if $bean->confirm}Confirm check?{/if}"
					}
					{sf_commandbutton value="Submit" action="#[\$bean->submit()]" immediate=(!$bean->required and !$bean->validator) class="mt-2"}
				</div>
				<div class="col-sm-4">
					<div class="bg-light border p-2">
						{sf_checkbox value='#[$bean->required]' action="" immediate=true label="Required"}
						{sf_checkbox value='#[$bean->ajaxAction]' action="" immediate=true label="Attach ajax action"}
						{sf_checkbox value='#[$bean->immediate]' action="" immediate=true label="Immediate" disabled=!$bean->ajaxAction}
						{sf_checkbox value='#[$bean->class]' action="" immediate=true label="Use custom class"}
						{sf_checkbox value='#[$bean->disabled]' action="" immediate=true label="Disabled"}
						{sf_checkbox value='#[$bean->rendered]' action="" immediate=true label="Rendered"}
						{sf_checkbox value='#[$bean->validator]' action="" immediate=true label="Add validator"}
						{sf_checkbox value='#[$bean->check]' action="" immediate=true label="Use different check/uncheck values"}
						{sf_checkbox value='#[$bean->boolean]' action="" immediate=true label="Store and process value of chekbox as boolean"}
						{sf_checkbox value='#[$bean->confirm]' action="" immediate=true label="Add confirm message"}
					</div>
				</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}