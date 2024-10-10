{capture name=desc}

{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}


			<div class="row">
				<div class="col-sm-8">
						{sf_status
							value="Ajax request is porcessing..."
						}
						{sf_commandbutton value="Execute ajax" action="#[sleep(1)]"}
					</div>
					<div class="col-sm-4">

					</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}