$(function() {
        	let isNicknameCheck = false
        	$('#nicknameduplication').click(function() {
				$.ajax({
					url:'nicknamecheck',
					type: 'post',
					data: {'nickname': $("#nickname").val()},
					success:function(res) {
						if(res == "true") {
							isNicknameCheck = true
							alert("닉네임 사용 가능합니다.")
						} else {
							alert("닉네임 중복됩니다.")
						}
					},
					error:function(err) {
						alert("닉네임 중복체크 오류")
					}
				})        		
        	})
        	$('#joinbtn').click(function(e) {
        		let p1 = $('#password1').val()
        		let p2 = $('#password2').val()
        		if(p1 !== p2) {
        			alert("비밀번호가 일치하지 않습니다.")
        			e.preventDefault()
        		} else if(isNicknameCheck == false) {
					alert("닉네임 중복체크 해주세요.")
					e.preventDefault()
        		}
        	})
        })
