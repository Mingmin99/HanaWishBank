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

        .carouselExampleIndicators {
            background-image: linear-gradient(to bottom, #9dcabf, #4e72a0);
        }

        .carouselExampleIndicators2 {
            background-image: linear-gradient(to bottom, #9dcabf, #4e72a0);
        }

        #carouselExampleIndicators .section1 {
            background-image: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
            border-radius: 20px;
            margin: 20px;
        }

        #carouselExampleIndicators .hello-word {
            margin-top: -50px;
            margin-left: 15%;
            margin-right: 5%;
            text-align: left;
            white-space: nowrap;
        }

        #carouselExampleIndicators .title {
            font-size: 48px;
            margin-left: 1%;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        #carouselExampleIndicators .subtitle {
            margin-top: 30px;
            margin-left: 8%;
            font-family: "Hana2.0 L";
            font-weight: 500;
            font-size: 26px;
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        #carouselExampleIndicators title, #carouselExampleIndicators .subtitle {
            /* 애니메이션 규칙 추가 */
            animation: fadeIn 2s ease-in-out;
        }

        .container-box {
            background-image: linear-gradient(to top, #feada6 0%, #f5efef 100%);
            border: 3px #a7a7a7;
            border-radius: 20px;
            margin: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 설정 */
        }

        .content {
            display: flex;
            align-items: center;
            height: 400px;
            /* This centers the content vertically (optional) */
        }

        .section1 {
            align-items: center;
            display: flex;
        }

        .menu-bar {
            margin: 20px;
            /*background-color: #333; !* 배경색 설정 *!*/
            background-image: linear-gradient(to right, #eea2a2 0%, #bbc1bf 19%, #57c6e1 42%, #b49fda 79%, #7ac5d8 100%);
            padding: 10px; /* 위아래 여백 설정 */
            border-radius: 20px; /* 모서리 둥글게 만들기 */
        }

        /* Style the row within the menu bar */
        .menu-bar .row {
            display: flex;
            justify-content: space-between; /* 아이템 사이의 간격을 균일하게 조절 */
        }

        /* Style the menu item container */
        .menu-bar .col {
            text-align: center;
            padding: 10px; /* 내부 여백 설정 */
            flex: 1; /* 아이템이 동일한 너비를 갖도록 함 */
        }

        /* Style the menu icons */
        .menu-icon {
            width: 70px; /* 아이콘의 크기 설정 */
            height: 70px;
        }
        /* Define a bounce animation */
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-10px); /* 이동 거리 및 시간을 조절하여 원하는 바운스 효과를 얻을 수 있습니다. */
            }
            60% {
                transform: translateY(-5px);
            }
        }

        /* Apply the bounce animation to .menu-item */
        .menu-item {
            font-family: "Hana2.0 CM";
            color: #333333;
            text-decoration: none;
            display: block;
            animation: bounce 0.5s ease; /* 애니메이션을 한 번만 재생하도록 설정 */
            animation-fill-mode: forwards; /* 애니메이션 종료 시 마지막 상태 유지 */}

        /* Add a hover effect on menu items */
        .menu-item:hover {
            background-color: #faf9f9; /* 호버 상태 배경색 설정 */
            border-radius: 5px; /* 호버 상태에서 모서리 둥글게 만들기 */
            transition: background-color 0.3s; /* 부드러운 색상 전환을 위한 트랜지션 추가 */
        }

        /*--------------------*/
        .timeRegisterWishListItemsTitle {
            padding: 10px;
            font-size: 32px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            margin-left: 8rem;
            margin-top: 5rem;
            color: #4a4949;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .timeRegisterWishListItemsSubTitle {
            padding: 10px;
            font-size: 24px;
            font-weight: 500;
            margin-left: 8rem;
            margin-top: 5rem;
            color: #4a4949;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            font-family: "Hana2.0 CM";
        }

        .mainWishListRecommendMent img {
            margin-left: 5rem;
            margin-top: 2rem;
        }

        .btn_mainRegisterMyWishListItem img {
            margin-left: 220px; /* 원하는 픽셀 단위의 값으로 조정 */
            margin-top: -500px; /* 원하는 픽셀 단위의 값으로 조정 */
        }

        .mainCardContainer {
            margin-right: 50px;
            margin-top: 4%;
        }

        #item-container {
            max-width: 600px; /* 원하는 최대 너비 설정 */
            margin: 0 auto; /* 가운데 정렬을 위해 좌우 여백을 자동으로 설정 */
            padding: 10px; /* 내부 여백 설정 (원하는 값으로 조정) */
        }

        .card {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
            margin: 1rem;

        }

        .card-body {
            font-family: "Hana2.0 CM";
        }

        /* 카드에 마우스 호버 시 약간 확대 효과 */
        .card:hover {
            transform: scale(1.02);
        }

        .card-img-top {
            border-radius: 3rem 3rem 0 0;
            display: block;
            margin: 1rem auto;
        }

        .itemTitle {
            font-weight: bolder;
            margin-bottom: 1rem;
            white-space: normal; /* 줄바꿈을 위한 속성 */
            word-wrap: break-word; /* 긴 단어의 줄바꿈을 위한 속성 */
            text-align: center;
            color: #555;
            font-family: "Hana2.0 L";
        }


        .item-price {
            font-size: 1rem;
            color: #555;
            margin-bottom: 0.5rem;
            text-align: center;
            justify-content: center;
            align-items: center;
            font-family: "Hana2.0 L";
        }

        .separator {
            width: 90%;
            height: 1px;
            margin: 0 auto; /* 가운데 정렬을 위해 margin을 auto로 설정 */
            margin-top: 30px;
            background-color: rgb(123, 162, 153);
            filter: blur(2px);
        }

        /*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
        .section3 {
            background-color: #ffffff;
        }

        .infoContainer {
            background-image: linear-gradient(-225deg, #E3FDF5 0%, #FFE6FA 100%);
            border: 3px #a7a7a7;
            border-radius: 20px;
            margin: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 설정 */
            padding: 20px;

        }

        .section-title {
            padding: 10px;
            font-size: 32px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            margin-left: 4%;
            color: #6a978d;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .box-container .notice-cards {
            display: flex;
            flex-wrap: wrap;
        }

        .box-container .notice-card {
            background-color: #fff;
            border: 1px #4a4949;
            border-radius: 5px;
            padding: 10px;
            margin: 10px;
            flex: 0 1 calc(33.33% - 20px);
        }

        .box-container .card-title {
            font-weight: bold;

        }

        .box-container .card-content {
            margin-top: 10px;
            color: #4a4949;
        }

        .notice-table {
            width: 100%;
            border-collapse: collapse;
        }

        .notice-table th, .notice-table td {
            padding: 10px;
            border: 0.5px solid #4a4949;
        }

        .notice-table th {
            font-size: 18px;
            font-weight: bold;
            color: #4a4949;
        }

        .notice-table td {
            font-size: 16px;
            color: #4a4949;
        }

        .notice-cards {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .notice-card {
            border: 1px solid #4a4949;
            padding: 10px;
            margin: 10px;
            width: 30%; /* 카드 너비 조정 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #fff;
            border-radius: 5px;
        }

        .card-title {
            font-weight: bold;
        }

        .card-date {
            color: #4a4949;
            font-size: 14px;
            margin-top: 5px;
        }

        .card-content {
            margin-top: 10px;
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

<div id="carouselExampleIndicators" class="carousel slide"
     data-bs-ride="true">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide-to="0" class="active" aria-current="true"
                aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div id="carouselExampleIndicators2" class="carousel slide"
         data-bs-ride="true">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide-to="0" class="active" aria-current="true"
                    aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="section1">
                    <!-- 섹션 1 내용 -->
                    <div class="content">
                        <div class="hello-word">
                            <p class="title">🔎 저번 달에 돈을 얼마나 썼지?</p>
                            <p class="subtitle">
                                👀 한 눈에 확인하는 나만의 소비패턴 <br> 하나위시뱅크에서 나의 소비를 확인해봐 !!
                            </p>
                        </div>
                        <div class="img-container">
                            <c:url var="logoUrl" value="../../resources/img/mainpattern.png"/>
                            <a class="mainPattern" href=#> <img src="${logoUrl}"
                                                                alt="소비내역" class="mainPattern-img" width="450px;">
                            </a>
                        </div>
                    </div>
                </div>
            </div>


            <div class="carousel-item">
                <div class="section1">
                    <div class="content">
                        <div class="hello-word">
                            <p class="title">🛍️ 사고싶은 것들이 너무 많다고?</p>
                            <p class="subtitle">
                                ✔️ 클릭 한 번으로 나만의 WishLish 완성! <br> 하나위시뱅크에서 위시리스트를 작성해봐 !!
                            </p>
                        </div>
                        <div class="img-container">
                            <c:url var="logoUrl" value="../../resources/img/mainwishlist.png"/>
                            <a class="Wishlist" href=#> <img src="${logoUrl}"
                                                             alt="위시리스트" class="wishlist-img" width="450px;">
                            </a>
                        </div>
                    </div>

                </div>
            </div>


            <div class="carousel-item">
                <div class="section1">
                    <div class="content">
                        <div class="hello-word">
                            <p class="title">️ 💸 돈을 모으기가 너무 어렵다고?</p>
                            <p class="subtitle">
                                🌞 하루하루 두둑해지는 나만의 Challenge 통장! <br>하나위시뱅크에서 챌린지 적금을 시작해봐 !!
                            </p>
                        </div>
                        <div class="img-container">
                            <c:url var="logoUrl" value="../../resources/img/mainsave.png"/>
                            <a class="save" href=#> <img src="${logoUrl}" alt="적금"
                                                         class="saveimg" width="450px;">
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <button class="carousel-control-prev" type="button"
                data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button"
                data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

<%----메뉴바--%>
<div class="menu-bar">
    <div class="row">
        <div class="col">
            <img class="menu-icon" src="../../resources/img/ic_introduce.svg" alt="아이콘 1">
            <a class="menu-item" href="/introduce">
                서비스 소개
            </a>
        </div>
        <div class="col">
            <img class="menu-icon" src="../../resources/img/ic_myExpansePattern.svg" alt="아이콘 2">
            <a class="menu-item" href="/checkMyExpensePattern">
                소비 분석
            </a>
        </div>

        <div class="col">
            <img class="menu-icon" src="../../resources/img/ic_wishList.svg" alt="아이콘 3">
            <a class="menu-item" href="/checkMyWishList">
                위시리스트 등록
            </a>
        </div>
        <div class="col">
            <img class="menu-icon" src="../../resources/img/ic_challengeSaving.svg" alt="아이콘 3">
            <a class="menu-item" href="/checkMyChallengeSavings">
                챌린지 현황
            </a>
        </div>
    </div>
</div>

<%----section2--%>


<div class="container-box">
    <div class="container-border">
        <div class="row">
            <div class="col">
                <div class="timeRegisterWishListItemsTitle">실시간 고객 등록 위시 리스트 아이템</div>
                <c:url var="mainWishListRecommendMent" value="../../resources/img/mainWishListRecommendMent.png"/>
                <a class="mainWishListRecommendMent" href=#> <img src="${mainWishListRecommendMent}">
                </a>
                <c:url var="btn_mainRegisterMyWishListItem"
                       value="../../resources/img/btn_mainRegisterMyWishListItem.svg"/>
                <a class="btn_mainRegisterMyWishListItem" href=/registerMyWishList> <img
                        src="${btn_mainRegisterMyWishListItem}">
                </a>

            </div>
            <div class="col">
                <div class="mainCardContainer">
                    <div class="row" id="item-container">
                        <!-- 아이템 카드들이 여기에 동적으로 추가될 것입니다. -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        // 랜덤 숫자 생성 함수
        function getRandomInt(min, max) {
            return Math.floor(Math.random() * (max - min + 1)) + min;
        }

        // 페이지 로드 시 Ajax로 데이터 가져오기
        $.ajax({
            type: "GET",
            url: "/wish-list",
            contentType: "application/json",
            success: function (data) {
                const items = data; // 데이터 배열을 items 변수에 저장

                // 랜덤으로 4개의 아이템을 선택
                const selectedItems = [];
                while (selectedItems.length < 4 && items.length > 0) {
                    const randomIndex = getRandomInt(0, items.length - 1);
                    const selectedItem = items.splice(randomIndex, 1)[0];
                    selectedItems.push(selectedItem);
                }

                const itemContainer = $("#item-container");

                // 선택된 아이템을 화면에 추가
                $.each(selectedItems, function (index, item) {
                    const card = $("<div>").addClass("col-lg-6 col-md-6 col-sm-12 mb-6") // 수정된 부분
                        .css({
                            borderRadius: "50px",
                        });

                    const cardInner = $("<div>").addClass("card");

                    const img = $("<img>").attr("src", item.image)
                        .addClass("card-img-top mx-auto")
                        .attr("alt", "...");


// 이미지 크기를 일정한 크기로 설정
                    img.on("load", function () {
                        $(this).css({
                            width: "100px", // 이미지 최대 너비 설정
                            height: "100px", // 이미지 최대 높이 설정
                        });
                    });
                    const cardBody = $("<div>").addClass("card-body");
                    const itemTitle = $("<h5>").addClass("item-title")
                        .addClass("card-title")
                        .text(item.title)
                        .css({
                            whiteSpace: "nowrap", // 줄바꿈 방지
                            overflow: "hidden", // 넘치는 부분 숨김 처리
                            textOverflow: "ellipsis", // 넘치는 부분 생략 표시
                            fontFamily: "Hana2.0 CM", // 원하는 폰트 설정
                        });
                    const formattedPrice = item.price.toLocaleString(); // 가격을 형식에 맞게 변환
                    const itemPrice = $("<p>").addClass("item-price")
                        .addClass("card-text")
                        .text(formattedPrice + "원");

                    cardBody.append(itemTitle, itemPrice);
                    cardInner.append(img, cardBody);
                    card.append(cardInner);
                    itemContainer.append(card);
                });
            },
            error: function (xhr, status, error) {
                console.error(error);
            }
        });
    });
</script>
<%--<div class="separator"></div>--%>

<%---------------------------------------------------------------------------------------------------%>
<div class="section3">

    <div class="infoContainer">
        <div class="row">
            <div class="col-md-6">
                <div class="box-container">
                    <div class="section-title">은행소식</div>
                    <div class="notice-cards">
                        <div class="notice-card">
                            <div class="card-title">신규 서비스 오픈!</div>
                            <div class="card-date">2023년 8월 6일</div>
                            <div class="card-content">HANA BANK에서 새로운 디지털 뱅킹 서비스를 오픈했습니다. 지금 바로 로그인하여 확인해보세요!</div>
                        </div>
                        <div class="notice-card">
                            <div class="card-title">여름 특별 대출 이벤트</div>
                            <div class="card-date">2023년 8월 10일</div>
                            <div class="card-content">여름을 맞이하여 특별 대출 이벤트를 진행합니다. 우대 금리와 다양한 혜택을 놓치지 마세요!</div>
                        </div>
                        <div class="notice-card">
                            <div class="card-title">뱅킹 서비스 개편</div>
                            <div class="card-date">2023년 8월 15일</div>
                            <div class="card-content">HANA BANK 뱅킹 서비스가 새롭게 개편되었습니다. 더욱 편리한 기능을 만나보세요!</div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="box-container">
                    <div class="section-title">공지사항</div>
                    <table class="notice-table">
                        <tr>
                            <td class="notice-title">서비스 이용 안내</td>
                            <td class="notice-date">2023년 8월 6일</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="notice-content">HANA WISH BANK 서비스 점검으로 인해 8월 10일 01:00 ~ 03:00까지 서비스
                                이용이
                                일시적으로 불가능합니다.
                            </td>
                        </tr>
                        <tr>
                            <td class="notice-title">사용자 보안 강화</td>
                            <td class="notice-date">2023년 8월 10일</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="notice-content">HANA BANK에서 사용자 보안 강화를 위해 비밀번호 변경 안내를 발송하였습니다.
                                확인해주세요!
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 푸터 추가 -->
<!-- <footer class="bg-dark text-light text-center py-3"> © 2023
    Your Website. All rights reserved. </footer> -->
<%@ include file="include/footer.jsp" %>

<!-- 부트스트랩 JavaScript 연결 -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
