/**
 * 메인에있는 슬라이더 
 */

 $(document).ready(function() {
    var currentSlide = 0;
    var totalSlides = $('.slide').length;
    var slideWidth = $('.slider-container').width();

    $('#nextSlide').on('click', function() {
    currentSlide++;
    if (currentSlide >= totalSlides) {
        currentSlide = 0;
    }
    updateSlidePosition();
    });

    $('#prevSlide').on('click', function() {
    currentSlide--;
    if (currentSlide < 0) {
        currentSlide = totalSlides - 1;
    }
    updateSlidePosition();
    });

    function updateSlidePosition() {
      let slidePosition = -(currentSlide * slideWidth);
        $('.slides').css('transform', 'translateX(' + slidePosition + 'px)');
    }
});