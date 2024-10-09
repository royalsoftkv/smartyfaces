{capture name=desc}

{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=SelectonemenuView}
			{sf_status}
			{sf_messages global=true}
			<div class="row">
				<div class="col-sm-8">
					Required:{sf_inputtext value="" required=true attachMessage=true}<br/>
					{sf_selectonemenu
						id="countries"
						value='#[$bean->country]'
						required=$bean->required
						disabled=$bean->disabled
						action="{if $bean->action}#[\$bean->change()]{else}null{/if}"
						attachMessage=true
						class="{if $bean->class}my-class{/if}"
						onchange="{if $bean->onchange}onChangeFn(this){/if}"
						rendered=$bean->rendered
						title="This is sample checkbox"
						immediate=$bean->immediate
						style="{if $bean->style}color:red{/if}"
						values=$bean->countries
						noselect="{if $bean->noselect}Please select...{/if}"
						var=country
						val='$country["iso"]'
						label='$country["name"]'
						block=$bean->block
						optionClass="{if $bean->option_class}\$country['iso']=='AI' ? 'text-danger' : ''{/if}"
						autocomplete=$bean->autocomplete
						free_input=$bean->free_input
					}
						<br/>
						{sf_commandbutton value="Submit" action='#[$bean->submit()]' immediate=!$bean->required}
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
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$bean->required]' action="" immediate=true label="Required"}
							{sf_checkbox value='#[$bean->disabled]' action="" immediate=true label="Disabled"}
							{sf_checkbox value='#[$bean->action]' action="" immediate=true label="Use action"}
							{sf_checkbox value='#[$bean->class]' action="" immediate=true label="Add custom class"}
							{sf_checkbox value='#[$bean->onchange]' action="" immediate=true label="Add onchange javascript function"}
							{sf_checkbox value='#[$bean->rendered]' action="" immediate=true label="Rendered"}
							{sf_checkbox value='#[$bean->immediate]' action="" immediate=true label="Immediate" disabled=!$bean->action}
							{sf_checkbox value='#[$bean->noselect]' action="" immediate=true label="Add no select label"}
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
	{/sf_view}

	<script type="text/javascript">
		function onChangeFn(a) {
			console.log(a);
			alert("Changed selection to " + $(a).val())
		}
	</script>

	<style>
		.my-class {
			background-color: #66afe9;
		}
	</style>
{/literal}
{/capture}