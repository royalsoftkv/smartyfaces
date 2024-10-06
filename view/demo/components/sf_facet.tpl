{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
			{sf_in name=view class=FacetView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						{$countries=SampleData::loadData(10)}
						{sf_datatable value=$countries var=country}
							{sf_facet name=header class="{if $view->class}h3{/if}"}
								List of countries
							{/sf_facet}
							{sf_column}
								{sf_facet name=header}
									ISO
								{/sf_facet}
								{$country.iso}
							{/sf_column}
							{sf_column}
								{sf_facet name=header}
									Name
								{/sf_facet}
								{$country.name}
							{/sf_column}
							{sf_column}
								{sf_facet name=header}
									Iso3
								{/sf_facet}
								{$country.iso3}
							{/sf_column}
							{sf_column}
								{sf_facet name=header rendered=$view->rendered}
									Numeric code
								{/sf_facet}
								{$country.numcode}
							{/sf_column}
						{/sf_datatable}
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$view->rendered]' immediate=true action="" label="Rendered header of last column"}
							{sf_checkbox value='#[$view->class]' immediate=true action="" label="Add custom class to header"}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}