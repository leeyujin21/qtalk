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
			<c:forEach items="${freeBoardList}" var="freeBoard">
				<div class="post">
           			<div class="postnum">${freeboard.num }</div>
           			<div class="left" >
	               	<div class="title"><a href="freeboarddetail?num=${freeboard.num}">${freeboard.title}</a></div>
	               	<div class="left_bot">
	               		<div class="writer">작성자 : ${freeboard.nickname}</div>
	               		<div class="viewcnt">조회 : ${freeboard.viewcount}</div>	               	
	               		<div class="writedate">${freeboard.writedate}</div>
	               	</div>
           		</div>
           		<div class="right">
	               	<div class="commentcnt"> 댓글 &#40; ${freeboard.commentcount } &#41; </div>
           		</div>
            	</div>
			</c:forEach>
		</div> <!-- boardList  -->
	</div> <!-- container  -->
</body>
</html>