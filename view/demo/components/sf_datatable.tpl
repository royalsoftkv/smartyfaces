{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=DatatableView}
			{sf_status}
			<style>
				.sf-datatable tbody tr.selected td, .table tbody tr.selected td { background-color: #EFEFC2 }
				.sf-datatable tr.red td,.table tr.red td  { color:red }
			</style>
			<div class="row">
				<div class="col-sm-8">
						{sf_datatable value=$bean->countries() var=country style="width:500px;" class="my-table" index=index
							emptyRowsMessage="There are no records in this table" rowKeyVar=row rowSelection=$bean->selected
							header="SmartyFaces data table" rowclass='$template->getTemplateVars(\'bean\')->getRowClass($row)'
							responsive=$bean->responsive}
							{sf_column header=Index}
								{sf_commandlink value="$index" action="#[\$bean->selected={$index}]"}
							{/sf_column}
							{sf_column header=ISO}
								{$country.iso}
							{/sf_column}
							{sf_column header=Name}
								{$country.name}
							{/sf_column}
							{sf_column header=Iso3}
								{$country.iso3}
							{/sf_column}
							{sf_column header="Numeric code"}
								{$country.numcode}
							{/sf_column}
							{sf_column header="index"}
								{$row.index}
							{/sf_column}
							{sf_column header="iteration"}
								{$row.iteration}
							{/sf_column}
							{sf_column header="first"}
								{$row.first}
							{/sf_column}
							{sf_column header="last"}
								{$row.last}
							{/sf_column}
						{/sf_datatable}
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_checkbox value='#[$bean->emptyTable]' action="" immediate=true label="Empty table"}
							{sf_checkbox value='#[$bean->responsive]' action="" immediate=true label="Responsive table (used for bootstrap)"}
						</div>
					</div>
			</div>
			
			{sf_link value="Datamodel demo" view="demo/datamodel" viewvar="page"} |
			{sf_link value="Light datamodel demo" view="demo/lightdatamodel" viewvar="page"} |
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}