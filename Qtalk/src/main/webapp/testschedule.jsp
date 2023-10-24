<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="js/category.js"></script>
	<script src="js/testschedule.js"></script>
	<script src="https://kit.fontawesome.com/ad2be14d60.js"crossorigin="anonymous"></script>

	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	 
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<link 
		 href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
         rel="stylesheet"
         integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
         crossorigin="anonymous"/>	
<style>
 .on{
font-size: 1.2rem; 
 color: #3B5998;
}
</style>   
         
<title>Qtalk | 시험일정보기</title>
</head>

<body>
	<%@ include file="header.jsp"%>
	<main class="test-schedule-main">

		<!-- 인클루드한 다른 파일 -->
		<%@ include file="categorylist.jsp"%>


		<section class="test-list-section">
			<div class="test-list-header">
				<div class="test-list-title">자격증 시험 보기</div>
				<select class="test-list-select">
					<!-- 인기순 & 임박순  -->
					<option value="" class="test-list-option">인기순</option>
					<option value="" class="test-list-option">임박순</option>
				</select>
			</div>
			<table class="schedule-table">
				<thead>
					<tr>
						<th>북마크</th>
						<th>자격증이름</th>
						<th>구분</th>
						<th>필기원서접수</th>
						<th>필기응시날짜</th>
						<th>실기원서접수</th>
						<th>실기 응시날짜</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${examScheduleList}"  var="examSchedule">
					<tr>
						<td>
							<c:choose>
                                    <c:when test="${empty member}">
                                        <button style="background-color: transparent;">
                                            <i class="fas fa-bookmark" id="bookMarkIcon2"></i>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <form class="bookmark-form" data-id="${member.id}" data-num="${examSchedule.num}">
                                            <button type="button" style="background-color: transparent;">
                                                <i class="fas fa-bookmark" id="bookMarkIcon"></i>
                                            </button>
                                        </form>
                                    </c:otherwise>
                                </c:choose>
						</td>
						
						<!-- 종목명 -->
						<td value="${examSchedule.jmfldnm}">
						<a href="testdetail?num=${examSchedule.num}">${examSchedule.jmfldnm}</a>
						</td>
						<!-- 회차 -->
						<td value="${examSchedule.implplannm}">${examSchedule.implplannm}</td>
						<td>
						<!-- 필기 시험 접수 시작일자 -->
						<span value="${examSchedule.docregstartdt}">${examSchedule.docregstartdt} </span><br>
						<!-- 필기 시험 접수 끝일자 -->
						<span  value="${examSchedule.docregenddt}">${examSchedule.docregenddt}</span>
						</td>
						<td>
						<!-- 필기 시험 일자 -->
						<span value="${examSchedule.docexamstartdt}">${examSchedule.docexamstartdt} </span><br> 
						<!-- 필기 시험 끝 일자-->
						<span  value="${examSchedule.docexamenddt}">${examSchedule.docexamenddt}</span>
						</td>
						<td>
						<!-- 실기 시험 접수 시작일자  -->
						<span value="${examSchedule.pracregstartdt}">${examSchedule.pracregstartdt} </span><br> 
						<!-- 실기 시험 접수 마감 시작일자  -->
						<span  value="${examSchedule.pracregenddt}">${examSchedule.pracregenddt}</span>
						</td>
						<td>
						<!-- 실기 시험 접수 시작일자  -->
						<span value="${examSchedule.pracexamstartdt}">${examSchedule.pracexamstartdt} </span><br> 
						<!-- 실기 시험 접수 마감 시작일자  -->
						<span value="${examSchedule.pracexamenddt}">${examSchedule.pracexamenddt}</span>
						</td>
					</tr>

					</c:forEach>
				</tbody>
			</table>
		</section>

	</main>
		

</body>

</html>