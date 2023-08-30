<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
            height: 1800px;
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

        /* 차트  ------------------------------------------------------------------------------------------------------- */
        .chartTitle {
            margin-top: 48px;
            font-size: 28px;
            font-weight: 600;
            font-family: "Hana2.0 CM";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .expense-section {
            margin-top: 30px;
            margin-bottom: 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* 테이블  ------------------------------------------------------------------------------------------------------- */
        .expense-summary {
            margin-top: 20px;
            margin-right: 5%;
            border: 1px solid #ccc;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-right: 5%;
        }

        .expense-summary table {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
            background-color: #fff;
        }

        .expense-summary th, .expense-summary td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .expense-summary th {
            background-color: #F3E1E6;
            font-weight: bold;
            color: #333;
        }

        .expense-summary tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .expense-summary th:first-child, .expense-summary td:first-child {
            border-left: none;
        }

        .expense-summary th:last-child, .expense-summary td:last-child {
            border-right: none;
        }

        .result-box {
            margin-top: 20px;
            padding: 4px; /* 텍스트 내용과 테두리 사이의 간격 */
            border-radius: 20px;
            max-width: 800px;
        }

        .result-text1 {
            padding: 10px;
            font-size: 24px;
            font-weight: 500;
            font-family: 'Helvetica', sans-serif;
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .result-text2 {
            padding: 10px;
            font-size: 22px;
            font-weight: 500;
            font-family: 'Helvetica', sans-serif;
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            /* 	display: flex;
            justify-content: center; */
        }

        /* 이번 달 ------------------------------------------------------------------------------------------------------- */
        .thisMonthTitle {
            margin-left: 5%;
            margin-top: 30px;
            font-size: 24px;
            font-weight: 600;
            font-family: 'Helvetica', sans-serif;
            color: #4B9D9B;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .monthlyKing {
            margin-top: -80px;
            margin-bottom: 20px;
            margin-left: 35%;
            font-size: 24px;
            font-weight: 600;
            font-family: 'Helvetica', sans-serif;
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }

        .thisMonthContainer {
            margin-right: 10%;
            margin-top: 50px;
            width: 90%;
            border: 4px dashed #ccc;
            border-radius: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

    </style>
    <!-- 부트스트랩 연결 -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<%@ include file="include/header.jsp" %>
<body>


<!-- 사이드바  ------------------------------------------------------------------------------------------------------- -->
<div class="sidebar">
    <h3>나의 소비패턴</h3>
    <ul>
        <li><a href="cardRegistration.jsp">카드등록</a></li>
        <li><a href="checkMyExpansePattern.jsp">소비내역 조회</a></li>
        <!-- <li><a href="#">대출신청</a></li>
        <li><a href="#">카드신청</a></li>
        <li><a href="#">고객센터</a></li> -->
    </ul>
</div>
<!---메인  ------------------------------------------------------------------------------------------------------- -->
<main>
    <div class="title">
        <img src="<c:url value='../../resources/img/ic_myExpansePattern.svg' />"
             alt="Main Wish List" width="80" style="vertical-align: middle;">
        나의 소비패턴 조회
    </div>

    <div class="description-box">
        <div class="description-text1">🔎 나는 어디에 가장 돈을 많이 쓸까? 나는 어디에 가장
            돈을 자주 쓸까? 🧐
        </div>
        <div class="description-text2">➡️ 좌측메뉴에서 카드등록 후 나의 일상 소비를
            확인해보세요!
        </div>
    </div>
    <hr class="divider">
    <!-- 차트  ------------------------------------------------------------------------------------------------------- -->
    <div class="chart">
        <div class="chartTitle">* 나의 지출 차트</div>
    </div>
    <div class="expense-section">
        <div class="chart-container" style="width: 60%;">
            <img src="<c:url value='../../resources/img/ic_patternChart.svg' />" alt="Pattern Chart"
                 width=400;>
            <!-- 여기가 차트가 들어갈자리  -->
        </div>
        <div class="expense-summary" style="width: 40%;">
            <table>
                <tr>
                    <th colspan="2">이번 달 총 소비 금액</th>
                </tr>
                <tr>
                    <td colspan="2">20,000,000 원</td>
                </tr>
                <tr>
                    <th>이번 달 최대 지출 카테고리</th>
                    <th>금액</th>
                </tr>
                <tr>
                    <td>식비</td>
                    <td>600,000 원</td>
                </tr>
                <tr>
                    <th>이번 달 최다 지출 카테고리</th>
                    <th>횟수</th>
                </tr>
                <tr>
                    <td>카페</td>
                    <td>25회</td>
                </tr>
            </table>
        </div>
    </div>


    <div class="result-box">
        <div class="result-text1">🏁 결산 : 이번 달 민영 님은 총 20,000,000원을
            소비하셨습니다.
        </div>
        <div class="result-text2">
            <br>➡️ 이번 달 최대 지출 카테고리는 "식비"로 총 600,000 원을 소비하셨고,<br> <br>
            ➡️ 이번 달 최다 지출 카테로는 "카페"로 총 25회 소비하셨습니다.
        </div>
    </div>
    <!-- 이번달  ------------------------------------------------------------------------------------------------------- -->


    <div class="thisMonthContainer">
        <div class="thisMonth">
            <div class="thisMonthTitle">
                그 결과 <br>이번 달 민영 님은...
            </div>
        </div>
        <!-- if= 지출카테고리가 무엇일때 그에 맞는 이미지 띄우기 ! -->
        <div class="monthlyKing">
            <img src="<c:url value='../../resources/img/ic_idCoffeemaniac.svg' />"
                 alt="Monthly King" width=550;>

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
