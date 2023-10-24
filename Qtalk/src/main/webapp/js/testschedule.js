

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



$(document).ready(function() {
    $(".bookmark-form").each(function() {
        var form = $(this);
        var id = form.data("id");
        var num = form.data("num");
        // AJAX 요청을 수행할 부분
        $.ajax({
            type: "POST",
            url: "isbookmark",
            data: {
                id: id,
                num: num
            },
            success: function(response) {
                // 서버에서 받은 응답(response)을 기반으로 북마크 아이콘 상태 설정
                var bookMarkIcon = form.find("#bookMarkIcon");
                if (response === "on") {
                    bookMarkIcon.addClass("on");
                } else {
                    bookMarkIcon.removeClass("on");
                }
            },
            error: function(xhr, status, error) {
                console.log("Error: " + error);
            }
        });
       });

        // 각 북마크 폼에 대한 클릭 핸들러
          $(".bookmark-form").on("click", function() {
			var form = $(this);
            var bookMarkIcon = form.find("#bookMarkIcon");
            var id = form.data("id");
            var num = form.data("num");
            Swal.fire({
            title: '북마크를 수정 하시겠습니까?',
            showCancelButton: true,
            confirmButtonText: '승인',
            cancelButtonText: '취소',
            reverseButtons: true,
        }).then((result) => {
            if (result.isConfirmed) {
            $.ajax({
                type: "POST",
                url: "bookmarkedit",
                data: {
                    id: id,
                    num: num
                },
                success: function(response) {
                    if (response === "success") {
                        bookMarkIcon.addClass("on");
                    } else {
                        bookMarkIcon.removeClass("on");
                    }
                },
                error: function(xhr, status, error) {
                    console.log("Error: " + error);
                }
            });
                
                
            }
        });
            
      });
   
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
                window.location.href = "login";
            }
        });
    });
	});
});
