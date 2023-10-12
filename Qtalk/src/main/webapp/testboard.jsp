<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/testboard.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="board-title">
        <h1 style="margin-bottom: 50px;">시험문제공유</h1>
        <div class="search" style="position: relative;">
            <input type="text" id="search" style="outline: none;">
            <button class="search-btn"><i class="fas fa-search" style="width:20px; position: absolute; right:25px; top:20%;"></i></button>
            
        </div>
    </div>

    
    <div class="container">
        <div class="write"><a href="testboardwrite">글쓰기</a></div>
        <c:forEach items="${res.testBoardList}" var="testboard">
        <div class="post">
            <div class="subject">
                ${testboard.subject }
            </div>
            <div class="title"><a href="testboarddetail?num=${testboard.num }">${testboard.title }</a>
            </div>
            <div class="commentcnt">${testboard.commentcount }</div>
            <div class="viewcnt">조회수 &#40; ${testboard.viewcount } &#41; </div>
        </div> 
        </c:forEach> 
        
    </div>
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