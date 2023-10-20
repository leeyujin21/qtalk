<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/login.css" rel="stylesheet" />
	<script>
		/* login 실패 시 servlet(login)에서 err 출력 */
		/* let err = "${err}";
		if(err !== null){
			alert("${err}");
			err = null;
		} */
	</script>
	<title>Qtalk | 로그인</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="jh-container">
		<div id="goback">
			<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png" style="width: 20px; margin-bottom: -2px;"> <a href="javascript: history.back();">뒤로가기</a>
		</div>
		<form action="login" method="post">
			<div id="loginspace">
				<p>로그인</p>
				<div id="idtext" class="textcommon">
					<label for="id" class="textlabel" style="width: 100px;">아이디</label>
					<input type="text" class="textinput" name="id"
						placeholder="ex) kosta" required="required">
				</div>
				<div id="passwordtext" class="textcommon">
					<label for="id" class="textlabel" style="width: 100px;">비밀번호</label>
					<input type="password" class="textinput" name="password" required="required">
				</div>
				<div class="loginbtn">
					<input type="submit" value="로그인" id="loginbtn">
				</div>
				
				<div class="bottomspace">
					<a href="join" id="joinbtn">회원가입</a>
					<a href="idforget" id="idforget">ID 찾기</a>
					<a href="passwordforget" id="passwordforget">PW 찾기</a>
				</div>
			</div>
		</form>
		
	</div>
	<script src="https://kit.fontawesome.com/ad2be14d60.js"
		crossorigin="anonymous"></script>
</body>
</html>