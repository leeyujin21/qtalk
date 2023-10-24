$(function() {
        	let isIdCheck = false
        	$('#idcheck').click(function() {
				if ($('#id').val() == "") {
					alert("아이디가 유효하지 않습니다.")
				} else if($("#idcheck").val() == "다시입력") {
					isIdCheck = false
					console.log("1")
					$("#id").attr("readonly", false)
					$("#idcheck").attr("value", "중복체크")
				} else {
						$.ajax({
							url:'idcheck',
							type: 'post',
							data: {'id': $("#id").val()},
							success:function(res) {
								if(res == "true") {
									isIdCheck = true
									console.log("2")
									$('#id').attr("readonly", true)
									$("#idcheck").attr("value", "다시입력")
									alert("아이디 사용 가능합니다.")
								} else {
									alert("아이디가 중복됩니다.")
								}
							},
							error:function(err) {
								alert("서버 오류")
							}
							
						})        		
        		}
        	})
        	
        	let isNicknameCheck = false
        	$('#nicknameCheck').click(function() {
				if($("#nicknameCheck").val() == "다시입력") {
					isNicknameCheck = false
					$("#nickname").attr("readonly", false)
					$("#nicknameCheck").attr("value", "중복체크")
				} else {
					$.ajax({
						url:'nicknamecheck',
						type: 'post',
						data: {'nickname': $("#nickname").val()},
						success:function(res) {
							if(res == "true") {
								isNicknameCheck = true
								$("#nickname").attr("readonly", true)
								$("#nicknameCheck").attr("value", "다시입력")
								alert("닉네임 사용 가능합니다.")
							} else {
								alert("닉네임 중복됩니다.")
							}
						},
						error:function(err) {
								alert("서버 오류")
						}
					})   
				}
        	})
        	
        	let isEmailCheck = false
        	$('#emailCheck').click(function() {
				if($("#emailCheck").val() == "다시입력") {
					isEmailCheck = false
					$("#email").attr("readonly", false)
					$("#emailCheck").attr("value", "중복체크")
				} else {
					if ($("#email").val() !== null) {
						let regEmail = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
						if (!regEmail.test($("#email").val())) {
							console.log($("#email").val())
							alert('이메일 형식에 맞춰주세요.');
							e.preventDefault() 
				  		} else {
							$.ajax({
								url:'emailcheck',
								type: 'post',
								data: {'email': $("#email").val()},
								success:function(res) {
									if(res == "true") {
										isEmailCheck = true
										$("#email").attr("readonly", true)
										$("#emailCheck").attr("value", "다시입력")
										alert("이메일 사용 가능합니다.")
									} else {
										alert("이메일이 중복됩니다.")
									}
								},
								error:function(err) {
										alert("서버 오류.")
								}
							})   
						}
					}
        		}	
        	})
        	
        	
        	$('#joinbtn').click(function(e) {
        		let p1 = $('#password1').val()
        		let p2 = $('#password2').val()
        		if(p1 !== p2) {
        			alert("비밀번호가 일치하지 않습니다.")
        			e.preventDefault()
        		} else if(p1 !== p2){
					alert("비밀번호가 일치하지 않습니다.")
					e.preventDefault()
				} else if(isIdCheck == false) {
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