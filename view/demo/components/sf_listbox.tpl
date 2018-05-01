{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=ListboxView}
			{sf_status}
			
			<style>
				.my_country {
					border:1px solid red;
				}
			</style>
			
			<div class="row">
				<div class="col-sm-8">
						{sf_listbox values=$bean->countries() var=country label='$country["name"]' val='$country["iso"]'
							value='#[$bean->selected_countries]' id="countries" 
							class="{if $bean->class}my_country{/if}"
							style="{if $bean->style}color:red{/if}"
							disabled=$bean->disabled
							}
						<br/>
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
							{sf_checkbox value='#[$bean->class]' action="" label="Use class"} 
							{sf_checkbox value='#[$bean->style]' action="" label="Use style"} 
							{sf_checkbox value='#[$bean->disabled]' action="" label="Disabled"} 
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}