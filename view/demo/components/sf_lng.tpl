{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
		
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						{sf_lng lng=en}
							I am translation block in english
						{/sf_lng}
						{sf_lng lng=sr}
							Ja sam translation block na srpskom
						{/sf_lng}
						<br/>
						I am just variable: {$l.some_language_key}
					</div>
					<div class="col-sm-4">
						<div class="well">
						{$sel_lng=SmartyFaces::getLanguage()}
						Cureent language code is: {$sel_lng} 
						<br/>
						{sf_link value="Switch to Serbian" action="SmartyFaces::changeLanguage('sr',true)"
							rendered=$sel_lng eq 'en'}
						{sf_link value="Switch to English" action="SmartyFaces::changeLanguage('en',true)"
							rendered=$sel_lng eq 'sr'}
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}