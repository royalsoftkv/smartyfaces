{capture name=desc}
	Used component is <a href="https://eonasdan.github.io/bootstrap-datetimepicker/" target="_blank">Bootstrap 3 datetimepicker</a>
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
							value="#[\$demoView->date]"
							required=true
							attachMessage=$demoView->attachMessage
							size=10
							dateFormat=$demoView->dateFormat class="my-datepicker"
							converter="{if $demoView->useConverter eq 1}MySqlDateConverter{/if}"
							validator="DemoView::dateValidator"
							buttonImage="{if $demoView->buttonImage}img/cal.gif{/if}"
							title="This is title of datepicker"
							onclick="{if $demoView->onclick}alert('Datepicker clicked!'){/if}"
							onchange="{if $demoView->onchange}alert('Datepicker changed!'){/if}"
							style="{if $demoView->style}color:red{/if}"
							required=$demoView->required disabled=$demoView->disabled
							rendered=$demoView->rendered
							action="{if $demoView->action}#[\$demoView->executeAction()]{/if}"
							bootstrapIcon="{if $demoView->bootstrapIcon}time{else}calendar{/if}"
							datepickerOptions=['calendarWeeks'=>true]
							time=$demoView->time
							block=$demoView->block
						}
						<br/>
						{sf_commandbutton value="Save" action="#[\$demoView->submitDate()]"}
						<br/>
						{$demoView->text}
						<hr/>
						{sf_datepicker value="#[\$demoView->date2]" dateFormat="DD.MM.YYYY hh:mm:ss"}
					</div>
					<div class="col-sm-4">
						<div class="well">
							Date Format:
							{sf_inputtext value='#[$demoView->dateFormat]' style="display:inline"}
							<br/>
							{sf_checkbox value='#[$demoView->useConverter]' label="Use converter"} 
							<br/>
							{sf_commandbutton value="Set" action="" immediate=true}
							{sf_commandbutton value="Reset" action='#[$demoView->resetDatepicker()]' immediate=true}
							{sf_checkbox value='#[$demoView->buttonImage]' action="" immediate=true label="Use button image"} 
							{sf_checkbox value='#[$demoView->onclick]' action="" immediate=true label="Test onclick"} 
							{sf_checkbox value='#[$demoView->onchange]' action="" immediate=true label="Test onchange"} 
							{sf_checkbox value='#[$demoView->style]' action="" immediate=true label="Use style"} 
							{sf_checkbox value='#[$demoView->required]' action="" immediate=true label="Required"} 
							{sf_checkbox value='#[$demoView->attachMessage]' action="" immediate=true label="Show validation message"} 
							{sf_checkbox value='#[$demoView->disabled]' action="" immediate=true label="Disabled"} 
							{sf_checkbox value='#[$demoView->action]' action="" immediate=true label="Attach action on datepicker"} 
							{sf_checkbox value='#[$demoView->rendered]' action="" immediate=true label="Rendered datepicker"} 
							{sf_checkbox value='#[$demoView->bootstrapIcon]' action="" immediate=true label="Change bootstrap icon"} 
							{sf_checkbox value='#[$demoView->time]' action="" immediate=true label="Add time"}
							{sf_checkbox value='#[$demoView->block]' action="" immediate=true label="Display as block"}
						</div>
						
					</div>
			</div>
		{/sf_form}
	{{/sf_view}}
	{/literal}
{/capture}