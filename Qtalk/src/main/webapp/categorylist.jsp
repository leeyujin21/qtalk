<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<section class="category-search-section">
	<!-- 카테고리 -->
	<div class="category-search-container">
		<form action="categorylist" method="get">
			<div class="category">
				<div class="category-btn">
					<div class="category-title">카테고리</div>
				</div>

				<div class="category-box-container hidden">
				
					<div class="category-box">
						<div class="box-title">대분류</div>
						<ul class="categorys">
							<c:if test="${examInfoList == null}">
								<li>내용이 없습니다</li>
							</c:if>
							<c:if test="${examInfoList != null}">
								<li>전체</li>
							</c:if>

							<c:forEach items="${examInfoList}" var="categoryList">
								<li value="${categoryList.mdobligfldnm}">${categoryList.mdobligfldnm}</li>
							</c:forEach>

						</ul>
					</div>
					
					<div class="category-box">
						<div class="box-title">중분류</div>
						<ul class="categorys">
							<c:forEach items="${examInfoList}" var="categoryList">
								<li value="${categoryList.obligfldnm}">${categoryList.obligfldnm}</li>
							</c:forEach>
						</ul>
					</div>
					
					<div class="category-box">
						<div class="box-title">소분류</div>
						
						<ul class="categorys">
							<c:forEach items="${examInfoList}" var="categoryList">
								<li value="${categoryList.jmfldnm}">${categoryList.jmfldnm}</li>
							</c:forEach>
						</ul>
						
					</div>
					
					<div class="category-footer">
						<i class="fas fa-times close-btn"></i>
						<div>
							<i class="fas fa-redo-alt"></i>
							<button class="submit-btn">적용</button>
						</div>

					</div>
				</div>

			</div>
		</form>


		<!-- 검색창 -->
		<section class="search-section test-search ">
			<form action="testschedulesearch" method="get" class="search-form">
				<input type="search" name="search" class="input-search">
				<button class="search-btn">
					<i class="fas fa-search"></i>
				</button>
			</form>
		</section>


	</div>
</section>