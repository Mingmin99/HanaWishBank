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
/* 이자율 테이블 ------------------------------------------------------------------------------------------------------- */
.interestRateTableTitle {
	margin-top: 30px;
	font-size: 20px;
	font-weight: 500;
	font-family: 'Helvetica', sans-serif;
	color: #4F4F4F;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}

.interest-table {
	font-size: 0.9rem;
	border-collapse: collapse;
	margin-top: 1rem;
	width: 40%;
	border-collapse: collapse;
}

.interest-table th, .interest-table td {
	border: 1px solid #ddd;
	padding: 0.5rem;
	text-align: center;
}

.interest-table th {
	background-color: #9CC5C0;
	font-weight: bold;
}
/* 납입계획 입력 양식------------------------------------------------------------------------------------------------------- */
.paymntPlanTitle {
	margin-top: 5rem;
	margin-bottom: 2rem;
	font-size: 24px;
	font-weight: 500;
	font-family: 'Helvetica', sans-serif;
	color: #4F4F4F;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}

.payment-plan-form {
	margin-right: 5rem;
	width: 85%;
	font-family: 'Helvetica', sans-serif;
	color: #333;
	padding: 2rem;
	border: 1px solid #ddd;
	border-radius: 10px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.section {
	margin-bottom: 2rem;
}

h3 {
	font-size: 1.5rem;
	margin-bottom: 1.5rem;
}

.input-container {
	display: flex;
	align-items: center;
	margin-bottom: 1.5rem;
}

label {
	width: 30%;
	font-weight: bold;
	margin-right: 1rem;
}

input[type="text"], input[type="number"], select {
	flex: 1;
	padding: 0.5rem;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 1rem;
}

.ratio-container {
	display: flex;
	flex-direction: column;
	gap: 1rem;
}

.ratio-input {
	display: flex;
	align-items: center;
	gap: 0.5rem;
}

.ratio-input label {
	width: 50%;
	font-weight: bold;
}

.ratio-input label[for="ratio"] {
	margin-left: 20%;
}

.ratio-input input[type="text"], .ratio-input input[type="number"] {
	flex: 1;
	padding: 0.5rem;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 1rem;
}

.ratio-info {
	font-size: 0.8rem;
	color: #777;
	margin-top: 2rem;
}

.section:not(:last-child) {
	border-bottom: 1px solid #ddd;
	padding-bottom: 1.5rem;
	margin-bottom: 1.5rem;
}

.payment-day-of-week {
	display: none;
}

.input-container textarea[readonly] {
	flex: 1;
	padding: 0.5rem;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 1rem;
	resize: none;
	background-color: #f5f5f5;
}

.button-container {
	text-align: center;
	margin-top: 2rem;
}

button {
	background-color: #ABCBCD;
	border: none;
	color: #fff;
	padding: 0.5rem 1rem;
	border-radius: 5px;
	font-size: 1rem;
	cursor: pointer;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #C7AFAF;
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
		<h4>나의 챌린지 계좌</h4>
		<ul>
			<li><a href="registerMyWishList.jsp">나의 납입계획 등록</a></li>
			<li><a href="registerMyPurchasePlanList.jsp">나의 챌린지 계좌 조회</a></li>
			<!-- <li><a href="#">대출신청</a></li>
			<li><a href="#">카드신청</a></li>
			<li><a href="#">고객센터</a></li> -->
		</ul>
	</div>
	<!---메인  ------------------------------------------------------------------------------------------------------- -->
	<main>
		<div class="title">
			<img src="<c:url value='ic_paymentPlan.svg' />" alt="paymentPlan"
				width="80" style="vertical-align: middle;"> 나의 납입계획 등록
		</div>

		<div class="description-box">
			<div class="description-text1">🎲 챌린지 적금 계좌 개설을 위해 납입계획을
				등록해주세요!</div>
			<div class="description-text2">➡️ 확실한 납입계획 설정은 목표에 효율적으로 도달할 수
				있도록 도와줍니다.</div>
		</div>
		<hr class="divider">
		<!---위시리스트 조회   ------------------------------------------------------------------------------------------------------- -->

		<div class="interestRateContainer">
			<div class="interestRateTableTitle">◉ 챌린지 적금 기간별 이자율</div>
			<table class="interest-table">
				<thead>
					<tr>
						<th>기간</th>
						<th>금리 (연율, 세전)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1년</td>
						<td>3.55%</td>
					</tr>
					<tr>
						<td>2년</td>
						<td>3.65%</td>
					</tr>
					<tr>
						<td>3년</td>
						<td>3.75%</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="paymntPlanTitle">◆ 납입계획 세우기</div>

		<div class="payment-plan-form">
			<div class="section">
				<h3>납입계획 작성</h3>
				<div class="input-container">
					<label for="planName">계획명</label> <input type="text" id="planName"
						name="planName" placeholder="계획명을 입력하세요" required>
				</div>
				<div class="input-container">
					<label for="goalDuration">목표기간</label> <input type="number"
						id="goalDuration" name="goalDuration" placeholder="개월" required>
				</div>
				<div class="input-container">
					<label for="goalAmount">목표금액</label> <input type="number"
						id="goalAmount" name="goalAmount" placeholder="원" required>
				</div>
			</div>

			<div class="section">
				<h3>납입 정보</h3>
				<div class="input-container">
					<label for="paymentFrequency">납입주기</label> <select
						id="paymentFrequency" name="paymentFrequency">
						<option value="매월">매월</option>
						<option value="매주">매주</option>
						<option value="매일">매일</option>
					</select>
				</div>
				<div class="input-container payment-date">
					<label for="paymentDate">납입일</label> <input type="date"
						id="paymentDate" name="paymentDate">
				</div>
				<div class="input-container payment-day-of-week"
					style="display: none;">
					<label for="paymentDayOfWeek">납입일 (요일)</label> <select
						id="paymentDayOfWeek" name="paymentDayOfWeek">
						<option value="월요일">월요일</option>
						<option value="화요일">화요일</option>
						<option value="수요일">수요일</option>
						<option value="목요일">목요일</option>
						<option value="금요일">금요일</option>
						<option value="토요일">토요일</option>
						<option value="일요일">일요일</option>
					</select>
				</div>
				<div class="input-container">
					<label for="paymentAmount">납입금액</label> <input type="number"
						id="paymentAmount" name="paymentAmount" placeholder="원" required>
				</div>
				<div class="input-container">
					<label for="transferMethod">이체방식</label> <select
						id="transferMethod" name="transferMethod">
						<option value="자동이체">자동이체</option>
						<option value="직접이체">직접이체</option>
					</select>
				</div>
				<div class="input-container">
					<label for="autoTransferAccount">자동이체 계좌</label> <input type="text"
						id="autoTransferAccount" name="autoTransferAccount"
						placeholder="계좌번호를 입력하세요">
				</div>
			</div>

			<div class="section">
				<h3>분배 비율</h3>
				<div class="ratio-container">
					<div class="ratio-input">
						<label for="plan1">계획명</label> <input type="text" id="plan1"
							name="plan1" placeholder="계획명"> <label for="ratio">분배비율
						</label><input type="number" id="ratio1" name="ratio1" placeholder="0"><label
							for="ratio1">%</label>
					</div>
					<div class="ratio-input">
						<label for="plan1">계획명</label> <input type="text" id="plan1"
							name="plan1" placeholder="계획명"> <label for="ratio">분배비율
						</label><input type="number" id="ratio1" name="ratio1" placeholder="0"><label
							for="ratio1">%</label>
					</div>
					<div class="ratio-input">
						<label for="plan1">계획명</label> <input type="text" id="plan1"
							name="plan1" placeholder="계획명"> <label for="ratio">분배비율
						</label><input type="number" id="ratio1" name="ratio1" placeholder="0"><label
							for="ratio1">%</label>
					</div>
				</div>
				<p class="ratio-info">* 연결된 구매계획리스트 분배 비율 합이 100이 되어야 합니다.</p>
			</div>

			<div class="section">
				<h3>만기 예상</h3>
				<div class="input-container">
					<label for="expectedPrincipal">만기 예상 원금</label> <input
						type="number" id="expectedPrincipal" name="expectedPrincipal"
						placeholder="원">
				</div>
				<div class="input-container">
					<label for="expectedInterest">만기 예상 이자</label> <input type="number"
						id="expectedInterest" name="expectedInterest" placeholder="원">
				</div>
				<div class="input-container">
					<label for="terminationMethod">해지방식</label> <select
						id="terminationMethod" name="terminationMethod">
						<option value="자동해지">자동해지</option>
						<option value="직접해지">직접해지</option>
					</select>
				</div>
				<div class="input-container">
					<label for="expectedTerminationDate">예상 만기 일자</label>
					<textarea id="expectedTerminationDate"
						name="expectedTerminationDate" rows="1" readonly>20203년 월 일</textarea>
				</div>

			</div>
		</div>
		<script>
			document.getElementById("paymentFrequency").addEventListener(
					"change",
					function() {
						var selectedValue = this.value;
						var paymentDateInput = document
								.querySelector(".payment-date");
						var paymentDayOfWeekInput = document
								.querySelector(".payment-day-of-week");

						if (selectedValue === "매월") {
							paymentDateInput.style.display = "block";
							paymentDayOfWeekInput.style.display = "none";
						} else if (selectedValue === "매주") {
							paymentDateInput.style.display = "none";
							paymentDayOfWeekInput.style.display = "block";
						} else {
							paymentDateInput.style.display = "none";
							paymentDayOfWeekInput.style.display = "none";
						}
					});
		</script>



		<div class="ButtonContainer ">
			<div class="row">
				<div class="col">
					<c:url var="goMakeAccountButton" value="/btn_goMakeAccount.svg" />
					<a class="goMakeAccountButton" href="main.jsp"> <img
						src="${goMakeAccountButton}" alt="버튼" class="goMakeAccountButton">
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
