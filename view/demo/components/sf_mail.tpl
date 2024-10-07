{capture name=view}
{literal}
	{sf_view id="demo" template=$template}
		{sf_form}
			{sf_in name=bean class=MailView}
			{sf_status}
			<div class="row">
				<div class="col-sm-8">
						Mail message is in body part of this page.
						<br/>Check source to see it.
						<pre class="bg-light border p-2">
						{sf_mail
							to=$bean->to
							subject="SmartyFaces Test Email"
							from="mailer@localhost"
							type=$bean->type
							debug=$bean->debug
							cc=$bean->getCc()
							bcc=$bean->getBcc()
						}
							{sf_facet name=text}
								This is text part of message
							{/sf_facet}
							{sf_facet name=html}
								<p>This is <strong>html</strong> part of message</p>
							{/sf_facet}
						{/sf_mail}
						</pre>
						<p>
							Mail will be sent to email address:<br/>{$bean->to}
						</p>
						{if $bean->cc}
							<p>
								CC Email will be sent also to: <br/>{$bean->cc_email}
							</p>
						{/if}
						{if $bean->bcc}
							<p>
								BCC Email will be sent also to: <br/>{$bean->bcc_email}
							</p>
						{/if}
					</div>
					<div class="col-sm-4">
						<div class="bg-light border p-2">
							<div class="row align-items-center mb-2">
								<label class="col-sm-3">To:</label>
								<div class="col-sm-9">
									{sf_inputtext value='#[$bean->to]' block=true}
								</div>
							</div>
							<div class="row align-items-center mb-2">
								<label class="col-sm-3">Type:</label>
								<div class="col-sm-9">
									{sf_selectonemenu values=['text','html','alternative'] value='#[$bean->type]' var=t action=""}
								</div>
							</div>
							<div class="row align-items-center mb-2">
								<div class="col-sm-3">
									{sf_checkbox value='#[$bean->cc]' action="" label="Add CC"}
								</div>
								<div class="col-sm-9">
									{sf_inputtext value='#[$bean->cc_email]' block=true rendered=$bean->cc}
								</div>
							</div>
							<div class="row align-items-center mb-2">
								<div class="col-sm-3">
									{sf_checkbox value='#[$bean->bcc]' action="" label="Add BCC"}
								</div>
								<div class="col-sm-9">
									{sf_inputtext value='#[$bean->bcc_email]' block=true rendered=$bean->bcc}
								</div>
							</div>
							
							{sf_checkbox value='#[$bean->debug]' action="" label="View message (debug)" disabled=$bean->disabledSend()}
							{if $bean->disabledSend()}
								<i class="text-muted">Sending email is disabled</i>
							{else}
								<i class="text-muted">Uncheck this to actually send message</i>
							{/if}

						</div>
					</div>
			</div>
		
		{/sf_form}
	{/sf_view}
{/literal}
{/capture}