{extends file='template/demo.tpl'}
{block name=content}


{{sf_view id="session_test"}}
{sf_form}

    {sf_status}

    {sf_in name=counterView}
        Counter={$counterView->counter} Start={$counterView->start}

    {sf_commandlink value="Increment" action="#[\$counterView->increment()]" immediate=true}
    {sf_commandlink value="Decrement" action="#[\$counterView->decrement()]" immediate=true}
        Set value

    {sf_inputtext id=c value="#[\$counterView->counter2]" required=true}
    {sf_messages for=c}
    {sf_commandbutton value="Set" action="#[\$counterView->set()]"}
    {sf_commandbutton value="Exec" action="#[\$counterView->exec()]"  immediate=true}


{/sf_form}
{{/sf_view}}

{/block}