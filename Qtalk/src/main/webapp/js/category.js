var thirdValue = null;
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


	/** 대분류 > 중분류 */
	$('#firstcategory li').on('click', function() {
		let firstValue = $(this).data('value');
		$.ajax({
			url: 'categorylist',
			type: 'get',
			data: { 'firstValue': firstValue },
			success: function(secondValue) {

				var cleanedData = secondValue.substring(1, secondValue.length - 1).split(',');
				var dataArray = [];
				$('#secondcategory').empty();
				for (var i = 0; i <= cleanedData.length - 1; i++) {
					var trimmedData = cleanedData[i].trim();
					dataArray.push(trimmedData);
					$('#secondcategory').append('<li data-value="' + cleanedData[i] + '">' + cleanedData[i] + '</li>')
				}
			},
			error: function(err) {
				console.error("Error occurred:", err);
			}
		})
	})

	/** 중분류 > 소분류 */
	$('#secondcategory').on('click', 'li', function() {
		let secoundValue = $(this).data('value');
		//console.log(secoundValue)
		$.ajax({
			url: 'categorysecondlist',
			type: 'get',
			data: { 'secoundValue': secoundValue },
			success: function(thirdValue) {
				var cleanedData = thirdValue.substring(1, thirdValue.length - 1).split(',');
				/*console.log(cleanedData)
				console.log('click')*/
				$('#thirdcategory').empty()
				for (var i = 0; i <= cleanedData.length - 1; i++) {
					$('#thirdcategory').append('<li data-value="' + cleanedData[i] + '">' + cleanedData[i] + '</li>')
				}
			},
			error: function(err) {
				console.error("Error occurred:", err);
			}
		})
	})

	$("#thirdcategory").on('click', 'li', function() {
		thirdValue = $(this).data('value').trim();
		console.log(thirdValue);
		$('#thirdValue').val(thirdValue);
		console.log($('#thirdValue').val());
	})


	$('#category-submit-btn').on('click', function() {
		console.log(search);
		$.ajax({
        url: 'testschedulesearch', // 여기에 서블릿의 URL을 넣어주세요.
        type: 'get', // 또는 'get', 서블릿의 HTTP 메소드에 맞게 선택합니다.
        data: { 'search': search },
        success: function(response) {
            // 서블릿에서 받은 응답을 처리합니다.
            console.log('서블릿으로 전송 성공:', response);
        },
        error: function(err) {
            console.error("Error occurred:", err);
        }
    	})
	})

});


