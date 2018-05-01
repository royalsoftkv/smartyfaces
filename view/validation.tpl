Validation Test
{{sf_view id="validation"}}
{sf_form}
{sf_in name=validationTestView}


<br/>
Checkbox
{sf_checkbox value='#[$validationTestView->checkbox]' required=true attachMessage=true}
<br/>
Datepicker
{sf_datepicker value='#[$validationTestView->datepicker]' required=true attachMessage=true}
<br/>
Editor
{sf_editor value='#[$validationTestView->editor]' required=true attachMessage=true}
<br/>
Input text
{sf_inputtext value='#[$validationTestView->inputtext]' required=true attachMessage=true}
<br/>
Input text area
{sf_inputtextarea value='#[$validationTestView->inputtextarea]' required=true attachMessage=true}
<br/>
Pick list
{sf_picklist source=[1,2,3] value=[2] value='#[$validationTestView->picklist]' required=true attachMessage=true}
<br/>
Radio
{sf_radio value='#[$validationTestView->radio]' required=true attachMessage=true}
<br/>
Select one menu
{sf_selectonemenu value='#[$validationTestView->selectonemenu]' values=[1,2,3] 
noselect=" " required=true attachMessage=true}

<br/>
{sf_commandbutton value="Submit" action=""}

<hr/>
{sf_region id="time1" value='
time1:{time()}{sf_commandlink value="Update time1" action="" update="time1"}
'}
<br/>
{sf_region id="time2" value='
time2:{time()}{sf_commandlink value="Update time2" action="" update="time2"}
'}

{/sf_form}
{{/sf_view}}