{capture name=view}
	{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=demoView class=InputtextareaView}
		<hr/>
		Example:
		<div class="row">
				<div class="col-sm-8">
					{sf_inputtextarea value='#[$demoView->value]' required=$demoView->required attachMessage=true
						disabled=$demoView->disabled class="my-textarea" rendered=$demoView->rendered
						validator="{if $demoView->validator}InputtextareaView::validateLength{/if}"
						title=$demoView->value rows=$demoView->rows cols=$demoView->cols style="{if $demoView->style}color:red{/if}"
						custom="{if $demoView->custom}placeholder=\"Enter text here...\"{/if}"
						converter="{if $demoView->converter}SampleConverter{/if}"}
					<br/>
					{sf_commandlink value="Clear" action="#[\$demoView->clear()]" immediate=true}
					{sf_commandlink value="Reset" action="#[\$demoView->reset()]" immediate=true}
					<br/>
					{sf_commandbutton value="Submit" action="#[\$demoView->submit()]"}
				</div>
				<div class="col-sm-4">
					<div class="well">
						{sf_checkbox value='#[$demoView->required]' action="" immediate=true label="Required"}
						{sf_checkbox value='#[$demoView->disabled]' action="" immediate=true label="Disabled"}
						{sf_checkbox value='#[$demoView->rendered]' action="" immediate=true label="Rendered"}
						{sf_checkbox value='#[$demoView->validator]' action="" immediate=true label="Use validator"}
						{sf_checkbox value='#[$demoView->style]' action="" immediate=true label="Inline style"}
						{sf_ajax event=change action="" for=rows}
						Rows{sf_inputtext id="rows" value='#[$demoView->rows]' size=3 style="display:inline"}
						{sf_ajax event=change action="" for=cols}
						Cols{sf_inputtext id="cols" value='#[$demoView->cols]' size=3 style="display:inline"}
						{sf_checkbox value='#[$demoView->custom]' action="" immediate=true label="Add custom attribute"}
						{sf_checkbox value='#[$demoView->converter]' action="" immediate=true label="Use converter"}
					</div>
				</div>
			</div>
		{/sf_form}
	{{/sf_view}}
	{/literal}
{/capture}

	
