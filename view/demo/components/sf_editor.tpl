{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=EditorView}
			{sf_status}
			{sf_messages global=true}
			<div class="row">
				<div class="col-sm-8">
						{sf_editor id="editor" value="#[\$bean->data['editor']]" required=$bean->data.required attachMessage=true
							rendered=$bean->data.rendered validator="{if $bean->data.validator|default:false}EditorView::editorValidator{/if}"
							class="my-editor" disabled=$bean->data.disabled|default:false  width=500 height=300
							summernoteOptions=$bean->summernoteOptions() summernotePlugins=['ext-hello']
							editor=$bean->data["editortype"] editorconfig=['customConfig'=>'../../js/ckeditor_config.js']}
						<br/>
						{sf_commandbutton value="Submit" action="#[\$bean->submit()]"}
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_checkbox value='#[$bean->data["required"]]' immediate=true action="" label="Required"}
							{sf_checkbox value='#[$bean->data["rendered"]]' immediate=true action="" label="Rendered"}
							{sf_checkbox value='#[$bean->data["validator"]]' immediate=true action="" label="Use validator"}
							{sf_checkbox value='#[$bean->data["disabled"]]' immediate=true action="" label="Disabled"}
							{sf_checkbox value='#[$bean->data["config"]]' immediate=true action="" label="Use simple theme"}
							Editor type
							{sf_selectonemenu value='#[$bean->data["editortype"]]' immediate=true values=['summernote'=>'Summernote','ckeditor'=>'CKEditor'] action=""}
						</div>
					</div>
			</div>
			
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}