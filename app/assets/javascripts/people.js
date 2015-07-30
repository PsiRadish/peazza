// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function ()
{
    if ($('#topping-prefs-table'))
    {
        // console.log("yep!");
        
        // if (typeof gon != 'undefined')
        // {
        //     console.log(gon.preferencesForm);
        // }
        // else
        // {
        //     console.log("dammit");
        // }
        
        $checked = $('input[type="radio"]:checked');
        
        console.log('eaching!');
        
        $checked.each(function()
        {
            // console.log(radio);
            buttonLabel = $(this).closest('label.radio-inline');
            buttonLabel.addClass("active");
            // console.log(buttonLabel[0]);
        });
    }
});
