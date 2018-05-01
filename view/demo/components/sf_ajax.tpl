{capture name=desc}
	sf_ajax is tag which can be attached to specific component and allow ajax processing of component event.
	<br/>
	Target component is identified by its id with for attribute.
	<br/>
	Tag must be placed before target component in order to work.
{/capture}	
{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		{sf_in name=bean class=AjaxView}
			{sf_status}
			<script type="text/javascript">
			function highlight(data) {
				$("#out").css("background-color","red").delay(500).queue(function(){
					$(this).css("background-color","#FFF");
				});
			}
			function highlight2(data) {
				$("#out2").css("background-color","red").delay(500).queue(function(){
					$(this).css("background-color","#FFF");
				});
			}
			</script>
			<div class="row">
				<div class="col-sm-8">
					In this first examle sf_ajax component is added before target component
					<br/>
					{sf_ajax for="demo_input" event="change" immediate=$bean->immediate action='#[$bean->change()]' actionData=15
						rendered=$bean->rendered oncomplete='highlight(data)'}
					{sf_inputtext id="demo_input" value='#[$bean->text]' onchange="{if $bean->onchange}alert('changed'); return false;{/if}"}
					<br/>
					<span id="out">
						{$bean->out}
					</span>
					<br/>
					Required component:
					{sf_inputtext value='' required=true attachMessage=true}
					<hr/>
					In second example ajax event is attached to events attribute
					<br/>
					{sf_inputtext id="demo_input2" value='#[$bean->text2]' 
						events=['change'=>['immediate'=>$bean->immediate,'action'=>'#[$bean->change2()]','actionData'=>23,'oncomplete'=>'highlight2(data)']]}
					<br/>
					<span id="out2">
						{$bean->out2}
					</span>
					<br/>
					Required component
					{sf_inputtext value='' required=true attachMessage=true}
				</div>
				<div class="col-sm-4">
					<div class="well">
					{sf_checkbox value='#[$bean->rendered]' action="" immediate=true label="Rendered"} 
					{sf_checkbox value='#[$bean->immediate]' action="" immediate=true label="Immediate"} 
					{sf_checkbox value='#[$bean->onchange]' action="" immediate=true label="Add onchange javascript event"} 
					</div>
				</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}