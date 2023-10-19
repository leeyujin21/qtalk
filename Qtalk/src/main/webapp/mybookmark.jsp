<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
		<header class="boardheader">
			<h2>북마크</h2>
		</header>
		
		<div class="boardList">
			<c:choose>
				<c:when test="${not empty freeBoardList}">
					<c:forEach items="${freeBoardList}" var="freeBoard">
						<div class="post">
		           			<div class="postnum">${freeboard.num }</div>
		           			<div class="left" >
			               	<div class="title"><a href="freeboarddetail?num=${freeboard.num}">${freeboard.title}</a></div>
			               	<div class="left_bot">
			               		<div class="writer">작성자 : ${freeboard.nickname}</div>
			               		<div class="viewcnt">조회 : ${freeboard.viewcount}</div>	               	
			               		<div class="writedate">${freeboard.writedate}</div>
			               	</div>
		           		</div>
		           		<div class="right">
			               	<div class="commentcnt"> 댓글 &#40; ${freeboard.commentcount } &#41; </div>
		           		</div>
		            	</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p>
						북마크한 시험이 없습니다.<br><br>
						<a href="testschedule">시험 보러 가기</a>
					</p>
				</c:otherwise>
			</c:choose>
		</div> <!-- boardList  -->
