<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/onelineboard.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script type="text/javascript" src="js/onelineboard.js"></script>
</head>
<body>
	<%@ include file="header.jsp" %>
    <div class="board-title">
        <h1 style="margin-bottom:50px;">시험 한줄평</h1>
        
        <form action="onelineboardsearch" method="get" id="searchform">
   	    	<input type="hidden" id="page" value="1">
	        <div class="search" style="position: relative; margin-bottom: 20px;">
	            <select name="type" id="subjectse2">
	            	<option value="all">선택</option> 
	            	<c:forEach items="${res.subjectList}" var="sbj"> 
	           			 <!-- subject 데이터 가져오기 -->
	                	<option value="${sbj}" ${res.type eq '${sbj}'? 'selected':''}>#${sbj}</option> 
	                </c:forEach>
	               		<option value="기사이름1" ${res.type eq '기사이름1'? 'selected':''}>#기사이름1</option>
	               		<option value="기사이름2" ${res.type eq '기사이름2'? 'selected':''}>#기사이름2</option>
	               		<option value="기사이름3" ${res.type eq '기사이름3'? 'selected':''}>#기사이름3</option>
	               		<option value="기사이름4" ${res.type eq '기사이름4'? 'selected':''}>#기사이름4</option>
	            </select>
	            <input type="text" id="search" name="keyword" value="${res.keyword}" placeholder="게시글 검색하기">
	           <input type="submit" id="searchsubmit" class="search-btn"> <i class="fas fa-search" style="width:20px; position: absolute; right:25px; top:20%;"></i>
	        </div>
        </form>
    </div>

    
    <div class="container">
    	<%-- <c:if test="${member ne Empty}"> --%>
	    <form action="onelineboardpost" method="post">
	        <div class="write">
	            <div class="subsel">
	                <select name="subject" id="subjectsel" >
	                	<option value="none" disabled >선택</option>
	                    <option value="기사이름1">#정보처리기사(jmfldnm)</option> 
	                    <option value="기사이름2">#기사이름2</option> 
	                    <option value="기사이름3">#기사이름3</option> 
	                    <option value="기사이름4">#기사이름4</option> 
	                </select>
	            </div>
	            <div class="level">
	            	<!-- <input type="range" name="level"  max="5" min="1" step="1">  -->
	                <input type="radio" name="level" value="1" checked> 
	                <input type="radio" name="level" value="2">
	                <input type="radio" name="level" value="3">
	                <input type="radio" name="level" value="4">
	                <input type="radio" name="level" value="5">
	            </div>
	            <div class="text">
	                <input type="text" id="textbox" name="content" style="outline: none;"> 
	                <input type="submit" id="submit" value="등록">
	            </div>
	    	</div>
		</form>
		<%-- </c:if> --%>
       	<c:forEach items="${res.oneLineBoardList}" var="olb">
 	       <div class="post">
	            <div class="subject">#${olb.subject}</div>
            	<div class="title">${olb.content}</div>
            	<div class="level">${olb.level}</div>
            	<div class="time">${olb.writedate}</div>
            	<%-- <c:if test="${member.id == olb.writer}">
            		<div class="delete"><a href="boarddelete?num=${olb.num}&page=${res.pageInfo.curPage}"></a>삭제</div>
    	    	</c:if> --%>
    	    </div>
    	</c:forEach>
 		<div id="emptyArea">
    	<c:choose>
    		<c:when test="${res.pageInfo.curPage>1}">
    			<a href="onelineboardpost?page=${res.pageInfo.curPage-1}">&lt;</a>
    		</c:when>
    		<c:otherwise>
    			&lt;
    		</c:otherwise>
    	</c:choose>
    	&nbsp;&nbsp;
    	
    	<c:forEach begin="${res.pageInfo.startPage}" end="${res.pageInfo.endPage }" var="i">
    		<c:choose>
    			<c:when test="${res.pageInfo.curPage==i}">
   					<a href="onelineboardpost?page=${i}" class="select" onclick="callBtn(${i});return ${res.keyword==null};">${i}</a>&nbsp;
    			</c:when>
    			<c:otherwise>
   					<a href="onelineboardpost?page=${i}" class="btn" onclick="callBtn(${i});return ${res.keyword==null};">${i}</a>&nbsp;
    			</c:otherwise>
    		</c:choose>
    	</c:forEach>
    	
    	<c:choose>
    		<c:when test="${res.pageInfo.curPage < res.pageInfo.allPage}">
 				<a href="onelineboardpost?page=${res.pageInfo.curPage+1}">&gt;</a>
    		</c:when>
    		<c:otherwise>
    			&gt;
    		</c:otherwise>
    	</c:choose>
    	&nbsp;&nbsp;
    </div>
    </div>
    <script src="https://kit.fontawesome.com/ad2be14d60.js" crossorigin="anonymous"></script>
</body>
</html>