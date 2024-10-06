{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
			
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
					<div class="border p-2 mb-2">
						{sf_in
							name=bean1
							class=InView
						}
						<div class="mb-2">Independent view 1</div>
						Counter={$bean1->counter} {sf_commandbutton value="Increment" action='#[$bean1->increment()]'}
					</div>
					<div class="border p-2 mb-2">
						{sf_in name=bean2 class=InView}
						<div class="mb-2">Independent view 2</div>
						Counter={$bean2->counter} {sf_commandbutton value="Increment" action='#[$bean2->increment()]'}
					</div>
					<div class="border p-2 mb-2">
						{sf_in
							name=bean3
							class=InView
							args=10
						}
						<div class="mb-2">Independent view with arguments</div>
						Counter={$bean3->counter} {sf_commandbutton value="Increment" action='#[$bean3->increment()]'}
					</div>
					<div class="border p-2 mb-2">
						{sf_in
							name=inView
							scope=session
						}
						<div class="mb-2">View in session</div>
						Counter={$inView->counter} {sf_commandbutton value="Increment" action='#[$inView->increment()]'}
					</div>
				</div>
				<div class="col-sm-4">

				</div>
			</div>
			
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}