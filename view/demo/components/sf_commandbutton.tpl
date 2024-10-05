{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=CommandbuttonView}
			{sf_status}
			{sf_messages global=true}
			<style>
				.my-button{
					color:red;
					border:1px solid red;
					margin:5px;
					background-color: #fff;
				}
			</style>
			<div class="row">
				<div class="col-sm-8">
					Name:
					{sf_inputtext value="#[\$bean->data['name']]" required=true attachMessage=true}
					<br/>
				
					{sf_commandbutton id="btn" value="Command Button" action='#[$bean->action()]' rendered=$bean->data.rendered
						immediate=$bean->data.immediate|default:false class="{if $bean->data.class|default:false}my-button{/if}" style="font-style:italic"
						title="Click here" disabled=$bean->data.disabled|default:false confirm="{if $bean->data.confirm|default:false}Are you sure to want to click?{/if}"
						onclick="{if $bean->data.onclick|default:false}alert('onclick event'){/if}"
						custom='data-role="button"' btnclass='primary' button=$bean->data.button|default:false}
					{sf_commandbutton value="Button 2" action="#[\$bean->submit2()]" immediate=true default="{if $bean->data['default']}form{/if}"
						update="region2"}
					{sf_region id="region2" value='
						{sf_in name=bean}
						{if $bean->submitted2}
							Updated region!
						{/if}
					'}
					{sf_commandbutton value="Warning Button" btnclass="warning"}
				</div>
				<div class="col-sm-4">
					<div class="well">
						{sf_checkbox value="#[\$bean->data['rendered']]" immediate=true action="" label="Rendered"}
						{sf_checkbox value="#[\$bean->data['immediate']]" immediate=true action="" label="Immediate"}
						{sf_checkbox value="#[\$bean->data['class']]" immediate=true action="" label="Use custom class"}
						{sf_checkbox value="#[\$bean->data['disabled']]" immediate=true action="" label="Disabled"}
						{sf_checkbox value="#[\$bean->data['confirm']]" immediate=true action="" label="Display confirm message"}
						{sf_checkbox value="#[\$bean->data['onclick']]" immediate=true action="" label="Add onclick event"}
						{sf_checkbox value="#[\$bean->data['button']]" immediate=true action="" label="Render component as button tag"}
						{sf_checkbox value="#[\$bean->data['default']]" immediate=true action="" label="Set second button as default"}
					</div>
				</div>
			</div>
			<a href="?page=default_button">Test default button</a>
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}