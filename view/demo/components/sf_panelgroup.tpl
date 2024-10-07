{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=PanelgroupView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						{sf_panelgroup rendered=$bean->rendered}
							I am panel group. 
							<br/> I can hold other components
							<br/> TODO: Convert me into panel (card) with header/footer
						{/sf_panelgroup}
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$bean->rendered]' action="" label="Rendered"}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}