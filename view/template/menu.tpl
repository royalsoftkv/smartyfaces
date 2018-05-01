{{sf_view id="demo_menu"}}
{sf_form}
{sf_in name=menuBean class=DemoFunctions}
{$components=$menuBean->components()}
<script type="text/javascript">
	function setSelectionRange(input, selectionStart, selectionEnd) {
	  if (input.setSelectionRange) {
	    input.focus();
	    input.setSelectionRange(selectionStart, selectionEnd);
	  }
	  else if (input.createTextRange) {
	    var range = input.createTextRange();
	    range.collapse(true);
	    range.moveEnd('character', selectionEnd);
	    range.moveStart('character', selectionStart);
	    range.select();
	  }
	}

	function focus_filter() {
		l=$("#filter").val().length;
		setSelectionRange($("#filter").get(0),l,l);
	}
</script>

<div class="panel panel-default">
	<div class="panel-heading">
		<strong>Components</strong>
	</div>

		<table class="table table-condensed table-hover">
		<tr>
			<td>
			{sf_ajax event=keyup for=filter action="#[\$menuBean->dofilter()]" oncomplete='focus_filter()'}
			{sf_inputtext id=filter value='#[$menuBean->filter]' placeholder="Search" block=true}
			</td>
		</tr>
			{foreach $components as $component}
				{$sel=(isset($smarty.get.tag) and $smarty.get.tag eq $component)}
				<tr class="{if $sel}info{/if}">
				<td>
				{if $sel}<strong>{/if}
				<a href="?page=demo/components/component&tag={$component}">{$component}</a>
				{if $sel}</strong>{/if}
				</td>
				</tr>
			{/foreach}
		</table>

</div>





{/sf_form}
{{/sf_view}}