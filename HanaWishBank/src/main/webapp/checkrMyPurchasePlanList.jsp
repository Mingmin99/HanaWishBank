<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>웹 페이지</title>
<style>
body {
	background-color: white;
}

.navbar {
	position: relative;
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	background-color: white;
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
	margin-left: 15%;
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
	max-width: 160px; /* 로고 이미지 크기 조절 */
	max-height: 160px; /* 로고 이미지 크기 조절 */
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

.navbar-divider {
	border-top: 2px solid #009591;
	margin-top: 0;
	margin-bottom: 0;
	width: 100%;
}
/* 사이드 바 ------------------------------------------------------------------------------------------------------- */
.sidebar {
	margin-top: 3%;
	margin-left: 5%;
	width: 200px;
	position: absolute;
	/* 	border-right: 1px solid #ccc; */
}

.sidebar h4 {
	color: #009591;
	margin-bottom: 20px;
	position: relative;
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
}

.sidebar h4::before {
	content: "";
	position: absolute;
	bottom: -5px;
	left: 0;
	width: 100%;
	height: 3px; /* 굵기 변경 */
	background-color: #009591; /* 구분선 색상 */
}

.sidebar ul {
	list-style: none;
	padding: 0;
}

.sidebar ul li {
	margin-bottom: 10px;
	position: relative;
}

.sidebar ul li a {
	color: #333;
	text-decoration: none;
	display: block;
	padding: 5px 10px; /* 글자 주변의 패딩 추가 */
}

.sidebar ul li::before {
	content: "";
	position: absolute;
	width: 100%;
	height: 1px;
	background-color: #ccc; /* 밑줄 색상 */
}

.sidebar ul li:last-child::before {
	display: block; /* 마지막 항목의 밑줄 제거 */
}

.sidebar ul li a:hover {
	background-color: #009591;
	color: white;
}
/* 메인 ------------------------------------------------------------------------------------------------------- */
main {
	margin-top: 3%;
	margin-left: 25%;
	margin-bottom: 10%;
}

.title {
	font-size: 32px;
	font-weight: 600;
	font-family: 'Helvetica', sans-serif;
	color: #4F4F4F;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}

.description-box {
	margin-top: 20px;
	padding: 4px; /* 텍스트 내용과 테두리 사이의 간격 */
	border-radius: 20px;
	max-width: 800px;
}

.description-text1 {
	padding: 10px;
	font-size: 16px;
	font-weight: 500;
	font-family: 'Helvetica', sans-serif;
	color: #5A5A5A;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}

.description-text2 {
	padding: 10px;
	font-size: 16px;
	font-weight: 500;
	font-family: 'Helvetica', sans-serif;
	color: #5A5A5A;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
	/* 	display: flex;
	justify-content: center; */
}

.purchasePlanListTitle {
	margin-top: 48px;
	font-size: 24px;
	font-weight: 500;
	font-family: 'Helvetica', sans-serif;
	color: #4F4F4F;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}
/* 위시리스트 조회------------------------------------------------------------------------------------------------------- */
.card {
	margin-bottom: 1rem;
	margin-top: 2rem;
	width: 18rem;
	border: none;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
	width: 18rem;
}

.card:hover {
	transform: scale(1.02);
}

.card-header {
	background-color: #9CC5C0 !important;
	color: #5A5A5A;
	font-weight: bold;
	padding: 2rem;
	display: flex;
	align-items: center;
	justify-content: space-between;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.card-header input[type="checkbox"] {
	margin-right: 0.5rem;
}

.list-group-item {
	font-size: 1rem;
	border: none;
	padding: 1rem !important;
	background-color: #F7F7F7;
}

.ButtonContainer {
	margin-top: 3rem;
	margin-left: 2rem !important;
	margin-right: 10rem !important;
	display: flex;
	justify-content: center;
	align-items: center;
}

.backButton {
	margin-left: 2rem;
}

.registerPurchasePlanListButton {
	margin-left: 2rem;
}

/* 푸터 ------------------------------------------------------------------------------------------------------- */
.BankFooter {
	padding: 30px 0;
	background-color: #ffffff;
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
				<a class="navbar-brand" href="main.jsp"> <img src="${logoUrl}"
					alt="로고" class="logo-img">
				</a>

				<div class="collapse navbar-collapse ml-auto"
					id="navbarSupportedContent1">
					<!-- 첫 번째 메뉴 내용 -->
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="myExpansePattern.jsp">나의 소비패턴</a></li>
						<li class="nav-item"><a class="nav-link"
							href="checkMyWishList.jsp">나의 위시리스트</a></li>
						<li class="nav-item"><a class="nav-link"
							href="checkrMyPurchasePlanList.jsp">나의 구매계획리스트</a></li>
						<li class="nav-item"><a class="nav-link" href="#">나의 챌린지
								계좌</a></li>
					</ul>
				</div>

				<div class="collapse navbar-collapse" id="navbarSupportedContent2">
					<!-- 두 번째 메뉴 내용 -->
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
					</ul>
				</div>

			</div>
		</nav>
	</div>
	<hr class="navbar-divider">

	<!-- 사이드바  ------------------------------------------------------------------------------------------------------- -->
	<div class="sidebar">
		<h4>나의 구매계획리스트</h4>
		<ul>
			<li><a href="checkrMyPurchasePlanList.jsp">나의 구매계획리스트 조회</a></li>
			<li><a href="registerMyPurchasePlanList.jsp">나의 구매계획리스트 등록</a></li>
			<!-- <li><a href="#">대출신청</a></li>
			<li><a href="#">카드신청</a></li>
			<li><a href="#">고객센터</a></li> -->
		</ul>
	</div>
	<!---메인  ------------------------------------------------------------------------------------------------------- -->
	<main>
		<div class="title">
			<img src="<c:url value='ic_wishList.svg' />" alt="Main Wish List"
				width="80" style="vertical-align: middle;"> 나의 구매계획리스트 조회
		</div>

		<div class="description-box">
			<div class="description-text1">🌻 구매계획을 바탕으로 적금 챌린지 계좌에 도전해보세요
				!</div>
			<div class="description-text2">➡️ 동일한 목표기간을 가진 구매계획 리스트 아이템을 함께
				묶어 계좌를 개설하여 효율적으로 챌린지를 달성해보세요!</div>
		</div>
		<hr class="divider">
		<!---위시리스트 조회   ------------------------------------------------------------------------------------------------------- -->

		<div class="purchasePlanListTitle">◆ 나의 구매계획리스트 목록</div>
		<div class="row">
			<div class="col">
				<div class="card" style="width: 18rem;">
					<div class="card-header">
						<input type="checkbox" id="checkboxHeader"> <label
							for="checkboxHeader"> 계획명 1</label>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">목표금액: 300,000 원</li>
						<li class="list-group-item">목표기간: 6개월</li>

					</ul>
				</div>
			</div>

			<div class="col">
				<div class="card" style="width: 18rem;">
					<div class="card-header">
						<input type="checkbox" id="checkboxHeader"> <label
							for="checkboxHeader"> 계획명 2</label>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">목표금액: 200,000 원</li>
						<li class="list-group-item">목표기간: 6개월</li>


					</ul>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 18rem;">
					<div class="card-header">
						<input type="checkbox" id="checkboxHeader"> <label
							for="checkboxHeader"> 계획명 3</label>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">목표금액: 50,000,000 원</li>
						<li class="list-group-item">목표기간: 12개월</li>


					</ul>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 18rem;">
					<div class="card-header">
						<input type="checkbox" id="checkboxHeader"> <label
							for="checkboxHeader"> 계획명 4</label>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">목표금액: 100,000 원</li>
						<li class="list-group-item">목표기간: 1개월</li>

					</ul>
				</div>
			</div>
		</div>
		<div class="ButtonContainer ">
			<div class="row">
				<div class="col">
					<c:url var="goMakeAccountButton" value="/btn_goMakeAccount.svg" />
					<a class="goMakeAccountButton" href="main.jsp"> <img
						src="${goMakeAccountButton}" alt="버튼" class="goMakeAccountButton"
						>
					</a>
				</div>
			</div>
		</div>
	</main>





	<!-- 푸터 -->
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
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
