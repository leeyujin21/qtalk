<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

* {
	font-family: 'Pretendard-Regular';
}

.header {
	height: 100px;
}

a {
	text-decoration: none;
	color: black;
}

.jh-container {
	margin: 0 auto;
}

#goback {
	margin-left: 27%;
	display: flex;
	align-items: center;
	cursor: pointer;
}

#joinspace {
	width: 60%;
	margin: 0 auto 0 auto;
	background-color: #FDFDFD;
}

#joinspace>p {
	height: 50px;
	margin: 0 auto 14.5px auto;
	padding-top: 31px;
	text-align: center;
	font-size: 2em;
	font-weight: bold;
}

#idtext, #passwordtext, #nicknametext {
	width: 50%;
	height: 60px;
	margin: 0 auto 10px auto;
	border: 1px solid gainsboro;
	display: flex;
	align-items: center;
}

#emailtext {
	width: 50%;
	height: 60px;
	margin: 0 auto 60px auto;
	border: 1px solid gainsboro;
	display: flex;
	align-items: center;
}

.textlabel {
	color: #000;
	font-size: 1.2em;
	font-weight: bold;
	text-align: center;
	line-height: normal;
	padding-right: 21px;
	padding-left: 10px;
}

.textinput {
	width: 65%;
	height: 90%;
	border: none;
	background: transparent;
	outline: none;
	font-size: 20px;
}

.nicknameduplicationbtn, .idduplicationbtn, .emailduplicationbtn {
	border-radius: 10px;
	background: #DFE3EE;
	color: #3B5998;
	border: none;
	width: 70px;
	height: 30px;
	font-weight: bold;
	cursor: pointer;
}

.joinbtn {
	text-align: center;
}

#joinbtn {
	border-radius: 10px;
	background: #3B5998;
	color: #FFF;
	border: none;
	width: 200px;
	height: 50px;
	font-weight: bold;
	font-size: 1.2em;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script>
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
    </script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="jh-container">
		<div id="goback">
			<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
				style="width: 20px; margin-bottom: -2px;"> <a
				href="..\index.html">뒤로가기</a>
		</div>
		<form action="join" method="post">
			<div id="joinspace">
				<p>회원가입</p>
				<div id="idtext">
					<label for="id" class="textlabel">아이디</label>
					<input type="text" name="id" id="id" class="textinput" required="required">
					<input type="button" id="idcheck" class="idduplicationbtn" value="중복확인">
				</div>
				<div id="passwordtext">
					<label for="password" class="textlabel">비밀번호</label>
					<input type="password" id="password1" name="password1" class="textinput" required="required">
				</div>
				<div id="passwordtext">
					<label for="password" class="textlabel">비밀번호 확인</label>
					<input type="password" id="password2" name="password2" class="textinput" required="required">
				</div>
				<div id="nicknametext">
					<label for="nickname" class="textlabel">닉네임</label>
					<input type="text" name="nickname" id="nickname" class="textinput" required="required">
					<input type="button" id="nicknameCheck" class="nicknameduplicationbtn" value="중복확인" >
				</div>
				<div id="emailtext">
					<label for="email" class="textlabel">이메일</label>
					<input type="email" name="email" id="email"class="textinput"  required="required">
					<input type="button" id="emailCheck" class="emailduplicationbtn" value="중복확인">
				</div>
				<div class="joinbtn">
					<input type="submit" id="joinbtn" value="회원가입" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>