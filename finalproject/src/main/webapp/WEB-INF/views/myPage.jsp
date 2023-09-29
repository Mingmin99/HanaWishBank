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

        /* 탭 스타일 */
        .tabs {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .tabs li {
            display: inline;
            margin-right: 10px;
        }

        .tabs a {
            text-decoration: none;
            padding: 5px 10px;
            background-color: #eee;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .tabs a:hover {
            background-color: #ddd;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

    </style>
    <!-- 부트스트랩 연결 -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<%@ include file="include/header.jsp" %>
<body>


<!-- 사이드바  ------------------------------------------------------------------------------------------------------- -->
<div class="sidebar">
    <h3>마이페이지</h3>
    <ul>
        <li><a href="/myPage">나의 정보</a></li>
    </ul>
</div>
<!---메인  ------------------------------------------------------------------------------------------------------- -->
<main>
    <div class="title">
        <img src="<c:url value='../../resources/img/ic_user.svg' />" alt="Main Wish List"
             width="70" style="vertical-align: middle;"> 마이페이지
    </div>

    <div class="description-box">
        <div class="description-text1"> 👤 내 정보를 확인하세요.</div>
        <%--        <div class="description-text2">➡️상품 별로 얼마나 목표를 달성했는지 확인해보세요!--%>
    </div>
    </div>
    <hr class="divider">
    <!---위시리스트 조회   ------------------------------------------------------------------------------------------------------- -->

    <nav>
        <!-- 네비게이션 메뉴 탭 -->
        <ul class="tabs">
            <li><a href="#profile">기본정보</a></li>
            <li><a href="#expenses">나의 소비</a></li>
            <li><a href="#items">아이템</a></li>
            <li><a href="#savings">적금</a></li>
        </ul>
    </nav>


    <section id="profile" class="tab-content">
        <!-- 프로필 정보 표시 -->
        <h2>기본정보</h2>
        <!-- 사용자 정보 및 프로필 이미지 표시 -->
    </section>

    <section id="expenses" class="tab-content">
        <!-- 사용자 설정 표시 -->
        <h2>나의 소비</h2>
        <!-- 나의 소비 정보 표시 -->
    </section>

    <section id="items" class="tab-content">
        <!-- 활동 기록 표시 -->
        <h2>아이템</h2>
        <!-- 아이템 정보 표시 -->
    </section>

    <section id="savings" class="tab-content">
        <!-- 활동 기록 표시 -->
        <h2>적금</h2>
        <!-- 적금 정보 표시 -->
    </section>
    <script>// JavaScript를 사용하여 탭 메뉴 구현
    document.addEventListener("DOMContentLoaded", function () {
        const tabLinks = document.querySelectorAll('.tabs a');
        const tabContents = document.querySelectorAll('.tab-content');

        // 기본정보 탭 활성화
        document.getElementById("profile").classList.add('active');

        tabLinks.forEach(link => {
            link.addEventListener('click', (e) => {
                e.preventDefault();

                // 모든 다른 탭 숨김
                tabContents.forEach(content => {
                    content.classList.remove('active');
                });

                const targetTabId = e.target.getAttribute('href').substr(1);
                const targetTab = document.getElementById(targetTabId);
                targetTab.classList.add('active');
            });
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
