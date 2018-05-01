{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
			
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						{sf_in name=bean1 class=InView}
						Counter={$bean1->counter} {sf_commandbutton value="Increment" action='#[$bean1->increment()]'}
						<br/>
						{sf_in name=bean2 class=InView}
						Counter={$bean2->counter} {sf_commandbutton value="Increment" action='#[$bean2->increment()]'}
						<br/>
						{sf_in name=bean3 class=InView args=10}
						Counter={$bean3->counter} {sf_commandbutton value="Increment" action='#[$bean3->increment()]'}
						<br/>
						{sf_in name=inView scope=session}
						Counter={$inView->counter} {sf_commandbutton value="Increment" action='#[$inView->increment()]'}
						<br/>
					</div>
					<div class="col-sm-4">
					
					</div>
			</div>
			
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}