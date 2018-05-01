{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=ColumnView}
			{sf_status}
			<style>
				.sf-columnheader.main { background-color: #AEAF41 }
				tr td.main, .sf-datatable tbody tr.even-row td.main{ background-color: #EFEFC2; text-align:center }
			</style>
			<div class="row">
				<div class="col-sm-8">
						{sf_datatable value=$bean->data var=row}
							{sf_column class="main" header="ISO"}
								{$row.iso}
							{/sf_column}
							{sf_column header='<span style="font-style:italic;font-weight:bold;text-align:left;">Name</span>' 
								style="font-style:italic;font-weight:bold"}
								{$row.name}
							{/sf_column}
							{sf_column header="ISO3" title="Three letter code of country"}
								{$row.iso3}
							{/sf_column}
							{sf_column rendered=$bean->rendered width="10%" align="center"}
								{sf_facet name=header}
									<a href="#" onclick="alert('Header!'); return false;">Numcode</a>
								{/sf_facet}
								{$row.numcode}
							{/sf_column}
						{/sf_datatable}
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_checkbox value='#[$bean->rendered]' action="" label="Last column rendered"}
						</div>
					</div>
			</div>
			
			{sf_link value="Reordable example" view="demo/reordable"}
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}