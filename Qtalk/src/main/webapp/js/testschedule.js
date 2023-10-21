

// 로그아웃 상태
 $(document).ready(function () {
	 let bookMarkIcon2 = $("#bookMarkIcon2");
  bookMarkIcon2.click(function () {
	/*bookMarkIcon2.toggleClass("book-icon-color");	*/
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


/*
//로그인 상태
 $(document).ready(function () {
	 let bookMarkIcon = $("#bookMarkIcon");
  bookMarkIcon.click(function () {
	bookMarkIcon.toggleClass("book-icon-color");	
  });
});
*/

/*
 $(document).ready(function () { 
		let bookmark = $("bookmarks").value;
		let exnum=$("num").value;
		
		if(bookmark == exnum){
			let isbook =true;
			$("#bookMarkIcon").classList.remove("off")
			$("#bookMarkIcon").classList.add("on")
		}else{
			isbook=false;
			$("#bookMarkIcon").classList.remove("off")
			$("#bookMarkIcon").classList.add("on")
		}
	 
	 let bookMarkIcon = $("#bookMarkIcon");
	 
  bookMarkIcon.click(function () {
	  if(isbook==false){
	    Swal.fire({
      title: '북마크에 저장 하시겠습니까?',
      showCancelButton: true,
      confirmButtonText: '승인',
      cancelButtonText: '취소',
      reverseButtons: true,
    }).then((result) => {
      if (result.isConfirmed) {
		 isbook=false;
      }
    });
    }
    if(isbook==true){
	    Swal.fire({
      title: '북마크에 삭제 하시겠습니까?',
      showCancelButton: true,
      confirmButtonText: '승인',
      cancelButtonText: '취소',
      reverseButtons: true,
    }).then((result) => {
      if (result.isConfirmed) {
		  isbook=true;
      }
    });
    }
    
    
    
  });
  
  
});

*/

/*
$(document).ready(function() {
    let bookmark = $("#bookMarkIcon");
    let isClicked = false;

    bookmark.click(function() {
        if (isClicked === false) {
            Swal.fire({
                title: '북마크에 저장 하시겠습니까?',
                showCancelButton: true,
                confirmButtonText: '승인',
                cancelButtonText: '취소',
                reverseButtons: true,
            }).then((result) => {
                if (result.isConfirmed) {
                    bookmark.addClass("on");
                    isClicked = true;
                }
            });
        } else {
            Swal.fire({
                title: '북마크에 삭제 하시겠습니까?',
                showCancelButton: true,
                confirmButtonText: '승인',
                cancelButtonText: '취소',
                reverseButtons: true,
            }).then((result) => {
                if (result.isConfirmed) {
                    bookmark.removeClass("on");
                    isClicked = false;
                }
            });
        }
    });
});*/



$(document).ready(function() {
    $(".bookmark-form").on("click", function() {
        var form = $(this);
        var id = form.data("id");
        var num = form.data("num");
        $.ajax({
            type: "POST",
            url: "bookmarkedit",
            data: {
                id: id,
                num: num
            },
            success: function(response) {
                if (response === "success") {
                    form.find("#bmw").toggleClass("on");
                }
            },
            error: function(xhr, status, error) {
                console.log("Error: " + error);
                
            }
        });
    });
});