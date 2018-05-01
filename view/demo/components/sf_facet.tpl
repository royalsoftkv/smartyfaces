{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						{$countries=SampleData::loadData(10)}
						{sf_datatable value=$countries var=country}
							{sf_facet name=header class="h3"}
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
								{sf_facet name=header}
									Numeric code
								{/sf_facet}
								{$country.numcode}
							{/sf_column}
						{/sf_datatable}
					</div>
					<div class="col-sm-4">

					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}