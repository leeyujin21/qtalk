<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/hj-style.css" rel="stylesheet">
</head>

<body>
	<main class="test-schedule-main">
	
	<%@ include file="header.jsp"%>
	
		<section class="category-search-section">
			<!-- 카테고리 -->
			<div class="category-search-container">

				<div class="category">
					<div class="category-btn">
						<div class="category-title">카테고리</div>
					</div>

					<div class="category-box-container hidden">
						<div class="category-box">
							<div class="box-title">대분류</div>
							<ul>
								<li>전체</li>
							</ul>
						</div>
						<div class="category-box">
							<div class="box-title">중분류</div>
							<ul>
								<li>전체</li>
							</ul>
						</div>
						<div class="category-box">
							<div class="box-title">소분류</div>
							<ul>
								<li>전체</li>
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


				<!-- 검색창 -->
				<section class="search-section test-search ">
					<form action="#" method="post" class="search-form">
						<input type="search" name="search" class="input-search">
						<button class="search-btn">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</section>

			</div>
		</section>

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
					<tr>
						<td><i class="fas fa-bookmark"></i></td>
						<td>정보처리기사</td>
						<td>4회</td>
						<td>2023-01-01 <br> 2023-01-01
						</td>
						<td>2023-01-01 <br> 2023-01-01
						</td>
						<td>2023-01-01 <br> 2023-01-01
						</td>
						<td>2023-01-01 <br> 2023-01-01
						</td>
					</tr>
				</tbody>
			</table>
		</section>

	</main>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="js/category.js"></script>
	<script src="https://kit.fontawesome.com/ad2be14d60.js" crossorigin="anonymous"></script>
</body>

</html>