{capture name=desc}

{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
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
						{sf_radiogroup value='#[$bean->value]' values=$bean->values() var=option
							val='$option["number"]' label='$option["text"]' required=$bean->required attachMessage=true
							action="{if $bean->action}#[\$bean->select()]{/if}" immediate=$bean->immediate
							rendered=$bean->rendered disabled=$bean->disabled class="{if $bean->class}my-class{/if}"
							direction=$bean->direction}
						<br/>
						{sf_commandbutton value="Submit" action='#[$bean->submit()]'}
						{sf_commandbutton value="Reset" action='#[$bean->reset()]' immediate=true}
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_checkbox value='#[$bean->required]' action="" immediate=true label="Required"}
							{sf_checkbox value='#[$bean->action]' action="" immediate=true label="Action on select"}
							{sf_checkbox value='#[$bean->immediate]' action="" immediate=true label="Immediate"}
							{sf_checkbox value='#[$bean->rendered]' action="" immediate=true label="Rendered"}
							{sf_checkbox value='#[$bean->disabled]' action="" immediate=true label="Disabled"}
							{sf_checkbox value='#[$bean->class]' action="" immediate=true label="Use custom class"}
							Direction
							{sf_radiogroup value='#[$bean->direction]' values=['horizontal','vertical'] var=dir
								val='$dir' label='$dir' immediate=true direction=horizontal action=""}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}