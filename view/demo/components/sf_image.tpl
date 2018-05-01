{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=ImageView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						{sf_image value=$bean->path() width=$bean->width height=$bean->height data=$bean->data() 
							type=$bean->type() class="{if $bean->class}img-thumbnail{/if}"
							responsive=$bean->responsive
							style="border:1px solid #ccc;padding:3px;"
							rendered=$bean->rendered timestamp=$bean->timestamp}
					</div>
					<div class="col-sm-4">
						<div class="well">
							Width: {sf_inputtext value='#[$bean->width]' size="5" style="display:inline"}<br/> 
							Height: {sf_inputtext value='#[$bean->height]' size="5" style="display:inline"}<br/>
							{sf_commandbutton value="Set" action=""}
							{sf_commandbutton value="Reset" action='#[$bean->reset()]'}
							<br/>
							{sf_checkbox value='#[$bean->base64]' action="" label="Use data image"} 
							{sf_checkbox value='#[$bean->class]' action="" label="Use class"} 
							{sf_checkbox value='#[$bean->responsive]' action="" label="Responsive image"} 
							{sf_checkbox value='#[$bean->rendered]' action="" label="Rendered"} 
							{sf_checkbox value='#[$bean->timestamp]' action="" label="Prevent caching"} 
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}