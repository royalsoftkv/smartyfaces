{{sf_view id="radio_test"}}
	{sf_form}
		{sf_in name=radioTestView}
	
		{sf_radio id="radio" value="#[\$radioTestView->value]" checkedValue="a"} - a
		<br/>
		{sf_radio id="radio" value="#[\$radioTestView->value]" checkedValue="b"} - b
		<br/>
		{sf_radio id="radio" value="#[\$radioTestView->value]" checkedValue="c"} - c
		<br/>
		{sf_commandbutton value="Submit" action=""}
		{sf_commandbutton value="Clear" action="#[\$radioTestView->value=null]"}
		<br/>
		Your submitted: {$radioTestView->value} 
		<br/>
		<pre>
		{$radioTestView->out()}
		</pre>
	
	{/sf_form}
	

{{/sf_view}}