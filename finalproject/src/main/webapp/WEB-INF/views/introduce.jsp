<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>웹 페이지</title>
    <style>
        body {
            background-color: #c8eadd;
        }

        .navbar {
            position: relative;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
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
            margin-left: 16%;
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
            max-width: 400px; /* 로고 이미지 크기 조절 */
            max-height: 400px; /* 로고 이미지 크기 조절 */
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

        .mainExplain {
            display: flex;
            justify-content: center; /* Horizontally center the image */
            align-items: center; /* Vertically center the image (optional) */
            max-width: 100%; /* Optional: adjust the max-width as needed */
            margin: 30px auto;
        }

        .mainExplain {
            animation: scaleInOut 0.5s ease-in-out 2;
        }

        /* @keyframes scaleInOut {
          0%, 100% {
            transform: scale(1);
          }

          50% {
            transform: scale(1.2);
          }
        } */
        .mainHello1 {
            justify-content: center;
            color: #136C62;
            font-size: 32px;
            font-weight: 700;
            display: flex;
            font-family: sans-serif;
            text-shadow: 2px 2px 4px rgba(19, 108, 98, 0.1);
        }

        .mainHello2 {
            margin-top: 3%;
            justify-content: center;
            color: #403F3F;
            font-size: 28px;
            font-weight: 600;
            display: flex;
            font-family: sans-serif;
        }

        .image-container {
            display: flex;
            justify-content: center; /* 이미지를 수평으로 가운데 정렬합니다. */
            align-items: center; /* 이미지를 수직으로 가운데 정렬합니다. */
            margin: auto 0;
            align-items: center;
        }

        /* 이미지에 마우스를 올렸을 때 애니메이션 효과 적용 */
        .image-container div:hover {
            transform: translateY(-20px); /* 이미지를 위로 20px 이동시킴 */
            transition: transform 0.3s ease; /* 애니메이션을 0.3초 동안 부드럽게 적용 */
        }

        .image-container div {
            display: flex;
            justify-content: center;
            margin: 40px auto 0;
            align-items: center;
            animation: bounce 1s infinite; /* bounce 애니메이션을 1초 동안 무한 반복 */
        }

        .mainExpansePattern, .mainChallenge {
            display: inline-block;
        }

        /* 미디어 쿼리를 이용해 화면 크기에 따라 이미지들을 재배치 */
        @media ( max-width: 768px) {
            .mainExpansePattern, .mainChallenge {
                display: block;
            }
        }

        .mainButton {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            margin-right: 50px;
            margin-top: 20px;
            margin-bottom: 96px;
            transition: transform 0.3s ease;
        }

        .mainButton:hover {
            animation: shake 0.3s ease;
        }

        /*
        @keyframes shake {
            0%, 100% {
                transform: translate(0);
            }
            25% {
                transform: translateX(-20px);
            }
            75% {
                transform: translateX(20px); }
        } */
        .serviceInfo {
            margin-top: -240px;
            margin-left: 30px;
        }

        .section {
            width: 70%;
            background-color: #fff;
            border: 1px solid #ddd;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px;
            border-radius: 20px;
            text-align: left;
            transition: background-color 0.3s;
        }

        /* 제목 스타일 */
        h2 {
            font-size: 24px;
            font-family: "Hana2.0 CM";
            color: #333;
            margin: 0 0 10px 0;
        }

        /* 본문 스타일 */
        p {
            font-family: "Hana2.0 L";
            font-size: 16px;
            color: #666;
            margin: 0;
        }

        /* 호버 효과 */
        .section:hover {
            background-image: linear-gradient(to top, #fff1eb 0%, #ace0f9 100%);
        }

    </style>

    <!-- 부트스트랩 연결 -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css"/>
</head>
<body>
<div class="header">
    <!-- 메뉴바 내용 -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <c:url var="logoUrl" value="../../resources/img/logo.png"/>
            <a class="navbar-brand" href="/"> <img
                    src="${logoUrl}" alt="로고" class="logo-img">
            </a>
        </div>
    </nav>
</div>

<div class="mainExplain">
    <img src="<c:url value='../../resources/img/mainExplain.png' />" alt="Main Explain"
         width="800">
</div>


<div class="image-container">
    <div class="mainWishList">
        <img src="<c:url value='../../resources/img/mainWishList.svg' />" alt="Main Wish List"
             width="300">
    </div>

    <div class="mainExpansePattern">
        <img src="<c:url value='../../resources/img/mainExpansePattern.svg' />"
             alt="Main Expanse Pattern" width="300">
    </div>
    <div class="mainChallenge">
        <img src="<c:url value='../../resources/img/mainChallenge.svg' />" alt="Main Challenge"
             width="300">
    </div>
    <div class="mainPerson">
        <img src="<c:url value='../../resources/img/mainPerson.svg' />" alt="Main Person"
             width="350">
    </div>
</div>

<c:url var="mainButton" value="../../resources/img/mainButton.svg"/>
<a class="mainButton" href="/"> <img src="${mainButton}"
                                     alt="버튼" class="mainButton">
</a> <!-- 섹션 1: 소비패턴 분석 -->
<div class="serviceInfo">
    <section class="section">
        <h2>01. 소비패턴 분석</h2>
        <p>사용자가 등록한 카드의 지출 내역을 통해 나의 소비를 차트화 및 분석하여 소비 패턴을 파악하고,</p>
        <p>지출이 가장 큰 카테고리와 지출 횟수가 잦은 카테고리 분석 후 소비태그 제공</p>
    </section>

    <!-- 섹션 2: 위시리스트 관리 -->
    <section class="section">
        <h2>02. 위시리스트 관리</h2>
        <p>검색을 통하여 원하는 상품을 위시리스트에 등록, 관리</p>
        <p>나의 소비태그를 바탕으로 위시리스트 상품의 가격을 대체 표현하여 실질 가격을 체감할 수 있는 서비스 제공</p>
        <p>구매 고민 후 결정 된 항목에 대하여 간단 구매계획리스트 작성</p>
    </section>

    <!-- 섹션 3: 챌린지 적금 개설 -->
    <section class="section">
        <h2>03. 챌린지 적금 개설</h2>
        <p>구매계획리스트 중 목표기간이 같은 항목끼리 묶어서 챌린지 적금 계좌 개설 가능</p>
        <p>납입 분배 비율 설정에 따라 납입 금액 자동 분배 납입 가능</p>
        <p>적금 현황 대시보드에서 목표 달성률 확인 가능</p>
    </section>
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
