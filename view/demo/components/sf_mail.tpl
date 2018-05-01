{capture name=view}
{literal}
	{{sf_view id="demo" template=$template}}
		{sf_form}
			{sf_in name=bean class=MailView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						Mail message is in body part of this page. Check source to see it.
						<pre style="background-color: #EFEFEF;">
						{sf_mail to=$bean->to subject="SmartyFaces Test Email" from="mailer@localhost" debug=$bean->debug
							type=$bean->type bcc=$bean->getBcc() cc=$bean->getCc()}
							{sf_facet name=text}
								This is text part of message
							{/sf_facet}
							{sf_facet name=html}
								<p>This is <strong>html</strong> part of message</p>
							{/sf_facet}
						{/sf_mail}
						</pre>
						
						Mail will be sent to email address: {$bean->to}
						{if $bean->cc}
							<br/>
							CC Email will be sent also to {$bean->cc_email}
						{/if}
						{if $bean->bcc}
							<br/>
							BCC Email will be sent also to {$bean->bcc_email}
						{/if}
					</div>
					<div class="col-sm-4">
						<div class="well form-horizontal">
								<div class="form-group">
									<label class="col-sm-3 control-label">Type:</label>
									<div class="col-sm-9">
										{sf_selectonemenu values=['text','html','alternative'] value='#[$bean->type]'
										var=t action=""}
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">To:</label>
									<div class="col-sm-9">
										{sf_inputtext value='#[$bean->to]' block=true}
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3">
										{sf_checkbox value='#[$bean->cc]' action="" label="Add CC"}
									</label>
									<div class="col-sm-9">
										{sf_inputtext value='#[$bean->cc_email]' block=true rendered=$bean->cc}
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3">
										{sf_checkbox value='#[$bean->bcc]' action="" label="Add BCC"}
									</label>
									<div class="col-sm-9">
										{sf_inputtext value='#[$bean->bcc_email]' block=true rendered=$bean->bcc}
									</div>
								</div>
							
							{sf_checkbox value='#[$bean->debug]' action="" label="View message"}
							<i class="text-muted">Uncheck this to actually send message</i>
							
						</div>
					</div>
			</div>
		
		{/sf_form}
	{{/sf_view}}
{/literal}
{/capture}