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
						<div class="d-flex gap-2 align-items-center">
							Required field
							{sf_inputtext value="#[\$bean->name]" required=true attachMessage=true}
						</div>
						<br/>
						{sf_fileupload
							id="upload"
							value="Upload"
							rendered=$bean->rendered
							action="#[\$bean->fileUploaded()]"
							immediate=$bean->immediate
							class="{if $bean->class}my-class{/if}"
							acceptTypes=$bean->acceptTypes
							maxSize=$bean->maxSize
							buttonClass="{if $bean->buttonClass}upload-btn{/if}"
							fileClass="{if $bean->fileClass}file-btn{/if}"
							multiple=$bean->multipleUpload
						}
					</div>
						
					{sf_popup rendered=$bean->files header="Uploaded files" action="#[\$bean->files=null]" immediate=true}
						<pre>
							{print_r($bean->files)}
						</pre>
						{sf_commandbutton value="Close" action="#[\$bean->files=null]" immediate=true}
					{/sf_popup}
					
				</div>
				<div class="col-sm-4">
					<div class="bg-light border p-2">
						{sf_checkbox value='#[$bean->rendered]' immediate=true action="" label="Rendered"}
						{sf_checkbox value='#[$bean->immediate]' immediate=true action="" label="Immediate"}
						{sf_checkbox value='#[$bean->class]' immediate=true action="" label="Use custom class"}
						<div class="row align-items-center mb-2">
							<div class="col-4">Accepted types</div>
							<div class="col-8">
								{sf_inputtext value='#[$bean->acceptTypes]'}
							</div>
						</div>
						<div class="row align-items-center mb-2">
							<div class="col-4">Max size</div>
							<div class="col-8">
								{sf_inputtext value='#[$bean->maxSize]'}
							</div>
						</div>
						<div class="row align-items-center mb-2">
							<div class="col-4"></div>
							<div class="col-8">
								{sf_commandbutton value="Set" action="#[\$bean->set()]" immediate=true}
								{sf_commandbutton value="Reset" btnclass=secondary action="#[\$bean->reset()]" immediate=true}
							</div>
						</div>
						{sf_checkbox value='#[$bean->buttonClass]' immediate=true action="" label="Use button class"}
						{sf_checkbox value='#[$bean->fileClass]' immediate=true action="" label="Use File button class"}
						{sf_checkbox value='#[$bean->multipleUpload]' immediate=true action="" label="Multiple files upload"}
					</div>
				</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}

	<style>
		.my-class input[type=file] {
			background-color: #66afe9;
		}
	</style>

{/literal}
{/capture}