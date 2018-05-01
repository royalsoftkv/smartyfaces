{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
			{sf_status}

			<div class="row">
				<div class="col-sm-8">
						{$data=SampleData::loadData(10)}
						<ul>
						{sf_repeat value=$data var=item}
							<li>{$item.iso} - {$item.name}</li>
						{/sf_repeat}
						</ul>
					</div>
					<div class="col-sm-4">

					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}