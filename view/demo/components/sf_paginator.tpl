{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=PaginatorView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						{$countries=$bean->countries}
						{sf_datatable value=$countries var=country datamodel='$bean->countries' index=row}
							{sf_facet name=header}
								<h3>Countries table</h3>
							{/sf_facet}
							{sf_column header="ISO" sortby="iso"}
								{$country.iso}
							{/sf_column}
							{sf_column header=Name sortby="name"}
								{$country.name}
							{/sf_column}
							{sf_column header=ISO3 sortby="iso3"}
								{$country.iso3}
							{/sf_column}
							{sf_column header="Numeric code" sortby="numcode"}
								{$country.numcode}
							{/sf_column}
							{sf_column}
								{sf_inputtext value="" required=true attachMessage=true size="2" block=false}
							{/sf_column}
						{/sf_datatable}
						{sf_paginator id="botom" value=$countries datamodel='$bean->countries' immediate=$bean->immediate}
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_checkbox value='#[$bean->immediate]' action="" label="Immediate" immediate=true}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}