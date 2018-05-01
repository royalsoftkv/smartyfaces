{{sf_view id="view1"}}
	{sf_form}
		{sf_in name=bean class=ViewTest}
		{sf_status}
		{sf_messages global=true}
		Required 
		{sf_inputtext value='#[$bean->field1]' required=true attachMessage=true}
		<br/>
		{sf_commandbutton value="Submit" action='#[$bean->action1()]'}
	{/sf_form}
{{/sf_view}}

{{sf_view id="view2"}}
	{sf_form}
		{sf_in name=bean class=ViewTest}
		{sf_status}
		{sf_messages global=true}
		Required 
		{sf_inputtext value='#[$bean->field2]' required=true attachMessage=true}
		<br/>
		{sf_commandbutton value="Submit" action='#[$bean->action2()]'}
	{/sf_form}
{{/sf_view}}