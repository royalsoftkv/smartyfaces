{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
			{sf_in name=view class=LngView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
					<div class="border p-2">
						{sf_lng
							lng=en
							rendered=$view->rendered}
							I am translation block in english
						{/sf_lng}
						{sf_lng lng=sr}
							Ja sam translation block na srpskom
						{/sf_lng}
						<br/>
					</div>
					<div class="p-2">
						I am just variable: <strong>{$l.some_language_key}</strong>
					</div>
				</div>
					<div class="col-sm-4">
					<div class="bg-light border p-2">
						{sf_checkbox value='#[$view->rendered]' action="" label="Rendered" immediate=true}

						{$sel_lng=SmartyFaces::getLanguage()}
						Current language code is: <strong>{$sel_lng}</strong>
						<br/>
						{sf_link value="Switch to Serbian" action="SmartyFaces::changeLanguage('sr',true)"
							rendered=$sel_lng eq 'en'}
						{sf_link value="Switch to English" action="SmartyFaces::changeLanguage('en',true)"
							rendered=$sel_lng eq 'sr'}
					</div>
				</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}