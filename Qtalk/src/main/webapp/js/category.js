$(document).ready(function() {
	let crtBtn = $(".category-btn");
	let crtCon = $(".category-box-container");
	let crtTitle = $(".category-title");
	let closeBtn = $(".close-btn");

	crtBtn.click(function() {
		crtCon.toggleClass("hidden");
		crtTitle.toggleClass("category-color");		
	});
	closeBtn.click(function() {
		crtCon.toggleClass("hidden");
	});

});


