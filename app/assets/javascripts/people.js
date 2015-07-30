// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function getDescriptorText(radioValue)
{
    var descriptorText;
    
    switch (radioValue)
    {
        case "needed_toppings":
            return "I need it!";
            break;
        case "wanted_toppings":
            return "I want it.";
            break;
        case "unlisted_toppings":
            return "I don't care.";
            break;
        case "mehed_toppings":
            return "It's alright I guess...";
            break;
        case "hated_toppings":
            return "I can't eat that!";
            break;
        default:
            return "That's not true... That's impossible!";
    }
}


$(function ()
{
    if ($('#topping-prefs-table'))
    {        
        $checked = $('input[type="radio"]:checked');
        
        $checked.each(function()
        {
            var $this = $(this);
            
            buttonLabel = $this.closest('label.radio-inline');
            buttonLabel.addClass("active");
            
            var descriptorText = getDescriptorText($this.val());
            
            $this.closest('td').nextAll('.pref-descriptor').text(descriptorText);
        });
        
        $(".radio-inline").on("click", function(e)
        {
            var $this = $(this);
            var descriptorText = getDescriptorText($this.find('input[type="radio"]').val());
            
            $this.closest('td').nextAll('.pref-descriptor').text(descriptorText);
        });
    }
});
