{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=ImageView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						{sf_image
							value=$bean->path()
							class="{if $bean->class}img-thumbnail{/if}"
							rendered=$bean->rendered
							data=$bean->data()
							width=$bean->width
							height=$bean->height
							responsive=$bean->responsive
							style="{if $bean->style}border:1px solid red;padding:5px;{/if}"
							timestamp=$bean->timestamp
						}
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$bean->class]' action="" label="Use class"}
							{sf_checkbox value='#[$bean->style]' action="" label="Use custom style"}
							{sf_checkbox value='#[$bean->rendered]' action="" label="Rendered"}
							{sf_checkbox value='#[$bean->base64]' action="" label="Use data image"}
							<div class="row align-items-center mb-2">
								<div class="col-4">Width:</div>
								<div class="col-8">{sf_inputtext value='#[$bean->width]'}</div>
							</div>
							<div class="row align-items-center mb-2">
								<div class="col-4">Height:</div>
								<div class="col-8">{sf_inputtext value='#[$bean->height]'}</div>
							</div>
							<div class="row align-items-center mb-2">
								<div class="col-4"></div>
								<div class="col-8">
									{sf_commandbutton value="Set" action=""}
									{sf_commandbutton value="Reset" btnclass=secondary action='#[$bean->reset()]' immediate=true}
								</div>
							</div>
							{sf_checkbox value='#[$bean->responsive]' action="" label="Responsive image"}
							{sf_checkbox value='#[$bean->timestamp]' action="" label="Prevent caching"}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}