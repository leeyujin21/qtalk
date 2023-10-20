<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/testboard.css" rel="stylesheet" type="text/css">
<title>Qtalk | 시험문제공유</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="board-container">
<div class="board-title">
    <h1 style="margin-bottom: 50px; " ><a href="testboard" style="font-family: 'Pretendard-Regular';" >시험문제공유</a></h1>
    <form action="testboardsearch" method="post" id="searchform">    
        <div class="search" style="position: relative;">
        	<select name="type" id="selectbar">
        		<option value="all">선택</option>
				<option value="subject" ${ res.type eq 'subject' ? 'selected' : ''}>시험종목</option>
				<option value="nickname" ${ res.type eq 'nickname' ? 'selected' : ''}>작성자</option>
				<option value="title" ${ res.type eq 'title' ? 'selected' : ''}>제목</option>
				<option value="content" ${ res.type eq 'content' ? 'selected' : ''}>내용</option>
        	</select>
            <input type="text" id="search" name="keyword" style="outline: none;">
            <button class="search-btn"><i class="fas fa-search" style="width:20px; position: absolute; right:25px; top:20%;"></i></button>
        </div>
       </form> 
    </div>

    
    <div class="container">
        <div class="write"><a href="testboardwrite">글쓰기</a></div>
        <c:forEach items="${res.testBoardList}" var="testboard">
        <div class="post">
            <div class="subject" style="font-family: 'Pretendard-Regular';"><a href="testboardsearch?type=subject&keyword=${testboard.subject }" style="color: #3B5998;">#${testboard.subject }</a></div>
        	<div class="left" >        
            <div class="title" ><a href="testboarddetail?num=${testboard.num }"style="font-family: 'Pretendard-Regular';">${testboard.title }</a></div>
            	<div class="left_bot">
	               	<div class="writer">작성자 : ${testboard.nickname}</div>
	               	<div class="viewcnt">조회 : ${testboard.viewcount }</div>	               	
	               	<div class="writedate">${testboard.writedate }</div>
	             </div> 
        	</div> 	
	        <div class="right">
	       		 <div class="commentcnt">댓글 &#40; ${testboard.commentcount } &#41; </div>
	        </div>
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
      &nbsp;

      <c:forEach begin="${res.pageInfo.startPage}"
         end="${res.pageInfo.endPage}" var="i">
         <c:choose>
            <c:when test="${res.pageInfo.curPage==i}">
               <a href="testboard?page=${i}" style="font-family: 'Pretendard-Regular';" class="select" onclick="callBtn(${i}); return ${res.keyword==null};">${i}</a>&nbsp;
            </c:when>
            <c:otherwise>
               <a href="testboard?page=${i}" style="font-family: 'Pretendard-Regular';" class="btn" onclick="callBtn(${i}); return ${res.keyword==null};">${i}</a>&nbsp;
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
   </div>
   
    <!-- footer -->
    <%@include file="footer.jsp" %>
    <script src="https://kit.fontawesome.com/ad2be14d60.js" crossorigin="anonymous"></script>
</body>
</html>