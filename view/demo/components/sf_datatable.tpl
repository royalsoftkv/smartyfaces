{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=DatatableView}
			{sf_status}
			<style>
				.sf-datatable tbody tr.selected td, .table tbody tr.selected td { background-color: #EFEFC2 }
				.sf-datatable tr.red td,.table tr.red td  { color:red }
			</style>
			<div class="row">
				<div class="col-sm-8">
						{sf_datatable
							id="my-data-table"
							value=$bean->countries()
							style="{if $bean->style}width:500px;{/if}"
							class="{if $bean->class}my-table{/if}"
							var=country
							index=index
							emptyRowsMessage="There are no records in this table"
							rowKeyVar=row
							rowSelection=$bean->selected
							header="SmartyFaces data table"
							rowclass='$template->getTemplateVars(\'bean\')->getRowClass($row)'
							responsive=$bean->responsive
							visibleColumns=$bean->getVisibleColumns()
						}
							{sf_column header=Index id=index}
								{sf_commandlink value="$index" action="#[\$bean->selected={$index}]"}
							{/sf_column}
							{sf_column header=ISO id=iso}
								{$country.iso}
							{/sf_column}
							{sf_column header=Name id=name}
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
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$bean->style]' action="" immediate=true label="Add custom style"}
							{sf_checkbox value='#[$bean->class]' action="" immediate=true label="Add custom class"}


							{sf_checkbox value='#[$bean->emptyTable]' action="" immediate=true label="Empty table"}
							{sf_checkbox value='#[$bean->responsive]' action="" immediate=true label="Responsive table"}
							{sf_checkbox value='#[$bean->hideColumns]' action="" immediate=true label="Hide columns"}
						</div>
					</div>
			</div>
			
			{sf_link value="Datamodel demo" view="demo/datamodel"} |
			{sf_link value="Light datamodel demo" view="demo/lightdatamodel"} |
		
		{/sf_form}
	{/sf_view}


	<style>
		.my-table thead th {
			background-color: blue;
		}
	</style>
{/literal}
{/capture}