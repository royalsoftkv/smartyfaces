{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=PopupView}
			{sf_status}
			
			<style>
				.my-popup .modal-header{
					background-color: #333;
					color:#fff;
				}
			</style>

			<div class="row">
				<div class="col-sm-8">

						{sf_commandbutton value="Open popup" action='#[$bean->openPopup()]'}
						{sf_commandbutton value="Open second popup" action='#[$bean->popup2=true]' immediate=true}

						{sf_popup
							id="my-popup"
							rendered=$bean->popup
							immediate=$bean->immediate
							class="{if $bean->class}my-popup{/if}"
							header="SmartyFaces Popup"
					  		action='#[$bean->closePopup()]'
							width=$bean->width
							fade=$bean->fade
						}
							<p>
								This is simple modal poup. 
								<br/>You can close it by click on X link in header,
								or by click on close button below.
							</p>
							Required field
							{sf_inputtext id="req" value="" required=true attachMessage=true}
							<br/>
							{sf_facet name=footer rendered=(SmartyFaces::$skin eq 'bootstrap')}
								{sf_commandbutton value="Save" action='#[$bean->save()]' btnclass="primary"}
								{sf_commandbutton value="Close" action='#[$bean->closePopup()]' immediate=true}
							{/sf_facet}
						{/sf_popup}
						
						{sf_popup rendered=$bean->popup2 header="Second popup" action='#[$bean->popup2=false]'}
							<p>
								This is second popup
								<br/>
								{sf_commandbutton value="Open nested popup" action='#[$bean->popup3=true]' immediate=true}
							</p>
							{sf_facet name=footer}
								{sf_commandbutton value="Close" action='#[$bean->popup2=false]' immediate=true}
							{/sf_facet}
						{/sf_popup}
						
						{sf_popup rendered=$bean->popup3 header="Third popup" action='#[$bean->popup3=false]'}
							<p>
								This is third popup
							</p>
							{sf_facet name=footer}
								{sf_commandbutton value="Close" action='#[$bean->popup3=false]' immediate=true}
							{/sf_facet}
						{/sf_popup}

					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value='#[$bean->immediate]' action="" immediate=true label="Immediate"}
							{sf_checkbox value='#[$bean->class]' action="" immediate=true label="Use custom class"}
							<div class="d-flex gap-2 align-items-center">
								Width {sf_inputtext value='#[$bean->width]' required=true attachMessage=true}
								{sf_commandbutton value="Set" action=""}
								{sf_commandbutton value="Reset" action="#[\$bean->width='auto']"}
							</div>
							{sf_checkbox value='#[$bean->fade]' action="" immediate=true label="Open with fade effect"}
						</div>
					</div>
			</div>
			

		{/sf_form}
	{/sf_view}
{/literal}
{/capture}