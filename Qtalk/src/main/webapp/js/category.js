$(document).ready(function() {
    let crtBtn = $(".category-btn");
    let crtCon = $(".category-box-container");

    let closeBtn =$(".close-btn");

    crtBtn.click(function() {
        crtCon.toggleClass("hidden");
    });
    closeBtn.click(function(){
        crtCon.toggleClass("hidden");
    });
});