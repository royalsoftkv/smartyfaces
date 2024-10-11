{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=CommandlinkView}
			{sf_status}
			{sf_messages global=true}
			<style>
				.my-link{
					color:red;
					margin:5px;
					background-color: #fff;
					text-decoration: none;
				}
			</style>
			<div class="row">
				<div class="col-sm-8">
					<div class="d-flex gap-3 align-items-center mb-2">
						<div>Name:</div>
						<div>
							{sf_inputtext value="#[\$bean->data['name']]" required=true attachMessage=true}
						</div>
						<div>
							{if !empty($bean->data.name)}
							{sf_commandlink value='<span class="fa fa-times"></span>' action='#[$bean->clear()]'}
							{/if}
						</div>
					</div>

						{sf_commandlink
							id="lnk"
							action='#[$bean->action()]'
							value="Command Link"
							immediate=$bean->data.immediate|default:false
							rendered=$bean->data.rendered
							disabled=$bean->data.disabled|default:false
							style="{if $bean->data.style|default:false}font-style:italic{/if}"
							class="{if $bean->data.class|default:false}my-link{/if}"
							title="Click here"
							custom='link-id="123"'
							confirm="{if $bean->data.confirm|default:false}Are you sure to want to click?{/if}"
							onclick="{if $bean->data.onclick|default:false}alert('onclick event'){/if}"
							update="{if $bean->data.update|default:false}region{/if}" }

						{if $bean->data.update|default:false}
							{sf_region id="region" value='
								{sf_in name=bean}
								You submitted {$bean->data.name}
							'}
						{/if}
						
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							{sf_checkbox value="#[\$bean->data['immediate']]" immediate=true action="" label="Immediate"}
							{sf_checkbox value="#[\$bean->data['rendered']]" immediate=true action="" label="Rendered"}
							{sf_checkbox value="#[\$bean->data['disabled']]" immediate=true action="" label="Disabled"}
							{sf_checkbox value="#[\$bean->data['style']]" immediate=true action="" label="Add custom style"}
							{sf_checkbox value="#[\$bean->data['class']]" immediate=true action="" label="Use custom class"}
							{sf_checkbox value="#[\$bean->data['confirm']]" immediate=true action="" label="Display confirm message"}
							{sf_checkbox value="#[\$bean->data['onclick']]" immediate=true action="" label="Add onclick event"}
							{sf_checkbox value="#[\$bean->data['update']]" immediate=true action="" label="Use update region"}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}