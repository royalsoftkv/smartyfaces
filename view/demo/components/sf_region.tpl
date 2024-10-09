{capture name=desc}
	Region is special part of view which can be updated independt from the view
{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=RegionView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
					<div class="m-2">
						Assigned vars outside of region:<br/>
						{$var1="123"}
						{$var1a="ABC" scope=global}
						{$var1b="XYZ" scope=parent}
						{$var1c="789" scope=root}
						{$var1d="TEST"}
						var1={$var1} scope=default
						<br/>
						var1a={$var1a} scope=global
						<br/>
						var1b={$var1b} scope=parent
						<br/>
						var1c={$var1c} scope=root
						<br/>
						var1d={$var1d} scope=default and assigned to region
						<br/>
						Var2 ={$var2|default:null}
						<br/>
						{sf_inputtext value='#[$bean->name]' required=true attachMessage=true placeholder="Enter name"}
						<br/>
						{sf_commandbutton value="Submit | Update region" action='#[$bean->submit()]' update="region" immediate=true}
						{sf_commandbutton value="Submit | Update view" action='#[$bean->submit()]' immediate=true}
					</div>
					{sf_region
						id="region" value='
							{sf_in name=bean class=RegionView}
							<div class="bg-light border p-2 m-2">
								{$var2="456" scope=root}
								In region out: {$bean->out1}
								<br/>
								Counter1={$bean->counter1}
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
								Vars inside region:<br/>
								Var1 = {$var1|default:null}
								<br/>
								Var1a = {$var1a|default:null}
								<br/>
								Var1b = {$var1b|default:null}
								<br/>
								Var1c = {$var1c|default:null}
								<br/>
								Var1d = {$var1d|default:null}
								<br/>
								Var2 ={$var2|default:null} scope=root (assigned in region)
							</div>
						'
						rendered=$bean->rendered
						assign=var1d
					}
					<div class="m-2">
						Outside region out: {$bean->out2}
						<br/>
						Counter1={$bean->counter1}
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
						Vars outside of region:<br/>
						Var1 = {$var1|default:null}
						<br/>
						Var1a = {$var1a|default:null}
						<br/>
						Var1b = {$var1b|default:null}
						<br/>
						Var1c = {$var1c|default:null}
						<br/>
						Var1d = {$var1d|default:null}
						<br/>
						Var2 ={$var2|default:null}
					</div>
				</div>
				<div class="col-sm-4">
					<div class="bg-light border p-2">
						{sf_checkbox value='#[$bean->rendered]' action="" immediate=true label="Rendered"}
					</div>
				</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}