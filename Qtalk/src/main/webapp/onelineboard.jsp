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
	<title>Qtalk | 한줄게시판</title>
</head>


<body>
	<%@ include file="header.jsp" %>
	<div class="board-container">
    <div class="board-title">
        <h1 style="margin-bottom:50px;">시험 한줄평</h1>
        
        <form action="onelineboardsearch" method="get" id="searchform">
   	    	<input type="hidden" id="page" value="1">
	        <div class="search" style="position: relative; margin-bottom: 20px;">
	            <select name="type" id="subjectse2">
	            	<option value="all">선택</option> 
	            	<c:forEach items="${examInfoList}" var="examInfo"> 
	           			 <!-- subject 데이터 가져오기 -->
	                	<option value="${examInfo.jmfldnm}" ${res.type eq '${examInfo.jmfldnm}'? 'selected':''}>#${examInfo.jmfldnm}</option> 
	                </c:forEach>
	            </select>
	            <input type="text" id="search" name="keyword" value="${res.keyword}" placeholder="게시글 검색하기">
	           	<button class="search-btn"><i class="fas fa-search" style="width:20px; position: absolute; right:25px; top:20%;"></i></button>
	        </div>
        </form>
    </div>

    
    <div class="container">
    	<c:if test="${member != null}">
		    <form action="onelineboardpost" method="post" id="onelineboardpost">
		        <div class="write">
		            <div class="sibal">
		            <div class="subsel">
		                <select name="subject" id="subjectsel" >
			                <option id="subjectsel" value="none">선택</option>
		                	<c:forEach items="${examInfoList}" var="examInfo"> 
		           				 <!-- subject 데이터 가져오기 -->
		                		<option value="${examInfo.jmfldnm}">#${examInfo.jmfldnm}</option> 
		               		 </c:forEach>
		                </select>
		            </div>
		            <div class="checkbox-container">
					   	<input type="checkbox" id="checkbox1" class="hidden-checkbox" name="level1" value="1">
					    <label for="checkbox1" class="custom-checkbox">
					        <i class="fas fa-pen"></i>
					    </label>
					
					    <input type="checkbox" id="checkbox2" class="hidden-checkbox" name="level2" value="2">
					    <label for="checkbox2" class="custom-checkbox">
					        <i class="fas fa-pen"></i>
					    </label>
					
					    <input type="checkbox" id="checkbox3" class="hidden-checkbox" name="level3" value="3">
					    <label for="checkbox3" class="custom-checkbox">
					        <i class="fas fa-pen"></i>
					    </label>
					
					    <input type="checkbox" id="checkbox4" class="hidden-checkbox" name="level4" value="4">
					    <label for="checkbox4" class="custom-checkbox">
					        <i class="fas fa-pen"></i>
					    </label>
					
					    <input type="checkbox" id="checkbox5" class="hidden-checkbox" name="level5" value="5">
					    <label for="checkbox5" class="custom-checkbox">
					        <i class="fas fa-pen"></i>
					    </label>
					    <input type="hidden" id="levelField" name="level" value="">
					</div>
		            </div>
	
		            <div class="text">
		                <input type="text" id="textbox" name="content" style="outline: none;"> 
		                <input type="submit" id="submit" value="등록" style="cursor: pointer;">
		            </div>
		    	</div>
			</form>
		</c:if>
		<c:forEach items="${res.oneLineBoardList}" var="onelineboard">
			<div class="post">
			    <div class="subject">#${onelineboard.subject}</div>
		        <div class="title">${onelineboard.content}</div>
		        <div class="level">난이도: ${onelineboard.level}</div>
		        <div class="time">${onelineboard.writedate}</div>
		   		<c:if test="${onelineboard.writer == member.id}">
		       		<div class="delete">
		       			<a href="onelineboarddelete?num=${onelineboard.num}">삭제</a>
		           	</div>
		       	</c:if>
		   	</div>
		</c:forEach>		
       	
    </div>
    <!-- 페이지 수 표시 시작 -->
   <div id="emptyArea">
      <c:choose>
         <c:when test="${res.pageInfo.curPage>1}">
            <a href="onelineobardpost?page=${res.pageInfo.curPage-1}">&lt;</a>
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
               <a href="onelineboardpost?page=${i}" class="select" style="font-family: 'Pretendard-Regular';" onclick="callBtn(${i}); return ${res.keyword==null};">${i}</a>&nbsp;
            </c:when>
            <c:otherwise>
               <a href="onelineboardpost?page=${i}" class="btn" style="font-family: 'Pretendard-Regular';" onclick="callBtn(${i}); return ${res.keyword==null};">${i}</a>&nbsp;
            </c:otherwise>
         </c:choose>
      </c:forEach>

      <c:choose>
         <c:when test="${res.pageInfo.curPage<res.pageInfo.allPage}">
            <a href="onelineboardpost?page=${res.pageInfo.curPage+1}">&gt;</a>
         </c:when>
         <c:otherwise>
         	&gt;
         </c:otherwise>
      </c:choose>
      &nbsp;&nbsp;
   </div>
    <!-- footer -->
    <%@include file="footer.jsp" %>
   <!-- 페이지 수 표시 끝 -->
   </div>
    <script src="https://kit.fontawesome.com/ad2be14d60.js" crossorigin="anonymous"></script>
</body>
<script>
const levelField = document.getElementById('levelField');
const checkboxes = document.querySelectorAll('.hidden-checkbox');
const form = document.querySelector('#onelineboardpost');
const subjectsel = document.querySelector('#subjectsel');
const textbox = document.getElementById("textbox");

checkboxes.forEach(checkbox => {
	// console.log(checkbox)
    checkbox.addEventListener('change', function() {
		/* console.log(checkbox) */
        const level = parseInt(checkbox.value);
		console.log('1 : '+level) // 1,2,3,4,5

        checkboxes.forEach(cb => {
            const cbLevel = parseInt(cb.value);
            console.log('2 : '+cbLevel);
            
            // 선택한 버튼의 value 이하인 버튼들만 선택하고 나머지는 해제
            if (cbLevel <= level) {
                cb.checked = true;
                cb.nextElementSibling.querySelector('i').style.color = '#3B5998';
            } else {
                cb.checked = false;
                cb.nextElementSibling.querySelector('i').style.color = 'rgb(116, 111, 111)';
            }

    		levelField.value = level;
        });
    });
});

form.addEventListener('submit', function(event) {
    // 체크된 체크박스가 있는지 여부를 나타내는 변수
	let isChecked = false;
	let isSubjectChecked = false;
	let isContent = false;
	
	if(isChecked == false) {
		 checkboxes.forEach(checkbox => {
			 console.log(checkbox)
		     if (checkbox.checked) {
		         isChecked = true;
		     }
		 });
	}
	
	//난이도를 체크하지 않았을때
    if (!isChecked) {
        event.preventDefault(); // 폼 제출을 막음
        alert("난이도를 선택해주세요");
    }
  	//시험명을 체크하지 않았을때
	if(subjectsel.value == 'none'){
		event.preventDefault(); // 폼 제출을 막음
        alert("시험명을 선택해주세요");
	}
	//내용을 입력하지 않았을때
    if (textbox.value.trim() === '') { // 수정된 부분
        event.preventDefault(); // 폼 제출을 막음
        alert("내용을 입력해주세요");
    }
});
</script>
</html>