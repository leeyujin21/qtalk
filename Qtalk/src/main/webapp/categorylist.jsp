<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<section class="category-search-section">
	<!-- 카테고리 -->
	<div class="category-search-container">
		<!-- <form action="categorylist" method="get"> -->
			<div class="category">
				<div class="category-btn">
					<div class="category-title">카테고리</div>
				</div>

				<div class="category-box-container hidden">

					<div class="category-box">
						<div class="box-title">대분류</div>
						<ul class="categorys" id="firstcategory">
							<c:if test="${firstCategoryList == null}">
								<li>내용이 없습니다</li>
							</c:if>
							<c:if test="${firstCategoryList != null}">
								<li data-value="${firstCategoryList}">전체</li>
							</c:if>

							<c:forEach items="${firstCategoryList}" var="firstCategoryList">
								<li data-value="${firstCategoryList.mdobligfldnm}">${firstCategoryList.mdobligfldnm}</li>
							</c:forEach>
						</ul>
					</div>

					<div class="category-box">
						<div class="box-title">중분류</div>
						<ul class="categorys" id="secondcategory">
							<c:if test="${firstCategoryList != null}">
								<li data-value="${firstCategoryList}">전체</li>
							</c:if>
						</ul>
					</div>

					<div class="category-box">
						<div class="box-title">소분류</div>
						<ul class="categorys" id="thirdcategory">

						</ul>
					</div>
					<div class="category-footer">
						<i class="fas fa-times close-btn"></i>
						<div style="display: flex; align-items: center;">
							<i class="fas fa-redo-alt" style="margin-right: 5px;"></i>
							<form action = "categorylistselect" method="get">
								<input class="selectedSubject" type="text" name="thirdValue" id="thirdValue" readonly>
								<button class="submit-btn" id="category-submit-btn">적용</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		<!-- </form> -->


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