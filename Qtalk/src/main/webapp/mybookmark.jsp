<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
		<header class="boardheader">
			<h2>북마크</h2>
		</header>
		
		<div class="boardList">
			<c:choose>
				<c:when test="${not empty examScheduleList}">
						<div class="post">
							<table class="schedule-table">
				<thead>
					<tr>
						<th>북마크</th>
						<th>자격증이름</th>
						<th>구분</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${examScheduleList}"  var="examSchedule">
							<tr>
								<td><c:forEach items="${bookMarkList}" var="books">
										<input type="hidden" name="bookmarks" value="${books.num}">
									</c:forEach>
									<form action="bookmarkedit" method="post">
										<input type="hidden" name="id" value="${member.id}"> <input
											type="hidden" name="num" value="${examSchedule.num}">
										<button style="background-color: transparent;">
											<i class="fas fa-bookmark off" id="bookMarkIcon"></i>
										</button>
									</form></td>

								<!-- 종목명 -->
								<td value="${examSchedule.jmfldnm}"><a
									href="testdetail?num=${examSchedule.num}">${examSchedule.jmfldnm}</a>
								</td>
								<!-- 회차 -->
								<td value="${examSchedule.implplannm}">${examSchedule.implplannm}</td>
								<td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
		</section>
				</c:when>
				<c:otherwise>
					<p>
						북마크한 시험이 없습니다.<br><br>
						<a href="testschedule">시험 보러 가기</a>
					</p>
				</c:otherwise>
			</c:choose>
		</div> <!-- boardList  -->
