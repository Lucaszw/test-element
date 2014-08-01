var onTop = true;
 jQuery('#expandButton').click(function() {
 	if ($(window).scrollTop() <= 482) {
	jQuery('html, body').animate({
		scrollTop: 482
	}, 'slow');
	return false;
}


	});

var interval = setInterval(function() {
    if ($(window).scrollTop() >= 482) {
    	onTop = false;
    	 $( "#navbar" ).toggleClass( "normal", true );
    }else if(!onTop){
    	$( "#navbar" ).toggleClass( "normal", false );
    }
}, 250);