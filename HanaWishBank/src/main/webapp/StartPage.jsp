<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>웹 페이지</title>
<style>
body {
	background-image: linear-gradient(to bottom, #E0F8FF, #E0F8FF);
}

.navbar {
	position: relative;
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: space-between;
}

.navbar>.container-fluid {
	padding-top: 25px;
	padding-bottom: 25px;
}

.navbar-brand {
	margin-left: 4rem;
}

.navbar-nav {
	margin-left: 16%;
}

.navbar-nav .nav-item {
	margin-left: 2rem;
}

.navbar-nav .nav-link {
	color: #605757;
	font-size: 15px;
	font-weight: bold;
}

.logo-img {
	max-width: 400px; /* 로고 이미지 크기 조절 */
	max-height: 400px; /* 로고 이미지 크기 조절 */
} /* 반응형 스타일 */
@media ( max-width : 768px) {
	.navbar-nav {
		margin-left: 0;
	}
	.navbar-brand {
		margin-left: 1rem;
	}
	.navbar-nav .nav-item {
		margin-left: 0.5rem;
	}
}

.mainExplain {
	display: flex;
	justify-content: center; /* Horizontally center the image */
	align-items: center; /* Vertically center the image (optional) */
	max-width: 100%; /* Optional: adjust the max-width as needed */
	margin: 30px auto;
}

.mainExplain {
	animation: scaleInOut 0.5s ease-in-out 2;
}

/* @keyframes scaleInOut {
  0%, 100% {
    transform: scale(1);
  }

  50% {
    transform: scale(1.2);
  }
} */
.mainHello1 {
	justify-content: center;
	color: #136C62;
	font-size: 32px;
	font-weight: 700;
	display: flex;
	font-family: sans-serif;
	text-shadow: 2px 2px 4px rgba(19, 108, 98, 0.1);
}

.mainHello2 {
	margin-top: 3%;
	justify-content: center;
	color: #403F3F;
	font-size: 28px;
	font-weight: 600;
	display: flex;
	font-family: sans-serif;
}

.image-container {
	display: flex;
	justify-content: center; /* 이미지를 수평으로 가운데 정렬합니다. */
	align-items: center; /* 이미지를 수직으로 가운데 정렬합니다. */
	margin: auto 0;
	align-items: center;
}
/* 이미지에 마우스를 올렸을 때 애니메이션 효과 적용 */
.image-container div:hover {
	transform: translateY(-20px); /* 이미지를 위로 20px 이동시킴 */
	transition: transform 0.3s ease; /* 애니메이션을 0.3초 동안 부드럽게 적용 */
}

.image-container div {
	display: flex;
	justify-content: center;
	margin: 40px auto 0;
	align-items: center;
	animation: bounce 1s infinite; /* bounce 애니메이션을 1초 동안 무한 반복 */
}

.mainExpansePattern, .mainChallenge {
	display: inline-block;
}
/* 미디어 쿼리를 이용해 화면 크기에 따라 이미지들을 재배치 */
@media ( max-width : 768px) {
	.mainExpansePattern, .mainChallenge {
		display: block;
	}
}

.mainButton {
	display: flex;
	align-items: center;
	justify-content: flex-end;
	margin-right: 50px;
	margin-top: 20px;
	margin-bottom: 96px;
	transition: transform 0.3s ease;
}

.mainButton:hover {
	animation: shake 0.3s ease;
}
/* 
@keyframes shake {
    0%, 100% {
        transform: translate(0); 
    }
    25% {
        transform: translateX(-20px); 
    }
    75% {
        transform: translateX(20px); }
} */
/* 기본 스타일 */
.BankFooter {
	padding: 30px 0;
}

.BankFooterContent {
	max-width: 1200px;
	margin: 0 auto;
	text-align: center;
}

.FooterRow {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.FooterLinks {
	list-style: none;
	padding: 0;
	display: flex;
}

.FooterLinks li {
	margin-right: 20px;
}

.FooterLinks li:last-child {
	margin-right: 0;
}

.FooterLinks a {
	color: #136c62;
	text-decoration: none;
	font-size: 14px;
	transition: color 0.2s ease-in-out;
}

.FooterLinks a:hover {
	color: #0f4c48;
}

/* 연락처 섹션 스타일 */
.ContactItem {
	display: flex;
	align-items: center;
}

.ContactTitle {
	font-size: 16px;
	font-weight: bold;
	margin-right: 10px;
}

.ContactNumbers {
	display: flex;
	align-items: center;
}

.ContactNumber {
	font-size: 16px;
	font-weight: bold;
}

.Strong15881111, .Strong15991111 {
	margin: 0 5px;
}

.ContactSeparator {
	margin: 0 10px;
}

/* 푸터 설명 스타일 */
.FooterDescription {
	font-size: 14px;
	color: #888;
	margin-top: 20px;
	font-weight: bold;
}
</style>

<!-- 부트스트랩 연결 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
</head>
<body>
	<div class="header">
		<!-- 메뉴바 내용 -->
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<c:url var="logoUrl" value="/logo.png" />
				<a class="navbar-brand" href="mainHana.jsp"> <img
					src="${logoUrl}" alt="로고" class="logo-img">
				</a>

				<!-- 	<div class="collapse navbar-collapse ml-auto"
					id="navbarSupportedContent1">
					첫 번째 메뉴 내용
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">나의 소비패턴</a></li>
						<li class="nav-item"><a class="nav-link" href="#">나의
								위시리스트</a></li>
						<li class="nav-item"><a class="nav-link" href="#">나의
								구매계획리스트</a></li>
						<li class="nav-item"><a class="nav-link" href="#">나의 챌린지
								계좌</a></li>
					</ul>
				</div>

				<div class="collapse navbar-collapse" id="navbarSupportedContent2">
					두 번째 메뉴 내용
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
					</ul>
				</div>
 -->
			</div>
		</nav>
	</div>
	<!-- <div class="mainHello1">위시리스트를 향해 한 걸음씩!</div>
	<div class="mainHello2">단기 챌린지 적금으로 지갑과 소원을 동시에 이루는 똑똑한 소비를
		경험해보세요</div> -->
	<div class="mainExplain">
		<img src="<c:url value='/mainExplain.png' />" alt="Main Explain"
			width="800">
	</div>


	<div class="image-container">
		<div class="mainWishList">
			<img src="<c:url value='/mainWishList.svg' />" alt="Main Wish List"
				width="300">
		</div>

		<div class="mainExpansePattern">
			<img src="<c:url value='/mainExpansePattern.svg' />"
				alt="Main Expanse Pattern" width="300">
		</div>
		<div class="mainChallenge">
			<img src="<c:url value='/mainChallenge.svg' />" alt="Main Challenge"
				width="300">
		</div>
		<div class="mainPerson">
			<img src="<c:url value='/mainPerson.svg' />" alt="Main Person"
				width="350">
		</div>
	</div>

	<c:url var="mainButton" value="/mainButton.svg" />
	<a class="mainButton" href="main.jsp"> <img src="${mainButton}"
		alt="버튼" class="mainButton">
	</a>



	<!-- 푸터 추가 -->
	<!-- <footer class="bg-dark text-light text-center py-3"> © 2023
		Your Website. All rights reserved. </footer> -->

	<footer class="BankFooter">
		<div class="BankFooterContent">
			<div class="FooterRow">
				<ul class="FooterLinks">
					<li><a href="#">이용약관</a></li>
					<li><a href="#">개인정보처리방침</a></li>
					<li><a href="#">보안정책</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
				<div class="ContactItem">
					<div class="ContactTitle">고객센터</div>
					<div class="ContactNumbers">
						<span class="ContactNumber Strong15881111">1588-1111</span> <span
							class="ContactSeparator">/</span> <span
							class="ContactNumber Strong15991111">1599-1111</span>
					</div>
				</div>
			</div>
			<p class="FooterDescription">© 2023 HANA WISH BANK. All rights
				reserved.</p>
		</div>
	</footer>

	<!-- 부트스트랩 JavaScript 연결 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
