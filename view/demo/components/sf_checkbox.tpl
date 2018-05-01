{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
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
					{sf_checkbox id="chk1" value='#[$bean->checked]' required=$bean->required attachMessage=$bean->attachMessage
						action='#[$bean->action()]' immediate=$bean->immediate class=$bean->get_class() title="Click if you agree with terms"
						disabled=$bean->disabled checkedValue="{if $bean->check}Y{else}1{/if}"  
						unCheckedValue="{if $bean->check}N{else}0{/if}" rendered=$bean->rendered label="I agree with terms"
						block=$bean->block confirm="{if $bean->confirm}Confirm check?{/if}"}
					
					{sf_commandbutton value="Submit" action="#[\$bean->submit()]"}
					<br/>
					Checkbox with true/false
					{sf_checkbox value='#[$bean->value2]' boolean=true}
					{sf_commandbutton value="Submit 2" action="#[\$bean->submit2()]" immediate=true}
				</div>
				<div class="col-sm-4">
					<div class="well">
						{sf_checkbox value='#[$bean->required]' action="" immediate=true label="Required"}
						{sf_checkbox value='#[$bean->attachMessage]' action="" immediate=true label="Attach message"}
						{sf_checkbox value='#[$bean->immediate]' action="" immediate=true label="Immediate"}
						{sf_checkbox value='#[$bean->class]' action="" immediate=true label="Use custom class"}
						{sf_checkbox value='#[$bean->disabled]' action="" immediate=true label="Disabled"}
						{sf_checkbox value='#[$bean->check]' action="" immediate=true label="Use different check/uncheck values"}
						{sf_checkbox value='#[$bean->rendered]' action="" immediate=true label="Rendered"}
						{sf_checkbox value='#[$bean->block]' action="" immediate=true label="Display checkbox as block"}
						{sf_checkbox value='#[$bean->confirm]' action="" immediate=true label="Add confirm message"}
					</div>
				</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}