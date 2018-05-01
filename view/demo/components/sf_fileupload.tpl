{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=FileuploadView}
			{sf_status}
			<style>
				.upload-btn{ border:1px solid red; }
				.file-btn{ border:1px solid green;color:red }
			</style>
			<div class="row">
				<div class="col-sm-8">
					<div class="col-sm-4">
						Required field {sf_inputtext value="#[\$bean->name]" required=true attachMessage=true}
						<br/>
						{sf_fileupload action="#[\$bean->fileUploaded()]" id="upload" value="Upload" rendered=$bean->rendered
							acceptTypes=$bean->acceptTypes resetCtrl=Back maxSize=$bean->maxSize 
							buttonClass="{if $bean->buttonClass}upload-btn{/if}" immediate=$bean->immediate
							fileClass="{if $bean->fileClass}file-btn{/if}"}
					</div>
						
					{sf_popup rendered=$bean->file header="Uploaded file" action="#[\$bean->file=null]" immediate=true}
						<pre>
							{print_r($bean->file)}
						</pre>
						{sf_commandbutton value="Close" action="#[\$bean->file=null]" immediate=true}
					{/sf_popup}
					
				</div>
				<div class="col-sm-4">
					<div class="well">
						{sf_checkbox value='#[$bean->rendered]' immediate=true action="" label="Rendered"}
						Accepted types
						{sf_inputtext value='#[$bean->acceptTypes]' style="display:inline"}
						<br/>
						Max size
						{sf_inputtext value='#[$bean->maxSize]' style="display:inline"}
						<br/>
						{sf_commandbutton value="Set" action="#[\$bean->set()]" immediate=true}
						<br/>
						{sf_checkbox value='#[$bean->buttonClass]' immediate=true action="" label="Use button class"}
						{sf_checkbox value='#[$bean->immediate]' immediate=true action="" label="Immediate"}
						{sf_checkbox value='#[$bean->fileClass]' immediate=true action="" label="Use File button class"}
					</div>
				</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}