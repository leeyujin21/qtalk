<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 70%;
	outline: none;
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
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="back" name="submitButton" style="cursor: pointer;">
		<img src="https://cdn-icons-png.flaticon.com/128/8371/8371124.png"
			alt="돌아가기" style="width: 20px; margin-bottom: -5px;"
			name="submitButton"> 돌아가기
	</div>
	<div class="testboard_title">제목제목제목제목</div>
	<div class="container">
		<div class="div">
			<div class="testboard_writer">&nbsp;&nbsp;작성자:&nbsp; nickname</div>
			<div class="testview_cnt">&nbsp;&nbsp;조회수:&nbsp; 245</div>
		</div>
		<hr>
		<div class="textarea">
			<div>
				<textarea name="textarea" id="textarea" cols="30" rows="10" disabled>{testboard_content}</textarea>
				<!-- 첨부된 이미지는 어떻게 하죠..? -->
			</div>
		</div>
		<div class="comment_cnt">
			<div>
				댓글 <a style="color: rgb(213, 223, 250); font-weight: bold;">{comment_count}</a>개
			</div>
		</div>
		<div class="comment">
			<div class="com_id">{id}</div>
			<div class="com_content">{content}</div>
			<div class="com_mod">수정</div>
			&nbsp;
			<div class="com_del">삭제</div>
		</div>
		<div class="comment">
			<div class="com_id">{id}</div>
			<div class="com_content">{content}</div>
			<div class="com_mod">수정</div>
			&nbsp;
			<div class="com_del">삭제</div>
		</div>
		<div class="comment">
			<div class="com_id">{id}</div>
			<div class="com_content">{content}</div>
			<div class="com_mod">수정</div>
			&nbsp;
			<div class="com_del">삭제</div>
		</div>
		<div class="comment">
			<div class="com_id">{id}</div>
			<div>{content}</div>
			<div class="com_mod">수정</div>
			&nbsp;
			<div class="com_del">삭제</div>
		</div>
		<div class="comment_write">
			<input type="text" class="com_write" style="border-style: none;" /> <input
				type="submit" class="com_submit" style="border-style: none;" />
		</div>
	</div>
</body>
</html>