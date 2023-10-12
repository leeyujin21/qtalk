<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<link href="css/testboardpost.css" rel="stylesheet">
	<title>자유게시판 : ${freeboard.title} </title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="back" name="submitButton" style="cursor: pointer;">
		<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
			alt="돌아가기" style="width: 20px; margin-bottom: -5px;"
			name="submitButton"> <a href = "freeboard.jsp">돌아가기</a>
	</div>
	
	<div class="testboard_title"name="title">${freeboard.title}</div>
	
	<div class="container">
		<div class="div">
			<%-- <div class="testboard_subject" name="writer">&nbsp;#${testboard.subject}&nbsp;${testboard.round}회</div>   --%>
			<div class="testboard_writer" name="writer">&nbsp;&nbsp;작성자:&nbsp; ${freeboard.writer}</div>  
			<div class="testview_cnt" name="viewcount">&nbsp;&nbsp;조회수:&nbsp; ${freeboard.viewcount}</div>
		</div>
		<hr>
		<div class="textarea">
			<div>
				<textarea name="textarea" id="textarea" cols="30" rows="10" disabled>${freeboard.content}</textarea>
			</div>
		</div>
		
		
		<div class="comment_cnt">
			<div>
				댓글 <a style="color: rgb(213, 223, 250); font-weight: bold;"> ${freeboard.commentcount} </a>개
			</div> 
		</div>
		<!--댓글개수 보여주기  -->
			
			<c:forEach var="comments" items="${requestScope.freeboardCommentList}">
				<div class="comment">
					<div class="com_id">${comments.writer}</div>
					<div class="com_content">${comments.content}</div>
					&nbsp;&nbsp;
					<c:if test="${comments.writer eq member.id}">
						 <form action="freeboardcommentedit" method="post" onclick="return confirmDelete();" >
							<div class="com_del">
				                <input type="hidden" name="num" value="${comments.comment_num}">
				                <input type="submit" style="border-style: none; background-color: transparent; cursor: pointer; "value="삭제"></input>
							</div>
			            </form>
					</c:if>
						
				</div>	
			</c:forEach>
			
<script>
function confirmDelete() {
    return confirm("정말로 삭제하시겠습니까?"); // 사용자에게 확인 메시지를 표시합니다.
}
</script>
			
			
		<c:if test="${requestScope.freeBoardCommentList != null}">
		</c:if>
		
		
					
		
		<!--1. 달린 댓글 있을때만 보여줌 
			2. 댓글 작성자와 세션아이디가 같을때만 수정 삭제 보여줌
		-->

		
	
	 	<c:if test="${member.id !=null}"> 
		
			<div class="comment_write">
			<form id="writeCommentForm" method="post"  >
				<input type="hidden" name="comment_board" value="${freeboard.num}">
				<input type="hidden" name="comment_id" value="${member.id}">
				<input type="text"  name="comment_content" class="com_write" style="border-style: none;" /> 
				<input type="submit" value="제출" class="com_submit" style="border-style: none;" >
			</form>	
			</div>
		</c:if> 
		
		<!-- 1.로그인 했을떄만 글작성 보여줌  
			 2.댓글다는 글의 고유번호 및 댓글 작성자의 아이디는 히든으로 저장
			 3. 서브밋 버튼을 a태그로 변경 onclick시 writeCmt js 실행
		-->
	
	</div> 
</body>
</html>