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
		crtTitle.toggleClass("category-color");
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
                 $('#secondcategory').empty()
				for(var i = 0; i <= cleanedData.length-1; i++){
					var trimmedData = cleanedData[i].trim();
                   	dataArray.push(trimmedData);
					$('#secondcategory').append('<li data-value="'+cleanedData[i] +'">'+cleanedData[i]+'</li>')
				}
			},
			error: function(err) {
				console.error("Error occurred:", err);
			}
		})
	})
		
	/** 중분류 > 소분류 */		
	$('#secondcategory').on('click','li', function() {
		let secoundValue = $(this).data('value');
		console.log(secoundValue)
		$.ajax({
			url: 'categorysecondlist',
			type: 'get',
			data: { 'secoundValue': secoundValue },
			success: function(thirdValue) {
				var cleanedData = thirdValue.substring(1, thirdValue.length - 1).split(',');
				console.log(cleanedData)
				console.log('click')
                 $('#thirdcategory').empty()
				for(var i = 0; i <= cleanedData.length-1; i++){
					$('#thirdcategory').append('<li data-value="'+cleanedData[i] +'">'+cleanedData[i]+'</li>')
				}
			},
			error: function(err) {
				console.error("Error occurred:", err);
			}
		})
	})	
});


