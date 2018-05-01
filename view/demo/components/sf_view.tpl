{capture name=desc}
	Here goes component description
{/capture}	
{capture name=view}
{literal}
	<style>
		.my-view {
			border:1px solid #ccc;
			padding:10px;
		}
	</style>
	{{sf_view id="demo" stateless=ViewView::stateless() log=ViewView::log() storestate=ViewView::storestate() class="my-view"  template=$template}}
		{sf_form}
			{sf_status}
			{sf_in name=bean class=ViewView}
			{sf_var name=counter default=0}
			{sf_var name=stateless default=ViewView::stateless()}
			{sf_var name=log default=$smarty.session.log|default:false}
			<div class="row">
				<div class="col-sm-8">
						Counter = 
						{sf_outputtext value=$bean->counter rendered=!$stateless}
						{sf_outputtext value=$counter rendered=$stateless}
						
						{sf_commandlink value="Increment" action='#[$bean->increment()]' rendered=!$stateless}
						{sf_commandlink value="Increment" action='ViewView::increment2()' rendered=$stateless}
						<br/>
						Click {sf_link view="demo/view_template" viewvar="page" value="here"} to test template parameter.
						<br/>
						Click {sf_link view="demo/view_test" viewvar="page" value="here"} to test multiple views.
					</div>
					<div class="col-sm-4">
						<div class="well">
							{sf_link value="Switch to stateless view" viewvar=page view="demo/components/component&tag=sf_view&stateless"
								rendered=!$stateless} 
							<br/>
							{if !$stateless}
								{$storestate=ViewView::storestate()}
								{if $storestate eq 'server'}
									{sf_link value="Switch to client store" viewvar=page 
									view="demo/components/component&tag=sf_view&storestate=client"}
								{else}
									{sf_link value="Switch to server store" viewvar=page 
									view="demo/components/component&tag=sf_view"}
								{/if}
							{/if}
							<br/>
							{sf_link value="Switch to statefull view" viewvar=page view="demo/components/component&tag=sf_view"
								rendered=$stateless} 
							<br/>
							{sf_link value="Display log" rendered=!$log action="ViewView::toggleLog()"} 
							{sf_link value="Hide log" rendered=$log action="ViewView::toggleLog()"} 
						</div>
						
					</div>
			</div>
			
			{sf_checkbox value=ViewView::isCompressState() label="Compress state" action="#[\$bean->toggleCompressState()]"}
		
		{/sf_form}
	{{/sf_view}}

	<hr/>

	<a href="?page=demo/single_delim_view">View defined with single delimiters</a>


{/literal}
{/capture}