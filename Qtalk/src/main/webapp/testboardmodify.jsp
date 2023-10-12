<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/testboardmodify.css" rel="stylesheet" />
<title>시험게시글 수정하기</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<!--게시글 작성 폼 시작-->
	<div class="board_title">시험문제 공유 게시글 수정하기</div>
	<hr>
	<div class="container">
		<div class="div">
			<div class="select">
				&nbsp;&nbsp;회차&nbsp;&nbsp;
				<select id="round" name="round">
					<option value="">2023년 1회차</option>
					<option value="">2023년 2회차</option>
				</select>
			</div>
		</div>
		<div class="div"> 
			<div class="select">
				&nbsp;&nbsp;시험명&nbsp;&nbsp;
				<select id="subject" name="subject">
				    <option value="">시험명을 선택하세요</option>
				    <c:forEach items="${examInfoList}" var="examInfo">
				        <option value="${examInfo.jmfldnm}">${examInfo.jmfldnm}</option>
				    </c:forEach>
				</select>
			</div>
		</div>
		<div class="div">
			<div class="select">
				&nbsp;&nbsp;제목&nbsp;&nbsp; <input class="title" type="text"
					style="border: none; background: transparent; height: 27px; outline: none;" />
			</div>
		</div>
		<div class="div">
			<div class="select">
				&nbsp;&nbsp;이미지첨부&nbsp;&nbsp; <input type="text" class="upload-name"
					value="이미지를 업로드 하세요" placeholder="이미지를 업로드 하세요" disabled> <label
					for="upload-file">파일선택</label> <input type="file" id="upload-file">
			</div>
		</div>
		<div class="textarea">
			<div>
				<textarea name="textarea" id="textarea" cols="30" rows="10"></textarea>
			</div>
		</div>
		<div class="button">
			<input class="btn1" type="submit" value="수정하기" />&nbsp;&nbsp; <input
				class="btn2" type="submit" value="취소" />
		</div>
	</div>
	<!--게시글 작성 폼 끝-->
</body>
</html>