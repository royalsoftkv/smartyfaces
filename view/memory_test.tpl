{{sf_view id="mem_test"}}
{sf_form}
{sf_in name=bean class=MemoryTestView}

Counter={$bean->counter} 
{sf_commandlink value="Increment" action="#[\$bean->increment()]"}




<pre>
	{SmartyFacesContext::getStateInfo()}
</pre>

{/sf_form}
{{/sf_view}}