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
            height: 2000px;
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
            font-size: 18px;
            font-weight: 500;
            font-family: "Hana2.0 L";
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .description-text2 {
            padding: 10px;
            font-size: 18px;
            font-weight: 500;
            font-family: "Hana2.0 L";
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            /* 	display: flex;
            justify-content: center; */
        }

        .divider {
            margin: 1rem 0;
            color: inherit;
            background-color: currentColor;
            border: 0;
            opacity: .25;
            width: 95%;
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
            width: 95%;
            padding: 20px;
            margin-top: 30px;
            margin-bottom: 50px;
            justify-content: center;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fdfafa;
            box-shadow: 0 0 7px rgba(0, 0, 0, 0.2);
            transition: box-shadow 0.3s ease-in-out;
        }

        .expense-section:hover {
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
        }


        #expenseChart {
            margin-top: 5%;
            width: 400px !important;
            height: 400px !important;
        }

        .chartCanvasTitle {
            font-size: 20px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            margin-top: 3%;
            text-align: center; /* 수평 가운데 정렬 */
            display: flex;
            align-items: center; /* 수직 가운데 정렬 */
            justify-content: center; /* 수직 가운데 정렬 */
            height: 100%; /* 수직 가운데 정렬 */
        }


        /* 테이블  ------------------------------------------------------------------------------------------------------- */
        .expense-summary {
            margin-top: 20%;
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
            width: 95%;
            padding: 20px;
            margin-top: 30px;
            margin-bottom: 50px;
            justify-content: center;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fdfafa;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            transition: box-shadow 0.3s ease-in-out;
        }

        .resultTitle {
            margin-bottom: 2%;
            font-size: 28px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            color: #5A5A5A;
            text-align: center;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .result-text1 {
            font-size: 20px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            color: #5A5A5A;
            text-align: center;
            /*text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);*/
        }

        .result-text2 {
            font-size: 20px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            color: #5A5A5A;
            text-align: center;
            /*text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);*/
        }

        /* expense-amount 클래스에 대한 스타일 */
        .expense-amount {
            padding: 10px;
            font-size: 20px;
            font-weight: bold;
            font-family: "Hana2.0 CM";
            color: #6a978d;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* top-amount 클래스에 대한 스타일 */
        .top-amount {
            padding: 10px;
            font-size: 20px;
            font-weight: bold;
            font-family: "Hana2.0 CM";
            color: #4e72a0;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* category-count 클래스에 대한 스타일 */
        .category-count {
            padding: 10px;
            font-size: 20px;
            font-weight: bold;
            font-family: "Hana2.0 CM";
            color: #ff8e8e;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* top-category 클래스에 대한 스타일 */
        .top-category {
            padding: 10px;
            font-size: 20px;
            font-weight: bold;
            font-family: "Hana2.0 CM";
            color: orange;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }


        /* 이번 달 ------------------------------------------------------------------------------------------------------- */
        .thisMonthTitle {
            display: inline-block;
            margin-left: 2%;
            font-size: 24px;
            font-weight: 600;
            font-family: "Hana2.0 CM";
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* 스타일을 위한 버튼 클래스 */
        .showTagsButton {
            display: inline-block;
            background-color: #b4d0ca;
            margin-left: 10px;
            margin-top: -10px;
            border: 1px solid #889b97;
            color: #4a4949; /* 텍스트 색상을 흰색으로 설정 */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
            font-family: "Hana2.0 CM";
            font-size: 14px;
            transition: background-color 0.3s, color 0.3s;
        }

        .showTagsButton:hover {
            color: #fff1eb;
            background-color: #8da29d; /* 마우스 호버시 더 진한 분홍색 배경 */
        }

        .showTagsButton:active {
            transform: scale(0.95); /* 클릭시 버튼 크기 약간 축소 */
        }


        .monthlyKing1 {
            margin-top: 5%;
            margin-right: 24%;
            border-radius: 30px;
            background-color: #8da29d;
            color: #4a4949;
            margin-bottom: 20px;
            margin-left: 24%;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.4); /* 그림자 효과 추가 */
        }

        .monthlyKing2 {
            margin-top: 5%;
            margin-right: 24%;
            border-radius: 30px;
            background-color: #8da29d;
            color: #4a4949;
            margin-bottom: 20px;
            margin-left: 24%;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.4); /* 그림자 효과 추가 */
        }

        @keyframes fadeIn {
            0% {
                opacity: 0; /* 투명도를 0으로 시작 */
            }
            100% {
                opacity: 1; /* 투명도를 1로 끝냄 */
            }
        }

        /* monthlyKing1와 monthlyKing2에 애니메이션 적용 */
        .monthlyKing1, .monthlyKing2 {
            margin-top: 5%;
            margin-right: 24%;
            border-radius: 30px;
            background-color: #8da29d ;
            color: #4a4949;
            margin-bottom: 20px;
            margin-left: 24%;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.4); /* 그림자 효과 추가 */

            animation: fadeIn 2s forwards; /* 한 번만 2초 동안 나타나고 멈추는 fadeIn 애니메이션 적용 */
        }


        .tagTitle {
            font-weight: 800;
            font-size: 20px;
            font-family: "Hana2.0 CM";
            background-color: #FAF1E4;
            display: flex;
            padding: 10px;
            justify-content: center;
            align-content: center;
            color: #4a4949;
            margin-top: -8%;

        }

        .imageAndPriceContainer {
            display: flex; /* Flexbox 레이아웃을 사용합니다. */
            align-items: center; /* 요소를 수직 가운데 정렬합니다. */
            margin-left: 12%;
            margin-top: 25px;
        }

        .CategoryTag {
            margin-left: 30px; /* 이미지와 대표가격 사이의 간격을 조절합니다. */
            font-weight: 500;
            font-size: 18px;
            font-family: "Hana2.0 CM";
            border: 1px solid #fff1eb;
            padding: 5px 10px;
            background-color: #fff1eb;
            border-radius: 5px;
        }

        #icClip, #icClip2 {
            margin-top: -5%;
            margin-left: 8%;
        }

        .logoAndQR {
            display: flex; /* Flexbox 레이아웃 사용 */
            justify-content: flex-end; /* 요소들을 오른쪽으로 정렬 */
            align-items: center; /* 요소들을 수직 가운데 정렬 */
            position: relative; /* 상대 위치 지정 */
            top: -10px; /* 위쪽으로 50px 이동 (원하는 만큼 조정 가능) */
            right: 20px;
        }

        .thisMonthContainer {
            width: 95%;
            padding: 20px;
            margin-top: 30px;
            margin-bottom: 50px;
            justify-content: center;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fdfafa;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            transition: box-shadow 0.3s ease-in-out;
        }

    </style>
    <!-- 부트스트랩 연결 -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<%@ include file="include/header.jsp" %>
<body>


<!-- 사이드바  ------------------------------------------------------------------------------------------------------- -->
<div class="sidebar">
    <h3>나의 소비패턴</h3>
    <ul>
        <li><a href="checkMyCard">카드조회</a></li>
        <li><a href="checkMyExpensePattern">소비내역조회</a></li>
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
        <div class="description-text2">➡️ 월별 지출을 카테고리 별로 확인하고 소비 태그를 획득해 보세요!
        </div>
    </div>
    <hr class="divider">
    <!-- 차트  ------------------------------------------------------------------------------------------------------- -->
    <div class="chart">
        <div class="chartTitle">• 나의 지출 차트</div>
    </div>
    <div class="expense-section">
        <div class="row">
            <div class="col">
                <canvas id="expenseChart" width="400" height="400"></canvas>
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        var cardID = localStorage.getItem('cardID');
                        console.log("이거 차트 불러올 카드 아이디 " + cardID);

                        // 차트 초기화 함수
                        function initChart() {
                            var ctx = document.getElementById('expenseChart').getContext('2d');
                            window.myChart = new Chart(ctx, {
                                type: 'pie',
                                data: {
                                    labels: [],
                                    datasets: [{
                                        data: [],
                                        backgroundColor: [
                                            'rgb(255,179,179)',
                                            'rgb(177,203,250)',
                                            'rgb(251,205,136)',
                                            'rgb(179,222,189)',
                                            'rgb(217,205,244)',
                                            'rgb(255,204,182)',
                                            'rgb(186,174,162)',
                                            'rgb(167,190,206)',
                                            'rgba(255, 206, 86, 1)',
                                        ],
                                        // borderColor: [
                                        //     'rgb(241,131,152)',
                                        //     'rgb(143,200,232)',
                                        //     'rgba(255, 206, 86, 1)',
                                        //     'rgba(75, 192, 192, 1)',
                                        //     'rgba(153, 102, 255, 1)',
                                        //     'rgba(255, 159, 64, 1)',
                                        //     'rgba(255, 99, 132, 1)',
                                        //     'rgba(54, 162, 235, 1)',
                                        //     'rgba(255, 206, 86, 1)',
                                        // ],
                                        borderWidth: 1
                                    }]
                                }
                            });
                        }

                        // 함수를 정의하여 데이터를 가져오고 차트를 업데이트하는 역할을 수행합니다.
                        function updateChart() {
                            console.log("updateChart 함수 호출");
                            $.ajax({
                                type: 'GET',
                                url: '/getExpenseChartData',
                                data: {cardID: cardID},
                                dataType: 'json',
                                success: function (data) {
                                    console.log("지금 차트 데이터 넘어오고있니?" + JSON.stringify(data));

                                    // 서버에서 받은 JSON 데이터를 파싱하여 x, y 축 데이터 추출
                                    // 서버에서 받은 JSON 데이터를 파싱하여 x, y 축 데이터 추출
                                    var labels = data.map(item => item.description); // description을 x축으로 사용
                                    console.log(labels);
                                    var values = data.map(item => item.totalExpenseCategoryExpenseAmount);
                                    // totalExpenseCategoryExpenseAmount를 y축으로 사용

                                    // 차트 업데이트
                                    window.myChart.data.labels = labels;
                                    window.myChart.data.datasets[0].data = values;
                                    window.myChart.update();
                                },
                                error: function (error) {
                                    console.log(error);
                                }
                            });
                        }

                        // 페이지 로드 시 차트 초기화 및 업데이트
                        $(document).ready(function () {
                            initChart(); // 차트 초기화
                            updateChart(); // 차트 업데이트
                        });
                    });
                </script>

                <script>
                    // 페이지 로딩 시 localStorage에서 데이터 가져오기
                    document.addEventListener('DOMContentLoaded', function () {
                        var cardID = localStorage.getItem('cardID');

                        // Ajax 요청 설정
                        var xhr = new XMLHttpRequest();
                        xhr.open('GET', '/checkMyExpenseData?cardID=' + cardID, true);

                        // 요청 완료 후의 처리
                        xhr.onload = function () {
                            if (xhr.status === 200) {
                                // 서버로부터 받은 데이터를 처리
                                var responseData = JSON.parse(xhr.responseText);

                                function formatNumber(number) {
                                    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                }


                                // 데이터를 화면에 표시

                                document.getElementById('topCategory').textContent = responseData.topCategory.expenseCategoryCode;
                                document.getElementById('categoryCount').textContent = responseData.topCategory.categoryCount;
                                document.getElementById('topAmount').textContent = responseData.topAmount.expenseCategoryCode;
                                document.getElementById('totalAmount').textContent = formatNumber(responseData.topAmount.totalAmount);
                                document.getElementById('totalExpenseAmount').textContent = formatNumber(responseData.totalExpenseAmount.totalExpenseAmount);
                            } else {
                                // 요청이 실패한 경우 에러 처리
                                console.error('Request failed. Status: ' + xhr.status);
                            }
                        };

                        // 요청 보내기
                        xhr.send();
                    });
                </script>

            </div>
            <div class="col">
                <div class="expense-summary">
                    <table>
                        <tr>
                            <th colspan="2">이번 달 총 소비 금액</th>
                        </tr>
                        <tr>
                            <td colspan="2"><span id="totalExpenseAmount"></span>원</td>
                        </tr>
                        <tr>
                            <th>이번 달 최대 지출 카테고리</th>
                            <th>금액</th>
                        </tr>
                        <tr>
                            <td><span id="topAmount"></span></td>
                            <td><span id="totalAmount"> </span>원</td>
                        </tr>
                        <tr>
                            <th>이번 달 최다 지출 카테고리</th>
                            <th>횟수</th>
                        </tr>
                        <tr>
                            <td><span id="topCategory"></span></td>
                            <td><span id="categoryCount"> 회</span></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="chartCanvasTitle">< 지출 카테고리 별 소비차트 및 소비 카테고리 분석 ></div>
    </div>

    <script>
        // 페이지 로딩 시 localStorage에서 데이터 가져오기
        document.addEventListener('DOMContentLoaded', function () {
            var cardID = localStorage.getItem('cardID');

            // Ajax 요청 설정
            var xhr = new XMLHttpRequest();
            xhr.open('GET', '/checkMyExpenseData?cardID=' + cardID, true);

            // 요청 완료 후의 처리
            xhr.onload = function () {
                if (xhr.status === 200) {
                    // 서버로부터 받은 데이터를 처리
                    var responseData = JSON.parse(xhr.responseText);

                    // 숫자를 3자리마다 쉼표로 구분된 문자열로 포맷팅하는 함수 정의
                    function formatNumber(number) {
                        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    }


                    // 데이터를 화면에 표시
                    document.getElementById('topCategoryValue').textContent = responseData.topCategory.expenseCategoryCode;
                    document.getElementById('categoryCountValue').textContent = responseData.topCategory.categoryCount;
                    document.getElementById('topAmountValue').textContent = responseData.topAmount.expenseCategoryCode;
                    document.getElementById('totalAmountValue').textContent = formatNumber(responseData.topAmount.totalAmount);
                    document.getElementById('totalExpenseAmountValue').textContent = formatNumber(responseData.totalExpenseAmount.totalExpenseAmount);

                } else {
                    // 요청이 실패한 경우 에러 처리
                    console.error('Request failed. Status: ' + xhr.status);
                }
            };

            // 요청 보내기
            xhr.send();
        });
    </script>


    <%
        // 세션에서 memberID 가져오기
        String memberID = (String) session.getAttribute("memberID");
// 세션에서 name 가져오기
        name = (String) session.getAttribute("name");
    %>

    <div class="result-box">
        <div class="resultTitle">🏁 결산</div>
        <div class="result-text1">이번 달 <%= name %> 님은 총 <span id="totalExpenseAmountValue"
                                                              class="expense-amount"></span>원을
            소비하셨습니다.
        </div>
        <div class="result-text2">
            <br>➡️ 이번 달 최대 지출 카테고리는<span id="topAmountValue" class="top-amount"></span>(으)로 총 <span
                id="totalAmountValue" class="expense-amount"></span>원을 소비하셨고,<br>
            ➡️ 이번 달 최다 지출 카테로고리는<span id="topCategoryValue" class="top-category"></span>(으)로 총 <span
                id="categoryCountValue" class="category-count"></span>회 소비하셨습니다.
        </div>
    </div>


    <!-- 이번달  ------------------------------------------------------------------------------------------------------- -->

    <div class="thisMonthContainer">
        <div class="thisMonth">
            <div class="thisMonthTitle">
                이번 달 <%= name %>님이 획득하신 소비태그는...!
            </div>
            <button class="showTagsButton"
                    id="showTagsButton"> ✓ 확인하기
            </button>
        </div>
        <!-- if= 지출카테고리가 무엇일때 그에 맞는 이미지 띄우기 ! -->
        <div class="monthlyKing1" id="monthlyKing1" style="display:none;">
            <img id="icClip" src="../../resources/img/ic_clip.svg" width="70">
            <div class="tagTitle">이번 달 나의 소비태그</div>

            <!-- 이미지의 src를 동적으로 설정 -->
            <div class="imageAndPriceContainer">
                <img id="CategoryTagImage" width="160" title="tagImg"/>
                <div class="CategoryTag">
                    평균 지출 가격: <span id="CategoryRepresentativePrice" class="top-category"></span>원
                </div>
            </div>
            <div class="logoAndQR">
                <img id="icLogo" src="../../resources/img/logo.png" width="170">
                <img id="icQR" src="../../resources/img/ic_QR.svg" width="60">
            </div>
        </div>

        <div class="monthlyKing2" id="monthlyKing2" style="display:none;">
            <img id="icClip2" src="../../resources/img/ic_clip.svg" width="70">
            <div class="tagTitle">이번 달 나의 소비태그</div>
            <!-- 이미지의 src를 동적으로 설정 -->
            <div class="imageAndPriceContainer">
                <img class="tagImg" id="AmountTagImage" alt="Monthly King" width="160" title="tagImg"/>
                <div class="CategoryTag">
                    평균 소비 가격: <span id="AmountRepresentativePrice" class="top-category"></span>원
                </div>
            </div>
            <div class="logoAndQR">
                <img id="icLogo2" src="../../resources/img/logo.png" width="170">
                <img id="icQR2" src="../../resources/img/ic_QR.svg" width="60">
            </div>
        </div>


        <div class="monthlyKing1Tmp" style="display: none">
            <div id="categoryImgTmp"></div>
            <div id="categoryRepresentativePriceTmp"></div>
        </div>
        <div class="monthlyKing2Tmp" style="display: none">
            <div id="amountImgTmp"></div>
            <div id="amountRepresentativePriceTmp"></div>
        </div>


    </div>
    <script>
        // 버튼 클릭 이벤트 리스너 추가
        var showTagsButton = document.getElementById('showTagsButton');
        showTagsButton.addEventListener('click', function () {
            // Toggle monthlyKing1 and monthlyKing2 visibility
            var monthlyKing1 = document.getElementById('monthlyKing1');
            var monthlyKing2 = document.getElementById('monthlyKing2');

            if (monthlyKing1.style.display === 'none') {
                monthlyKing1.style.display = 'block';
                monthlyKing2.style.display = 'none';
            } else {
                monthlyKing1.style.display = 'none';
                monthlyKing2.style.display = 'block';
            }

            var cardID = localStorage.getItem('cardID');

            // Ajax 요청 설정
            var xhr = new XMLHttpRequest();
            xhr.open('GET', '/checkMyExpenseData?cardID=' + cardID, true);

            // 요청 완료 후의 처리
            xhr.onload = function () {
                if (xhr.status === 200) {
                    // 서버로부터 받은 데이터를 JSON으로 파싱
                    var responseData = JSON.parse(xhr.responseText);

                    // 숫자를 3자리마다 쉼표로 구분된 문자열로 포맷팅하는 함수 정의
                    function formatNumber(number) {
                        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    }

                    // deatailTopCategory와 deatailTopAmount에서 필요한 데이터 추출
                    var topCategorySubCategoryDescription = responseData.topCategorySubCategoryDescription.subCategoryDescription;
                    var topAmountSubCategoryDescription = responseData.topAmountSubCategoryDescription.subCategoryDescription;
                    console.log("이거 카테고리 이름: " + topCategorySubCategoryDescription);
                    console.log("이거 어마운트카테고리 이름: " + topAmountSubCategoryDescription);
                    var categoryRepresentativePrice = responseData.deatailTopCategory.representativePrice;
                    var amountRepresentativePrice = responseData.deatailTopAmount.representativePrice;
                    // 가격 데이터를 포맷팅해서 HTML 요소에 데이터 삽입
                    document.getElementById('CategoryRepresentativePrice').textContent = formatNumber(categoryRepresentativePrice);
                    document.getElementById('AmountRepresentativePrice').textContent = formatNumber(amountRepresentativePrice);
                    // 이미지의 src 속성을 동적으로 설정
                    var categoryImage = "../../resources/img/" + responseData.deatailTopCategory.tagImage;
                    var amountImage = "../../resources/img/" + responseData.deatailTopAmount.tagImage;
                    document.getElementById('CategoryTagImage').src = categoryImage;
                    document.getElementById('AmountTagImage').src = amountImage;

                    //tmt
                    var categoryImg = responseData.deatailTopCategory.tagImage;
                    var amountImg = responseData.deatailTopAmount.tagImage;

                    document.getElementById('categoryRepresentativePriceTmp').textContent = formatNumber(categoryRepresentativePrice);
                    document.getElementById('amountRepresentativePriceTmp').textContent = formatNumber(amountRepresentativePrice);
                    document.getElementById('categoryImgTmp').textContent = categoryImg;
                    document.getElementById('amountImgTmp').textContent = amountImg;
                    randomInsertFunc();

                } else {
                    // 요청이 실패한 경우 에러 처리
                    console.error('Request failed. Status: ' + xhr.status);
                }
            };

            // 요청 보내기
            xhr.send();
        });
    </script>

    <script>
        function randomInsertFunc() {
            // 1 또는 2 중에서 랜덤한 값을 얻음
            var randomValue = Math.floor(Math.random() * 2) + 1;

            // 선택한 요소를 표시하고 다른 요소를 숨김
            if (randomValue === 1) {
                $('#monthlyKing1').show();
                $('#monthlyKing2').hide();
            } else {
                $('#monthlyKing1').hide();
                $('#monthlyKing2').show();
            }

            var selectedMonthlyKing = randomValue === 1 ? '#monthlyKing1' : '#monthlyKing2';
            console.log(selectedMonthlyKing);
            // monthlyKing1Tmp의 대표 가격 데이터 가져오기
            var categoryRepresentativePriceTmp = document.getElementById('categoryRepresentativePriceTmp').textContent;

            // monthlyKing1Tmp의 이미지 소스 데이터 가져오기
            var categoryImgTmp = document.getElementById('categoryImgTmp').textContent;

            // monthlyKing2Tmp의 대표 가격 데이터 가져오기
            var amountRepresentativePriceTmp = document.getElementById('amountRepresentativePriceTmp').textContent;

            // monthlyKing2Tmp의 이미지 소스 데이터 가져오기
            var amountImgTmp = document.getElementById('amountImgTmp').textContent;

            // 데이터를 로컬 스토리지에 저장
            localStorage.setItem("selectedMonthlyKing", selectedMonthlyKing);
            localStorage.setItem("categoryRepresentativePriceTmp", categoryRepresentativePriceTmp);
            localStorage.setItem("categoryImgTmp", categoryImgTmp);
            localStorage.setItem("amountRepresentativePriceTmp", amountRepresentativePriceTmp);
            localStorage.setItem("amountImgTmp", amountImgTmp);

            // 결과를 콘솔에 출력
            console.log('Selected Monthly King:', selectedMonthlyKing);
            console.log('Category Representative Price:', categoryRepresentativePriceTmp);
            console.log('Category Image Source:', categoryImgTmp);
            console.log('Amount Representative Price:', amountRepresentativePriceTmp);
            console.log('Amount Image Source:', amountImgTmp);
        }
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
