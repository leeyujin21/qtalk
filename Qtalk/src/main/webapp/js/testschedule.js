



 $(document).ready(function () {
	 let bookMarkIcon2 = $("#bookMarkIcon2");
  bookMarkIcon2.click(function () {
	bookMarkIcon2.toggleClass("book-icon-color");	
    Swal.fire({
      title: '로그인 하시겠습니까?',
      showCancelButton: true,
      confirmButtonText: '승인',
      cancelButtonText: '취소',
      reverseButtons: true,
    }).then((result) => {
      if (result.isConfirmed) {
        window.location.href="login"
      }
    });
  });
});



 $(document).ready(function () {
	 let bookMarkIcon = $("#bookMarkIcon");
  bookMarkIcon.click(function () {
	bookMarkIcon.toggleClass("book-icon-color");	
  });
});


var isClicked = false;

 $(document).ready(function () {
	 let bookMarkIcon = $("#bookMarkIcon");
	 
  bookMarkIcon.click(function () {
	bookMarkIcon.toggleClass("book-icon-color");	
    Swal.fire({
      title: '북마크에 저장 하시겠습니까?',
      showCancelButton: true,
      confirmButtonText: '승인',
      cancelButtonText: '취소',
      reverseButtons: true,
    }).then((result) => {
      if (result.isConfirmed) {
		  !isClicked()
      }
    });
  });
  
  
  
});
