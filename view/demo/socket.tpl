<html>
<head>
    <title>SmartyFaces Showcase</title>
    {SmartyFaces::loadCss()}
</head>
<body>

    {sf_view id="socket"}
        {sf_form}
            {sf_in name=bean class=SocketView}
            {sf_socket id=server type=server host="0.0.0.0" port=2050}

            Socket test (TODO)

            {sf_commandbutton value=Test action='#[$bean->test()]'}

            {$bean->response}

            {sf_socket type=client server=server event=receiveDate action=''}

        {/sf_form}


    {/sf_view}

    {SmartyFaces::loadJs()}
</body>

