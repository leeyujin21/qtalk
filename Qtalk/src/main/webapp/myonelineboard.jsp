<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<%-- <%@ include file="mypage.jsp"%> --%>
	<div class="container">
		<header>
			<h2>자유게시판</h2>
		</header>
		
		<div class="boardList">
			<c:forEach items="${onelineBoardList}" var="onelineBoard">
				<div class="post">
		            <div class="subject">#${onelineBoard.subject}</div>
	            	<div class="title">${onelineBoard.content}</div>
	            	<div class="level">난이도: ${onelineBoard.level}</div>
	            	<div class="time">${onelineBoard.writedate}</div>
	    	    </div>
			</c:forEach>
		</div>
	</div>
</body>
</html>