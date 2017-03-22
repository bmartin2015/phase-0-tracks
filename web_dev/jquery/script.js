/* Filename: custom.js */
$(function() {
	$( "#dino_bg").hide(); // Hide element with id dino_bg
	$( "#click_me" ).click(function() { // When you click the element with id #click_me
		alert("Look at that sweet picture!"); // Send an alert
		$( "#dino_bg" ).show(); // Show element with id dino_bg
		$(this).hide(); // Hide element with #click_me id (this)
	});

	var color_links = $( "p.bg_color_change" ).children(); // Used to get the children of p.bg_color_change class
	$(color_links[0]).click(function() {
		$("body").css("background", "red"); // If first child, set background color to red
	});

	$(color_links[1]).click(function() {
		$("body").css("background", "green"); // If second child, set background color to green
	});

		$(color_links[2]).click(function() {
		$("body").css("background-color", "#b5d7fc"); // If first child, set background color back to blue
		$("body").css("background-image", "url('dinosaur-14543_640.jpg')"); // restore bg image
		$("body").css("background-repeat", "no-repeat"); // More bg image stuff
		$("body").css("background-position", "right top"); // more bg image stuff
		$("body").css("max-width", "960px"); // more bg stuff
	});
});