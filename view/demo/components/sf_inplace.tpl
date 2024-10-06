{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=InplaceView}
			{sf_status}
			{sf_messages global=true}
			<div class="row">
				<div class="col-sm-8">
						{sf_inplace
							id="inplace_comp"
							value="#[\$bean->text]"
							required=$bean->required
							disabled=$bean->disabled
							class="{if $bean->class}demo-class{/if}"
							rendered=$bean->rendered
							validator="{if $bean->validator}InplaceView::textValidator{/if}"
							action="#[\$bean->action()]"
					 		emptytext="Click here to edit"
						 	attachMessage=true
							type=$bean->type
						}
						<br/>
						{sf_commandbutton value="Submit" action="#[\$bean->submit()]"}
						{sf_commandbutton value="Clear" action="#[\$bean->clear()]" immediate=true}
						<br/>
						{if $bean->submitted}
							You submitted: {$bean->text}
						{/if}
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value="#[\$bean->required]" action="" immediate=true label="Required"}
							{sf_checkbox value="#[\$bean->class]" action="" immediate=true label="Use custom class"}
							{sf_checkbox value="#[\$bean->disabled]" action="" immediate=true label="Disabled"}
							{sf_checkbox value="#[\$bean->rendered]" action="" immediate=true label="Rendered"} 
							{sf_checkbox value="#[\$bean->validator]" action="" immediate=true label="Use validator"}
							{sf_checkbox value="#[\$bean->ajax]" action="" immediate=true label="Ajax enabled"}
							<div class="d-flex gap-2 align-items-center">
								Input type
								{sf_selectonemenu value='#[$bean->type]' immediate=true
								values=['text'=>'text','textarea'=>'textarea'] action=""}
							</div>
						</div>
						
					</div>
			</div>
		
		{/sf_form}
	{/sf_view}

	<style>
		.demo-class {
			background-color: #66afe9;
		}
	</style>
{/literal}
{/capture}