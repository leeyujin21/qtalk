<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/freeboardwrite.css" rel="stylesheet" />
<title>자우게시판 글쓰기</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<!--게시글 작성 폼 시작-->
	<div class="board_header">
		<div class="board_title">자유게시판 게시글 작성하기</div>
		<div class="writer" id="writer">${member.id }</div>
	</div>
	<hr>
	<form action="freeboardwrite" method="post" enctype="multipart/form-data"
			name="freeboardwrite">
	<div class="container">
		<div class="div">
			<div class="select">
				&nbsp;&nbsp;제목&nbsp;&nbsp; <input class="title" type="text" id="title" name = "title"
					style="border: none; background: transparent; height: 27px; outline: none;" />
			</div>
		</div>
		<div class="div">
			<div class="select">
				&nbsp;&nbsp;이미지첨부&nbsp;&nbsp; <input type="text" class="upload-name"
					value="이미지를 업로드 하세요" placeholder="이미지를 업로드 하세요" disabled> <label
					for="file">파일선택</label> <input type="file" name = "file" id="file">
			</div>
		</div>
		<div class="textarea">
			<div>
				<textarea name="content" id="content" cols="30" rows="10" name="textarea"></textarea>
			</div>
		</div>
		<div class="button">
			<input class="btn1" type="submit" value="등록" />&nbsp;&nbsp; <input
				class="btn2" type="button" value="취소"
				onclick="location.href='freeboard.jsp'" />
		</div>
	</div>
	</form>
	<!--게시글 작성 폼 끝-->

	<div class="list-back-btn">
		<span><a href="..\MiniProj\freeboard.jsp">목록</a></span>
	</div>
</body>
</html>