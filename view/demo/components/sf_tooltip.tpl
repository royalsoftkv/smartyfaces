{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
			{sf_status}
			{sf_in name=bean class=TooltipView}
			<style>
				.my_tooltip{
				 color:red;
				 border:3px solid red;
				 padding:10px;
				 font-weight:bold
				}
			</style>
			<div class="row">
				<div class="col-sm-8">
						Hower over this
						{sf_commandlink value="link" action="" id="link"}
						to see tooltip.
						{sf_tooltip id="link_tt" for="link" rendered=$bean->rendered class="{if $bean->style}my_tooltip{/if}" placement=$bean->placement}
							I am tooltip!
						{/sf_tooltip}
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_checkbox value='#[$bean->rendered]' action="" label="Rendered"}
							{sf_checkbox value='#[$bean->style]' action="" label="Use style"}
							Placement
							{sf_radiogroup values=['left','right','top','bottom','auto'] var=pl val='$pl' label='$pl' value='#[$bean->placement]' immediate=true action=""}
						</div>
					</div>
			</div>
			
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}