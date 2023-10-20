<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/freeboard.css" rel="stylesheet" type="text/css">
<title>Qtalk | 자유게시판</title>
</head>
<body>
   <%@ include file="header.jsp"%>
  <div class="board-container">
  <div class="board-title">
      <h1 style="margin-bottom: 50px;"><a href="freeboard" style="font-family: 'Pretendard-Regular';">자유게시판</a></h1>
      <form action="freeboardsearch" method="post" id="searchform">    
     	 <div class="search" style="position: relative;">
     	 	<select name="type" id="selectbar">
        		<option value="all">선택</option>
				<option value="title" ${ res.type eq 'title' ? 'selected' : ''}>제목</option>
				<option value="nickname" ${ res.type eq 'nickname' ? 'selected' : ''}>작성자</option>
				<option value="content" ${ res.type eq 'content' ? 'selected' : ''}>내용</option>
        	</select>
        	 <input type="text" id="search" name="keyword" style="outline: none;">
        	 <button class="search-btn"><i class="fas fa-search" style="width: 20px; position: absolute; right: 25px; top: 20%;"></i></button>
  	    </div>
      </form> 
   </div>
	
  <!--  <form action="freeboard" method="post"> -->
      <div class="container">
         <div class="write">
            <a href="freeboardwrite">글쓰기</a></div>
         <c:forEach items="${res.freeBoardList}" var="freeboard">
            <div class="post">
           		<div class="postnum">${freeboard.num }</div>
           		<div class="left" >
	               	<div class="title"><a href="freeboarddetail?num=${freeboard.num }">${freeboard.title }</a></div>
	               	<div class="left_bot">
	               	<div class="writer">작성자 : ${freeboard.nickname}</div>
	               	<div class="viewcnt">조회 : ${freeboard.viewcount }</div>	               	
	               	<div class="writedate">${freeboard.writedate }</div>
	               	</div>
           		</div>
           		<div class="right">
	               	<div class="commentcnt"> 댓글 &#40; ${freeboard.commentcount } &#41; </div>
           		</div>
            </div>
         </c:forEach>
      </div>
   <!-- </form> -->
   
   
   <!-- 페이지 수 표시 시작 -->
   <div id="emptyArea">
      <c:choose>
         <c:when test="${res.pageInfo.curPage>1}">
            <a href="boardlist?page=${res.pageInfo.curPage-1}">&lt;</a>
         </c:when>
         <c:otherwise>
                 &lt;
              </c:otherwise>
      </c:choose>
      &nbsp;&nbsp;

      <c:forEach begin="${res.pageInfo.startPage}"
         end="${res.pageInfo.endPage}" var="i">
         <c:choose>
            <c:when test="${res.pageInfo.curPage==i}">
               <a href="freeboard?page=${i}" class="select" style="font-family: 'Pretendard-Regular';" onclick="callBtn(${i}); return ${res.keyword==null};">${i}</a>&nbsp;
                    </c:when>
            <c:otherwise>
               <a href="freeboard?page=${i}" class="btn" style="font-family: 'Pretendard-Regular';" onclick="callBtn(${i}); return ${res.keyword==null};">${i}</a>&nbsp;
                    </c:otherwise>
         </c:choose>
      </c:forEach>

      <c:choose>
         <c:when test="${res.pageInfo.curPage<res.pageInfo.allPage}">
            <a href="boardlist?page=${res.pageInfo.curPage+1}">&gt;</a>
         </c:when>
         <c:otherwise>
                 &gt;
              </c:otherwise>
      </c:choose>
      &nbsp;&nbsp;
   </div>
   <!-- 페이지 수 표시 끝 -->
   
   <%@include file ="footer.jsp"  %>
   </div>
<script src="https://kit.fontawesome.com/ad2be14d60.js" crossorigin="anonymous"></script>
</body>
</html>