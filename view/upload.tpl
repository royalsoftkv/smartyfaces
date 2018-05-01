Upload component test
<br/>
{{sf_view id="upload_test"}}
	{sf_form}
		{sf_in name=uploadView}
		Please select file to upload
		<br/>
		Accept types: {sf_inputtext value="#[\$uploadView->acceptTypes]"}<br/>
		Max size: {sf_inputtext value="#[\$uploadView->maxSize]"}<br/>
		{sf_commandbutton value="Set" action=""}
		{sf_fileupload action="#[\$uploadView->upload()]" value="Upload" 
			acceptTypes=$uploadView->acceptTypes resetCtrl="Reset upload" maxSize=$uploadView->maxSize}
		
		{if $uploadView->uploaded}
			You uploaded file: <br/>
			Name: {$uploadView->files.name}<br/>
			Type: {$uploadView->files.type}<br/>
			Path: {$uploadView->files.tmp_name}<br/>
			Error: {$uploadView->files.error}<br/>
			Size: {$uploadView->files.size}<br/>
			{sf_image value=$uploadView->files.tmp_name rendered=$uploadView->isImage() width=100 height=100}
			{sf_commandlink value="Clear" action="#[\$uploadView->uploaded=false]"}
		{/if}
		
	{/sf_form}

{{/sf_view}}