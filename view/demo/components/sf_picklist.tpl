{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
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
						{sf_picklist id="my-picklist" source=$bean->available_countries var=country 
							label="\$country['name']" value='#[$bean->selected_countries]' attachMessage=true 
							required=$bean->required class="my-picklist" disabled=$bean->disabled}
						{sf_commandbutton value="Submit" action="#[\$bean->submit()]"}
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
						<div class="well">
							{sf_checkbox value='#[$bean->required]' immediate=true action="" label="Required"}
							{sf_checkbox value='#[$bean->disabled]' immediate=true action="" label="Disabled"}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}