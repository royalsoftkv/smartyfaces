{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
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
						Name:
						{sf_inputtext value="#[\$bean->data['name']]" required=true attachMessage=true}
						<br/>
					
						{sf_commandlink id="lnk" value="Command Link" action='#[$bean->action()]' rendered=$bean->data.rendered
							immediate=$bean->data.immediate|default:false class="{if $bean->data.class|default:false}my-link{/if}" style="font-style:italic"
							title="Click here" disabled=$bean->data.disabled|default:false confirm="{if $bean->data.confirm|default:false}Are you sure to want to click?{/if}"
							onclick="{if $bean->data.onclick|default:false}alert('onclick event'){/if}"
							update="{if $bean->data.update|default:false}region{/if}" custom='link-id="123"'}
							
						{sf_region id="region" value='
							{sf_in name=bean class=CommandlinkView}
							{if isset($bean) and isset($bean->data.name)}
								You submitted {$bean->data.name}
							{/if}
						
						
						' assign=bean}
						
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_checkbox value="#[\$bean->data['rendered']]" immediate=true action="" label="Rendered"}
							{sf_checkbox value="#[\$bean->data['immediate']]" immediate=true action="" label="Immediate"}
							{sf_checkbox value="#[\$bean->data['class']]" immediate=true action="" label="Use custom class"}
							{sf_checkbox value="#[\$bean->data['disabled']]" immediate=true action="" label="Disabled"}
							{sf_checkbox value="#[\$bean->data['confirm']]" immediate=true action="" label="Display confirm message"}
							{sf_checkbox value="#[\$bean->data['onclick']]" immediate=true action="" label="Add onclick event"}
							{sf_checkbox value="#[\$bean->data['update']]" immediate=true action="" label="Use update [Experimental]"}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}