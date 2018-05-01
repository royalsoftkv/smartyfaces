{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=PollView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						{sf_poll id="poll" action="#[\$bean->poll()]" interval=$bean->interval enabled=$bean->enabled 
							oncomplete='$("#date").css("color","red")' onstart='$("#date").css("color","black")'}
						<span id="date">
							{$bean->out}
						</span>
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_ajax for="int" event="change" action=""}
							Interval
							{sf_inputtext id="int" value='#[$bean->interval]' required=true attachMessage=true disabled=$bean->enabled size=5 style="display:inline"}
							{sf_outputtext value="?" id="tt"}
							{sf_tooltip for="tt"}
								Disable poll to change interval
							{/sf_tooltip}
							<br/>
							{sf_checkbox value='#[$bean->enabled]' immediate=true action="" label="Enabled"} 
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}