<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

        .navbar > .container-fluid {
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
        }

        /* 반응형 스타일 */
        @media ( max-width: 768px) {
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
            margin-top: 4%;
            margin-left: 5%;
            width: 200px;
            position: absolute;
            /* 	border-right: 1px solid #ccc; */
        }

        .sidebar h4 {
            color: #009591;
            font-family: "Hana2.0 CM";
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
            font-family: "Hana2.0 CM";
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
            font-family: "Hana2.0 CM";
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

        .section {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h3 {
            font-size: 18px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        /*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

        .ratio-container {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
        }

        .ratio-input {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap; /* 추가 */
        }


        .PlanName {
            font-weight: bold;
            margin-right: 10px;
        }

        .selectPlanName {
            flex-grow: 1;
        }

        .ratio-label {
            width: 10% !important;
            font-weight: bold;
            margin-right: 5px;
        }

        .percent-label {
            width: 0% !important;
            font-weight: bold;
            margin-left: 5px;
        }

        input[type="number"] {
            width: 50px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .ratio-info {
            font-size: 14px;
            color: #888;
            margin-top: 5px;
        }

        /*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

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
            margin-right: 10rem !important;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .backButton {
            margin-left: 2rem;
        }

        .makeAccountButton {
            margin-left: 2rem;
        }

    </style>

    <!-- 부트스트랩 연결 -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<%@ include file="include/header.jsp" %>
<body>
<!-- 사이드바 ------------------------------------------------------------------------------------------------------- -->
<div class="sidebar">
    <h4>나의 챌린지 계좌</h4>
    <ul>
        <li><a href="registerMyWishList.jsp">나의 납입계획 등록</a></li>
        <li><a href="registerMyPurchasePlanList.jsp">나의 챌린지 계좌 조회</a></li>

    </ul>
</div>
<!---메인 ------------------------------------------------------------------------------------------------------- -->
<main>
    <div class="title">
        <img src="<c:url value='../../resources/img/ic_paymentPlan.svg' />" alt="paymentPlan"
             width="80" style="vertical-align: middle;"> 나의 납입계획 등록
    </div>

    <div class="description-box">
        <div class="description-text1">🎲 챌린지 적금 계좌 개설을 위해 납입계획을
            등록해주세요!
        </div>
        <div class="description-text2">➡️ 확실한 납입계획 설정은 목표에 효율적으로 도달할 수
            있도록 도와줍니다.
        </div>
    </div>
    <hr class="divider">
    <!---위시리스트 조회 ------------------------------------------------------------------------------------------------------- -->

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
                <label for="goalDuration">목표기간</label>
                <input type="number" id="goalDuration" name="goalDuration" placeholder="개월" required
                       value="${PaymentPlanList[0].planPeriod}">
            </div>

            <div class="input-container">
                <label for="goalAmount">목표금액</label> <input type="number"
                                                            id="goalAmount" name="goalAmount" placeholder="원" required>
            </div>

            <script>
                // PaymentPlanList 배열에서 planAmount 합계 계산
                var planAmountSum = 0;
                <c:forEach var="item" items="${PaymentPlanList}">
                planAmountSum += ${item.planAmount};
                </c:forEach>
                // 목표금액 input 요소에 합계를 할당
                document.getElementById("goalAmount").value = planAmountSum;
                // goalAmount 입력 필드 값 변경 이벤트 리스너 추가
                document.getElementById("goalAmount").addEventListener("input", function () {
                    var enteredAmount = parseFloat(this.value.replace(" 원", "").replace(",", "")); // 입력값에서 " 원" 제거 및 숫자로 변환
                    if (enteredAmount < planAmountSum) {
                        alert("최소 목표 금액보다 낮은 가격입니다.");
                    }
                });
            </script>
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
                <label for="paymentDate">납입일</label>
                <select id="paymentDate" name="paymentDate">
                    <!-- 1일부터 30일까지의 모든 일자를 드롭다운으로 표시 -->
                    <option value="1">1일</option>
                    <option value="2">2일</option>
                    <option value="3">3일</option>
                    <option value="4">4일</option>
                    <option value="5">5일</option>
                    <option value="6">6일</option>
                    <option value="7">7일</option>
                    <option value="8">8일</option>
                    <option value="9">9일</option>
                    <option value="10">10일</option>
                    <option value="11">11일</option>
                    <option value="12">12일</option>
                    <option value="13">13일</option>
                    <option value="14">14일</option>
                    <option value="15">15일</option>
                    <option value="16">16일</option>
                    <option value="17">17일</option>
                    <option value="18">18일</option>
                    <option value="19">19일</option>
                    <option value="20">20일</option>
                    <option value="21">21일</option>
                    <option value="22">22일</option>
                    <option value="23">23일</option>
                    <option value="24">24일</option>
                    <option value="25">25일</option>
                    <option value="26">26일</option>
                    <option value="27">27일</option>
                    <option value="28">28일</option>
                    <option value="29">29일</option>
                    <option value="30">30일</option>
                </select>
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
                                                               id="paymentAmount" name="paymentAmount" placeholder="원"
                                                               required>
            </div>
            <script>// 사용자 입력값 가져오기
            var goalAmount = parseFloat(document.getElementById("goalAmount").value.replace(" 원", "").replace(",", ""));
            var goalDuration = parseInt(document.getElementById("goalDuration").value);
            var paymentFrequency = document.getElementById("paymentFrequency").value;

            // 납입주기에 따라 납입금액 계산
            var paymentAmount = 0;

            function calculatePaymentAmount() {
                if (paymentFrequency === "매월") {
                    paymentAmount = Math.ceil(goalAmount / goalDuration);
                } else if (paymentFrequency === "매주") {
                    // 현재 날짜에서 목표 기간 후의 날짜 계산
                    var currentDate = new Date();
                    var endDate = new Date(currentDate);
                    endDate.setMonth(endDate.getMonth() + goalDuration);

                    // 날짜 차이 계산
                    var daysDifference = Math.ceil((endDate - currentDate) / (1000 * 60 * 60 * 24));

                    // 주 단위로 나눈 뒤 올림
                    paymentAmount = Math.ceil(goalAmount / daysDifference * 7);
                } else if (paymentFrequency === "매일") {
                    // 현재 날짜에서 목표 기간 후의 날짜 계산
                    var currentDate = new Date();
                    var endDate = new Date(currentDate);
                    endDate.setMonth(endDate.getMonth() + goalDuration);
                    // 날짜 차이 계산
                    var daysDifference = Math.ceil((endDate - currentDate) / (1000 * 60 * 60 * 24));

                    // 일 단위로 나눈 뒤 올림
                    paymentAmount = Math.ceil(goalAmount / daysDifference);
                }
            }

            // 납입주기 변경 감지
            document.getElementById("paymentFrequency").addEventListener("change", function () {
                paymentFrequency = this.value;
                calculatePaymentAmount();
                updatePaymentAmount();
            });

            // 결과 표시
            function updatePaymentAmount() {
                alert("납입금액은 " + paymentAmount + " 원입니다.");
                document.getElementById("paymentAmount").value = paymentAmount;
            }

            // 초기 계산
            calculatePaymentAmount();
            updatePaymentAmount();
            </script>

            <div class="input-container">
                <label for="transferMethod">이체방식</label> <select
                    id="transferMethod" name="transferMethod">
                <option value="자동이체">자동이체</option>
                <option value="직접이체">직접이체</option>
            </select>
            </div>

            <div class="input-container">
                <label for="autoTransferAccount">자동이체 계좌</label> <input type="text"
                                                                        id="autoTransferAccount"
                                                                        name="autoTransferAccount"
                                                                        placeholder="계좌번호를 입력하세요">
            </div>
        </div>

        <div class="section">
            <h3>분배 비율</h3>
            <c:forEach var="plan" items="${PaymentPlanList}">
                <div class="ratio-container">
                    <div class="ratio-input">
                        <div class="PlanName">계획명</div>
                        <div class="selectPlanName">${plan.planName}</div>
                        <!-- 특정 라벨에 클래스 추가 -->
                        <label class="ratio-label">분배비율</label>
                        <input type="number" id="ratio1" name="ratio1" value="${plan.allocationRatio}">
                        <label class="percent-label">%</label>
                    </div>
                </div>
            </c:forEach>
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
                                                                      id="expectedInterest" name="expectedInterest"
                                                                      placeholder="원">
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
                <textarea id="expectedTerminationDate" rows="1" readonly></textarea>
            </div>
            <script>
                // goalDuration 입력 필드의 값을 가져옴
                var goalDurationMonths = parseInt(document.getElementById("goalDuration").value);

                // 현재 날짜를 가져옴
                var currentDate = new Date();

                // goalDuration 값을 월에 더한 날짜를 계산
                var endDate = new Date(currentDate);
                endDate.setMonth(endDate.getMonth() + goalDurationMonths);

                // endDate를 원하는 형식으로 포맷팅
                function formatDate(date) {
                    const options = {year: 'numeric', month: '2-digit', day: '2-digit'};
                    return date.toLocaleDateString('ko-KR', options);
                }

                // 포맷팅된 날짜를 expectedTerminationDate 텍스트 영역에 표시
                document.getElementById("expectedTerminationDate").textContent = formatDate(endDate);
            </script>
        </div>
    </div>
    <script>
        document.getElementById("paymentFrequency").addEventListener(
            "change",
            function () {
                var selectedValue = this.value;
                var paymentDateInput = document.querySelector(".payment-date");
                var paymentDayOfWeekInput = document.querySelector(".payment-day-of-week");

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
            }
        );
    </script>
    <div class="ButtonContainer ">
        <div class="row">
            <div class="col">
                <c:url var="backButton" value="../../resources/img/btnBack.svg"/>
                <a class="backButton" href="checkMyWishList.jsp"> <img
                        src="${backButton}" alt="버튼" class="backButton">
                </a>
            </div>
            <div class="col">
                <c:url var="makeAccountButton" value="../../resources/img/btn_makeAccount.svg"/>
                <a class="makeAccountButton" href="index.jsp"> <img
                        src="${makeAccountButton}" alt="버튼" class="makeAccountButton"
                        width="190">
                </a>
            </div>
        </div>
    </div>
</main>

<!-- 푸터 추가 -->
<!-- <footer class="bg-dark text-light text-center py-3"> © 2023
Your Website. All rights reserved. </footer> -->
<%@ include file="include/footer.jsp" %>

<!-- 부트스트랩 JavaScript 연결 -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>