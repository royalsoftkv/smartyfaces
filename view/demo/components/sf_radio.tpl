{capture name=desc}

{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=RadioView}
			{sf_status}
			{sf_messages global=true}
			<style>
				.my-radio{
					border:1px solid red;
				}
			</style>
			<div class="row">
				<div class="col-sm-8">
						{sf_radio id="single-radio" value='#[$bean->selected]' required=$bean->required 
							attachMessage=true action="{if $bean->partial} {/if}" class="my-radio"
							disabled=$bean->disabled confirm="{if $bean->confirm}Are you sure to check this?{/if}"
							checkedValue="{if $bean->check}Y{else}1{/if}"  unCheckedValue="{if $bean->check}N{else}0{/if}" label="Single radio"} 
						<br/>
						{sf_commandbutton value="Submit" action="#[\$bean->submit()]"}
						{sf_commandbutton value="Reset" action="#[\$bean->reset()]"}
						<br/>
						Selected:{$bean->selected}
						<br/>
						{sf_radio id="radio" value='#[$bean->radio]' checkedValue=1 label="Radio 1"}
						{sf_radio id="radio" value='#[$bean->radio]' checkedValue=2 label="Radio 2"}
						{sf_radio id="radio" value='#[$bean->radio]' checkedValue=3 label="Radio 3"}
						{sf_commandbutton value="Submit" action='#[$bean->submit2()]'}
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_checkbox value='#[$bean->required]' action="" immediate=true label="Required"}  
							{sf_checkbox value='#[$bean->partial]' action="" immediate=true label="Partial"}  
							{sf_checkbox value='#[$bean->disabled]' action="" immediate=true label="Disabled"}  
							{sf_checkbox value='#[$bean->check]' action="" immediate=true label="Use different check/uncheck values"}
							{sf_checkbox value='#[$bean->confirm]' action="" immediate=true label="Confirm message"}  
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}