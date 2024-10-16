{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=PicklistView}
			{sf_status}
			<style>
				.my-picklist select{
					border:1px solid red;
					width:150px;
					height:100px;
				}
			</style>
			<div class="row">
				<div class="col-sm-8">
						{sf_picklist
							id="my-picklist"
							value='#[$bean->selected_countries]'
							attachMessage=true
							required=$bean->required
							class="{if $bean->class}my-picklist{/if}"
							disabled=$bean->disabled
							source=$bean->available_countries
							var=country
							label="\$country['name']"
						}
						{sf_commandbutton value="Submit" action="#[\$bean->submit()]" class="mt-2"}
						{sf_popup rendered=$bean->popup header="Selected countries" action="#[\$bean->popup=false]"}
							You submitted:
							<br/>
							{foreach $bean->selected_countries as $selcountry}
								{$selcountry.name}<br/>
							{/foreach}
							{sf_commandbutton value="Close" action="#[\$bean->popup=false]"}
						{/sf_popup}
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$bean->required]' immediate=true action="" label="Required"}
							{sf_checkbox value='#[$bean->class]' immediate=true action="" label="Add custom class"}
							{sf_checkbox value='#[$bean->disabled]' immediate=true action="" label="Disabled"}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{/sf_view}

	<style>
		.my-picklist select {
			background-color: #66afe9;
		}
	</style>
{/literal}
{/capture}