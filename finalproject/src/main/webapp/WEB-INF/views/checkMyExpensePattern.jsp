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
            border-radius: 20px;
            max-width: 900px;
        }

        .result-text1 {

            font-size: 24px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .result-text2 {

            font-size: 22px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            /* 	display: flex;
            justify-content: center; */
        }

        /* expense-amount 클래스에 대한 스타일 */
        .expense-amount {
            padding: 10px;
            font-size: 24px;
            font-weight: bold;
            font-family: "Hana2.0 CM";
            color: #6a978d;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* top-amount 클래스에 대한 스타일 */
        .top-amount {
            padding: 10px;
            font-size: 24px;
            font-weight: bold;
            font-family: "Hana2.0 CM";
            color: #4e72a0;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* category-count 클래스에 대한 스타일 */
        .category-count {
            padding: 10px;
            font-size: 24px;
            font-weight: bold;
            font-family: "Hana2.0 CM";
            color: #ff8e8e;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* top-category 클래스에 대한 스타일 */
        .top-category {
            padding: 10px;
            font-size: 24px;
            font-weight: bold;
            font-family: "Hana2.0 CM";
            color: orange;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }


        /* 이번 달 ------------------------------------------------------------------------------------------------------- */
        .thisMonthTitle {
            margin-left: 2%;
            margin-top: 5%;
            font-size: 24px;
            font-weight: 600;
            font-family: "Hana2.0 CM";
            color: #7ba299;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }


        .monthlyKing1 {
            margin-top: 5%;
            margin-right: 12%;
            border-radius: 30px;
            background-color: #88aba1;
            color: #4a4949;
            margin-bottom: 20px;
            margin-left: 30%;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.4); /* 그림자 효과 추가 */
        }

        .monthlyKing2 {
            margin-top: 5%;
            margin-right: 12%;
            border-radius: 30px;
            background-color: #88aba1;
            color: #4a4949;
            margin-bottom: 20px;
            margin-left: 30%;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.4); /* 그림자 효과 추가 */
        }

        .tagTitle {
            border-radius: 30px;
            font-weight: 800;
            font-size: 24px;
            font-family: "Hana2.0 CM";
            background-color: #FAF1E4;
            display: flex;
            justify-content: center;
            align-content: center;
            color: #4a4949;
            margin-top: -8%;

        }

        .imageAndPriceContainer {
            display: flex; /* Flexbox 레이아웃을 사용합니다. */
            align-items: center; /* 요소를 수직 가운데 정렬합니다. */
            margin-left: 12%;
            margin-top: 30px;
        }

        .CategoryTag {
            margin-left: 40px; /* 이미지와 대표가격 사이의 간격을 조절합니다. */
            font-weight: 500;
            font-size: 20px;
            font-family: "Hana2.0 CM";
        }

        #icClip, #icClip2 {
            margin-top: -5%;
            margin-left: 5%;
        }

        .logoAndQR {
            display: flex; /* Flexbox 레이아웃 사용 */
            justify-content: flex-end; /* 요소들을 오른쪽으로 정렬 */
            align-items: center; /* 요소들을 수직 가운데 정렬 */
            position: relative; /* 상대 위치 지정 */
            top: -20px; /* 위쪽으로 50px 이동 (원하는 만큼 조정 가능) */
            right: 20px;
        }


        /*.thisMonthContainer {*/
        /*    margin-right: 10%;*/
        /*    margin-top: 50px;*/
        /*    width: 90%;*/
        /*    border: 4px dashed #ccc;*/
        /*    border-radius: 30px;*/
        /*    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);*/
        /*}*/

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
        <div class="chartTitle">• 나의 지출 차트</div>
    </div>
    <div class="expense-section">
        <%--        <div class="chart-container" style="width: 60%;">--%>
        <%--            <% String cardNum = request.getParameter("cardNum"); %>--%>
        <%--            <% String cardName = request.getParameter("cardName"); %>--%>
        <%--            <% String cardExpiryDate = request.getParameter("cardExpiryDate"); %>--%>
        <%--            <% String CVV = request.getParameter("CVV"); %>--%>
        <%--            <% String cardType = request.getParameter("cardType"); %>--%>

        <%--            <p>Card Number: <%= cardNum %></p>--%>
        <%--            <p>Name: <%= cardName %></p>--%>
        <%--            <p>Expiry Date: <%= cardExpiryDate %></p>--%>
        <%--            <p>CVV: <%= CVV %></p>--%>
        <%--            <p>Type: <%= cardType %></p>--%>
        <%--            <canvas id="expenseChart"></canvas>--%>


        <%--            <script>--%>
        <%--                // 서버에서 받은 데이터를 JavaScript 변수로 변환합니다.--%>
        <%--                var expenseData = /* 서버에서 받은 데이터 */;--%>

        <%--                // Chart.js를 사용하여 그래프를 그립니다.--%>
        <%--                var ctx = document.getElementById('expenseChart').getContext('2d');--%>
        <%--                var expenseChart = new Chart(ctx, {--%>
        <%--                    type: 'bar', // 그래프 유형을 선택합니다. (막대 그래프, 선 그래프 등)--%>
        <%--                    data: {--%>
        <%--                        labels: expenseData.map(data => data.expenseCategoryCode), // X축 레이블 설정--%>
        <%--                        datasets: [{--%>
        <%--                            label: 'Total Expense Amount', // 그래프 레이블--%>
        <%--                            data: expenseData.map(data => data.totalExpenseCategoryExpenseAmount), // Y축 데이터 설정--%>
        <%--                            backgroundColor: 'rgba(75, 192, 192, 0.2)', // 막대 그래프 색상--%>
        <%--                            borderColor: 'rgba(75, 192, 192, 1)', // 막대 그래프 테두리 색상--%>
        <%--                            borderWidth: 1 // 테두리 두께--%>
        <%--                        }]--%>
        <%--                    },--%>
        <%--                    options: {--%>
        <%--                        scales: {--%>
        <%--                            y: {--%>
        <%--                                beginAtZero: true--%>
        <%--                            }--%>
        <%--                        }--%>
        <%--                    }--%>
        <%--                });--%>
        <%--            </script>--%>
        <%--        </div>--%>


        <!-- 차트를 표시할 영역 -->
        <div id="expenseChart" style="width: 80%; margin: 0 auto;"></div>


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

        <div class="expense-summary" style="width: 40%;">
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

// 이제 formatNumber 함수를 사용할 수 있습니다.

                    // 데이터를 화면에 표시
                    document.getElementById('topCategoryValue').textContent = responseData.topCategory.expenseCategoryCode;
                    document.getElementById('categoryCountValue').textContent = responseData.topCategory.categoryCount;
                    document.getElementById('topAmountValue').textContent = responseData.topAmount.expenseCategoryCode;
                    document.getElementById('totalAmountValue').textContent = formatNumber(responseData.topAmount.totalAmount);
                    document.getElementById('totalExpenseAmountValue').textContent = formatNumber(responseData.totalExpenseAmount.totalExpenseAmount);

                    // document.getElementById('CategoryRepresentativePrice').textContent = responseData.deatailTopCategory.RepresentativePrice;
                    // document.getElementById('CategoryParentCategoryCode').textContent = responseData.deatailTopCategory.ParentCategoryCode
                    // document.getElementById('CategoryTagImage').textContent = responseData.deatailTopCategory.TagImage;
                    // document.getElementById('CategoryexpenseCategoryCode').textContent = responseData.deatailTopCategory.expenseCategoryCode;
                    //
                    // document.getElementById('AmountRepresentativePrice').textContent = responseData.deatailTopCategory.RepresentativePrice;
                    // document.getElementById('AmountParentCategoryCode').textContent = responseData.deatailTopAmount.ParentCategoryCode
                    // document.getElementById('AmountTagImage').textContent = responseData.deatailTopAmount.TagImage;
                    // document.getElementById('AmountexpenseCategoryCode').textContent = responseData.deatailTopAmount.expenseCategoryCode;

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
        <div class="result-text1">🏁 결산 : 이번 달 <%= name %> 님은 총 <span id="totalExpenseAmountValue"
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
                그 결과, 이번 달  <%= name %>  님은...
            </div>
        </div>
        <!-- if= 지출카테고리가 무엇일때 그에 맞는 이미지 띄우기 ! -->
        <div class="monthlyKing1" id="monthlyKing1">
            <img id="icClip" src="../../resources/img/ic_clip.svg" width="64">
            <div class="tagTitle">< 이번 달 나의 소비태그 ></div>
            <!-- 이미지의 src를 동적으로 설정 -->
            <div class="imageAndPriceContainer">
                <img id="CategoryTagImage" alt="Monthly King" width="240"/>
                <div class="CategoryTag">
                    대표가격: <span id="CategoryRepresentativePrice" class="top-category"></span>원
                </div>
            </div>
            <div class="logoAndQR">
                <img id="icLogo" src="../../resources/img/logo.png" width="170">
                <img id="icQR" src="../../resources/img/ic_QR.svg" width="60">
            </div>
        </div>

        <div class="monthlyKing2" id="monthlyKing2">
            <img id="icClip2" src="../../resources/img/ic_clip.svg" width="64">
            <div class="tagTitle">< 이번 달 나의 소비태그 ></div>
            <!-- 이미지의 src를 동적으로 설정 -->
            <div class="imageAndPriceContainer">
                <img id="AmountTagImage" alt="Monthly King" width="240"/>
                <div class="CategoryTag">
                    대표가격: <span id="AmountRepresentativePrice" class="top-category"></span>원
                </div>
            </div>
            <div class="logoAndQR">
                <img id="icLogo2" src="../../resources/img/logo.png" width="170">
                <img id="icQR2" src="../../resources/img/ic_QR.svg" width="60">
            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // 1 또는 2 중에서 랜덤한 값을 얻음
                var randomValue = Math.floor(Math.random() * 2) + 1;

                // 선택한 요소를 표시하고 다른 요소를 숨김
                if (randomValue === 1) {
                    document.getElementById('monthlyKing1').style.display = 'block';
                    document.getElementById('monthlyKing2').style.display = 'none';
                } else {
                    document.getElementById('monthlyKing1').style.display = 'none';
                    document.getElementById('monthlyKing2').style.display = 'block';
                }

                // 선택된 monthlyKing에서 이미지와 가격 데이터 가져오기
                var selectedImageSrc = document.getElementById('selectedImage').src;
                var selectedPrice = document.getElementById('selectedPrice').textContent;

                // 데이터를 JSON 형식으로 구성
                var data = {
                    imageSrc: selectedImageSrc,
                    price: selectedPrice
                };

                // AJAX 요청을 보내어 데이터를 myWishListDetail.jsp로 전송
                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'myWishListDetail.jsp', true);
                xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

                xhr.onload = function () {
                    if (xhr.status === 200) {
                        // 서버로부터의 응답 처리
                        console.log('Data sent successfully!');
                    } else {
                        console.error('Request failed. Status: ' + xhr.status);
                    }
                };

                xhr.send(JSON.stringify(data));
            });

        </script>
    </div>
    <script>
        // 페이지 로딩이 완료되면 실행
        document.addEventListener('DOMContentLoaded', function () {
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
                    var categoryRepresentativePrice = responseData.deatailTopCategory.representativePrice;
                    var amountRepresentativePrice = responseData.deatailTopAmount.representativePrice;

                    // 이미지의 src 속성을 동적으로 설정
                    var categoryImage = "../../resources/img/" + responseData.deatailTopCategory.tagImage;
                    var amountImage = "../../resources/img/" + responseData.deatailTopAmount.tagImage;
                    document.getElementById('CategoryTagImage').src = categoryImage;
                    document.getElementById('AmountTagImage').src = amountImage;

                    // 가격 데이터를 포맷팅해서 HTML 요소에 데이터 삽입
                    document.getElementById('CategoryRepresentativePrice').textContent = formatNumber(categoryRepresentativePrice);
                    document.getElementById('AmountRepresentativePrice').textContent = formatNumber(amountRepresentativePrice);

                } else {
                    // 요청이 실패한 경우 에러 처리
                    console.error('Request failed. Status: ' + xhr.status);
                }
            };

            // 요청 보내기
            xhr.send();
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
