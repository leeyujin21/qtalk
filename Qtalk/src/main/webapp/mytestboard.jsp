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
			<c:forEach items="${testBoardList}" var="testBoard">
				<div class="post">
			        <div class="subject" style="font-family: 'Pretendard-Regular';">
			        	<a href="testboardsearch?type=subject&keyword=${testboard.subject}" style="color: #3B5998;">#${testboard.subject}</a>
			        </div>
			        <div class="left" >        
			            <div class="title" ><a href="testboarddetail?num=${testboard.num}">${testboard.title}</a></div>
			        </div>
	            	<div class="left_bot">
		               	<div class="writer">작성자 : ${testboard.nickname}</div>
		               	<div class="viewcnt">조회 : ${testboard.viewcount}</div>	               	
		               	<div class="writedate">${testboard.writedate}</div>
		             </div> 
		       		<div class="right">
		       			<div class="commentcnt">댓글 &#40; ${testboard.commentcount} &#41; </div>
		        	</div>
		        </div>
			</c:forEach>
		</div>
	</div>
</body>
</html>