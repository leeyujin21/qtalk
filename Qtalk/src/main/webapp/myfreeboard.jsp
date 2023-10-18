<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
		<header>
			<h2>자유게시판</h2>
		</header>
		
		<div class="boardList">
			<c:forEach items="${freeBoardList}" var="freeBoard">
				<div class="post">
           			<div class="postnum">${freeBoard.num }</div>
           			<div class="left" >
	               	<div class="title"><a href="freeboarddetail?num=${freeBoard.num}">${freeBoard.title}</a></div>
	               	<div class="left_bot">
	               		<div class="writer">작성자 : ${freeBoard.nickname}</div>
	               		<div class="viewcnt">조회 : ${freeBoard.viewcount}</div>	               	
	               		<div class="writedate">${freeBoard.writedate}</div>
	               	</div>
           		</div>
           		<div class="right">
	               	<div class="commentcnt"> 댓글 &#40; ${freeBoard.commentcount } &#41; </div>
           		</div>
            	</div>
			</c:forEach>
		</div> <!-- boardList  -->
