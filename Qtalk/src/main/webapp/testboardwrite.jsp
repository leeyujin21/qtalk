<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/testboardwrite.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<!--게시글 작성 폼 시작-->
	<form action="testboardwrite" method="post" enctype="multipart/form-data"
		name="testboardwrite">
	<div class="board_header">
		<div class="board_title">시험문제 공유 게시글 작성하기</div>
		<div class="writer" id="writer">${user.id }</div>
	</div>
	<hr>
	<div class="container">
		<div class="div">
			<div class="select">
				&nbsp;&nbsp;회차&nbsp;&nbsp;
				<select id="round" name="round">
					<option value="">회차를 선택하세요</option>
				    <c:forEach items="${examScheduleList}" var="examSchedule">
				        <option value="${examSchedule.implplannm}">${examSchedule.implplannm}</option>
				    </c:forEach>
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
				<textarea name= "content" id="content" cols="30" rows="10"></textarea>
			</div>
		</div>
		<div class="button">
			<input class="btn1" type="submit" value="등록" />&nbsp;&nbsp; <input
				class="btn2" type="button" value="취소"
				onclick="location.href='testboard.jsp'" />
		</div>
	</div>	
	</form>
	<!--게시글 작성 폼 끝-->

	<div class="list-back-btn">
		<span><a href="..\gunwoo\testboard.html">목록</a></span>
	</div>
</body>
</html>