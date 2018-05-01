This is template file



{{sf_view id="s2" template="template"}}
	Smarty view in template
	{sf_in name=counterView2 class=CounterView}
	Counter={$counterView2->counter} Start={$counterView2->start}
	{sf_form}
		{sf_commandlink value="Increment" action="#[\$counterView2->increment()]" immediate=true}
		{sf_commandlink value="Decrement" action="#[\$counterView2->decrement()]" immediate=true}
		Set value
		{sf_inputtext id=c value="#[\$counterView2->counter2]" required=true}
		{sf_messages for=c}
		{sf_commandbutton value="Set" action="#[\$counterView2->set()]"}
	{/sf_form}
{{/sf_view}}

{block name="body"}



{/block}

{block name="body2"}

{{sf_view id="s3" template="template"}}
	Smarty view in template block
	{sf_in name=counterView3 class=CounterView}
	Counter={$counterView3->counter} Start={$counterView3->start}
	{sf_form}
		{sf_commandlink value="Increment" action="#[\$counterView3->increment()]" immediate=true}
		{sf_commandlink value="Decrement" action="#[\$counterView3->decrement()]" immediate=true}
		Set value
		{sf_inputtext id=c value="#[\$counterView3->counter2]" required=true}
		{sf_messages for=c}
		{sf_commandbutton value="Set" action="#[\$counterView3->set()]"}
	{/sf_form}
{{/sf_view}}

{/block}

