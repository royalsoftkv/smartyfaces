{capture name=view}
	{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=demoView class=InputtextView}
		{sf_status}
		{sf_messages global=true}
		<script type="text/javascript">
			function complete(data) {
				id=data.sf_source;
				$("#"+id).css("background-color","red");
				$("#"+id).focus();
			}
			function inoutOnChange(ev) {
				alert(ev.target.value);
			}
			function inoutOnKeyup(ev) {
				console.log(ev);
			}
		</script>
		<hr/>
		<div class="row">
				<div class="col-sm-8">
					<div class="d-flex gap-3 align-items-center">
						{sf_ajax for="itext" event="change" action='#[$demoView->change()]' actionData=5 immediate=true
							oncomplete="complete(data)" rendered=$demoView->events}
						<div>
							{sf_inputtext
								value='#[$demoView->name]'
								id="itext"
								required=($demoView->required eq 1)
								size=$demoView->size
								type=$demoView->type
								validator="{if $demoView->validator}InputtextView::textValidator{/if}"
								class="{if $demoView->class}my-class{/if}"
								style="{if $demoView->style}color: green;{/if}"
								disabled=($demoView->disabled eq 1)
								rendered=$demoView->rendered
								attachMessage=true
								converter="{if $demoView->converter}SampleConverter{/if}"
								title="Name input"
								custom='custom-attr="value"'
								onchange="{if $demoView->onchange}inoutOnChange(event){/if}"
								onkeyup="{if $demoView->onkeyup}inoutOnKeyup(event){/if}"
								placeholder=$demoView->placeholder
								block=$demoView->block
								readonly=$demoView->readonly
							}
						</div>
						{$demoView->text}
					</div>
					<br/>
					{sf_commandbutton value="Submit" action='#[$demoView->submit()]'}
					{sf_commandbutton value="Reset" btnclass=secondary action='#[$demoView->reset()]' immediate=true}
					<br/>
				</div>
				<div class="col-sm-4">
					<div class="bg-light border p-2">
						{sf_checkbox value='#[$demoView->required]' action="" immediate=true label="Required"}
						<div class="row align-items-center mb-2">
							<div class="col-4">Size:</div>
							<div class="col-8">
								{sf_inputtext id="size" value='#[$demoView->size]' size=5 events=['change'=>['immediate'=>true, 'action'=>'']]}
							</div>
						</div>
						<div class="row align-items-center mb-2">
							<div class="col-4">Type:</div>
							<div class="col-8">
								{sf_selectonemenu value='#[$demoView->type]' immediate=true
									values=['text'=>'text','password'=>'password'] action=""}
							</div>
						</div>
						{sf_checkbox value='#[$demoView->validator]' action="" immediate=true label="Use validator"}
						{sf_checkbox value='#[$demoView->class]' action="" immediate=true label="Use custom class"}
						{sf_checkbox value='#[$demoView->style]' action="" immediate=true label="Use custom style"}
						{sf_checkbox value='#[$demoView->disabled]' action="" immediate=true label="Disabled"}
						{sf_checkbox value='#[$demoView->rendered]' action="" immediate=true label="Rendered"}
						{sf_checkbox value='#[$demoView->converter]' action="" immediate=true label="Use converter"}
						{sf_checkbox value='#[$demoView->events]' action="" immediate=true label="Attach ajax events"}
						{sf_checkbox value='#[$demoView->onchange]' action="" immediate=true label="Attach onchange javascript event"}
						{sf_checkbox value='#[$demoView->onkeyup]' action="" immediate=true label="Attach onkeyup javascript event"}
						<div class="row align-items-center mb-2">
							<div class="col-4">Placeholder:</div>
							<div class="col-8">
								{sf_ajax for="placeholder" event="change" action="" immediate=true}
								{sf_inputtext id="placeholder" value='#[$demoView->placeholder]'}
							</div>
						</div>
						{sf_checkbox value='#[$demoView->block]' action="" immediate=true label="Block display"}
						{sf_checkbox value='#[$demoView->readonly]' action="" immediate=true label="Read only"}
					</div>
				</div>
			</div>
		{/sf_form}
	{/sf_view}

		<style>
			.my-class {
				background-color: #66afe9;
			}
		</style>

	{/literal}
{/capture}

	
