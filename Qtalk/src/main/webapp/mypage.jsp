<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mypage.css" rel="stylesheet" />
<title>마이페이지</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="jh-container">
		<div id="goback">
			<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
				style="width: 20px; margin-bottom: -2px;">
				<a href="#" onclick="customGoBack();">뒤로가기</a>
		</div>
		<div id="myinfo">
			<p>마이페이지</p>
			<div class="myinfodetail">
				<div id="nickname">${member.nickname}</div>
				<div class="idemail">
					ID : <input type="text" class="textinput" value="${member.id}">
					<br> <br> Email : <input type="text" class="textinput"
						disabled value="${member.email}">
				</div>
				<div class="changeinfo">
					<a href="deletemember">회원탈퇴</a> &nbsp;&nbsp; <input type="button"
						id="btnOpen" value="내정보수정">
					<div id='modal'>
						<div id='content'>
							<input type='button' value='X' class="close" id='btnClose' />
							<p>비밀번호를 입력하세요</p>
							<br /> <input type='password' id='pwd'
								style="text-align: center;" /><br> <input type='button'
								value='check' id='btnCheck' />
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="contents">
			<div class="category">
				<div class="bookmark">
					<h3>북마크</h3>
					<a href="mypage">&nbsp;&nbsp;북마크</a>
					<h3>내가 쓴 글</h3>
					<a href="mywriteboard?typeBoard=1">&nbsp;&nbsp;자유게시판</a><br><br>
					<a href="mywriteboard?typeBoard=2">&nbsp;&nbsp;시험문제공유</a><br><br>
					<a href="mywriteboard?typeBoard=3">&nbsp;&nbsp;시험한줄평</a><br><br>
				</div>
			</div>
			<div class="content">
				<c:choose>
					<c:when test="${typeBoard == '1'}">
						<%@include file="myfreeboard.jsp"%>
					</c:when>
					<c:when test="${typeBoard == '2'}">
						<%@include file="mytestboard.jsp"%>
					</c:when>
					<c:when test="${typeBoard == '3'}">
						<%@include file="myonelineboard.jsp"%>
					</c:when>
					<c:otherwise>
						<%@include file="mybookmark.jsp"%>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
</div>
	
	<hr>
</body>

<script src="https://kit.fontawesome.com/ad2be14d60.js"
		crossorigin="anonymous"></script>
<script>
	var btnOpen = document.getElementById('btnOpen');
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
	var closeRtn = function() {
		var modal = document.getElementById('modal');
		modal.style.display = 'none';
	}

	// modal 창을 보여줌
	btnOpen.onclick = function() {
		var modal = document.getElementById('modal');
		modal.style.display = 'block';
	}

	// check 버튼 클릭 시 changeinfo 페이지로 이동
	btnCheck.onclick = function() {
		closeRtn(); // 모달 창 감추기
		window.location.href = 'changeinfo'; // changeinfo 페이지로 이동
	}

	// 비밀번호 유효성을 검사하기 위한 'check' 버튼 클릭 이벤트
	btnCheck.onclick = checkPassword;
	btnClose.onclick = closeRtn;
	
	function customGoBack() {
        var previousPage = document.referrer;
        if (previousPage.includes("deletemember") || previousPage.includes("changeinfo")) {
            history.go(-3);
        } else {
            history.go(-1);
        }
    }
</script>
</html>