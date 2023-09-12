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

        /* 위시리스트 조회------------------------------------------------------------------------------------------------------- */
        .purchasePlanListTitle {
            margin-top: 48px;
            font-size: 22px;
            font-weight: 600;
            font-family: "Hana2.0 L";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .description-text3 {
            margin-top: 15px;
            margin-left: 1rem;
            padding: 10px;
            font-size: 15px;
            font-weight: 400;
            font-family: "Hana2.0 L";
            color: #A91818;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            /* 	display: flex;
            justify-content: center; */
        }

        /*------------------------------------------------카드*/
        /* 카드 전체에 그림자 효과 추가 */
        .card {
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.4); /* 그림자 효과 추가 */
            transition: transform 0.2s;
            width: 18rem !important;
            height: 17rem !important;
            background-color: #fff !important;
            margin-top: 3rem !important;
            margin-left: 4rem;
        }

        /* 카드에 마우스 호버 시 약간 확대 효과 */
        .card:hover {
            transform: scale(1.02);
        }

        .card-title {
            font-size: 0.8rem;
            font-weight: bold;
            white-space: normal; /* 줄바꿈을 위한 속성 */
            word-wrap: break-word; /* 긴 단어의 줄바꿈을 위한 속성 */
            text-align: center;
        }

        /* 가격 정보 스타일링 */
        .card-text {
            font-size: 0.8rem;
            color: #555;
            margin-bottom: 0.5rem;
            text-align: center;
        }

        /* 표현식 ------------------------------------------------------------------------------------------------------- */
        .purchasePlanListInput {
            margin-top: 4rem !important;
            font-size: 20px;
            font-weight: 600;
            font-family: "Hana2.0 L";
            color: #526185;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .input-container {
            margin-right: 8rem !important;
            margin-top: 50px;
        }

        .endBox {
            margin-right: 8rem !important;
            margin-left: 2rem !important;
            margin-top: 5rem;
            border: 3px solid #ccc;
            padding: 30px;
            border-style: dashed;
            border-radius: 30px;
        }

        .summary {
            word-wrap: break-word; /* 긴 단어의 줄바꿈을 위한 속성 */
            text-align: center;
            font-size: 16px;
            font-weight: 400;
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .comment {
            word-wrap: break-word; /* 긴 단어의 줄바꿈을 위한 속성 */
            text-align: center;
            font-size: 16px;
            font-weight: 600;
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            word-wrap: break-word;
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<%@ include file="include/header.jsp" %>
<body>

<div class="header">

    <hr class="navbar-divider">

    <!-- 사이드바  ------------------------------------------------------------------------------------------------------- -->
    <div class="sidebar">
        <h4>나의 구매계획리스트</h4>
        <ul>
            <li><a href="/checkMyPurchasePlanList">나의 구매계획리스트 조회</a></li>
            <li><a href="/registerMyPurchasePlanList">나의 구매계획리스트 등록</a></li>
            <!-- <li><a href="#">대출신청</a></li>
            <li><a href="#">카드신청</a></li>
            <li><a href="#">고객센터</a></li> -->
        </ul>
    </div>
    <!---메인  ------------------------------------------------------------------------------------------------------- -->
    <main>
        <div class="title">
            <img src="<c:url value='../../resources/img/ic_purchasePlanList.svg' />"
                 alt="Main Wish List" width="80" style="vertical-align: middle;">
            나의 구매계획리스트 등록
        </div>

        <div class="description-box">
            <div class="description-text1">⏳ 목표를 위한 계획을 세워보세요!</div>
            <div class="description-text2">➡️ 구매를 결정했다면, 위시리스트 구매를 위한 대략적인
                나의 구매계획 리스트를 등록해보아요!
            </div>
        </div>
        <hr class="divider">
        <!---위시리스트 조회   ------------------------------------------------------------------------------------------------------- -->

        <div class="purchasePlanListTitle">
            <img src="<c:url value='../../resources/img/ic_purchasePlanList2.svg' />"
                 alt="Main Wish List" width="30"
                 style="vertical-align: middle; transform: rotate(-8deg);"> 간단한
            계획명과 대략적인 목표기간 및 목표금액을 입력하여 나의 나의 구매계획 리스트를 완성해주세요.
        </div>
        <div class="description-text3">
            * 물가변동을 고려하여 목표금액은 현재 상품 가격보다 높을 가격으로 지정하는 것을 추천드립니다. <br> <br>
            * 목표기간은 월 단위로 설정 가능합니다.
        </div>
        <%---------------------------------------------------------------------------------------%>
        <%
            // 세션에서 memberID 가져오기
            String memberID = (String) session.getAttribute("memberID");
        %>

        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <div class="card" style="width: 18rem; margin-top: 2rem;">
                        <div class="text-center">
                            <img id="itemImage" class="card-img-top mx-auto" alt="..."
                                 style="width: 12rem; height: 10.125rem; display: block; margin-top: 1rem;">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title" id="itemTitle"></h5>
                            <p class="card-text" id="itemPrice"></p>
                        </div>
                    </div>
                </div>
                <script>
                    // 세션 스토리지에서 데이터 가져오기
                    const selectedItem = JSON.parse(sessionStorage.getItem("선택된 아이템"));

                    // 가져온 데이터를 화면에 표시
                    if (selectedItem) {
                        const itemTitleElement = document.getElementById("itemTitle");
                        const itemPriceElement = document.getElementById("itemPrice");
                        const itemImageElement = document.getElementById("itemImage");
                        // const wishListID = selectedItem.wishListID;
                        console.log("이 상품의 selectedItem = :", selectedItem);
                        itemTitleElement.textContent = selectedItem.title;
                        itemPriceElement.textContent = selectedItem.price.toLocaleString() + "원";
                        itemImageElement.src = selectedItem.image;
                        itemImageElement.alt = selectedItem.title; // 이미지 대체 텍스트 설정

                    }
                </script>
                <div class="col">
                    <div class="purchasePlanListInput">
                        <div class="memberID" style="display: none"><%=memberID %>
                        </div>
                        <div id="itemWishListID" style="display: none"></div>
                        <div id="itemPrice2" style="display: none"></div>
                        <script>
                            // 세션 스토리지에서 데이터 가져오기
                            const selectedItem2 = JSON.parse(sessionStorage.getItem("선택된 아이템"));

                            // 가져온 데이터를 화면에 표시
                            if (selectedItem2) {
                                const itemWishListIDElement = document.getElementById("itemWishListID");
                                const itemPriceElement = document.getElementById("itemPrice2");
                                // const wishListID = selectedItem.wishListID;
                                console.log("이 상품의 selectedItem2 = :", selectedItem2);
                                itemWishListIDElement.textContent = selectedItem2.wishListID;
                                itemPriceElement.textContent = selectedItem.price;

                            }
                        </script>

                        <div class="input-container" style="text-align: left;">
                            <label for="planName">계획명</label>
                            <input type="text" id="planName" name="planName" placeholder="계획명을 입력하세요" required>
                        </div>
                        <div class="input-container" style="text-align: left;">
                            <label for="planAmount">목표금액</label>
                            <input type="number" id="planAmount" name="planAmount" placeholder="목표금액을 입력하세요" required>
                            <span class="unit">원</span>
                        </div>
                        <div class="input-container" style="text-align: left;">
                            <label for="planPeriod">목표기간</label>
                            <input type="number" id="planPeriod" name="planPeriod" placeholder="목표기간을 입력하세요" required>
                            <span class="unit">개월</span>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <%--  공지사항 -----------------------------------------------------------------------------%>
        <div class="endBox">
            <div class="summary">추후 적금계좌를 개설할 때, 동일한 목표기간을 가진 구매계획 리스트 아이템을
                함께 묶어 계좌를 개설할 수 있습니다.
            </div>
            <br>
            <div class="comment">비슷한 목표를 가진 계획을 묶어서 효율적인 저축 전략을 세우세요!</div>
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
                    <c:url var="registerPurchasePlanListButton"
                           value="../../resources/img/btn_registerPurchasePlanList.svg"/>
                    <a class="registerPurchasePlanListButton"> <img
                            src="${registerPurchasePlanListButton}" alt="버튼"
                            class="registerButton" width="240">
                    </a>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $(".registerButton").click(function (event) {
                    const memberID = $(".memberID").text().trim();
                    const itemWishListID = parseInt($("#itemWishListID").text());
                    const itemPrice2 = parseInt($("#itemPrice2").text());
                    const planName = $("#planName").val();
                    const planAmount = parseInt($("#planAmount").val());
                    const planPeriod = parseInt($("#planPeriod").val());

                    if (planAmount < itemPrice2) {
                        alert("입력하신 금액이 상품의 가격보다 적습니다. 목표 금액을 재설정해주세요.");
                    } else if (planPeriod < 1 || planPeriod > 36) {
                        alert("목표기간은 1개월부터 36개월까지 가능합니다.");
                    } else {
                        // JSON 데이터 생성
                        const requestData = {
                            wishListID: itemWishListID,
                            memberID: memberID,
                            planName: planName,
                            planAmount: planAmount,
                            planPeriod: planPeriod
                        };
                        console.log(requestData);

                        $.ajax({
                            type: "POST",
                            url: "/addPurchasePlanListItem",
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify(requestData),
                            timeout: 10000, // 타임아웃 설정 (10초)
                            success: function (response) {
                                // 리다이렉션 수행
                                window.location.href = "${pageContext.request.contextPath}/getAllPurchasePlanList";
                            },
                            error: function (xhr, status, error) {
                                alert("저장에 실패했습니다.");
                            }
                        });
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

    <!-- Unpkg AOS 연결 -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css">

    <!-- jQuery 연결 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>
