{extends file='template/template.tpl'}

{block name="body"}

{{sf_view id="s1"}}
	Smarty view in body
	{sf_in name=counterView}
	Counter={$counterView->counter} Start={$counterView->start}
	{sf_form}
		{sf_commandlink value="Increment" action="#[\$counterView->increment()]" immediate=true}
		{sf_commandlink value="Decrement" action="#[\$counterView->decrement()]" immediate=true}
		Set value
		{sf_inputtext id=c value="#[\$counterView->counter2]" required=true}
		{sf_messages for=c}
		{sf_commandbutton value="Set" action="#[\$counterView->set()]"}
	{/sf_form}
{{/sf_view}}

{/block}