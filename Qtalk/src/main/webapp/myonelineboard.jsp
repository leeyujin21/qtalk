<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
		<header>
			<h2>한 줄 게시판</h2>
		</header>
		
		<div class="boardList">
			<c:forEach items="${oneLineBoardList}" var="board">
				<div class="post">
		            <div class="subject">#${board.subject}</div>
	            	<div class="title">${board.content}</div>
	            	<div class="level">난이도: ${board.level}</div>
	            	<div class="time">${board.writedate}</div>
	    	    </div>
			</c:forEach>
		</div>
