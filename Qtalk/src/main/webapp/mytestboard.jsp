<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
		<header>
			<h2>시험문제공유</h2>
		</header>
		
		<div class="boardList">
			<c:choose>
				<c:when test="${not empty testBoardList}">
					<c:forEach items="${testBoardList}" var="testBoard">
						<div class="testpost">
					        <div class="left" >       
						        <div class="subject" style="font-family: 'Pretendard-Regular';">
						        	<a href="testboardsearch?type=subject&keyword=${testBoard.subject}" style="color: #3B5998;">#${testBoard.subject}</a>
						        </div> 
					            <div class="testtitle" ><a href="testboarddetail?num=${testBoard.num}">제목 : ${testBoard.title}</a></div>
				            	<div class="left_bot">
					               	<div class="writer">작성자 : ${testBoard.nickname}</div>
					               	<div class="viewcnt">조회 : ${testBoard.viewcount}</div>	               	
					               	<div class="writedate">${testBoard.writedate}</div>
					            </div> 
					        </div>
				       		<div class="right">
				       			<div class="commentcnt">댓글 &#40; ${testBoard.commentcount} &#41; </div>
				        	</div>
				        </div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p>
						작성한 글이 없습니다.<br><br>
						<a href=testboard>작성하러 가기</a>
					</p>
				</c:otherwise>
			</c:choose>
		</div>
