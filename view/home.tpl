SmartyFaces version 1.0


{{sf_view id="test"}}
	{sf_in name=counterView}
	Counter={$counterView->counter} Start={$counterView->start}
	{sf_form}
		{sf_commandlink value="Increment" action="#[\$counterView->increment()]" immediate=true}
		{sf_commandlink value="Decrement" action="#[\$counterView->decrement()]" immediate=true}
		Set value
		{sf_inputtext id=c value="#[\$counterView->counter2]" required=true}
		{sf_messages for=c}
		{sf_commandbutton value="Set" action="#[\$counterView->set()]"}
		<a href="#" onclick="SF.a(this,'#[$counterView->setValue()]',{ value:6 });">Remote Action</a>
		<a href="" id="remote2">Remote2</a>
		<script type="text/javascript">
			$(function() {
				$("#remote2").click(function(e){
					SF.a(this,'#[$counterView->setValue()]',{ value:12 });
					e.preventDefault();
				});
			});
		</script>
	{/sf_form}
	{CounterView::sessionSize()}
	<br/>
{{/sf_view}}


{{sf_view id="test2" stateless=true}}
	Stateless View
	<br/>
	{sf_form}
		{sf_var name=start default=$smarty.get.counter|default:0}
		{sf_var name=counter default=$start}
		{sf_var name=setval default=34}
		{sf_var name=array default=[]}
		
		Start={$start} Counter={$counter}
		{sf_commandlink value="Increment" action="CounterView::increment2()" immediate=true}
		{sf_commandlink value="Decrement" action="CounterView::decrement2()" immediate=true}
		{sf_commandlink value="Add to array" action="CounterView::addToArray()" immediate=true}
		Set value
		{sf_inputtext id=c value="{$setval}" required=true}
		{sf_messages for=c}
		{sf_commandbutton value="Set" action="CounterView::set2()"}
		{CounterView::sessionSize()}
		Array size: {count($array)}
		<br/>
		<a href="#" onclick="SF.a(this,'CounterView::setValue2()',{ value:6 });">Remote Action</a>
		<a href="" id="remote3">Remote3</a>
		<script type="text/javascript">
			$(function() {
				$("#remote3").click(function(e){
					SF.a(this,'CounterView::setValue2()',{ value:12 });
					e.preventDefault();
				});
			});
		</script>

	{/sf_form}
{{/sf_view}}



<h3>Test Disabled</h3>
{{sf_view id="disabled_test" log=true}}
	{sf_form}
		{sf_in name="testView"}
		
		{sf_datepicker value='#[$testView->date]' disabled=true converter="MySqlDateConverter"}
		{sf_commandbutton value="Submit" action=""}
		You submitted {$testView->date}
		
	{/sf_form}

{{/sf_view}}
