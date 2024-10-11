{capture name=desc}
	sf_ajax is tag which can be attached to specific component and allow ajax processing of component event.
	<br/>
	Target component is identified by its id with for attribute.
	<br/>
	Tag must be placed before target component in order to work.
{/capture}	
{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
		{sf_in name=bean class=AjaxView}
			{sf_status}
			<script type="text/javascript">
			function highlight(data) {
				console.log(data);
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
					<div class="row">
						<div class="col">
							{sf_ajax
								rendered=$bean->rendered
								action="{if $bean->action}#[\$bean->change()]{/if}"
								immediate=$bean->immediate
								for="demo_input"
								event="change"
								actionData=15
								oncomplete='highlight(data)'
							}
							{sf_inputtext id="demo_input" value='#[$bean->text]' onchange="{if $bean->onchange}alert('changed'); return false;{/if}"}
						</div>
						<div class="col">
							<span id="out" class="p-2 m-2">
								{$bean->out}
							</span>
						</div>
					</div>
					<div class="mt-2">
						<div class="">Required component:</div>
						<div class="">
							{sf_inputtext value='#[$bean->input]' required=true attachMessage=true}
						</div>
					</div>
					<hr/>
					In second example ajax event is attached to events attribute of input text
					<div class="row">
						<div class="col">
							{sf_inputtext id="demo_input2" value='#[$bean->text2]'
							events=[
								'change'=>[
								'immediate'=>$bean->immediate,
								'action'=>'#[$bean->change2()]',
								'actionData'=>23,
								'oncomplete'=>'highlight2(data)'
								]
							]}
						</div>
						<div class="col">
							<span id="out2"  class="p-2 m-2">
								{$bean->out2}
							</span>
						</div>
					</div>
					Required component
					{sf_inputtext value='' required=true attachMessage=true}
					<hr/>
					Example of region update:
					<div class="row">
						<div class="col">
							{sf_ajax
								for="demo_input3"
								event="change"
								action='#[$bean->change3()]'
								immediate=true
								update=out3
							}
							{sf_inputtext id=demo_input3 value='#[$bean->text3]'}
						</div>
						<div class="col">
							{sf_region id="out3" value='
								{sf_in name=bean}
								out3={$bean->out3}
							'}
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="bg-light border p-2">
					{sf_checkbox value='#[$bean->rendered]' action="" immediate=true label="Rendered"} 
					{sf_checkbox value='#[$bean->action]' action="" immediate=true label="Attach ajax action"}
					{sf_checkbox value='#[$bean->immediate]' action="" immediate=true label="Immediate"}
					{sf_checkbox value='#[$bean->onchange]' action="" immediate=true label="Add onchange javascript event"} 
					</div>
				</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}