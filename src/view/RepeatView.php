<?php

class RepeatView
{

    function linkAction($name) {
        SmartyFacesMessages::addGlobalSuccess("You clicked on ".$name);
    }

}