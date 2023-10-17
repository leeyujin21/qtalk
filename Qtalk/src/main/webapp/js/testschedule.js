/**
 * testschedule 자바 스크립트
 */

 $(document).ready(function() {
	let bookMarkIcon = $("#bookMarkIcon");
	
	bookMarkIcon.click(function() {
		bookMarkIcon.toggleClass("book-icon-color");		
	});
});
