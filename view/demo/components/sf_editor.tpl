{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=EditorView}
			{sf_status}
			{sf_messages global=true}
			<div class="row">
				<div class="col-sm-8">
						{sf_editor
							id="editor"
							value="#[\$bean->data['editor']]"
							required=$bean->data.required
							rendered=$bean->data.rendered
							validator="{if $bean->data.validator|default:false}EditorView::editorValidator{/if}"
							attachMessage=true
							class="{if $bean->data.class|default:false}my-editor{/if}"
							disabled=$bean->data.disabled|default:false
							width="100%"
							height="300px"
							summernoteOptions=$bean->summernoteOptions()
							summernotePlugins=$bean->summernotePlugins()
							editorconfig=$bean->ckEditorConfig()
							editor=$bean->data["editortype"]
						}
						<br/>
						{sf_commandbutton value="Submit" action="#[\$bean->submit()]"}
						{sf_commandbutton value="Clear" btnclass=secondary action="#[\$bean->clear()]" immediate=true}
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$bean->data["required"]]' immediate=true action="" label="Required"}
							{sf_checkbox value='#[$bean->data["rendered"]]' immediate=true action="" label="Rendered"}
							{sf_checkbox value='#[$bean->data["validator"]]' immediate=true action="" label="Use validator"}
							{sf_checkbox value='#[$bean->data["class"]]' immediate=true action="" label="Use custom class"}
							{sf_checkbox value='#[$bean->data["disabled"]]' immediate=true action="" label="Disabled"}
							{sf_checkbox value='#[$bean->data["editorconfig"]]' immediate=true action="" label="Custom CKEditor config"
							disabled=($bean->data["editortype"]!='ckeditor')}
							{sf_checkbox value='#[$bean->data["customSummernote"]]' immediate=true action="" label="Customize summernote"
							disabled=($bean->data["editortype"]!='summernote')}
							<div class="d-flex gap-2 align-items-center">
								Editor type
								{sf_selectonemenu value='#[$bean->data["editortype"]]' immediate=true
								values=['summernote'=>'Summernote','ckeditor'=>'CKEditor'] action=""}
							</div>
						</div>
					</div>
			</div>
			
		
		{/sf_form}
	{/sf_view}


	<style>

		.my-editor .cke_top,  .my-editor .cke_bottom{
			background-color: #66afe9;
		}
	</style>
{/literal}
{/capture}