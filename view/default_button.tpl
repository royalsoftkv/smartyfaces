{extends file='template/demo.tpl'}
{block name=content}

	{{sf_view id="default_button"}}
	{sf_form}
	{sf_in name=bean class=DefaultButtonView}
	
	<div class="well">
		{sf_messages global=true}
		<div class="row">
			<div class="col-sm-2 scope1 well wekk-sm">
				{sf_inputtext value="#[\$bean->input1]"}
				<span class="text-muted">
					Enter on this will submit only this block
				</span>
			</div>
			<div class="col-sm-2">
				{sf_inputtext value="#[\$bean->input2]"}
			</div>
			<div class="col-sm-2">
				{sf_inputtext value="#[\$bean->input3]"}
				Enter on this will submit form
			</div>
			<div class="col-sm-2">
				{sf_inputtextarea value="#[\$bean->input3]"}
				Enter on this will submit nothing
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2">
				{sf_commandbutton value="Submit1" id="submit1" action="#[\$bean->submit1()]" default=".scope1"}
			</div>
			<div class="col-sm-2">
				{sf_commandbutton value="Submit2" id="submit2" action="#[\$bean->submit2()]" default=form}
				Default button
			</div>
			<div class="col-sm-2">
				{sf_commandbutton value="Submit3" id="submit3" action="#[\$bean->submit3()]"}
			</div>
			<div class="col-sm-2">
				{sf_commandbutton value="Submit4" id="submit4" action="#[\$bean->submit4()]"}
			</div>
		</div>
	</div>
	
	{/sf_form}
	{{/sf_view}}
					
{/block}