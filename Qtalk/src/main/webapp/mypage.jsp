<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/mypage.css" rel="stylesheet" />
	<title>마이페이지</title>
	<style>
	</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="jh-container">
		<div id="goback">
			<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
				style="width: 20px; margin-bottom: -2px;"> <a
				href="..\index.html">뒤로가기</a>
		</div>
		<div id="myinfo">
			<p>마이페이지</p>
			<div class="myinfodetail">
				<div id="nickname">${member.nickname}</div>
				<div class="idemail">
					ID : <input type="text" class="textinput" value="${member.id}">
					<br>
					<br> Email : <input type="text" class="textinput" disabled
						value="${member.email}">
				</div>
				<div class="changeinfo">
					<a href="deletemember">회원탈퇴</a> &nbsp;&nbsp;
					<input type="button" id="btnOpen" value="내정보수정">
					<div id='modal'>
						<div id='content'>
							<input type='button' value='X' class="close" id='btnClose'/>
							<p>	비밀번호를 입력하세요</p><br/>
							<input type='password' id='pwd' style="text-align:center;"/><br>
							<input type='button' value='check' id='btnCheck'/>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="bookmark">
			<h2>북마크</h2>
			<div id="bookmark" class="inputspace">
				<div>content</div>
				<div>content</div>
				<div>content</div>
				<div>content</div>
				<div>content</div>
				<div>content</div>
			</div>
		</div>
		<hr>
		<div class="mywrite">
			<h2>내가 쓴 글</h2>
				<div id="mywrite" class="inputspace">
					<div class="container">
				        <div class="write"><a href="testboardwrite">글쓰기</a></div>
				        <c:forEach items="${res.testBoardList}" var="testboard">
				        <div class="post">
				            <div class="subject" style="font-family: 'Pretendard-Regular';">
				                ${testboard.subject}
				            </div>
				            <div class="title" ><a href="testboarddetail?num=${testboard.num }">${testboard.title }</a>
				            </div>
				        </div> 
				        </c:forEach> 
	   			 </div>
			</div>
		</div>
		<hr>
	</div>
</body>
<footer style="height: 100px;">
	<!--틀만 잡아뒀습니다.-->
</footer>
</body>
<script>
	var btnOpen  = document.getElementById('btnOpen');
	var btnCheck = document.getElementById('btnCheck');
	var btnClose = document.getElementById('btnClose');
	var passwordInput = document.getElementById('pwd');
	
	// 경고 메시지를 표시하는 함수
	function showAlert(message) {
	    alert(message);
	}
	
	// 입력한 비밀번호가 사용자의 비밀번호와 일치하는지 확인하는 함수
	function checkPassword() {
	    var userPassword = "${member.password}"; // 서버 측에서 실제 비밀번호 값으로 대체해주세요

	    if (passwordInput.value === userPassword) {
	        closeRtn(); // 모달을 숨깁니다
	        window.location.href = 'changeinfo'; // changeinfo 페이지로 이동합니다
	    } else {
	        showAlert('일치하지 않는 비밀번호입니다.'); // 일치하지 않는 비밀번호에 대한 경고를 표시합니다
	    }
	}
	
	
	// modal 창을 감춤
	var closeRtn = function(){
	  var modal = document.getElementById('modal');
	  modal.style.display = 'none';
	}
	
	// modal 창을 보여줌
	btnOpen.onclick = function(){
	  var modal = document.getElementById('modal');
	  modal.style.display = 'block';
	}
	
	// check 버튼 클릭 시 changeinfo 페이지로 이동
    btnCheck.onclick = function () {
        closeRtn(); // 모달 창 감추기
        window.location.href = 'changeinfo'; // changeinfo 페이지로 이동
    }

 	// 비밀번호 유효성을 검사하기 위한 'check' 버튼 클릭 이벤트
    btnCheck.onclick = checkPassword;
	btnClose.onclick = closeRtn;
</script>
</html>