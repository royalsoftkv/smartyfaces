{capture name=desc}

{/capture}

{capture name=view}
	{literal}
	
	{{sf_view id="demo" template=$template}}
	
		{sf_form}
		{sf_in name=demoView class=DatepickerView}
			{sf_messages global=true}
			<div class="row">
				<div class="col-sm-8">
						Select Date
						{sf_datepicker
							id="dtp"
							value="#[\$demoView->date]"
							required=$demoView->required
							attachMessage=$demoView->attachMessage
							class="{if $demoView->class}my-datepicker{/if}"
							disabled=$demoView->disabled
							validator="{if $demoView->useValidator}DatepickerView::dateValidator{/if}"
							converter="{if $demoView->useConverter eq 1}MySqlDateConverter{/if}"
							action="{if $demoView->action}#[\$demoView->executeAction()]{/if}"
							title="This is title of datepicker"
							onchange="{if $demoView->onchange}dtpOnChange(event){/if}"
							style="{if $demoView->style}color:red{/if}"
							rendered=$demoView->rendered
							time=$demoView->time
							block=$demoView->block
						}
						<br/>
						{sf_commandbutton value="Save" action="#[\$demoView->submitDate()]"}
						{sf_commandbutton value="Clear" btnclass="secondary" action="#[\$demoView->clearDate()]" immediate=true}
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$demoView->required]' action="" immediate=true label="Required"}
							{sf_checkbox value='#[$demoView->attachMessage]' action="" immediate=true label="Show validation message"}
							{sf_checkbox value='#[$demoView->class]' action="" immediate=true label="Use custom class"}
							{sf_checkbox value='#[$demoView->disabled]' action="" immediate=true label="Disabled"}
							{sf_checkbox value='#[$demoView->useValidator]' action="" immediate=true label="Use validator"}
							{sf_checkbox value='#[$demoView->useConverter]' label="Use converter"}
							{sf_checkbox value='#[$demoView->action]' action="" immediate=true label="Attach action on datepicker"}
							{sf_checkbox value='#[$demoView->onchange]' action="" immediate=true label="Test onchange"}
							{sf_checkbox value='#[$demoView->style]' action="" immediate=true label="Use style"}
							{sf_checkbox value='#[$demoView->rendered]' action="" immediate=true label="Rendered datepicker"}
							{sf_checkbox value='#[$demoView->time]' action="" immediate=true label="Add time"}
							{sf_checkbox value='#[$demoView->block]' action="" immediate=true label="Display as block"}
						</div>
						
					</div>
			</div>
		{/sf_form}
	{{/sf_view}}

		<script type="text/javascript">
			function dtpOnChange(ev) {
				alert(ev.target.value);
			}
		</script>

		<style>
			.my-datepicker {
				background-color: #990000;
				color: #fff;
			}
		</style>
	{/literal}
{/capture}