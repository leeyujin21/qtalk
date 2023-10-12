<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/freeboardmodify.css" rel="stylesheet" />
<title>자유게시판 글 수정하기</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<!--게시글 작성 폼 시작-->
	<form action="freeboardmodify" method="post" enctype="multipart/form-data">
	<div class="board_header">
		<div class="board_title">자유게시판 게시글 수정하기</div>
		<div class="writer" id="writer">${user.id }</div>
	</div>
	<hr>
	<div class="container">
		<div class="div">
			<div class="select">
				&nbsp;&nbsp;제목&nbsp;&nbsp; <input class="title" type="text" name="title" id="title"
				value="${board.title }"
					style="border: none; background: transparent; height: 27px; outline: none;" />
			</div>
		</div>
		<div class="div">
			<div class="select">
				&nbsp;&nbsp;이미지첨부&nbsp;&nbsp; <input type="text" class="upload-name" id="file" name="file"
					value="이미지를 업로드 하세요" placeholder="이미지를 업로드 하세요" disabled> <label
					for="upload-file">파일선택</label> <input type="file" id="file" name="file" accept="image/*">
			</div>
		</div>
		<div class="textarea">
			<div>
				<textarea name="textarea" id="content" name="content" cols="30" rows="10">${board.content }</textarea>
			</div>
		</div>
		<div class="button">
			<input class="btn1" type="submit" value="등록" />&nbsp;&nbsp; <input
				class="btn2" type="submit" value="취소" />
		</div>
	</div>
	</form>
	<!--게시글 작성 폼 끝-->

	<!-- footer 시작 -->
	<!-- 그냥 틀만 잡아놨어요..! -->
	<!-- footer 끝 -->
</body>
</html>