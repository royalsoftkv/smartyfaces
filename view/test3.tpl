{{sf_view id="test4"}}
{sf_form}
{sf_in name=testView}

	{if $testView->visible}
		Checkbox {sf_checkbox value="#[\$testView->check]"}
	{/if}
	{sf_commandbutton value="Hide checkbox" action="#[\$testView->hide()]" rendered=$testView->visible}
	{sf_commandbutton value="Show checkbox" action="#[\$testView->show()]" rendered=!$testView->visible}

{/sf_form}
{{/sf_view}}