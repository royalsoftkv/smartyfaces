{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=PollView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						{sf_poll
							id="poll"
							action="#[\$bean->poll()]"
							interval=$bean->interval
							enabled=$bean->enabled
							actionData=$bean->getAddActionData()
							oncomplete='pollOncomplete(d,r)'
							onstart='pollOnStart()'
						}
						<span id="date">
							{$bean->out}
						</span>
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							<div class="row align-items-center mb-2">
								<label class="col-sm-3">Interval:</label>
								<div class="col-sm-9">
									{sf_ajax for="int" event="change" action=""}
									{sf_inputtext id="int" value='#[$bean->interval]'
										required=true attachMessage=true disabled=$bean->enabled size=5}
								</div>
							</div>
							{sf_checkbox value='#[$bean->enabled]' immediate=true action="" label="Enabled"}
							{sf_checkbox value='#[$bean->actionData]' immediate=true action="" label="Add action data"}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{/sf_view}
	<script type="text/javascript">
		let pollOncomplete = (d,r) => {
			$("#date").css("color","red")
		}
		let pollOnStart = () => {
			$("#date").css("color","black")
		}
	</script>

{/literal}
{/capture}