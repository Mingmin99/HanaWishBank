<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>웹 페이지</title>
    <style>
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
            font-family: "Hana2.0 CM";
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
            font-family: "Hana2.0 L";
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .description-text2 {
            padding: 10px;
            font-size: 16px;
            font-weight: 500;
            font-family: "Hana2.0 L";
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
            font-family: "Hana2.0 L";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .goalAmountMessage {
            font-family: "Hana2.0 CM";
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
            margin-top: 2rem;
            margin-bottom: 2rem;
            font-size: 24px;
            font-weight: 500;
            font-family: "Hana2.0 L";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .payment-plan-form {
            margin-right: 5rem;
            width: 85%;
            font-family: "Hana2.0 L";
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
            font-family: "Hana2.0 CM";
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
            font-family: "Hana2.0 CM";
        }


        input[type="text"], input[type="number"], select {
            flex: 1;
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            color: black;
        }

        .section {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h3 {
            font-size: 18px;
            margin-top: 10px;
            margin-bottom: 10px;
            font-family: "Hana2.0 CM";
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
            font-family: "Hana2.0 CM";
            justify-content: space-between;
            flex-wrap: wrap; /* 추가 */
        }


        .PlanName {
            font-weight: bold;
            margin-right: 10px;
            font-family: "Hana2.0 CM";
        }

        .selectPlanName {
            flex-grow: 1;
        }

        .ratio-label {
            width: 10% !important;
            font-weight: bold;
            margin-right: 5px;
            font-family: "Hana2.0 CM";
        }

        .percent-label {
            font-family: "Hana2.0 CM";
            width: 0% !important;
            font-weight: bold;
            margin-left: 5px;
        }

        input[type="number"] {
            width: 50px;
            padding: 5px;
            font-family: "Hana2.0 CM";
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .ratio-info {
            font-size: 14px;
            color: #888;
            margin-top: 5px;
            font-family: "Hana2.0 CM";
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
        <li><a href="registerMyPurchasePlanList.jsp">나의 챌린지 적금 조회</a></li>

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
        <div class="interestRateTableTitle">• 챌린지 적금 기간별 이자율</div>
        <table class="interest-table">
            <thead>
            <tr>
                <th>기간</th>
                <th>금리 (연율, 세전)</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>6개월 - 12개월</td>
                <td>연 3.50%</td>
            </tr>
            <tr>
                <td>12개월 - 24개월</td>
                <td>연 3.80%</td>
            </tr>
            <tr>
                <td>24개월 - 36개월</td>
                <td>연 3.80%</td>
            </tr>
            <tr>
                <td>36개월 이상</td>
                <td>연 3.80%</td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="paymntPlanTitle">◆ 납입계획 세우기</div>
<%--        <c:forEach var="plan" items="${PaymentPlanList}">--%>
<%--            <div class="selectPurchasePlanID">${plan.purchasePlanID}</div>--%>
<%--        </c:forEach>--%>

    <form id="myForm" action="/insertPaymentPlan" method="post">
        <div class="payment-plan-form">
            <div class="section">
                <h3>납입계획 작성</h3>
                <c:forEach var="plan" items="${PaymentPlanList}">
                    <input style="display: none" type="number" name="selectPurchasePlanID"
                           value="${plan.purchasePlanID}">
                </c:forEach>
                <div class="input-container">
                    <label for="planName">계획명</label> <input type="text" id="planName"
                                                             name="planName" placeholder="계획명을 입력하세요" required>
                </div>
                <p id="planNameInfo"></p>


                <div class="input-container">
                    <label for="goalDuration">목표기간</label>
                    <input type="number" id="goalDuration" name="goalDuration" placeholder="개월" required
                           value="${PaymentPlanList[0].planPeriod}">
                </div>

                <div class="input-container">
                    <label for="goalAmount">목표금액</label> <input type="number"
                                                                id="goalAmount" name="goalAmount" placeholder="원"
                                                                required>
                </div>
                <div id="goalAmountMessage"></div>

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
                    <label for="paymentAmount">납입금액</label>
                    <input type="number" id="paymentAmount" name="paymentAmount" placeholder="원" required readonly>
                </div>


                <div class="input-container">
                    <label for="transferMethod">이체방식</label> <select
                        id="transferMethod" name="transferMethod">
                    <option value="자동이체">자동이체</option>
                    <option value="직접이체">직접이체</option>
                </select>
                </div>

                <div class="input-container">
                    <label for="autoTransferAccount">자동이체 계좌</label>
                    <select id="autoTransferAccount" name="autoTransferAccount"></select>
                </div>


            </div>

            <div class="section">
                <h3>분배 비율</h3>
                <c:forEach var="plan" items="${PaymentPlanList}">
                    <div class="ratio-container">
                        <div class="ratio-input">
                            <div class="PlanName">계획명</div>
                            <input style="display: none" type="number" name="selectPurchasePlanID"
                                   value="${plan.purchasePlanID}">
                            <div class="selectPlanName">${plan.planName}</div>
                            <!-- 특정 라벨에 클래스 추가 -->
                            <label class="ratio-label">분배비율</label>
                            <input type="number" class="ratio" name="ratio" value="${plan.allocationRatio}">
                            <label class="percent-label">%</label>
                        </div>
                    </div>
                </c:forEach>

                <p class="ratio-info">* 연결된 구매계획리스트 분배 비율 합이 100이 되어야 합니다.</p>
                <button id="updateButton">분배비율 수정하기</button> <!-- 업데이트 버튼 추가 -->
            </div>

            <script>
                $(document).ready(function () {
                    $("#updateButton").click(function () {
                        var dataToSend = [];

                        // 각 계획 항목과 ratio를 매핑하여 데이터를 준비
                        $(".ratio-container").each(function () {
                            var selectPurchasePlanID = $(this).find("input[name='selectPurchasePlanID']").val();
                            var ratio = $(this).find("input[name='ratio']").val();

                            // JavaScript 객체로 데이터를 생성
                            var planData = {
                                selectPurchasePlanID: parseInt(selectPurchasePlanID), // 문자열을 정수로 변환
                                ratio: parseInt(ratio) // 문자열을 정수로 변환
                            };

                            dataToSend.push(planData);
                        });

                        // 준비한 데이터를 서버로 전송
                        $.ajax({
                            type: "POST",
                            url: "/updatePurchasePlan", // 업데이트를 처리하는 컨트롤러 엔드포인트
                            data: JSON.stringify(dataToSend), // 데이터를 JSON 문자열로 변환하여 전송
                            contentType: "application/json", // Content-Type을 JSON으로 설정
                            success: function (response) {
                                // 성공 시 처리
                                console.log("성공:", response);
                            },
                            error: function (error) {
                                // 오류 시 처리
                                console.log("오류:", error);
                            }
                        });
                    });
                });
            </script>

            <div class="section">
                <h3>만기 예상</h3>
                <!-- 만기 예상 원금 입력 필드 -->
                <div class="input-container">
                    <label for="expectedPrincipal">만기 예상 원금</label>
                    <input type="number" id="expectedPrincipal" name="expectedPrincipal"
                           placeholder="클릭하여 만기 예상 이자를 확인하세요!"
                           onclick="calculateInterest()">
                </div>

                <!-- 만기 예상 이자 입력 필드 -->
                <div class="input-container">
                    <label for="expectedInterest">만기 예상 이자</label>
                    <input type="number" id="expectedInterest" name="expectedInterest"
                           placeholder="클릭하여 만기 예상 이자를 확인하세요!"
                           onclick="calculateInterest()">
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
                    <input type="text" name="expectedTerminationDate" id="expectedTerminationDate" readonly>
                </div>

                <div class="input-container">
                    <label for="challengeSavingsAccountNumber">계좌번호</label>
                    <input type="text" id="challengeSavingsAccountNumber" name="challengeSavingsAccountNumber" readonly>
                </div>

            </div>
        </div>
        <div class="ButtonContainer ">
            <div class="row">
                <div class="col">
                    <c:url var="backButton" value="../../resources/img/btnBack.svg"/>
                    <a class="backButton" href="/checkMyWishList"> <img
                            src="${backButton}" alt="버튼" class="backButton">
                    </a>
                </div>
                <div class="col">
                    <c:url var="makeAccountButton" value="../../resources/img/btn_makeAccount.svg"/>
                    <a class="makeAccountButton" href="javascript:void(0);" onclick="submitFormOnClick()">
                        <img src="${makeAccountButton}" alt="버튼" class="makeAccountButton" width="190">
                    </a>
                </div>
            </div>
        </div>
        <input type="submit" value="저장" style="display: none;">
    </form>

    <%--    <script>--%>
    <%--        // 이미지 클릭 시 폼 제출 함수--%>
    <%--        function submitFormOnClick() {--%>
    <%--            generateRandomAccountNumber(); // 계좌 번호 생성--%>
    <%--            document.getElementById('myForm').submit(); // 폼 제출--%>
    <%--        }--%>
    <%--    </script>--%>
    <script>
        $(document).ready(function () {
            // 계획명 입력 필드를 선택
            var planNameInput = $("#planName");

            // 입력 필드 값 변경 이벤트 리스너 추가
            planNameInput.on("input", function () {
                var planNameInfo = $("#planNameInfo");

                if (planNameInput.val().trim() === "") {
                    planNameInfo.text("* 계획명은 필수 입력 사항입니다.").css("color", "red");
                } else {
                    planNameInfo.text("* 계획명 입력 완료하셨습니다.").css("color", "green");
                }
            });
        });
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
            var messageElement = document.getElementById("goalAmountMessage"); // 메시지를 표시할 요소

            if (enteredAmount < planAmountSum) {
                messageElement.style.color = "red"; // 빨간색 텍스트로 설정
                messageElement.textContent = "* 최소 목표 금액보다 낮은 가격입니다.";
            } else {
                messageElement.style.color = "green"; // 초록색 텍스트로 설정
                messageElement.textContent = "* 최소 목표 금액 조건을 만족하였습니다.";
            }

        });

        // 사용자 입력값 가져오기
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

        document.getElementById("paymentAmount").addEventListener("input", function () {
            var enteredAmount = parseFloat(this.value.replace(" 원", "").replace(",", "")); // 입력값에서 " 원" 제거 및 숫자로 변환
            var messageElement = document.getElementById("paymentAmountMessage"); // 메시지를 표시할 요소

            if (enteredAmount < paymentAmount) {
                messageElement.style.color = "red"; // 빨간색 텍스트로 설정
                messageElement.textContent = "목표 기간 안에 목표 금액을 모으기 위한 최소 금액보다 낮은 금액입니다.";
            } else {
                messageElement.style.color = "green"; // 초록색 텍스트로 설정
                messageElement.textContent = "조건이 성립되었습니다.";
            }
        });


        // 납입주기 변경 감지
        document.getElementById("paymentFrequency").addEventListener("change", function () {
            paymentFrequency = this.value;
            calculatePaymentAmount();
            updatePaymentAmount();
        });

        // 결과 표시
        function updatePaymentAmount() {
            document.getElementById("paymentAmount").value = paymentAmount;
        }

        // 초기 계산
        calculatePaymentAmount();
        updatePaymentAmount();
        // AJAX로 계좌 목록 가져오기
        $.ajax({
            url: "/getAllAccounts",
            method: "GET",
            dataType: "json",
            success: function (data) {
                // 드롭다운을 참조
                var dropdown = document.getElementById("autoTransferAccount");

                // 각 계좌 정보에 대한 option 엘리먼트를 생성하여 추가
                data.forEach(function (account) {
                    var option = document.createElement("option");
                    option.value = BigInt(account.accountNumber); // 문자열을 BigInt로 변환하여 할당
                    option.text = account.accountNumber;

                    // 드롭다운에 옵션 추가
                    dropdown.appendChild(option);
                });

                // 받아온 데이터를 콘솔에 출력
                console.log("계좌 목록 데이터: ", data);
            },
            error: function (error) {
                console.log("Error fetching account data: " + error);
            }
        });


        // 드롭다운 값이 변경될 때 발생하는 이벤트 핸들러
        $("#autoTransferAccount").on("change", function () {
            // 선택한 값 가져오기
            var selectedValue = $(this).val();
            console.log("선택한 계좌 번호: " + selectedValue);
        });

        $(document).ready(function () {
            // 모든 .ratio 인풋 필드를 선택
            var ratioInputs = $(".ratio");

            // 초기에도 한 번 실행
            checkRatioSum();

            // 입력 필드 값 변경 이벤트 리스너 추가
            ratioInputs.on("input", function () {
                checkRatioSum();
            });

            // 비율 합계 체크 함수
            function checkRatioSum() {
                // 모든 입력 필드 값을 합산
                var total = 0;
                ratioInputs.each(function () {
                    var inputValue = parseFloat($(this).val()) || 0;
                    total += inputValue;
                });

                // 합계가 100이 아닌 경우 경고 표시
                if (total !== 100) {
                    $(".ratio-info").text("* 연결된 구매계획리스트 분배 비율 합이 100이 되어야 합니다.").css("color", "red");
                } else {
                    $(".ratio-info").text("* 연결된 구매계획리스트 분배 비율 합이 100이 되었습니다.").css("color", "green");
                }
            }
        });

        function calculateInterest() {
            // 사용자 입력
            var goalDurationStr = document.getElementById("goalDuration").value;
            var paymentAmountStr = document.getElementById("paymentAmount").value;

            // 입력 값이 비어 있는지 확인
            if (goalDurationStr === "" || paymentAmountStr === "") {
                alert("목표 기간과 결제 금액을 입력하세요.");
                return;
            }

            // 입력 값을 정수 또는 부동 소수점으로 변환
            var goalDuration = parseInt(goalDurationStr);
            var paymentAmount = parseFloat(paymentAmountStr);

            // 목표 기간에 따라 이자율 설정
            var interestRate;
            if (goalDuration >= 6 && goalDuration < 12) {
                interestRate = 0.035; // 연 3.50%
            } else if (goalDuration >= 12 && goalDuration < 24) {
                interestRate = 0.038; // 연 3.80%
            } else if (goalDuration >= 24 && goalDuration <= 36) {
                interestRate = 0.038; // 연 3.80%
            } else {
                // 기타 조건에 대한 처리
                alert("설정된 목표 기간은 유효하지 않습니다.");
                return;
            }

            // 입력 값에서 소수점 이하 제거
            paymentAmount = Math.floor(paymentAmount); // 소수점 이하 버림

            // 월별 이자 계산
            var monthlyInterest = paymentAmount * interestRate / 12;
            monthlyInterest = Math.floor(monthlyInterest);

            // 만기 예상 원금 및 이자 계산
            var totalPrincipal = paymentAmount * goalDuration;
            var totalInterest = monthlyInterest * goalDuration;

            // 결과를 입력 필드에 설정
            document.getElementById("expectedPrincipal").value = Math.round(totalPrincipal * 100) / 100;
            document.getElementById("expectedInterest").value = Math.round(totalInterest * 100) / 100;

        }

        var goalDurationMonths = parseInt(document.getElementById("goalDuration").value);

        // 현재 날짜를 가져옴
        var currentDate = new Date();

        // goalDuration 값을 월에 더한 날짜를 계산
        var endDate = new Date(currentDate);
        endDate.setMonth(endDate.getMonth() + goalDurationMonths);

        // 예상 만기 일자를 날짜 형식으로 변환
        var formattedEndDate = endDate.getFullYear() + '-' + ('0' + (endDate.getMonth() + 1)).slice(-2) + '-' + ('0' + endDate.getDate()).slice(-2);

        console.log(formattedEndDate);
        // calculatedEndDate 값을 해당 <input> 요소의 value로 설정
        document.getElementById("expectedTerminationDate").value = formattedEndDate;


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

        function generateRandomAccountNumber() {
            const randomSuffix = Math.floor(10000000 + Math.random() * 90000000); // 6자리 랜덤 숫자 생성
            const accountNumber = 1002 + randomSuffix.toString(); // 1002와 6자리 랜덤 숫자를 합침
            const accountNumberField = document.getElementById('challengeSavingsAccountNumber');
            accountNumberField.value = parseInt(accountNumber); // 정수로 변환하여 할당
        }

        // 이미지 클릭 시 폼 제출 함수
        function submitFormOnClick() {
            generateRandomAccountNumber(); // 계좌 번호 생성
            document.getElementById('myForm').submit(); // 폼 제출
        }

        $(document).ready(function () {
            // 이미지 버튼 클릭 이벤트 핸들러
            $(".makeAccountButton").click(function () {
                submitFormOnClick(); // 이미지 클릭 시 폼 제출 함수 호출
            });

            // 폼 제출 이벤트 핸들러
            $("#myForm").submit(function (event) {
                event.preventDefault(); // 폼 기본 제출 동작 방지
            });
        });
    </script>

</main>

<!— 푸터 추가 —>
<!—
<footer class="bg-dark text-light text-center py-3"> © 2023
    Your Website. All rights reserved.
</footer>
—>
<%@ include file="include/footer.jsp" %>

<!— 부트스트랩 JavaScript 연결 —>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>