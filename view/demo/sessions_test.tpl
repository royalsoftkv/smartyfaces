{extends file='template/demo.tpl'}
{block name=content}

    <iframe id="iframe" src="/smartyfaces/public/?page=demo/iframe" width="500" height="100"></iframe>

    {{sf_view id="view1"}}
    {sf_form}
        {sf_status}
        {sf_in name=bean1 class=SessionsTestView}

        <h4>View 1</h4>

        Counter: {$bean1->counter}
        <br/>
        {sf_commandlink value="Increment" action="#[\$bean1->increment()]" class="btn btn-default" onclick='reloadIframe()'}


    {/sf_form}
    {{/sf_view}}

    <script type="text/javascript">
        function reloadIframe() {
            $('#iframe').attr('src', $('#iframe').attr('src'));
        }
    </script>

{/block}