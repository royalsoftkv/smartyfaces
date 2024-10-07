{capture name=view}
	{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=demoView class=InputtextareaView}
		<div class="row">
				<div class="col-sm-8">
					{sf_inputtextarea
						id="my-text-area"
						value='#[$demoView->value]'
						required=$demoView->required
						disabled=$demoView->disabled
						class="{if $demoView->class}my-textarea{/if}"
						rendered=$demoView->rendered
						validator="{if $demoView->validator}InputtextareaView::validateLength{/if}"
						attachMessage=true
						title="This is textarea"
						style="{if $demoView->style}color:red{/if}"
						custom="{if $demoView->custom}placeholder=\"Enter text here...\"{/if}"
						converter="{if $demoView->converter}SampleConverter{/if}"

						 rows=$demoView->rows cols=$demoView->cols
						custom="{if $demoView->custom}placeholder=\"Enter text here...\"{/if}"

					}

					<div class="mt-2">
						{sf_commandbutton value="Submit" action="#[\$demoView->submit()]"}
						{sf_commandbutton value="Clear" btnclass=light action="#[\$demoView->clear()]" immediate=true}
						{sf_commandbutton value="Reset" btnclass=light action="#[\$demoView->reset()]" immediate=true}
					</div>

				</div>
				<div class="col-sm-4">
					<div class="bg-light border p-2">
						{sf_checkbox value='#[$demoView->required]' action="" immediate=true label="Required"}
						{sf_checkbox value='#[$demoView->disabled]' action="" immediate=true label="Disabled"}
						{sf_checkbox value='#[$demoView->class]' action="" immediate=true label="Use custom class"}
						{sf_checkbox value='#[$demoView->rendered]' action="" immediate=true label="Rendered"}
						{sf_checkbox value='#[$demoView->validator]' action="" immediate=true label="Use validator"}
						{sf_checkbox value='#[$demoView->style]' action="" immediate=true label="Inline style"}
						{sf_checkbox value='#[$demoView->custom]' action="" immediate=true label="Add custom attribute"}
						{sf_checkbox value='#[$demoView->converter]' action="" immediate=true label="Use converter"}

						<div class="d-flex gap-2 align-items-center">
							{sf_ajax event=change action="" for=rows}
							Rows{sf_inputtext id="rows" value='#[$demoView->rows]' size=3 style="display:inline"}
							{sf_ajax event=change action="" for=cols}
							Cols{sf_inputtext id="cols" value='#[$demoView->cols]' size=3 style="display:inline"}
						</div>

					</div>
				</div>
			</div>
		{/sf_form}
	{/sf_view}

		<style>
			.my-textarea {
				border: 1px solid green;
				color: green;
			}
		</style>

	{/literal}
{/capture}

	
