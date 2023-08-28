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
            margin-top: 3%;
            margin-left: 5%;
            width: 200px;
            position: absolute;
            /* 	border-right: 1px solid #ccc; */
        }

        .sidebar h3 {
            color: #009591;
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

        /* 위시리스트 조회------------------------------------------------------------------------------------------------------- */
        .wishListDetailTitle {
            margin-top: 48px;
            font-size: 20px;
            font-weight: 600;
            font-family: 'Helvetica', sans-serif;
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .card-img-top {
            border-radius: 0.5rem 0.5rem 0 0;
        }

        /* 카드 전체에 그림자 효과 추가 */
        .card {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
            width: 14rem !important;
            height: 240px; /* 원하는 크기로 조절 */
            margin-top: 3rem !important;
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
        .icCoffeeCalculator {
            transition: transform 0.2s;
            width: 12rem !important;
            height: 200px; /* 원하는 크기로 조절 */
            margin-top: 4rem !important;
        }

        .wishListDetailEqual {
            margin-top: 7rem !important;
            font-size: 60px;
            font-weight: 600;
            font-family: 'Helvetica', sans-serif;
            color: #526DB0;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .wishListDetaMultiply {
            margin-top: 7rem !important;
            font-size: 60px;
            font-weight: 600;
            font-family: 'Helvetica', sans-serif;
            color: #526DB0;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .ellipse {
            margin-top: 7rem !important;
            margin-right: 8rem !important;
            width: 200px;
            height: 100px;
            background-color: #ABCBCD;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .calculate-text {
            position: absolute;
            text-align: center;
            font-size: 20px;
            font-weight: 500;
            font-family: 'Helvetica', sans-serif;
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .summary {
            margin-right: 8rem !important;
            margin-top: 5rem;
            word-wrap: break-word; /* 긴 단어의 줄바꿈을 위한 속성 */
            text-align: center;
            font-size: 22px;
            font-weight: 100;
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .random-comment {
            margin-right: 8rem !important;
            margin-top: 1rem;
            word-wrap: break-word; /* 긴 단어의 줄바꿈을 위한 속성 */
            text-align: center;
            font-size: 24px;
            font-weight: 500;
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            word-wrap: break-word;
        }

        .ButtonContainer {
            margin-right: 10rem !important;
            margin-top: 5rem;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .deleteWishListButton {
            margin-left: 2rem;
        }

        .goPurchasePlanListButton {
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
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<%@ include file="include/header.jsp" %>
<body>
<div class="header">
    <!-- 메뉴바 내용 -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <c:url var="logoUrl" value="../../resources/img/logo.png"/>
            <a class="navbar-brand" href="index.jsp"> <img src="${logoUrl}"
                                                           alt="로고" class="logo-img">
            </a>

            <div class="collapse navbar-collapse ml-auto"
                 id="navbarSupportedContent1">
                <!-- 첫 번째 메뉴 내용 -->
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active"
                                            aria-current="page" href="checkMyExpansePattern.jsp">나의 소비패턴</a></li>
                    <li class="nav-item"><a class="nav-link"
                                            href="checkMyWishList.jsp">나의 위시리스트</a></li>
                    <li class="nav-item"><a class="nav-link"
                                            href="checkMyPurchasePlanList.jsp">나의 구매계획리스트</a></li>
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
    <h3>나의 위시리스트</h3>
    <ul>
        <li><a href="checkMyWishList.jsp">나의 위시리스트 조회</a></li>
        <li><a href="registerMyWishList.jsp">나의 위시리스트 등록</a></li>
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
        <div class="description-text2">➡️ 제품의 '진짜' 가치를 대체가격으로 파악하고,
            스마트한 소비 습관을 만들어보세요!
        </div>
    </div>
    <hr class="divider">
    <!---위시리스트 조회   ------------------------------------------------------------------------------------------------------- -->

    <div class="wishListDetailTitle">
        <img src="<c:url value='../../resources/img/ic_calculator.svg' />" alt="Main Wish List"
             width="50" style="vertical-align: middle; transform: rotate(-8deg);">
        이번 달 "커피중독자" 민영 님은
    </div>


    <div class="container text-center">
        <div class="row">
            <div class="col">

                <div class="card" style="width: 18rem; margin-top: 2rem;">
                    <c:url value="../../resources/img/ic_patternChart.svg" var="imageURL"/>
                    <div class="text-center">
                        <!-- 가운데 정렬을 위한 부모 컨테이너 -->
                        <img src="${imageURL}" class="card-img-top mx-auto" alt="..."
                             style="width: 10rem; height: 8.125rem; display: block; margin-top: 1rem;">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Apple 2022 에어팟 프로 2세대 블루투스 이어폰</h5>
                        <p class="card-text">317,720원</p>
                    </div>
                </div>
            </div>
            <div class="col">

                <div class="wishListDetailEqual">=</div>
            </div>
            <div class="col">
                <div class="icCoffeeCalculator">
                    <img src="<c:url value='../../resources/img/ic_coffeeCalculator.svg' />"
                         alt="Coffee Calculator" width="180"
                         style="vertical-align: middle">
                </div>

            </div>
            <div class="col">

                <div class="wishListDetaMultiply">x</div>
            </div>
            <div class="col">
                <div class="ellipse">
                    <div class="calculate-text">80 &nbsp; DAYS</div>
                </div>

            </div>
        </div>
    </div>


    <div class="summary">대략 커피를 80일간 절약한다면 위시 아이템을 구매하실 수 있습니다.</div>
    <br>
    <div class="random-comment">“목표를 이루기 위해 소비를 신중하게 선택하세요”</div>


    <div class="ButtonContainer ">
        <div class="row">
            <div class="col">
                <c:url var="deleteWishListButton" value="../../resources/img/btn_deleteWishList.svg"/>
                <a class="deleteWishListButton" href="checkMyWishList.jsp"> <img
                        src="${deleteWishListButton}" alt="버튼"
                        class="deleteWishListButton">
                </a>
            </div>
            <div class="col">
                <c:url var="goPurchasePlanListButton"
                       value="../../resources/img/btn_goPurchasePlanList.svg"/>
                <a class="goPurchasePlanListButton"
                   href="registerMyPurchasePlanList.jsp"> <img
                        src="${goPurchasePlanListButton}" alt="버튼"
                        class="goPurchasePlanListButton">
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
