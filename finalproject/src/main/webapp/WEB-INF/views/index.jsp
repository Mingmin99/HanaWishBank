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
            background-image: linear-gradient(to bottom, #FFEEED, #E0F8FF);
        }

        .carouselExampleIndicators2 {
            background-image: linear-gradient(to bottom, #FFEEED, #E0F8FF);
        }

        #carouselExampleIndicators .section1 {
            background-image: linear-gradient(to bottom, #FFEEED, #E0F8FF);
        }

        #carouselExampleIndicators .hello-word {
            margin-top: -50px;
            margin-left: 10%;
            margin-right: 5%;
            text-align: left;
            white-space: nowrap;
        }

        #carouselExampleIndicators .title {
            font-size: 48px;
            margin-left: 1%;
            font-weight: 600;
            font-family: 'Helvetica', sans-serif;
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        #carouselExampleIndicators .subtitle {
            margin-top: 30px;
            margin-left: 10%;
            font-family: 'Helvetica', sans-serif;
            font-weight: 600;
            font-size: 26px;
            color: #477580;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        #carouselExampleIndicators title, #carouselExampleIndicators .subtitle {
            /* 애니메이션 규칙 추가 */
            animation: fadeIn 2s ease-in-out;
        }

        /* 애니메이션 키프레임 정의 */
        /* @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        } */
        .content {
            display: flex;
            align-items: center;
            height: 500px;
            /* This centers the content vertically (optional) */
        }

        .section1 {
            align-items: center;
            display: flex;
        }

        .section2 {
            background-color: #fffefe
        }

        /* Common styles for both sections */
        .section-notice {
            padding: 20px;
            border-radius: 8px;
        }

        .section-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        /* Styles for news items in the "은행소식" section */
        .section-news .news-item {
            margin-bottom: 15px;
        }

        .section-news .news-title {
            font-size: 18px;
            font-weight: bold;
            color: #555;
            margin-bottom: 5px;
        }

        .section-news .news-date {
            font-size: 14px;
            color: #888;
            margin-bottom: 5px;
        }

        .section-news .news-content {
            font-size: 16px;
            color: #333;
        }

        /* Styles for the "공지사항" table */
        .notice-table {
            width: 100%;
            border-collapse: collapse;
        }

        .notice-table th, .notice-table td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        .notice-table th {
            font-size: 18px;
            font-weight: bold;
            color: #555;
        }

        .notice-table td {
            font-size: 16px;
            color: #333;
        }

        /* 기본 스타일 */
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
                            <c:url var="logoUrl" value="../../resources/img/mainwishlist.png"/>
                            <a class="mainPattern" href=#> <img src="${logoUrl}"
                                                                alt="소비내역" class="mainPattern-img">
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
                                                             alt="위시리스트" class="wishlist-img">
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
                                🌞 하루하루 두둑해지는 나만의 Challenge 통장! <br>하나위시뱅크에서 챌린지 적금을 시작해봐
                                !!
                            </p>
                        </div>
                        <div class="img-container">
                            <c:url var="logoUrl" value="../../resources/img/mainsave.png"/>
                            <a class="save" href=#> <img src="${logoUrl}" alt="적금"
                                                         class="saveimg">
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

<div class="section2">
    <br> <br>
    <div class="section-notice">
        <h2 class="section-title">은행소식</h2>
        <table class="notice-table">
            <tr>
                <th>제목</th>
                <th>날짜</th>
                <th>내용</th>
            </tr>
            <tr>
                <td class="news-title">신규 서비스 오픈!</td>
                <td class="news-date">2023년 8월 6일</td>
                <td class="news-content">HANA BANK에서 새로운 디지털 뱅킹 서비스를 오픈했습니다.
                    지금 바로 로그인하여 확인해보세요!
                </td>
            </tr>
            <tr>
                <td class="news-title">여름 특별 대출 이벤트</td>
                <td class="news-date">2023년 8월 10일</td>
                <td class="news-content">여름을 맞이하여 특별 대출 이벤트를 진행합니다. 우대 금리와 다양한
                    혜택을 놓치지 마세요!
                </td>
            </tr>
            <!-- 새로운 뉴스 항목 추가 -->
            <tr>
                <td class="news-title">온라인 뱅킹 서비스 개편</td>
                <td class="news-date">2023년 8월 15일</td>
                <td class="news-content">HANA BANK 온라인 뱅킹 서비스가 새롭게 개편되었습니다. 더욱
                    편리한 기능을 만나보세요!
                </td>
            </tr>
        </table>
    </div>
    <br> <br>
    <div class="section-notice">
        <h2 class="section-title">공지사항</h2>
        <table class="notice-table">
            <tr>
                <td class="notice-title">서비스 이용 안내</td>
                <td class="notice-date">2023년 8월 6일</td>
            </tr>
            <tr>
                <td colspan="2" class="notice-content">HANA BANK 서비스 점검으로 인해
                    8월 10일 01:00 ~ 03:00까지 서비스 이용이 일시적으로 불가능합니다.
                </td>
            </tr>
            <tr>
                <td class="notice-title">사용자 보안 강화</td>
                <td class="notice-date">2023년 8월 10일</td>
            </tr>
            <tr>
                <td colspan="2" class="notice-content">HANA BANK에서 사용자 보안 강화를
                    위해 비밀번호 변경 안내를 발송하였습니다. 확인해주세요!
                </td>
            </tr>
        </table>
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
