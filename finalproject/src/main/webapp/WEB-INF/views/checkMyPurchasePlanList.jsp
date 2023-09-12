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

        /* 공통 스타일 */
        .btn-container {
            display: flex; /* 요소를 가로로 배치 */
            justify-content: flex-end; /* 오른쪽으로 정렬 */
            margin-right: 6%; /* 우측 여백 추가 */
        }

        .btn {
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            margin-left: 10px; /* 버튼 사이 간격 조절 */
        }

        /* 녹색 버튼 스타일 */
        .btnSuccess {
            background-color: #64827a !important;
            color: white !important;
            font-family: "Hana2.0 CM";
            box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
        }

        /* 파란 버튼 스타일 */
        .btnDanger {
            background-color: #64827a !important;
            color: white !important;
            font-family: "Hana2.0 CM";
            box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
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

    <div class="btn-container"> <!-- 전체 선택 버튼 -->
        <button type="button" class="btn btnSuccess" onclick="selectAll()">전체 선택</button>
        <!-- 전체 삭제 버튼 -->
        <button type="button" class="btn btnDanger" onclick="deleteSelected()">삭제</button>
    </div>

    <!-- 이미지 클릭 시 모달 창 띄우기 -->
    <div class="row">
        <c:forEach var="plan" items="${purchasePlanList}">
            <div class="col-md-4">
                <div class="card mb-4" style="width: 18rem;">
                    <div class="card-header">
                        <input type="checkbox" id="checkboxHeader${plan.purchasePlanID}">
                        <label for="checkboxHeader${plan.purchasePlanID}">${plan.planName}</label>
                    </div>
                    <!-- 이미지 클릭 시 모달 창 열기 -->
                    <img src="${plan.image}"
                         onclick="openModal('${plan.purchasePlanID}', '${plan.planName}', '${plan.planAmount}', '${plan.planPeriod}')"
                         style="display: block; margin: 0 auto; width: 100px; height: 100px;"/>
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
        <script>
            // 모든 체크박스의 ID를 배열로 저장
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');

            // 전체 선택 함수
            function selectAll() {
                checkboxes.forEach(checkbox => {
                    checkbox.checked = true;
                });
            }

            // 전체 삭제 함수
            function deleteSelected(checkbox) {
                const purchasePlanID = checkbox.id.replace("checkboxHeader", "");

                // 선택된 체크박스에 대한 purchasePlanID를 서버로 전송하여 삭제
                fetch("/deletePurchasePlanList", {
                    method: "POST",
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify([purchasePlanID]) // 선택된 ID를 배열로 만들어 JSON으로 변환하여 전송
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            // 삭제가 성공적으로 완료된 경우 화면 갱신 등의 작업 수행
                            window.location.reload(); // 페이지 리로드 또는 다른 업데이트 작업
                        } else {
                            alert("삭제에 실패했습니다.");
                        }
                    })
                    .catch(error => {
                        console.error("오류 발생:", error);
                    });
            }

        </script>
    </div>
    <div class="modal" id="editModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">상품 정보 수정</h5>
                    <button type="button" class="close" onclick="closeModal()">&times;</button>
                </div>
                <div class="modal-body">
                    <form id="editForm">
                        <input type="hidden" id="editPlanID" name="purchasePlanID">
                        <div class="form-group">
                            <label for="editPlanName">상품명:</label>
                            <input type="text" class="form-control" id="editPlanName" name="planName" required>
                        </div>
                        <div class="form-group">
                            <label for="editPlanAmount">목표금액:</label>
                            <input type="number" class="form-control" id="editPlanAmount" name="planAmount" required>
                        </div>
                        <div class="form-group">
                            <label for="editPlanPeriod">목표기간:</label>
                            <input type="number" class="form-control" id="editPlanPeriod" name="planPeriod" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="updatePlan()">저장</button>
                    <button type="button" class="btn btn-secondary" onclick="closeModal()">취소</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // 모달 열기
        function openModal(purchasePlanID, planName, planAmount, planPeriod) {
            console.log(purchasePlanID);
            // 선택한 상품 정보를 모달에 표시
            const plan = document.getElementById("editPlanID").value = purchasePlanID;
            document.getElementById("editPlanName").value = planName;
            document.getElementById("editPlanAmount").value = planAmount;
            document.getElementById("editPlanPeriod").value = planPeriod;

            // 모달 열기
            $("#editModal").modal("show");
        }

        function closeModal() {
            $('#editModal').modal('hide');
        }


        // 계획 업데이트 함수
        function updatePlan() {
            // 선택한 상품 정보 가져오기
            const purchasePlanID = document.getElementById("editPlanID").value;
            const planName = document.getElementById("editPlanName").value;
            const planAmount = document.getElementById("editPlanAmount").value;
            const planPeriod = document.getElementById("editPlanPeriod").value;

            // JSON 데이터 생성
            const jsonData = {
                purchasePlanID,
                planName,
                planAmount,
                planPeriod
            };

            // AJAX를 사용하여 JSON 데이터를 서버로 전송
            fetch("/updatePurchasePlanListInfo", {
                method: "POST",
                body: JSON.stringify(jsonData),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
                .then(response => response.json())
                .then(data => {
                    if (data.message === "업데이트가 성공했습니다.") {
                        // 성공한 경우 알림 창 띄우기
                        alert("업데이트가 성공했습니다.");
                        // 모달 닫기
                        $("#editModal").modal("hide");
                        // 페이지 리로드 또는 업데이트된 데이터를 화면에 반영
                        window.location.reload(); // 페이지 리로드
                    } else {
                        alert("업데이트에 실패했습니다.");
                    }
                })
                .catch(error => {
                    console.error("오류 발생:", error);
                });
        }
    </script>

    <div class="ButtonContainer ">
        <div class="row">
            <div class="col">
                <c:url var="goMakeAccountButton" value="../../resources/img/btn_goMakeAccount.svg"/>
                <a class="goMakeAccountButton" href="${pageContext.request.contextPath}/registerMyPaymentPlan"> <img
                        src="${goMakeAccountButton}" alt="버튼" class="goMakeAccountButton">
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
