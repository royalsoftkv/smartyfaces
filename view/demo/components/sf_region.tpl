{capture name=desc}
	Region is special part of view which can be updated independt from the view
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=RegionView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						{$var1="123"}
						{$var1a="ABC" scope=global}
						{$var1b="XYZ" scope=parent}
						{$var1c="789" scope=root}
						{$var1d="TEST"}
						Assigned var ouside of region var1={$var1} scope=default
						<br/>
						Assigned var ouside of region var1a={$var1a} scope=global
						<br/>
						Assigned var ouside of region var1b={$var1b} scope=parent
						<br/>
						Assigned var ouside of region var1c={$var1c} scope=root
						<br/>
						Assigned var ouside of region var1d={$var1d} scope=default and transfered to region
						<br/>
						{sf_inputtext value='#[$bean->name]' required=true attachMessage=true}
						<br/>
						{sf_commandbutton value="Submit | Update region" action='#[$bean->submit()]' update="region" immediate=true}
						{sf_commandbutton value="Submit | Update view" action='#[$bean->submit()]' immediate=true}

						{sf_region id="region" value='
							{sf_in name=bean class=RegionView}
							<div style="background-color: #ccc;margin:10px;padding:10px">
								{$var2="456" scope=root}
								Assigned var inside of region var2={$var2}
								<br/>
								In region {$bean->out1}
								<br/>
								Counter1={$bean->counter1}
								<br/>
								{sf_commandlink value="Increment counter1 and update region" action="#[\$bean->increment1()]" 
									update="region" immediate=true}
								<br/>
								{sf_commandlink value="Increment counter1 and update view" action="#[\$bean->increment1()]" 
									immediate=true}
								<br/>
								{sf_commandlink value="Increment counter2 and update region" action="#[\$bean->increment2()]" 
									immediate=true update="region"}
								<br/>
								{sf_commandlink value="Increment counter2 and update view" action="#[\$bean->increment2()]" 
									immediate=true}
								<br/>
								Var1 in region is not available!
								<br/>
								Var1a in region = {$var1a|default:null}
								<br/>
								Var1b in region = {$var1b|default:null}
								<br/>
								Var1c in region = {$var1c|default:null}
								<br/>
								Var1d in region = {$var1d|default:null}
								<br/>
								Var2 in region ={$var2|default:null}
							</div>
						' rendered=$bean->rendered assign=var1d}
						
						Outside region {$bean->out2}
						<br/>
						Counter2={$bean->counter2}
						<br/>
						{sf_commandlink value="Increment counter1 and update region" action="#[\$bean->increment1()]" 
							update="region" immediate=true}
						<br/>
						{sf_commandlink value="Increment counter1 and update view" action="#[\$bean->increment1()]" 
							immediate=true}
						<br/>
						{sf_commandlink value="Increment counter2 and update region" action="#[\$bean->increment2()]" 
							immediate=true update="region"}
						<br/>
						{sf_commandlink value="Increment counter2 and update view" action="#[\$bean->increment2()]" 
							immediate=true}
						<br/>
						Var1 outside region = {$var1}
						<br/>
						Var2 outside region is not available!
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_checkbox value='#[$bean->rendered]' action="" immediate=true label="Rendered"} 
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}