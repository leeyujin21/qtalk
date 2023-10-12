$(function() {
        	let isIdCheck = false
        	$('#idcheck').click(function() {
				$.ajax({
					url:'idcheck',
					type: 'post',
					data: {'id': $("#id").val()},
					success:function(res) {
						if(res == "true") {
							isIdCheck = true
							alert("아이디 사용 가능합니다.")
						} else {
							alert("아이디가 중복됩니다.")
						}
					},
					error:function(err) {
						alert("아이디 중복체크 오류")
					}
					
				})        		
        	})
        	let isNicknameCheck = false
        	$('#nicknameCheck').click(function() {
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
        	
        	let isEmailCheck = false
        	$('#emailCheck').click(function() {
				$.ajax({
					url:'emailcheck',
					type: 'post',
					data: {'email': $("#email").val()},
					success:function(res) {
						if(res == "true") {
							isEmailCheck = true
							alert("이메일 사용 가능합니다.")
						} else {
							alert("이메일이 중복됩니다.")
						}
					},
					error:function(err) {
						alert("이메일 중복체크 오류")
					}
				})
        	})
        	$('#joinbtn').click(function(e) {
        		let p1 = $('#password1').val()
        		let p2 = $('#password2').val()
        		if(p1 !== p2) {
        			alert("비밀번호가 일치하지 않습니다.")
        			e.preventDefault()
        		}else if(isIdCheck == false) {
					alert("아이디 중복체크 해주세요.")
					e.preventDefault()
				} else if(isNicknameCheck == false) {
					alert("닉네임 중복체크 해주세요.")
					e.preventDefault()
				} else if(isEmailCheck == false) {
					alert("이메일 중복체크 해주세요.")
					e.preventDefault()
				}
			})
        })