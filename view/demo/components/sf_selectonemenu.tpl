{capture name=desc}

{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=SelectonemenuView}
			{sf_status}
			{sf_messages global=true}
			<div class="row">
				<div class="col-sm-8">
						Required:{sf_inputtext value="" required=true attachMessage=true}<br/>
						{sf_selectonemenu id="countries" value='#[$bean->country]' values=$bean->countries var=country
							label='$country["name"]' val='$country["iso"]' required=$bean->required 
							noselect="{if $bean->noselect}Please select...{/if}" attachMessage=$bean->attachMessage
							disabled=$bean->disabled action="{if $bean->action}#[\$bean->change()]{/if}"
							rendered=$bean->rendered title="This is sample checkbox"
							immediate=$bean->immediate block=$bean->block
							style="{if $bean->style}color:red{/if}"
							autocomplete=$bean->autocomplete
							optionClass="{if $bean->option_class}\$country['iso']=='AI' ? 'text-danger' : ''{/if}"
							free_input=$bean->free_input}
						<br/>
						{sf_commandbutton value="Submit" action='#[$bean->submit()]' immediate=false}
						<br/>
						Simple array select menu:
						{sf_selectonemenu values=$bean->array1() value=''}
						<br/>
						Simple array select menu with var attribute:
						{sf_selectonemenu values=$bean->array1() value='' var=item}
						<br/>
						Simple associative array select menu:
						{sf_selectonemenu values=$bean->array2() value=''}
						<br/>
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_checkbox value='#[$bean->required]' action="" immediate=true label="Required"}
							{sf_checkbox value='#[$bean->immediate]' action="" immediate=true label="Immediate"}
							{sf_checkbox value='#[$bean->noselect]' action="" immediate=true label="Add no select label"}
							{sf_checkbox value='#[$bean->attachMessage]' action="" immediate=true label="Attach message"}
							{sf_checkbox value='#[$bean->disabled]' action="" immediate=true label="Disabled"}
							{sf_checkbox value='#[$bean->action]' action="" immediate=true label="Use action"}
							{sf_checkbox value='#[$bean->rendered]' action="" immediate=true label="Rendered"}
							{sf_checkbox value='#[$bean->style]' action="" immediate=true label="Apply custom styles"}
							{sf_checkbox value='#[$bean->block]' action="" immediate=true label="Display as block"}
							{sf_checkbox value='#[$bean->autocomplete]' action="" immediate=true label="Replace with autocomplete"}
							{sf_checkbox value='#[$bean->option_class]' action="" immediate=true label="Evaluate option class"}
							{sf_checkbox value='#[$bean->free_input]' action="" disabled=!$bean->autocomplete
								 immediate=true label="Enable free input for autocomplete"}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}