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

a {
	text-decoration: none;
	color: black;
}

a {
	text-decoration: none;
	color: black;
}

.header {
	height: 100px;
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

#changeinfospace {
	width: 60%;
	margin: 0 auto 0 auto;
	background-color: #FDFDFD;
}

#changeinfospace>p {
	height: 50px;
	margin: 0 auto 14.5px auto;
	padding-top: 31px;
	text-align: center;
	font-size: 2em;
	font-weight: bold;
}

.nicknametext {
	width: 50%;
	height: 60px;
	margin: 0 auto 10px auto;
	border: 1px solid gainsboro;
	display: flex;
	align-items: center;
}

#nicknameduplication {
	border-radius: 10px;
	background: #DFE3EE;
	color: #3B5998;
	border: none;
	width: 70px;
	height: 30px;
	font-weight: bold;
	cursor: pointer;
}

.passwordchange {
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

.changeinfobtn {
	text-align: center;
}

#changeinfobtn {
	border-radius: 10px;
	background: #3B5998;
	color: #FFF;
	border: none;
	width: 100px;
	height: 50px;
	font-weight: bold;
	font-size: 1.2em;
	cursor: pointer;
}

#changeinfocancelbtn {
	border-radius: 10px;
	background: #DFE3EE;
	color: #3B5998;
	border: none;
	width: 100px;
	height: 50px;
	font-weight: bold;
	font-size: 1.2em;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
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
</script>

</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="jh-container">
		<div id="goback">
			<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
				style="width: 20px; margin-bottom: -2px;"> <a
				href="..\jeha\mypage.html">뒤로가기</a>
		</div>
		<form action="changeinfo" method="post">
			<div id="changeinfospace">
				<p>내 정보 수정</p>
				<div class="nicknametext">
					<label for="nickname" class="textlabel">닉네임</label>
					 <input	type="text" name="nickname" id="nickname" class="textinput" required="required">
					 <input type="button" id="nicknameduplication" value="중복확인">
				</div>
				<div class="passwordchange" style="margin-bottom: 10px;">
					<label for="password" class="textlabel">비밀번호 변경</label>
					<input type="password"  name="password1" class="textinput" required="required">
				</div>
				<div class="passwordchange">
					<label for="password" class="textlabel">비밀번호 확인</label>
					<input type="password" name="password2" class="textinput" required="required">
				</div>
				<div class="changeinfobtn">
					<input type="submit" value="수정" id="changeinfobtn">
					<input type="button" formaction="mypage" formmethod="get" value="취소"
						id="changeinfocancelbtn" onclick="location.href='mypage'">
				</div>
			</div>
		</form>
	</div>
</body>
</html>