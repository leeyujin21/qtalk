<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.header {
	height: 100px;
}

.back {
	width: 65%;
	margin: 0 auto;
}

hr {
	width: 100%;
	height: 3px;
	background-color: rgb(213, 223, 250);
	border: 0;
}

.container {
	width: 60%;
	margin: 0 auto;
	height: 100%;
	overflow: auto;
}

.testboard_title {
	margin-bottom: 20px;
	font-weight: bold;
	text-align: center;
	font-size: 1.3em;
}

.div {
	display: flex;
}
.testboard_subject {
	font-weight: bold;
	width : 200px;
}

.testboard_writer {
	font-weight: bold;	
}

.testview_cnt {
	color: lightgray;
	font-weight: bold;
	position: absolute;
	right: 21%;
}

textarea {
	border: 3px solid rgb(213, 223, 250);
	margin-top: 10px;
	width: 99%;
	height: 358px;
	resize: none;
	outline: none;
	font-size: 1.2em;
	background-color: white;
}

.comment_cnt {
	padding-top: 10px;
	padding-bottom: 10px;
}

.comment {
	display: flex;
	border-bottom: 2px solid gainsboro;
	padding-top: 10px;
	padding-bottom: 10px;
}

.com_id {
	width: 13%;
	padding-left: 2%;
	color: rgb(158, 158, 158);
}

.com_mod {
	position: absolute;
	right: 25%;
	font-size: 12px;
	color: rgb(146, 146, 146);
}

.com_del {
	position: absolute;
	right: 23%;
	font-size: 12px;
	color: rgb(146, 146, 146);
}

.comment_write {
	margin-top: 20px;
	margin-bottom: 70px;
	display: flex;
	border: 2px solid #8B9DC3;
	border-radius: 10px;
	height: 40px;
}

.com_write {
	margin-left: 10px;
	outline: none;
	width : 728px;
}

.com_submit {
	background-color: #3B5998;
	color: white;
	position: absolute;
	right: 20.5%;
	margin-top: 3px;
	margin-bottom: 3px;
	height: 34px;
	border-radius: 10px;
	width: 50px;
	cursor: pointer;
	text-align: center;
	line-height: normal;
}

</style>
<!-- 
<script>
function writeCmt()
{
    var form = document.getElementById("writeCommentForm");
    
    var board = form.comment_board.value
    var id = form.comment_id.value
    var content = form.comment_content.value;
    
    if(!content)
    {
        alert("내용을 입력하세요.");
        return false;
    }
    else
    {    
        var param="comment_board="+board+"&comment_id="+id+"&comment_content="+content;
            
       //제이쿼리로 어케저케 보냄 
    }
}
</script>
 -->

</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="back" name="submitButton" style="cursor: pointer;">
		
		<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
			alt="돌아가기" style="width: 20px; margin-bottom: -5px;"
			name="submitButton"> 돌아가기
	</div>
	
	<div class="testboard_title"name="title">${testboard.subject}</div>
	
	<div class="container">
		<div class="div">
			<div class="testboard_subject" name="writer">&nbsp;#${testboard.subject}${testboard.round}회</div>  
			<div class="testboard_writer" name="writer">&nbsp;&nbsp;작성자:&nbsp; ${testboard.writer}</div>  
			<div class="testview_cnt" name="viewcount">&nbsp;&nbsp;조회수:&nbsp; ${testboard.viewcount}</div>
		</div>
		<hr>
		<div class="textarea">
			<div>
				<textarea name="textarea" id="textarea" cols="30" rows="10" disabled>${testboard.content}</textarea>
				<!-- 첨부된 이미지는 어떻게 하죠..? -->
			</div>
		</div>
		
	<%-- 	
		<div class="comment_cnt">
			<div>
				댓글 <a style="color: rgb(213, 223, 250); font-weight: bold;">${testboard.commentcount}</a>개
			</div> 
		</div>
		<!--댓글개수 보여주기  -->
		
		<c:if test="${requestScope.testboarCommentList != null}">
			<c:forEach var="comment" items="${requestScope.testboardCommentList}">
				<div class="comment">
					<div class="com_id">${comment.id}</div>
					<div class="com_content">${comment.content}</div>
					
					<c:if test="${comment.id==uesr.id}">
						<div class="com_mod"><a href="#">수정</a></div>
						&nbsp;
						<div class="com_del">><a href="#">삭제</a></div>
					</c:if>
				</div>	
			</c:forEach>
		</c:if>
		<!--1. 달린 댓글 있을때만 보여줌 
			2. 댓글 작성자와 세션아이디가 같을때만 수정 삭제 보여줌
		-->

		
	
	 	<c:if test="${user.id !=null}"> 
		
			<div class="comment_write">
			<form id="writeCommentForm" >
				<input type="hidden" name="comment_board" value="${testboard.num}">
				<input type="hidden" name="comment_id" value="${user.id}">
				<input type="text"  name="comment_content" class="com_write" style="border-style: none;" /> 
				<a href="#" onclick="writeCmt()" class="com_submit" style="border-style: none;" >
				등록
				</a>
			</form>	
			</div>
		</c:if> 
		
		<!-- 1.로그인 했을떄만 글작성 보여줌  
			 2.댓글다는 글의 고유번호 및 댓글 작성자의 아이디는 히든으로 저장
			 3. 서브밋 버튼을 a태그로 변경 onclick시 writeCmt js 실행
		-->
		--%>
	</div> 
</body>
</html>