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
        .calculation-container {
            border: dashed 3px;
            border-color: #787676;
            border-radius: 10px;
            margin-right: 5%;
            margin-top: 3%;
        }

        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            max-width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .modal-content {
            margin: 20% auto;
            padding: 20px;
            border: 1px solid #888;
            font-family: "Hana2.0 CM";
            font-size: 24px;
            max-width: 60%;
            background-color: #ffb700 !important;
            display: flex;
            justify-content: center;
            align-content: center;
            text-align: center;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .wishListDetailTitle {
            margin-top: 48px;
            font-size: 24px;
            font-weight: 600;
            font-family: "Hana2.0 CM";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .card-img-top {
            border-radius: 0.5rem 0.5rem 0 0;
        }

        /* 카드 전체에 그림자 효과 추가 */
        .card {
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.4); /* 그림자 효과 추가 */
            transition: transform 0.2s;
            width: 14rem !important;
            background-color: #fff !important;
            height: 240px; /* 원하는 크기로 조절 */
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
        #amountImage {
            max-width: 200px;
            margin-top: 40%;
            margin-left: -7rem;
        }

        #amountPrice {
            margin-top: 10%;
            margin-left: -7rem;
            font-family: "Hana2.0 CM";
        }

        #categoryImage {
            max-width: 200px;
            margin-left: -7rem;
            margin-top: 24%;
        }

        #categoryPrice {
            margin-top: 40%;
            margin-left: -7rem;
            font-family: "Hana2.0 CM";
        }

        .wishListDetailEqual {
            margin-top: 7rem !important;
            font-size: 60px;
            font-weight: 600;
            font-family: 'Helvetica', sans-serif;
            color: #526DB0;
            margin-left: -7rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .wishListDetaMultiply {
            margin-top: 7rem !important;
            font-size: 60px;
            font-weight: 600;
            font-family: 'Helvetica', sans-serif;
            color: #526DB0;
            margin-left: -10rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .calculate-text {
            margin-top: 7rem !important;
            margin-left: -7rem;
            width: 200px;
            height: 100px;
            border: dotted 3px;
            border-radius: 20%;
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            text-align: center;
            font-size: 24px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            animation: slideIn 1s; /* 애니메이션 적용 및 지속 시간 설정 */
        }
        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        .summary {
            margin-top: 2rem;
            margin-left: 4rem;
            word-wrap: break-word; /* 긴 단어의 줄바꿈을 위한 속성 */
            text-align: center;
            font-size: 20px;
            font-family: "Hana2.0 L";
            font-weight: 100;
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            padding-bottom: 1rem;
        }

        .random-comment {
            margin-top: 1rem;
            display: flex;
            justify-content: center;
            word-wrap: break-word; /* 긴 단어의 줄바꿈을 위한 속성 */
            font-size: 36px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            word-wrap: break-word;
            color: #7ba299;
        }

        .notice {
            margin-top: 2%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            font-family: "Hana2.0 L";
        }

        .ButtonContainer {
            margin-top: 4%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .deleteWishListButton {
            margin-right: 1rem;
        }

        .goPurchasePlanListButton {
            margin-left: 1rem;
        }


    </style>
    <!-- 부트스트랩 연결 -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<%@ include file="include/header.jsp" %>
<body>

<div class="header">

    <!-- 사이드바  ------------------------------------------------------------------------------------------------------- -->
    <div class="sidebar">
        <h3>나의 위시리스트</h3>
        <ul>
            <li><a href="checkMyWishList">나의 위시리스트 조회</a></li>
            <li><a href="registerMyWishList">나의 위시리스트 등록</a></li>
            <!-- <li><a href="#">대출신청</a></li>
            <li><a href="#">카드신청</a></li>
            <li><a href="#">고객센터</a></li> -->
        </ul>
    </div>
    <!---메인  ------------------------------------------------------------------------------------------------------- -->
    <main>
        <div class="title">
            <img src="<c:url value='../../resources/img/ic_wishList.svg' />" alt="Main Wish List"
                 width="80" style="vertical-align: middle;"> 나의 위시리스트 상세조회
        </div>

        <div class="description-box">
            <div class="description-text1">📚 가격 뒤에 숨은 가치를 발견하세요!</div>
            <div class="description-text2">➡️ 나의 지출 소비태그를 활용하여 아이템의 가격을 실질적으로 체감해보고 구매를 고려해보아요!
            </div>
        </div>
        <hr class="divider">
        <!---위시리스트 조회   ------------------------------------------------------------------------------------------------------- -->

        <%
            // 세션에서 memberID 가져오기
            String memberID = (String) session.getAttribute("memberID");
            // 세션에서 name 가져오기
            name = (String) session.getAttribute("name");
        %>
        <div class="wishListDetailTitle">
            <img src="<c:url value='../../resources/img/ic_calculator.svg' />" alt="Main Wish List"
                 width="50" style="vertical-align: middle; transform: rotate(-8deg);">
            이번 달 <%=name %>님은
        </div>
        <div class="calculation-container">
            <div class="container text-center">
                <div class="row">
                    <div class="col">
                        <div class="card" style="width: 18rem; margin-top: 2rem;">
                            <div class="text-center">
                                <img id="itemImage" class="card-img-top mx-auto" alt="..."
                                     style="width: 10rem; height: 8.125rem; display: block; margin-top: 1rem;">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title" id="itemTitle"></h5>
                                <p class="card-text" id="itemPrice"></p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="wishListDetailEqual">=</div>
                    </div>
                    <div class="col">
                        <div class="expenseTagImg"></div>
                    </div>
                    <div class="col">
                        <div class="wishListDetaMultiply">x</div>
                    </div>
                    <div class="col">
                        <div class="calculate-text"></div>
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
                    const wishListID = selectedItem.wishListID;
                    console.log("이 상품의 WishListID = :", wishListID);

                    itemTitleElement.textContent = selectedItem.title;
                    itemPriceElement.textContent = selectedItem.price.toLocaleString() + "원";
                    itemImageElement.src = selectedItem.image;
                    itemImageElement.alt = selectedItem.title; // 이미지 대체 텍스트 설정

                }
            </script>

            <script>
                var selectedMonthlyKing = localStorage.getItem("selectedMonthlyKing");
                var categoryRepresentativePriceTmp = localStorage.getItem("categoryRepresentativePriceTmp");
                var categoryImgTmp = localStorage.getItem("categoryImgTmp");
                var amountRepresentativePriceTmp = localStorage.getItem("amountRepresentativePriceTmp");
                var amountImgTmp = localStorage.getItem("amountImgTmp");

                // 데이터를 활용하여 원하는 작업 수행
                console.log('Selected Monthly King:', selectedMonthlyKing);

                if (selectedMonthlyKing === "#monthlyKing1") {
                    console.log('Category Representative Price:', categoryRepresentativePriceTmp);
                    console.log('Category Image Source:', categoryImgTmp);

                    // 카테고리 관련 이미지를 동적으로 생성하여 화면에 추가
                    var categoryImageElement = document.createElement("img");
                    categoryImageElement.id = "categoryImage";
                    categoryImageElement.src = "../../resources/img/" + categoryImgTmp;
                    categoryImageElement.alt = "Category Image";

                    document.querySelector(".expenseTagImg").appendChild(categoryImageElement);

                    // 카테고리 가격을 동적으로 생성하여 화면에 추가하고 "원"을 추가
                    var categoryPriceElement = document.createElement("p");
                    categoryPriceElement.id = "categoryPrice";
                    categoryPriceElement.textContent = categoryRepresentativePriceTmp + " 원";
                    document.querySelector(".expenseTagImg").appendChild(categoryPriceElement);
                } else if (selectedMonthlyKing === "#monthlyKing2") {
                    console.log('Amount Representative Price:', amountRepresentativePriceTmp);
                    console.log('Amount Image Source:', amountImgTmp);
                    // 양 관련 이미지를 동적으로 생성하여 화면에 추가
                    var amountImageElement = document.createElement("img");
                    amountImageElement.id = "amountImage";
                    amountImageElement.src = "../../resources/img/" + amountImgTmp;
                    amountImageElement.alt = "Amount Image";
                    document.querySelector(".expenseTagImg").appendChild(amountImageElement);

                    // 양 가격을 동적으로 생성하여 화면에 추가
                    var amountPriceElement = document.createElement("p");
                    amountPriceElement.id = "amountPrice";
                    amountPriceElement.textContent = amountRepresentativePriceTmp + " 원";
                    document.querySelector(".expenseTagImg").appendChild(amountPriceElement);
                }
            </script>
            <!-- 모달 창 -->
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <p></p>
                </div>
            </div>

            <script>
                let itemPrice = parseInt(selectedItem.price); // 문자열을 정수로 변환하여 가격값 저장
                console.log("상품 가격: " + itemPrice);

                var selectedPrice; // 선택된 가격을 저장할 변수를 선언합니다.

                if (selectedMonthlyKing === "#monthlyKing1") {
                    selectedPrice = parseInt(categoryRepresentativePriceTmp.replace(/,/g, '')); // 쉼표를 제거하고 정수로 변환
                } else if (selectedMonthlyKing === "#monthlyKing2") {
                    selectedPrice = parseInt(amountRepresentativePriceTmp.replace(/,/g, '')); // 쉼표를 제거하고 정수로 변환
                }
                console.log("소비태그 대표가격: " + selectedPrice);

                var dayResult;

                if (itemPrice >= selectedPrice) {
                    dayResult = Math.round(itemPrice / selectedPrice); // 나눈 몫을 반올림
                    console.log("dayResult 값: " + dayResult);
                } else {
                    // itemPrice가 selectedPrice보다 작은 경우
                    dayResult = 1;
                    console.log("dayResult 값: " + dayResult);

                    // 모달 열기
                    const modal = document.getElementById("myModal");
                    const modalContent = document.querySelector(".modal-content");

                    modalContent.innerHTML = "위시리스트 아이템 가격이 나의 소비에 비해 저렴하므로<br><br>챌린지 적금 상품에 적합할지 다시 한 번 고려해보세요!";

                    modal.style.display = "block";

                    // 3초 후에 모달 창을 숨김
                    setTimeout(function () {
                        modal.style.display = "none";
                    }, 4000); // 3000 밀리초 (3초)
                }
                // .calculate-text 요소를 선택하고 결과 값을 설정
                const calculateTextElement = document.querySelector(".calculate-text");
                calculateTextElement.textContent = dayResult + " times";

            </script>

            <script>
                console.log("dayResult 값: " + dayResult);
                document.addEventListener('DOMContentLoaded', function () {
                    var cardID = localStorage.getItem('cardID');

                    var xhr = new XMLHttpRequest();
                    xhr.open('GET', '/checkMyExpenseData?cardID=' + cardID, true);

                    xhr.onload = function () {
                        if (xhr.status === 200) {
                            var responseData = JSON.parse(xhr.responseText);

                            var selectedMonthlyKing = localStorage.getItem("selectedMonthlyKing");
                            var topCategorySubCategoryDescription = responseData.topCategorySubCategoryDescription.subCategoryDescription;
                            var topAmountSubCategoryDescription = responseData.topAmountSubCategoryDescription.subCategoryDescription;

                            if (selectedMonthlyKing === "#monthlyKing1") {
                                var topCategorySubCategoryDescriptionElement = document.createElement("p");
                                topCategorySubCategoryDescriptionElement.id = "topCategorySubCategoryDescriptionElement";
                                topCategorySubCategoryDescriptionElement.textContent = "'" + topCategorySubCategoryDescription + "'"
                                    + "에 해당하는 지출을 대략 " + dayResult + " 정도 절약하면 해당 아이템을 구매하실 수 있습니다."; // 데이터 추가
                                document.querySelector(".summary").appendChild(topCategorySubCategoryDescriptionElement);
                            } else if (selectedMonthlyKing === "#monthlyKing2") {
                                var topAmountSubCategoryDescriptionElement = document.createElement("p");
                                topAmountSubCategoryDescriptionElement.id = "topAmountSubCategoryDescriptionElement";
                                topAmountSubCategoryDescriptionElement.textContent = "'" + topAmountSubCategoryDescription + "'" + "에 해당하는 지출을 대략 " + dayResult + "번 정도 절약하면 해당 아이템을 구매하실 수 있습니다."; // 데이터 추가
                                document.querySelector(".summary").appendChild(topAmountSubCategoryDescriptionElement);
                            }
                        } else {
                            console.error('Request failed. Status: ' + xhr.status);
                        }
                    };

                    xhr.send();
                });
            </script>

            <div class="summary"></div>
        </div>
        <br>

        <div>
            <div class="random-comment"></div>
        </div>


        <script>
            // 랜덤한 멘트 배열
            const comments = [
                "목표를 이루기 위해 소비를 신중하게 선택하세요!",
                "소비의 진정한 가치는 만족감보다는 목표 달성에 기여하는 것입니다!",
                "물건의 크기보다는 목표의 크기를 고려해 소비를 선택하세요!",
                "적은 소비가 큰 목표 달성을 위한 첫 걸음입니다!",
                "목표를 이루기 위해 소비를 신중하게 선택하세요!",
                "목표에 맞지 않는 소비는 진정한 가치가 없습니다!",
                "소비는 목표 달성의 도구이며, 목적없는 소비는 비효율적입니다!",
                "소비에 앞서 목표를 생각하고, 더 나은 선택을 하세요!",
                "저번 달의 지출을 토대로 합리적인 소비 습관을 형성하세요!"
            ];

            // 랜덤한 인덱스 생성
            const randomIndex = Math.floor(Math.random() * comments.length);
            // 선택된 멘트를 HTML 요소에 추가
            const randomCommentElement = document.querySelector(".random-comment");
            randomCommentElement.textContent = comments[randomIndex];
        </script>
        <div class="notice"> ➢ 위시리스트를 삭제하고 싶다면 위시리스트 삭제 버튼을 눌러주시고, 구매를 원하신다면 구매계획 리스트를 클릭하여 구매계획을 등록해보세요.</div>

        <div class="ButtonContainer">
            <div class="row">
                <div class="col">
                    <img
                            src="../../resources/img/btn_deleteWishList.svg"
                            alt="버튼"
                            class="deleteWishListButton"
                            id="deleteWishListButton">
                </div>

                <script>
                    // 이미지를 클릭했을 때 실행할 함수
                    document.getElementById("deleteWishListButton").addEventListener("click", function () {
                        // 선택된 아이템의 title 값을 가져옵니다.
                        const selectedItemTitle = selectedItem.title;
                        console.log(selectedItemTitle);
                        // URL에 파라미터를 추가한 후 /deleteWishList URL로 이동
                        window.location.href = "/deleteWishList?title=" + encodeURIComponent(selectedItemTitle);
                    });

                </script>

                <div class="col">
                    <c:url var="goPurchasePlanListButton"
                           value="../../resources/img/btn_goPurchasePlanList.svg"/>
                    <a class="goPurchasePlanListButton"
                       href="/registerMyPurchasePlanList"> <img
                            src="${goPurchasePlanListButton}" alt="버튼"
                            class="goPurchasePlanListButton">
                    </a>
                </div>
            </div>
        </div>

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
