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
            background-color: #f0f0f0;
            border-radius: 10px;
            padding: 20px;
            margin-top: 30px;
            width: 90% !important;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            margin-left: 0 !important;
        }

        /* 적금 계좌 정보 스타일 */
        .savingTitle {
            color: #333;
            font-family: "Hana2.0 CM";
            font-size: 24px;
            margin: 0;
        }

        .savingProgressInfo {
            color: #555;
            font-family: "Hana2.0 L";
            font-size: 16px;
            margin: 5px 0;
        }

        /* 구매 계획 리스트 스타일 */
        .purchase-plans {
            margin-top: 20px;
        }

        .plan-item {
            background-color: #fff;
            border-radius: 5px;
            padding: 10px;
            margin: 10px 0;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
        }

        .plan-item-title {
            color: #333;
            font-family: "Hana2.0 CM";
            font-size: 18px;
            margin: 0;
        }

        .plan-item-title-progress-bar {
            color: #555;
            font-size: 16px;
            font-family: "Hana2.0 L";
            margin: 0;
        }

        /* 프로그레스 바 스타일 */
        .progress-bar {
            height: 10px;
            background-color: #ddd !important;
            border-radius: 5px;
            margin-top: 10px;
        }

        .progress {
            height: 100%;
            border-radius: 5px;
            background-color: #6a978d !important;
            width: 50%; /* 목표 달성률에 따라 조절하세요 */
        }
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
    <div class="container">
        <div class="savingTitle">적금 계좌 1</div>
        <div class="savingProgressInfo">계좌 진행률: 70%</div>
        <!-- 가장 큰 챌린지의 구매 계획 리스트 -->
        <div class="purchase-plans">
            <div class="plan-item">
                <div class="plan-item-title">구매 계획 1</div>
                <div class="plan-item-title-progress-bar">목표 달성률: 50%</div>
                <div class="progress-bar">
                    <div class="progress" style="width: 50%;"></div>
                </div>
            </div>
            <div class="plan-item">
                <div class="plan-item-title">구매 계획 2</div>
                <div class="plan-item-title-progress-bar">목표 달성률: 75%</div>
                <div class="progress-bar">
                    <div class="progress" style="width: 75%;"></div>
                </div>
            </div>
        </div>
    </div>
    <script>
        // Ajax 요청을 통해 ChallengeSavings 데이터 가져오기
        $.ajax({
            type: "GET",
            url: "/getAllChallengeSavings",
            success: function (data) {
                var container = document.querySelector(".container");

                data.forEach(function (challengeSavings) {
                    var planName = challengeSavings.planName;

                    // 새로운 컨테이너 엘리먼트 생성
                    var newContainer = document.createElement("div");
                    newContainer.className = "container";

                    // 적금 계좌 타이틀 추가
                    var savingTitleElement = document.createElement("div");
                    savingTitleElement.className = "savingTitle";
                    savingTitleElement.textContent = "적금 계좌 " + planName;
                    newContainer.appendChild(savingTitleElement);

                    // 계좌 진행률 정보 등의 내용 추가 (필요에 따라 추가)

                    // 구매 계획 리스트 추가
                    var purchasePlansContainer = document.createElement("div");
                    purchasePlansContainer.className = "purchase-plans";

                    // 예시: 두 개의 구매 계획을 추가
                    for (var i = 1; i <= 2; i++) {
                        var planItem = document.createElement("div");
                        planItem.className = "plan-item";

                        // 구매 계획 타이틀 추가
                        var planItemTitle = document.createElement("div");
                        planItemTitle.className = "plan-item-title";
                        planItemTitle.textContent = "구매 계획 " + i;
                        planItem.appendChild(planItemTitle);

                        // 목표 달성률 추가 (예시로 50%와 75%)
                        var planItemTitleProgressBar = document.createElement("div");
                        planItemTitleProgressBar.className = "plan-item-title-progress-bar";
                        planItemTitleProgressBar.textContent = "목표 달성률: " + (i === 1 ? "50%" : "75%");
                        planItem.appendChild(planItemTitleProgressBar);

                        // 프로그레스 바 추가 (예시로 50%와 75%)
                        var progressBarContainer = document.createElement("div");
                        progressBarContainer.className = "progress-bar";

                        var progressBar = document.createElement("div");
                        progressBar.className = "progress";
                        progressBar.style.width = i === 1 ? "50%" : "75%";
                        progressBarContainer.appendChild(progressBar);

                        planItem.appendChild(progressBarContainer);

                        // 구매 계획을 구매 계획 리스트에 추가
                        purchasePlansContainer.appendChild(planItem);
                    }

                    // 구매 계획 리스트를 컨테이너에 추가
                    newContainer.appendChild(purchasePlansContainer);

                    // 생성한 컨테이너를 원래 컨테이너에 추가
                    container.appendChild(newContainer);
                });
            },
            error: function (error) {
                console.log("오류:", error);
            }
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

<!-- Unpkg AOS 연결 -->
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css">

<!-- jQuery 연결 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>
