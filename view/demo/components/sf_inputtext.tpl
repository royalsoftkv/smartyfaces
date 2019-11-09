{capture name=view}
	{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=demoView class=InputtextView}
		{sf_status}
		<script type="text/javascript">
			function complete(data) {
				id=data.sf_source;
				$("#"+id).css("background-color","red");
				$("#"+id).focus();
			}
		</script>
		<hr/>
		Example:
		<div class="row">
				<div class="col-sm-8">
					{sf_ajax for="itext" event="change" action='#[$demoView->change()]' actionData=5 immediate=true 
						oncomplete="complete(data)"}
					{sf_inputtext id="itext" value='#[$demoView->name]' required=($demoView->required eq 1) 
						attachMessage=($demoView->attachMessage eq 1) size=$demoView->size type=$demoView->type 
						disabled=($demoView->disabled eq 1)
						placeholder=$demoView->placeholder block=$demoView->block custom='custom-attr="value"'
						readonly=$demoView->readonly}
					<br/>
					{sf_commandbutton value="Submit" action='#[$demoView->submit()]'}
					{sf_commandbutton value="Reset" action='#[$demoView->reset()]' immediate=true}
					<br/>
					{$demoView->text}
				</div>
				<div class="col-sm-4">
					<div class="well">
						{sf_checkbox value='#[$demoView->required]' action="" immediate=true label="Required"}
						{sf_ajax for="size" event="change" action="" immediate=true}
						Size:
						{sf_inputtext id="size" value='#[$demoView->size]' size=5 style="display:inline"}
						<br/>
						Type: {sf_radiogroup values=['text','password'] value='#[$demoView->type]' var=t val='$t' label='$t'
							 action="" immediate=true}
						{sf_checkbox value='#[$demoView->disabled]' action="" immediate=true label="Disabled"}
						{sf_checkbox value='#[$demoView->attachMessage]' action="" immediate=true label="Attach message"}
						Placeholder:
						{sf_ajax for="placeholder" event="change" action="" immediate=true}
						{sf_inputtext id="placeholder" value='#[$demoView->placeholder]' style="display:inline"}
						<br/>
						{sf_checkbox value='#[$demoView->block]' action="" immediate=true label="Block display"}
						{sf_checkbox value='#[$demoView->readonly]' action="" immediate=true label="Read only"}
					</div>
				</div>
			</div>
		{/sf_form}
	{{/sf_view}}
	{/literal}
{/capture}

	
