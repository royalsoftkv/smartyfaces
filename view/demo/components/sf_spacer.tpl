{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=SpacerView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						<p style="background-color: #EFEFEF;padding:10px">
						This paragraph is 
						{sf_spacer
							style="{if $bean->style}border:1px solid red{/if}"
							width=$bean->width height=$bean->height }
						limited with spacer.
						</p>
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$bean->style]' immediate=true action="" label="Use style"}
							<div class="d-flex gap-2 align-items-center">
								Width
								{sf_ajax for=w event=change action=""}
								{sf_inputtext id=w value='#[$bean->width]' required=true attachMessage=true size=5}
								Height
								{sf_ajax for=h event=change action=""}
								{sf_inputtext id=h value='#[$bean->height]' required=true attachMessage=true size=5}
							</div>
						</div>
					</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}