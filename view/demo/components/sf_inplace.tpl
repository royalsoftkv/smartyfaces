{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=InplaceView}
			{sf_status}
			{sf_messages global=true}
			<div class="row">
				<div class="col-sm-8">
						{sf_inplace value="#[\$bean->text]" emptytext="Click here to edit" class="demo-class"
							required=$bean->required attachMessage=true disabled=$bean->disabled id="inplace_comp"
							rendered=$bean->rendered validator="{if $bean->validator}InplaceView::textValidator{/if}"
							type=$bean->type action="#[\$bean->action()]"}
						<br/>
						{sf_commandbutton value="Submit" action="#[\$bean->submit()]"}
						{sf_commandbutton value="Clear" action="#[\$bean->clear()]" immediate=true}
						<br/>
						{if $bean->submitted}
							You submitted: {$bean->text}
						{/if}
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_checkbox value="#[\$bean->required]" action="" immediate=true label="Required"} 
							{sf_checkbox value="#[\$bean->disabled]" action="" immediate=true label="Disabled"} 
							{sf_checkbox value="#[\$bean->rendered]" action="" immediate=true label="Rendered"} 
							{sf_checkbox value="#[\$bean->validator]" action="" immediate=true label="Use validator"} 
							{sf_radiogroup value='#[$bean->type]' values=['text','textarea'] var=t val='$t' label='$t' action="" immediate=true}
							{sf_checkbox value="#[\$bean->ajax]" action="" immediate=true label="Ajax enabled"} 
						</div>
						
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}