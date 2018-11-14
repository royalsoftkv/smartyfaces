{extends file='template/demo.tpl'}
{block name=content}


    {capture name=view}
    {literal}
        {sf_view id="single_delim_view" template=$template}
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

                {sf_commandlink value="Increment" action='#[$bean->increment()]'}
            </div>
        </div>


        {/sf_form}
        {/sf_view}
    {/literal}
    {/capture}

    {$template="{Smartyfaces::$config['root_path']}/view/demo/single_delim_view.tpl"}
    {eval $smarty.capture.view}

    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">Source</a></li>
        </ul>
        <div id="tabs-1">
		<textarea id="code">
			{htmlspecialchars($smarty.capture.view)}
		</textarea>
        </div>
    </div>

{/block}


