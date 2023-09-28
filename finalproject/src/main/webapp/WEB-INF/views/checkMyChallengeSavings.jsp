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

        /* 사이드 바 ------------------------------------------------------------------------------------------------------- */
        .sidebar {
            margin-top: 3%;
            margin-left: 5%;
            width: 200px;
            position: absolute;
            /* 	border-right: 1px solid #ccc; */
        }

        .sidebar h3 {
            color: #009591;
            font-family: "Hana2.0 CM";
            margin-bottom: 20px;
            position: relative;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .sidebar h3::before {
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

        /* 위시리스트 조회------------------------------------------------------------------------------------------------------- */
        .ChallengeSavingTitle {
            margin-top: 48px;
            font-size: 24px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .container {
            /*background-image: linear-gradient(-20deg, #f794a4 0%, #fdd6bd 100%);*/
            /*background-image: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%);*/
            background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
            width: 90% !important;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1); /* 미세하게 수정된 그림자 스타일 */
            margin-left: 0 !important;
            /*border: 2px double #4a4949;*/
        }

        .savingTitle {
            color: #333;
            font-family: "Hana2.0 CM";
            font-size: 24px;
            margin-left: 10px;
        }

        .savingAccountNumber,
        .savingProgressInfo {
            display: inline-block; /* 인라인 블록 요소로 배치 */
            margin-right: 20px; /* 간격을 조절할 수 있습니다. */
            margin-top: 10px; /* 간격을 조절할 수 있습니다. */
        }

        .savingAccountNumber {
            color: #555;
            font-family: "Hana2.0 L";
            font-size: 18px;
            margin-left: 10px;
        }

        .savingProgressInfo {
            color: #555;
            font-family: "Hana2.0 L";
            font-size: 18px;
            margin-left: 10px;
        }

        .purchase-plans {
            margin-top: 20px;
        }

        .plan-item {
            background: linear-gradient(to bottom, #ffffff, #f5f5f5); /* 그라데이션 배경색 */
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1); /* 미세하게 수정된 그림자 스타일 */
        }

        .plan-item-title {
            color: #333;
            font-family: "Hana2.0 CM";
            font-size: 20px;
            margin: 0;
        }

        .plan-item-price {
            color: #333;
            font-size: 16px;
            font-family: "Hana2.0 L";
        }

        .plan-item-progress-bar {
            color: #333;
            font-size: 16px;
            font-family: "Hana2.0 L";
        }

        .plan-item-price,
        .plan-item-progress-bar {
            display: inline-block; /* 인라인 블록 요소로 배치 */
            margin-right: 20px; /* 간격을 조절할 수 있습니다. */
            margin-top: 10px; /* 간격을 조절할 수 있습니다. */
        }

        .progress-bar {
            height: 30px;
            background-image: linear-gradient(to top, #d5d4d0 0%, #d5d4d0 1%, #eeeeec 31%, #efeeec 75%, #e9e9e7 100%);
            border-radius: 5px;
            margin-top: 10px;
        }

        .progress {
            height: 100%;
            border-radius: 5px;
            /*background: linear-gradient(to right, #4e72a0, #9cb8dc); !* 그라데이션 배경색 *!*/
            background-image: linear-gradient(to right, #eea2a2 0%, #bbc1bf 19%, #57c6e1 42%, #b49fda 79%, #7ac5d8 100%);
            width: 0; /* 초기 너비를 0으로 설정 */
            transition: width 2s ease-in-out; /* 너비(width) 속성에 대한 애니메이션 설정 */
            animation: fillProgress 2s ease-in-out; /* fillProgress 애니메이션 적용 */
        }

        /* 애니메이션 키프레임 정의 */
        @keyframes fillProgress {
            0% {
                width: 0; /* 애니메이션 시작 시 너비를 0으로 설정 */
            }
            100% {
                width: 100%; /* 애니메이션 종료 시 너비를 100%로 설정 (퍼센트만큼 채움) */
            }
        }


        /* --------------------------------------------모달 스타일 -------------------------------------------- */
        .password-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 배경에 어둡게 처리 */
            z-index: 1;
        }

        .password-modal-content {
            position: absolute;
            width: 30% !important;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        input[type="password"] {
            padding: 10px;
            width: 100%;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        button#checkPasswordBtn {
            background-color: #fcb69f;
            color: #252525;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
        }

        button#checkPasswordBtn:hover {
            background-image: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%);
        }

        /* 모달 스타일 */
        .saving-detail-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 배경에 어둡게 처리 */
            z-index: 1;
            overflow-y: auto; /* 수직 스크롤 활성화 */
        }

        .saving-detail-modal-content {
            position: absolute;
            width: 30% !important; /* 필요에 따라 조정 */
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #f1f1f1; /* 배경 색상 추가 */
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5); /* 그림자 추가 */
            text-align: center;
            max-height: 80%; /* 최대 높이 설정 */
            overflow-y: auto; /* 내용이 모달 내에서 넘칠 때 스크롤 활성화 */
        }

        /* 모달 콘텐츠 스타일링 */
        .saving-detail-modal h3 {
            font-family: "Hana2.0 CM";
            font-size: 1.8em; /* 폰트 크기 증가 */
            color: #6a978d; /* 글자 색상 변경 */
        }

        .separator {
            border: 1px solid #ccc; /* 구분선 스타일을 지정 */
            margin-top: 10px;
            margin-bottom: 30px;
        }


        .info-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 1.4em; /* 폰트 크기 증가 */
        }

        .info-value {
            display: flex;
            font-family: "Hana2.0 CM";
            justify-content: space-between;
            color: #8aaba3; /* 글자 색상 변경 */
            margin-bottom: 10px;
            font-size: 1em; /* 폰트 크기 증가 */

        }

        .info-label {
            font-family: "Hana2.0 CM";
            font-weight: bold;
            margin-right: 10px;
        }

        /* 버튼 스타일 */
        .saving-detail-modal button#closeDetailModal {
            background-color: #fcb69f;
            color: #fff; /* 글자색을 흰색으로 변경 */
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 1.2em;
            margin-top: 20px; /* 버튼 상단 여백 추가 */
        }

        .saving-detail-modal button#closeDetailModal:hover {
            background-image: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%);
        }

        /*-----------------------------------*/

    </style>
    <!-- 부트스트랩 연결 -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<%@ include file="include/header.jsp" %>
<body>


<!-- 사이드바  ------------------------------------------------------------------------------------------------------- -->
<div class="sidebar">
    <h3>나의 챌린지 적금</h3>
    <ul>
        <li><a href="/checkMyWishList">나의 챌린지 대시보드</a></li>
    </ul>
</div>
<!---메인  ------------------------------------------------------------------------------------------------------- -->
<main>
    <div class="title">
        <img src="<c:url value='../../resources/img/ic_wishList.svg' />" alt="Main Wish List"
             width="80" style="vertical-align: middle;"> 나의 챌린지 적금 조회
    </div>

    <div class="description-box">
        <div class="description-text1">🏆 나의 챌린지 현황을 조회보세요!</div>
        <div class="description-text2">➡️상품 별로 얼마나 목표를 달성했는지 확인해보세요!
        </div>
    </div>
    <hr class="divider">
    <!---위시리스트 조회   ------------------------------------------------------------------------------------------------------- -->

    <div class="ChallengeSavingTitle">◆ 나의 챌린지 대시보드</div>
    <!-- 컨테이너 템플릿 -->
    <div id="container-template" style="display: none;">
        <div class="container">
            <div class="savingTitle">적금 계좌 1</div>
            <div class="savingAccountNumber">계좌번호 :</div>
            <div class="savingProgressInfo">계좌 진행률: 70%</div>
            <!-- 가장 큰 챌린지의 구매 계획 리스트 -->
            <div class="purchase-plans">
                <div class="plan-item">
                    <div class="plan-item-title">구매 계획 1</div>
                    <div class="plan-item-price">목표 금액: 원</div>
                    <div class="plan-item-progress-bar">목표 달성률: 50%</div>
                    <div class="progress-bar">
                        <div class="progress" style="width: 50%;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="passwordModal" class="modal password-modal">
        <div class="modal-content password-modal-content">
            <input type="password" id="passwordInput" placeholder="비밀번호 입력">
            <button id="checkPasswordBtn">확인</button>
        </div>
    </div>

    <div id="savingDetailModal" class="modal saving-detail-modal">
        <div class="modal-content saving-detail-modal-content">
            <h3>적금 상세 정보</h3>
            <hr class="separator">
            <div class="info-item">
                <span class="info-label">적금명:</span>
                <span class="info-value" id="savingPlanName"></span>
            </div>
            <div class="info-item">
                <span class="info-label">계좌번호:</span>
                <span class="info-value" id="savingAccountNumber"></span>
            </div>
            <div class="info-item">
                <span class="info-label">목표 금액:</span>
                <span class="info-value" id="targetSavingsAmount"></span>
            </div>
            <div class="info-item">
                <span class="info-label">목표 기간:</span>
                <span class="info-value" id="targetSavingsPeriod"></span>
            </div>
            <div class="info-item">
                <span class="info-label">납입 금액:</span>
                <span class="info-value" id="paymentAmount"></span>
            </div>
            <div class="info-item">
                <span class="info-label">납입 주기:</span>
                <span class="info-value" id="paymentFrequency"></span>
            </div>
            <div class="info-item">
                <span class="info-label">납입 요일:</span>
                <span class="info-value" id="paymentDay"></span>
            </div>
            <div class="info-item">
                <span class="info-label">납입일:</span>
                <span class="info-value" id="paymentDate"></span>
            </div>
            <div class="info-item">
                <span class="info-label">이체 방식:</span>
                <span class="info-value" id="transferMethod"></span>
            </div>
            <div class="info-item">
                <span class="info-label">이체 계좌:</span>
                <span class="info-value" id="transferAccount"></span>
            </div>
            <div class="info-item">
                <span class="info-label">잔액:</span>
                <span class="info-value" id="accountBalance"></span>
            </div>
            <div class="info-item">
                <span class="info-label">만기 원금:</span>
                <span class="info-value" id="expectedPrincipal"></span>
            </div>
            <div class="info-item">
                <span class="info-label">만기 이자:</span>
                <span class="info-value" id="expectedInterest"></span>
            </div>
            <div class="info-item">
                <span class="info-label">만기 해제 방식 :</span>
                <span class="info-value" id="expirationOption"></span>
            </div>
            <div class="info-item">
                <span class="info-label">적금 시작일 :</span>
                <span class="info-value" id="startDay"></span>
            </div>
            <div class="info-item">
                <span class="info-label">적금 해제일 :</span>
                <span class="info-value" id="endDay"></span>
            </div>
            <div class="info-item">
                <span class="info-label">적금 목표 달성률 :</span>
                <span class="info-value" id="goalAchievementRate"></span>
            </div>
            <button id="closeDetailModal">닫기</button>
        </div>
    </div>

    <!-- JavaScript 코드 -->
    <script>
        $(document).ready(function () {
            var containerCount = 0; // 컨테이너의 고유한 카운터
            $.ajax({
                type: "GET",
                url: "/getAllChallengeSavings",
                success: function (data) {
                    var container = $("#container-template").parent(); // 컨테이너 템플릿의 부모
                    var containerTemplate = $("#container-template"); // 컨테이너 템플릿

                    data.forEach(function (savingsData) {
                        // 컨테이너 템플릿 복제
                        var newContainer = containerTemplate.clone();
                        newContainer.css("display", "block"); // 보이도록 설정
                        containerCount++; // 컨테이너 카운터 증가
                        var containerID = "container-" + containerCount; // 고유한 ID 생성
                        newContainer.attr("id", containerID); // 컨테이너에 고유한 ID 할당

                        // 데이터를 컨테이너에 채워넣기
                        newContainer.find(".savingTitle").text(savingsData.planName);
                        newContainer.find(".savingAccountNumber").text("계좌번호 : " + savingsData.challengeSavingsAccountNumber);
                        newContainer.find(".savingAccountPW").text("계좌 비밀번호 : " + savingsData.challengeSavingsAccountPW);
                        newContainer.find(".savingProgressInfo").text("계좌 진행률: " + savingsData.goalAchievementRate + "%");

                        // 기존의 purchase-plans 요소 초기화
                        var purchasePlans = newContainer.find(".purchase-plans");
                        purchasePlans.empty(); // 기존 내용 삭제

                        // 생성한 컨테이너를 페이지에 추가
                        container.append(newContainer);

                        // 추가한 컨테이너 내에서 새로운 Ajax 요청을 수행
                        $.ajax({
                            type: "GET",
                            url: "/getPurchasePlanByAccountNumber",
                            data: {challengeSavingsAccountNumber: savingsData.challengeSavingsAccountNumber},
                            success: function (purchasePlanData) {
                                try {
                                    // 구매 계획 데이터를 사용하여 각 계획의 이름을 설정
                                    purchasePlanData.forEach(function (plan) {
                                        // ...

                                        // 각각의 구매 계획 데이터를 해당하는 요소에 설정
                                        var planItem = $("<div>").addClass("plan-item");
                                        var planItemTitle = $("<div>").addClass("plan-item-title").text(plan.planName);
                                        var planItemPrice = $("<div>").addClass("plan-item-price").text("목표 금액: " + plan.planAmount + "원");
                                        var planItemProgressBar = $("<div>").addClass("plan-item-progress-bar").text("목표 달성률: " + Math.round(((savingsData.accountBalance * plan.allocationRatio) / plan.planAmount) * 10) / 10 + "%");
                                        var progressBar = $("<div>").addClass("progress-bar");
                                        var progress = $("<div>").addClass("progress").css("width", ((savingsData.accountBalance * plan.allocationRatio) / plan.planAmount) + "%");

                                        progressBar.append(progress);
                                        planItem.append(planItemTitle, planItemPrice, planItemProgressBar, progressBar);

                                        // 수정된 구매 계획 요소를 새로운 컨테이너에 추가
                                        purchasePlans.append(planItem);
                                    });
                                } catch (error) {
                                    console.error("구매 계획 데이터 처리 중 오류 발생:", error);
                                }
                            },
                            error: function (error) {
                                console.error("구매 계획 오류:", error);
                            }
                        });

                        // 컨테이너 클릭 이벤트 핸들러
                        newContainer.on("click", function () {
                            var passwordModal = $("#passwordModal");
                            var passwordInput = $("#passwordInput");

                            // 클로저로 현재 클릭한 컨테이너의 savingsData 유지
                            var currentSavingsData = savingsData;
                            // savingsData.challengeSavingsAccountPW 역시 숫자로 변환
                            var savedPassword = parseInt(currentSavingsData.challengeSavingsAccountPW, 10);

                            console.log("내가 클릭한 적금 계좌의 비밀번호 " + savedPassword);

                            // 비밀번호 확인 모달 창 열기
                            passwordModal.css("display", "block");

                            $("#checkPasswordBtn").off("click"); // 이전 클릭 이벤트 핸들러 제거

                            // 새로운 클릭 이벤트 핸들러 연결
                            $("#checkPasswordBtn").on("click", function () {
                                // 내가 입력한거
                                var enteredPassword = parseInt(passwordInput.val(), 10); // 10진수로 변환
                                console.log("내가 입력한 비밀번호 " + enteredPassword + " " + savedPassword);
                                // 입력한 비밀번호와 저장된 비밀번호 비교
                                if (enteredPassword === savedPassword) {
                                    // 비밀번호 일치하는 경우 적금 상세 내용 모달 창 열기
                                    openSavingDetailModal(currentSavingsData);
                                    // alert("비밀번호가 일치");
                                    passwordInput.val(""); // 입력 필드를 비웁니다.
                                    passwordModal.css("display", "none"); // 모달 창 닫기
                                    // ---------------------------------적금 상세 내용 모달 창 열기 함수---------------------------------
                                    function openSavingDetailModal(savingsData) {
                                        // savingsData 객체의 속성을 사용하여 정보 표시
                                        $("#savingPlanName").text(savingsData.planName);
                                        $("#savingAccountNumber").text(savingsData.challengeSavingsAccountNumber);
                                        $("#targetSavingsAmount").text(savingsData.targetSavingsAmount + "원");
                                        $("#targetSavingsPeriod").text(savingsData.targetSavingsPeriod + "개월");
                                        $("#paymentAmount").text(savingsData.paymentAmount + "원");
                                        $("#paymentFrequency").text(savingsData.paymentFrequency);
                                        $("#paymentDay").text(savingsData.paymentDay);
                                        $("#paymentDate").text(savingsData.paymentDate);
                                        $("#transferMethod").text(savingsData.transferMethod);
                                        $("#transferAccount").text(savingsData.transferAccount);
                                        $("#accountBalance").text(savingsData.accountBalance + "원");
                                        $("#expectedPrincipal").text(savingsData.expectedPrincipal + "원");
                                        $("#expectedInterest").text(savingsData.expectedInterest + "원");
                                        $("#expirationOption").text(savingsData.expirationOption);
                                        // savingsData에서 날짜 데이터 가져오기
                                        const startDay = new Date(savingsData.startDay);
                                        const endDay = new Date(savingsData.endDay);

                                        const startDateString = startDay.toLocaleDateString('en-US', {
                                            year: 'numeric',
                                            month: '2-digit',
                                            day: '2-digit'
                                        });
                                        const endDateString = endDay.toLocaleDateString('en-US', {
                                            year: 'numeric',
                                            month: '2-digit',
                                            day: '2-digit'
                                        });
                                        $("#startDay").text(startDateString);
                                        $("#endDay").text(endDateString);

                                        $("#goalAchievementRate").text(savingsData.goalAchievementRate + "%");

                                        // 모달 열기
                                        $("#savingDetailModal").css("display", "block");

                                        // 닫기 버튼 클릭 이벤트
                                        $("#closeDetailModal").click(function () {
                                            $("#savingDetailModal").css("display", "none");
                                        });
                                    }

                                } else {
                                    // 비밀번호 불일치 메시지 표시 또는 처리
                                    alert("비밀번호가 일치하지 않습니다.");
                                    passwordInput.val(""); // 입력 필드를 비웁니다.
                                }
                                // 비밀번호 확인 모달 창 닫기
                                passwordModal.css("display", "none");
                                passwordInput.val(""); // 입력 필드를 비웁니다.
                            });
                        });
                    });
                },
                error: function (error) {
                    console.error("데이터를 불러오는 중 오류 발생:", error);
                }
            });
        });

    </script>


</main>


<!-- 푸터 -->
<%@ include file="include/footer.jsp" %>
<!-- 부트스트랩 JavaScript 연결 -->
<!-- 부트스트랩 CSS 연결 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">

<!-- 부트스트랩 JavaScript 연결 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>

<!— Unpkg AOS 연결 —>
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css">

<!— jQuery 연결 —>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>
