<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
		<header>
			<h2>시험한줄평</h2>
		</header>
		
		<div class="boardList">
			<c:choose>
				<c:when test="${not empty oneLineBoardList}">
				<c:forEach items="${oneLineBoardList}" var="board">
					<div class="post">
						<div class="onelineleft">
				            <div class="subject">#${board.subject}</div>
			            	<div class="title">내용 : ${board.content}</div>
						</div>
						<div class="onelineright">
			            	<div class="level">
			            		<c:choose>
									<c:when test="${board.level eq '1'}">
										 <i class="fas fa-pen"></i>
									</c:when>
									<c:when test="${board.level eq '2'}">
										 <i class="fas fa-pen"></i>
										 <i class="fas fa-pen"></i>
									</c:when>
									<c:when test="${board.level eq '3'}">
											<i class="fas fa-pen"></i>
											<i class="fas fa-pen"></i>
											<i class="fas fa-pen"></i>
									</c:when>
									<c:when test="${board.level eq '4'}">
										<i class="fas fa-pen"></i>
										 <i class="fas fa-pen"></i>
										 <i class="fas fa-pen"></i>
										 <i class="fas fa-pen"></i>
									</c:when>
									<c:when test="${board.level eq '5'}">
										<i class="fas fa-pen"></i>
										<i class="fas fa-pen"></i>
										<i class="fas fa-pen"></i>
										<i class="fas fa-pen"></i>
										<i class="fas fa-pen"></i>
									</c:when>
									<c:otherwise>
										Level 값 오류
									</c:otherwise>
								</c:choose>
			            		<div class="delete"><a href="onelineboarddelete?num=${board.num}&typeBoard=3">삭제</a></div>
			            	</div>
		            		<div class="writedate">${board.writedate}</div>
						</div>
		    	    </div>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<p>
						작성한 글이 없습니다.<br><br>
						<a href="onelineboardpost">작성하러 가기</a>
					</p>
				</c:otherwise>
			</c:choose>
		</div>
		<script src="https://kit.fontawesome.com/ad2be14d60.js"	crossorigin="anonymous"></script>
