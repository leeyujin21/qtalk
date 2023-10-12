<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> Qtalk | FreeBoard</title>
<link href="css/freeboard.css" rel="stylesheet" type="text/css">
</head>
<body>
   <%@ include file="header.jsp"%>
   <div class="board-title">
      <h1 style="margin-bottom: 50px;">자유게시판</h1>
      <div class="search" style="position: relative;">
         <input type="text" id="search" style="outline: none;">
         
         <button class="search-btn">
            <i class="fas fa-search"
               style="width: 20px; position: absolute; right: 25px; top: 20%;"></i>
         </button>

      </div>
   </div>

   <form action="freeboard" method="post">
      <div class="container">
         <div class="write">
            <a href="freeboardwrite">글쓰기</a>
         </div>
         <c:forEach items="${res.boardList }" var="freeboard">
            <div class="post">
               <div class="title"><a href="freeboarddetail?num=${freeboard.num }">${freeboard.title }</a></div>
               <div class="commentcnt">${freeboard.commentcount }</div>
               <div class="viewcnt"> 조회수 &#40; ${freeboard.viewcount } &#41; </div>
            </div>
         </c:forEach>
      </div>
   </form>
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
               <a href="boardlist?page=${i}" class="select" onclick="callBtn(${i}); return ${res.keyword==null};">${i}</a>&nbsp;
                    </c:when>
            <c:otherwise>
               <a href="boardlist?page=${i}" class="btn" onclick="callBtn(${i}); return ${res.keyword==null};">${i}</a>&nbsp;
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
   
   
<script src="https://kit.fontawesome.com/ad2be14d60.js" crossorigin="anonymous"></script>
</body>
</html>