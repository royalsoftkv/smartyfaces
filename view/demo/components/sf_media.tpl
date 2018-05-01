{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=MediaView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						This component has no function yet!
					</div>
					<div class="col-sm-4">
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}