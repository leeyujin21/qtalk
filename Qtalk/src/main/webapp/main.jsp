<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/hj-style.css" rel="stylesheet">
</head>
<body>
	<%@ include file="header.jsp"%>
	<main class="main">
		<!-- 메인검색창(test-detail 의 검색창과도 같다)  -->
		<section class="search-section">
			<form action="#" method="post" class="search-form">
				<input type="search" name="search" class="input-search">
				<button class="search-btn">
					<i class="fas fa-search"></i>
				</button>
			</form>
		</section>

		<section class="info-section">

			<div class="info-box-container">
				<!-- 임박한 시험 보는 곳 -->
				<div class="main-info-box">
					<div class="main-info-title">정보 처리 기사</div>
					<div class="main-info-context">필기 시험 접수 기간</div>
					<div class="main-info-context text-2rem">2023/ 01/ 01 ~
						2023/01 /01</div>
					<div class="main-info-context bottom5">
						<a href="https://www.q-net.or.kr/man004.do?id=manSubMain">신청
							하러 가기 <i class="fas fa-home"></i>
						</a>
					</div>
				</div>


				<!-- 인기있는 시험 보는 곳 (슬라이드 박스)-->
				<div class="slider-container main-info-box">
					<div class="slides">
						<div class="slide">
							<div class="main-info-title">정보 처리 기사</div>
							<div class="main-info-context">필기 평균 합격률</div>
							<div class="main-info-context text-3rem">40%</div>
							<div class="main-info-context">
								<p>
									이용자 체감 난이도<br> <span> <i class="fas fa-pen"></i> <i
										class="fas fa-pen"></i> <i class="fas fa-pen"></i> <i
										class="fas fa-pen"></i> <i class="fas fa-pen"></i>
									</span>
								</p>
							</div>
						</div>
						
						<div class="slide">
							<div class="main-info-title">정보 처리 기사</div>
							<div class="main-info-context">필기 평균 합격률</div>
							<div class="main-info-context text-3rem">40%</div>
							<div class="main-info-context">
								<p>
									이용자 체감 난이도<br> <span> <i class="fas fa-pen"></i> <i
										class="fas fa-pen"></i> <i class="fas fa-pen"></i> <i
										class="fas fa-pen"></i> <i class="fas fa-pen"></i>
									</span>
								</p>
							</div>
						</div>
						
						<div class="slide">
							<div class="main-info-title">정보 처리 기사</div>
							<div class="main-info-context">필기 평균 합격률</div>
							<div class="main-info-context text-3rem">40%</div>
							<div class="main-info-context">
								<p>
									이용자 체감 난이도<br> <span> <i class="fas fa-pen"></i> <i
										class="fas fa-pen"></i> <i class="fas fa-pen"></i> <i
										class="fas fa-pen"></i> <i class="fas fa-pen"></i>
									</span>
								</p>
							</div>
						</div>
					</div>
					
				</div>

				<button id="prevSlide">
					<i class="fas fa-chevron-left icon-left"></i>
				</button>
				<button id="nextSlide">
					<i class="fas fa-chevron-right icon-right"></i>
				</button>
			</div>
		</section>


	</main>

	<footer class="footer"> </footer>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="js/mainSlider.js"></script>
	<script src="https://kit.fontawesome.com/ad2be14d60.js"	crossorigin="anonymous"></script>

</body>
</html>