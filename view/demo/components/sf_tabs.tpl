{capture name=desc}

{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_status}
		{sf_messages global=true}
		{sf_form}
		{sf_in name=bean class=TabsView}
		<div class="row">
				<div class="col-sm-8">
					{sf_tabs
						id="sample-tabs"
						action=$bean->getAction()
						value='#[$bean->tab]'
						load=$bean->load
					}
						{sf_tab header="Tab1"}
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce adipiscing odio purus, non egestas quam sodales a. Sed pharetra enim a sem suscipit, vel mattis massa faucibus. In lacinia eros sem, eget lacinia nibh pretium ac. Integer faucibus libero non gravida ultricies. Donec mattis congue sagittis. Praesent at mollis massa, ac eleifend dui. Maecenas sit amet arcu pretium, mollis dolor sed, scelerisque lectus. Donec urna ligula, tristique a urna id, pellentesque mollis elit. Ut sit amet blandit lectus. Nam posuere cursus enim, eu condimentum velit bibendum sit amet. Proin molestie ac nibh ut semper. Sed laoreet, justo nec pharetra sollicitudin, lectus nibh condimentum sem, et euismod augue ipsum consectetur mi. Sed consequat dapibus lacus, ut ornare lorem egestas a. Donec vitae sollicitudin mi. Duis neque augue, molestie vel mauris quis, luctus malesuada lorem. 
						{/sf_tab}
						{sf_tab header="Tab2"}
							Praesent id risus fermentum, vulputate elit ac, tincidunt magna. Donec lacinia mollis velit. Proin non leo molestie, consequat risus at, porttitor tortor. Maecenas eget libero ipsum. Nullam vulputate ligula felis. Morbi lacinia risus risus, non consectetur odio suscipit in.
						{/sf_tab}
						{sf_tab header="Tab3"}
							Curabitur elementum massa urna, ut bibendum ligula accumsan ut. Duis sit amet facilisis eros, id sodales nisl. In dignissim dolor et consectetur rhoncus. Cras et nisl eu neque rhoncus accumsan. Cras vel tempus urna. Vivamus facilisis pellentesque felis non blandit. Etiam feugiat, orci sit amet volutpat tristique, elit massa tristique felis, nec elementum odio erat a magna. 
							<br/>
							{sf_checkbox value="#[\$bean->check]"} Checkbox
							<br/>
							{sf_inputtext value="#[\$bean->input]"}
						{/sf_tab}
					{/sf_tabs}
					<hr/>
					Selected tab index = {$bean->tab}
					{sf_commandbutton value="Switch to last tab" action="#[\$bean->tab=2]"}
				</div>
				<div class="col-sm-4">
					<div class="bg-light border p-2">
						{sf_checkbox value='#[$bean->ajax]' immediate=true action="" label="Ajaxible"}
						{sf_checkbox value='#[$bean->load]' immediate=true action="" label="Load automaticaly"}
					</div>
					
					
				</div>
			</div>


		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}