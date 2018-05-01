{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
			{sf_in name=bean class=MessagesView}
			{sf_status}
			<style>
				.my-messages{ text-align: center;font-style: italic; }
				.msg-danger { background-color: #800000; color: #FF0000 }
			</style>
			{sf_messages class="{if $bean->class}my-messages{/if}" global=true style="{if $bean->style}position:relative;font-style:italic{/if}"
				styled=$bean->styled customClasses=$bean->getCustomClasses()}
			<div class="row">
				<div class="col-sm-8">
						
						{sf_inputtext id="name" value="#[\$bean->name]" required=true style="width:auto"}
						{sf_messages for="name" style="{if $bean->style}color:green;background-color:yellow{/if}"}
						<br/>
						{sf_commandbutton value="Submit (for component)" action='#[$bean->submit1()]'}
						{sf_commandbutton value="Submit (global)" action='#[$bean->submit2()]'}
						
						<br/>
						Global messages:
						<br/>
						{sf_commandbutton value="Success" action='#[$bean->submitSuccess()]' immediate=true}
						{sf_commandbutton value="Info" action='#[$bean->submitInfo()]' immediate=true}
						{sf_commandbutton value="Warning" action='#[$bean->submitWarning()]' immediate=true}
						{sf_commandbutton value="Error" action='#[$bean->submitError()]' immediate=true}
						{sf_commandbutton value="Warning & Error" action='#[$bean->submitMultiple()]' immediate=true}
						<br/>
						{sf_commandbutton value="Send flash message" action='#[$bean->sendFlash()]' immediate=true}
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_checkbox value='#[$bean->style]' action="" immediate=true label="Use style for message"}
							{sf_checkbox value='#[$bean->class]' action="" immediate=true label="Use class for message"}
							{sf_checkbox value='#[$bean->styled]' action="" immediate=true label="Styled messages"}
							{sf_checkbox value='#[$bean->customClasses]' action="" immediate=true label="Use custom classes"}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}