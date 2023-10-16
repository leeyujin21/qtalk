$(function() {		
			/* 닉네임 중복 체크*/
        	let isNicknameCheck = false
        	$('#nicknameduplication').click(function() {
				if($("#nicknameduplication").val() == "다시입력") {
					isNicknameCheck = false
					$("#nickname").attr("readonly", false)
					$("#nicknameduplication").attr("value", "중복체크")
				} else {
					$.ajax({
						url:'nicknamecheck',
						type: 'post',
						data: {'nickname': $("#nickname").val()},
						success:function(res) {
							if(res == "true") {
								isNicknameCheck = true
								$("#nickname").attr("readonly", true)
								$("#nicknameduplication").attr("value", "다시입력")
								alert("닉네임 사용 가능합니다.")
							} else {
								alert("닉네임 중복됩니다.")
							}
						},
						error:function(err) {
							alert(err)
						}
					})   
				}
        	})
        	
        	
        	/* true : 비밀번호 변경
        	 false : 비밀번호 변경하지 않음 */
        	let isPwOnOff = false
        	$('#switch').click(function() {
				if(isPwOnOff == false) {
					isPwOnOff = true
					/* disabled required 해제*/
					$('#password1').attr("disabled", false)
					$('#password2').attr("disabled", false)
					/* required 설정*/
					$("#password1").attr("required", true)
					$("#password2").attr("required", true)
				} else {
					/* disabled 설정*/
					isPwOnOff = false
					$('#password1').attr("disabled", true)
					$('#password2').attr("disabled", true)
					/* required 해제*/
					$("#password1").attr("required", false)
					$("#password2").attr("required", false)
				}
			})

        	/* 수정 버튼 클릭 시 닉네임 중복 체크, 비밀번호 변경 여부, 현재 비밀번호 확인*/
        	$('#changeinfobtn').click(function(e) {
				if(isNicknameCheck == false) {
					alert("닉네임 중복체크 해주세요.")
					e.preventDefault()
				}
				
				if(isPwOnOff == true) {
					let p1 = $('#password1').val()
	        		let p2 = $('#password2').val()
	        		
	        		if(p1 !== p2) {
	        			alert("새 비밀번호가 일치하지 않습니다.")
	        			e.preventDefault()
	        		} 
				}
				
				if($('#password1').val() == $('#password').val()) {
					alert("현재 비밀번호와 새 비밀번호가 일치합니다.")
	       			e.preventDefault()
				}
        	})
        })
