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

        .purchasePlanListTitle {
            margin-top: 48px;
            font-size: 24px;
            font-weight: 500;
            font-family: "Hana2.0 L";
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
            font-family: "Hana2.0 CM";
        }

        .card-header input[type="checkbox"] {
            margin-right: 0.5rem;
        }

        .list-group-item {
            font-size: 0.7rem;
            border: none;
            font-family: "Hana2.0 L";
            padding: 1rem !important;
            background-color: #F7F7F7;
        }

        .list-group-item price {
            font-size: 0.7rem;
            border: none;
            font-family: "Hana2.0 L";
            padding: 1rem !important;
            background-color: #F7F7F7;

        }

        .title-text {
            white-space: nowrap; /* 줄바꿈 숨김 처리 */
            overflow: hidden; /* 넘치는 내용 숨김 처리 */
            text-overflow: ellipsis; /* 생략 부호(...) 추가 */
            max-width: 100%; /* 가로 너비 최대값 설정 */
            display: inline-block; /* 줄바꿈 요소를 블록 요소로 표시 */
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
    </style>

    <!-- 부트스트랩 연결 -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<%@ include file="include/header.jsp" %>
<body>
<!-- 사이드바  ------------------------------------------------------------------------------------------------------- -->
<div class="sidebar">
    <h4>나의 구매계획리스트</h4>
    <ul>
        <li><a href="checkMyPurchasePlanList.jsp">나의 구매계획리스트 조회</a></li>
        <li><a href="registerMyPurchasePlanList.jsp">나의 구매계획리스트 등록</a></li>
        <!-- <li><a href="#">대출신청</a></li>
        <li><a href="#">카드신청</a></li>
        <li><a href="#">고객센터</a></li> -->
    </ul>
</div>
<!---메인  ------------------------------------------------------------------------------------------------------- -->
<main>
    <div class="title">
        <img src="<c:url value='../../resources/img/ic_wishList.svg' />" alt="Main Wish List"
             width="80" style="vertical-align: middle;"> 나의 구매계획리스트 조회
    </div>

    <div class="description-box">
        <div class="description-text1">🌻 구매계획을 바탕으로 적금 챌린지 계좌에 도전해보세요
            !
        </div>
        <div class="description-text2">➡️ 동일한 목표기간을 가진 구매계획 리스트 아이템을 함께
            묶어 계좌를 개설하여 효율적으로 챌린지를 달성해보세요!
        </div>
    </div>
    <hr class="divider">
    <!---위시리스트 조회   ------------------------------------------------------------------------------------------------------- -->

    <div class="purchasePlanListTitle">◆ 나의 구매계획리스트 목록</div>
    <div class="row">
        <c:forEach var="plan" items="${purchasePlanList}">
            <div class="col-md-4">
                <div class="card mb-4" style="width: 18rem;">
                    <div class="card-header">
                        <input type="checkbox" id="checkboxHeader4"> <label
                            for="checkboxHeader4"> ${plan.planName}</label>
                    </div>
                    <img src="${plan.image}"
                         style="display: block; margin: 0 auto;width: 100px; height: 100px;">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item" style="display: none">구매계획아이디: ${plan.purchasePlanID}</li>
                        <li class="list-group-item" style="display: none">위시리스트아이디: ${plan.wishListID}</li>
                        <li class="list-group-item title-text">상품명: ${plan.title}</li>
                        <li class="list-group-item price">상품금액: ${plan.price} 원</li>
                        <li class="list-group-item price">목표금액: ${plan.planAmount} 원</li>
                        <li class="list-group-item">목표기간: ${plan.planPeriod}개월</li>
                    </ul>
                </div>
            </div>
        </c:forEach>
    </div>
    <!-- 모달 팝업 -->
    <div id="updateModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">계획 수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="닫기">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="updateForm">
                        <div class="form-group">
                            <label for="planName">상품명:</label>
                            <input type="text" class="form-control" id="planName" name="planName" required>
                        </div>
                        <div class="form-group">
                            <label for="planAmount">목표금액:</label>
                            <input type="number" class="form-control" id="planAmount" name="planAmount" required>
                        </div>
                        <div class="form-group">
                            <label for="planPeriod">목표기간:</label>
                            <input type="number" class="form-control" id="planPeriod" name="planPeriod" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="updatePlanBtn">저장</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var priceElements = document.querySelectorAll(".price");
            var titleElements = document.querySelectorAll(".title-text");

            priceElements.forEach(function (element) {
                var price = element.textContent.trim().replace(/\D/g, ""); // 숫자 이외의 문자 제거
                var formattedPrice = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                element.textContent = "상품금액: " + formattedPrice + " 원";
            });

            titleElements.forEach(function (element) {
                if (element.offsetWidth < element.scrollWidth) {
                    element.title = element.textContent.trim(); // 원래 내용을 title 속성에 저장
                    element.textContent = element.textContent.trim().substring(0, 35) + " ..."; // 생략 부호 추가
                }
            });

            // 수정 버튼 클릭 시 모달 열기
            var updateBtns = document.querySelectorAll(".btn-update");

            updateBtns.forEach(function (btn) {
                btn.addEventListener("click", function () {
                    var card = btn.closest(".card");
                    var planName = card.querySelector(".title-text").textContent.split(": ")[1];
                    var planAmount = card.querySelector(".price:nth-child(4)").textContent.split(": ")[1].replace(/\D/g, "");
                    var planPeriod = card.querySelector(".list-group-item:nth-child(7)").textContent.split(": ")[1].replace(/\D/g, "");

                    document.getElementById("planName").value = planName;
                    document.getElementById("planAmount").value = planAmount;
                    document.getElementById("planPeriod").value = planPeriod;

                    $("#updateModal").modal("show");
                });
            });

            // 업데이트 버튼 클릭 시 AJAX 요청
            var updatePlanBtn = document.getElementById("updatePlanBtn");

            updatePlanBtn.addEventListener("click", function () {
                var planName = document.getElementById("planName").value;
                var planAmount = document.getElementById("planAmount").value;
                var planPeriod = document.getElementById("planPeriod").value;

                var formData = new FormData();
                formData.append("planName", planName);
                formData.append("planAmount", planAmount);
                formData.append("planPeriod", planPeriod);

                fetch("/updatePurchasePlanListInfo", {
                    method: "POST",
                    body: formData
                })
                    .then(function (response) {
                        if (response.ok) {
                            return response.json();
                        }
                        throw new Error("Network response was not ok.");
                    })
                    .then(function (data) {
                        if (data.success) {
                            $("#updateModal").modal("hide");
                            // 여기에서 필요한 업데이트 작업을 수행하십시오.
                        } else {
                            alert("업데이트에 실패했습니다.");
                        }
                    })
                    .catch(function (error) {
                        console.error("Error:", error);
                    });
            });
        });
    </script>

    <div class="ButtonContainer ">
        <div class="row">
            <div class="col">
                <c:url var="goMakeAccountButton" value="../../resources/img/btn_goMakeAccount.svg"/>
                <a class="goMakeAccountButton" href="${pageContext.request.contextPath}/createAccount"> <img
                        src="${goMakeAccountButton}" alt="버튼" class="goMakeAccountButton"
                >
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
