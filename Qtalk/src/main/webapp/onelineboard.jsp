<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@font-face {
            font-family: 'Pretendard-Regular'; 
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff'); 
            font-weight: 400; 
            font-style: normal; 
        }
        *{
            font-family: 'Pretendard-Regular';
        }
        .header{
            height: 100px;
        }
        .board-title{
            font-weight: bold;
            text-align: center;
            padding: 10px;
            width: 60%;
            margin: 10px auto;
        }
        .search{ 
            margin-left: 10px;
            margin-right: 10px;
            border: 1px ;
            border-radius: 10px;
            background-color: #D6E6FF;
            color : rgb(116, 111, 111);
            font-family: 'Pretendard-Regular';
            padding: 10px 0 10px 0;
        }
        #search{
            height: 30px;
            width:80%;
            min-width: 60%;
            margin: 0px;
            border: 1px ;
            border-radius: 10px;
            color : rgb(116, 111, 111);
            background-color: rgba(0,0,0,0);
            outline: none;
        }
        #subjectse2{
            max-width: fit-content;
            margin-left: 0px;
            outline: none;
            background-color: transparent;
            border: 2px ; 
            border-radius: 10px;
            border-color: #1D2C62;
            text-align: center;
            color: #3B5998;
            font-size: 16px;
            font-weight: 600;

        }
        .container{
            padding: 10px;
            margin: 20px;
            border: 1px solid;
            border-color: #e4e4e4;
            width: 60%;
            margin: 10px auto; 
        }
        .line{
            padding: 10px;
            padding-right: 20px;
            text-align: right;
            border-bottom: 3px solid rgb(213, 223, 250);
            color : rgb(179, 177, 177);
            font-weight: bold;
        }


        .write{
            overflow-anchor: auto;
            margin: 10px;
            padding: 20px;
            border: 1px ;
            background-color: #e0e5ff;
            border-radius: 10px;
            max-height: 70PX;
            display: grid;
            grid-template-columns: auto;
            gap: 10px;
            margin-bottom: 20px;
        }
        .subsel{
            width: 100%;
            margin: auto;
        }
        #subjectsel{
            margin-left: 6px;
            max-width: fit-content;
            height: 130%;
            outline: none;
            background-color: transparent;
            border: 2px ; 
            border-radius: 10px;
            border-color: #1D2C62;
            text-align: left;
            color: #3B5998;
            font-size: 16px;
            font-weight: 600;
            font-family: 'Pretendard-Regular'; 
        }

        .level{
            position: absolute;
            right: 23%;
        }
        .text{
            display: flex;
            width: 100%;
            border: 2px solid;
            border-color: #749BD6;
            border-radius: 10px;
        }
        #textbox{
            height: 30px;   
            margin-left: 0px ;
            width: 90%;
            background-color: transparent;
            border: transparent;
            font-size: 16px;
            font-weight: 600;
            border:none;
        }
        #submit{
            width: 10%;
            min-width: 10%;
            margin: 0px;
            position: relative;
            background-color: #749BD6;
            color: white;
            border-radius: 10px;
            border-color: #d8d7fd;
            padding: 0;
            font-size: 16px;
            font-weight: 600;
        }

        .post{
            overflow-anchor: auto;
            margin: 10px;
            padding: 30px;
            display: flex;
            max-height: 50PX;
            border-bottom: 1px solid lightgray;
        }

        .subject{
            margin-left: 10px;
            margin-right: 5px;
            width : 15%;
            color: #3B5998;
            font-weight: bold;
            overflow: hidden;
            
            font-size: 16px;
            font-weight: 600;
            font-family: 'Pretendard-Regular'; 
        }
        .title{
            max-width: 60%;
            color : rgb(116, 111, 111);
            font-size: 16px;
            font-weight: 600;
            font-family: 'Pretendard-Regular'; 
        }
        .time{
            position: absolute;
            right: 23%;
            float: right;
            color:  rgb(116, 111, 111);
            font-size: 16px;
            font-weight: 400;
            font-family: 'Pretendard-Regular'; 
        }</style>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script>
   		function callBtn(num) {
   			console.log($("#keyword").val())
   			let keyword = $("#keyword").val();
   			if(keyword!=null && keyword.trim()!='') {
   				$('#page').val(num);
   				$('#searchform').submit();
   			}
   		}
   </script>
</head>
<body>
	<%@ include file="header.jsp" %>
    <div class="board-title">
        <h1 style="margin-bottom:50px;">시험 한줄평</h1>
        
        <form action="onelineboardsearch" method="get">
	        <div class="search" style="position: relative; margin-bottom: 20px;">
	            <select name="type" id="subjectse2">
	            	<option value="all">선택</option> 
	            	<c:forEach items="${res.subjectList}" var="sbj"> 
	           			 <!-- subject 데이터 가져오기 -->
	                	<option value="${sbj}" ${res.type eq '${sbj}'? 'selected':''}>#${sbj}</option> 
	                </c:forEach>
	            </select>
	            <input type="text" id="search" name="keyword" placeholder="게시글 검색하기">
	            <i class="fas fa-search" style="width:20px; position: absolute; right:25px; top:20%;"><input type="submit" id="searchsubmit" class="search-btn"></input></i>
	        </div>
        </form>
    </div>

    
    <div class="container">
    	<%-- <c:if test="${member ne Empty}"> --%>
	    <form action="onelineboardpost" method="post">
	    	<%-- <input type="hidden" name="writer" value="${member.id}"> --%>
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
       	<c:forEach items="${res.OneLIneBoardList}" var="olb">
 	       <div class="post">
	            <div class="subject">#${olb.subject}</div>
            	<div class="title">${olb.content}</div>
            	<div class="level">${olb.level}</div>
            	<div class="time">${olb.date}</div>
            	<%-- <c:if test="${member.id == olb.writer}">
            		<div class="delete"><a href="boarddelete?num=${olb.num}&page=${res.pageInfo.curPage}"></a>삭제</div>
    	    	</c:if> --%>
    	    </div>
    	</c:forEach>
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