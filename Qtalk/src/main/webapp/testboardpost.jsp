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
	<title>시험공유게시판 : ${testboard.title} </title>
		<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function () {
	    const icon = document.getElementById('image');
	    const dropdown = document.getElementById('dropdown');
	    let isDropdownVisible = false;

	    icon.addEventListener('click', function () {
	        if (isDropdownVisible) {
	            dropdown.style.display = 'none';
	        } else {
	            dropdown.style.display = 'block';
	        }
	        isDropdownVisible = !isDropdownVisible;
	    });

	    document.addEventListener('click', function (e) {
	        if (!icon.contains(e.target) && !dropdown.contains(e.target)) {
	            dropdown.style.display = 'none';
	            isDropdownVisible = false;
	        }
	    });
	});
	</script>
	
</head>	
<body>
	<%@ include file="header.jsp"%>
	<div class="back" name="submitButton" style="cursor: pointer;">
		<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
			alt="돌아가기" style="width: 20px; margin-bottom: -5px;"
			name="submitButton"> <a href = "testboard" style="font-family: 'Pretendard-Regular';">돌아가기</a>
	</div>
	
	<div class = "sub_title">
		<div class="testboard_subject" name="writer">#${testboard.subject}&nbsp;&nbsp;#${testboard.round} </div>
		<div class="testboard_title"name="title">${testboard.title}</div>
	</div>
	
	<div class="container">
		<div class="div" style="position : relative;" >
			<div class="testboard_writer" name="writer">&nbsp;&nbsp;작성자:&nbsp; ${testboard.nickname} </div> 	
				<div class="testview_cnt" name="viewcount">&nbsp;&nbsp;조회수:&nbsp; ${testboard.viewcount}</div>
				<div class="writedate" name="writedate">${testboard.writedate}</div>
				<div class="viewmore">
					<i class="fas fa-ellipsis-v" id="image"></i>
					<c:if test="${testboard.writer eq member.id}">
					 <div class="dropdown" id="dropdown">
						 <form action="testboardmodify" method	='get'>
				           <button type="submit" name="num" value="${testboard.num}" >수정</button>
						 </form>
						 <form action="testboarddelete" method	='post' onclick="return confirmDelete();">
				           <input type="hidden" name="writer" value="${testboard.writer}">
				           <button type="submit" name="num" value="${testboard.num}" >삭제</button>
						 </form>
			        </div>
					</c:if> 
				</div>
			
		</div>
		<hr>
		<div class="textarea">
			<div>
				<textarea name="textarea" id="textarea" cols="30" rows="10" disabled>${testboard.content}</textarea>
			</div>
		</div>
		
		
		<div class="comment_cnt">
			<div>
				댓글 <a style="color: rgb(213, 223, 250); font-weight: bold;"> ${testboard.commentcount} </a>개
			</div> 
		</div>
		<!--댓글개수 보여주기  -->
			
			<c:forEach var="comments" items="${requestScope.testboardCommentList}">
				<div class="comment">
					<div class="com_id">${comments.writer}</div>
					<div class="com_content">${comments.content}</div>
					&nbsp;&nbsp;
					<c:if test="${comments.writer eq member.id}">
						 <form action="testboardcommentedit" method="post" onclick="return confirmDelete();" >
						<div class="com_del">
			                <input type="hidden" name="num" value="${comments.comment_num}">
			                <input type="hidden" name="post_num" value="${testboard.num}">
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
			
			
		<c:if test="${requestScope.testBoardCommentList != null}">
		</c:if>
		
		<!--1. 달린 댓글 있을때만 보여줌 
			2. 댓글 작성자와 세션아이디가 같을때만 수정 삭제 보여줌
		-->

		
	
	 	<c:if test="${member.id!=null}"> 
			<div class="comment_write">
			<form id="writeCommentForm" method="post"  >
				<input type="hidden" name="comment_board" value="${testboard.num}">
				<input type="hidden" name="comment_id" value="${member.id}">
				<input type="hidden" name="comment_nickname" value="${member.nickname}">
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
	<script src="https://kit.fontawesome.com/ad2be14d60.js" crossorigin="anonymous"></script>
</body>
</html>