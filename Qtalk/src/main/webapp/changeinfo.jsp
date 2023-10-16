<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/changeinfo.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script type="text/javascript" src="js/changeinfo.js"></script>
	<title>내 정보 수정</title>
	<style>
		label {
		  display: inline-flex;
		  align-items: center;
		  gap: 0.5rem;
		  cursor: pointer;
		}
		
		[type="checkbox"] {
		  appearance: none;
		  position: relative;
		  border: max(2px, 0.1em) solid gray;
		  border-radius: 1.25em;
		  width: 2.25em;
		  height: 1.25em;
		}
		
		[type="checkbox"]::before {
		  content: "";
		  position: absolute;
		  left: 0;
		  width: 1em;
		  height: 1em;
		  border-radius: 50%;
		  transform: scale(0.8);
		  background-color: gray;
		  transition: left 250ms linear;
		}
		
		[type="checkbox"]:checked {
		  background-color: tomato;
		  border-color: tomato;
		}
		
		[type="checkbox"]:checked::before {
		  background-color: white;
		  left: 1em;
		}
		
		[type="checkbox"]:disabled {
		  border-color: lightgray;
		  opacity: 0.7;
		  cursor: not-allowed;
		}
		
		[type="checkbox"]:disabled:before {
		  background-color: lightgray;
		}
		
		[type="checkbox"]:disabled + span {
		  opacity: 0.7;
		  cursor: not-allowed;
		}
		
		[type="checkbox"]:focus-visible {
		  outline-offset: max(2px, 0.1em);
		  outline: max(2px, 0.1em) solid tomato;
		}
		
		[type="checkbox"]:enabled:hover {
		  box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
		}
		
		fieldset {
		  border: none;
		  display: flex;
		  flex-direction: column;
		  gap: 0.5rem;
		}
		
		*,
		*::before,
		*::after {
		  box-sizing: border-box;
		}
		
	</style>
	<script>
		if(${err} !== null) {
			alert(${err})
		}
		
	</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="jh-container">
		<div id="goback">
			<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
				style="width: 20px; margin-bottom: -2px;"> <a
				href="mypage">뒤로가기</a>
		</div>
		<form action="changeinfo" method="post">
			<div id="changeinfospace">
				<p>내 정보 수정</p>
				<div class="nicknametext">
					<label for="nickname" class="textlabel">닉네임</label>
					 <input	type="text" name="nickname" id="nickname" class="textinput" required="required">
					 <input type="button" id="nicknameduplication" value="중복확인">
				</div>
				<fieldset>
				  <label for="switch">
				    <input role="switch" type="checkbox" name="switch" id="switch" />
				    <span>비밀번호 변경</span>
				  </label>
				</fieldset>
				<div class="passwordchange" style="margin-bottom: 10px;">
					<label for="password1" class="textlabel">새 비밀번호</label>
					<input type="password" id="password1" name="password1" class="textinput" disabled>
				</div>
				<div class="passwordchange">
					<label for="password2" class="textlabel">새 비밀번호 확인</label>
					<input type="password" id="password2" name="password2" class="textinput" disabled>
				</div>
				<div class="passwordchange">
					<label for="password" class="textlabel">현재 비밀번호</label>
					<input type="password" name="password" class="textinput" required="required">
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