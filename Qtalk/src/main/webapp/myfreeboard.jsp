<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
		<header>
			<h2>자유게시판</h2>
		</header>
		
		<div class="boardList">
			<c:choose>
				<c:when test="${not empty freeBoardList}">
					<c:forEach items="${freeBoardList}" var="freeBoard">
						<div class="post">
		           			<div class="left" >
			               	<div class="title"><a href="freeboarddetail?num=${freeBoard.num}">제목 : ${freeBoard.title}</a></div>
			               	<div class="left_bot">
			               		<div class="writer">작성자 : ${freeBoard.nickname}</div>
			               		<div class="viewcnt">조회 : ${freeBoard.viewcount}</div>	               	
			               		<div class="writedate">${freeBoard.writedate}</div>
			               	</div>
		           		</div>
		           		<div class="right">
			               	<div class="commentcnt"> 댓글 &#40; ${freeBoard.commentcount } &#41; </div>
			               	<!-- <div class="left-bot">
			               		수정, 삭제
			               	</div> -->
		           		</div>
		            	</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p>
						작성한 글이 없습니다.<br><br>
						<a href="freeboard">작성하러 가기</a>
					</p>
				</c:otherwise>
			</c:choose>
		</div> <!-- boardList  -->
