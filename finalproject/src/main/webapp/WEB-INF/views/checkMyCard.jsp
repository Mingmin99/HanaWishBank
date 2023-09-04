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

        .cardtitle {
            margin-top: 48px;
            font-size: 24px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            margin-bottom: 3%;
        }

        @font-face {
            font-family: 'LocusSangsang';
            font-weight: normal;
            font-style: normal;
            src: url('https://cdn.jsdelivr.net/gh/webfontworld/locus/LocusSangsang.eot');
            src: url('https://cdn.jsdelivr.net/gh/webfontworld/locus/LocusSangsang.eot?#iefix') format('embedded-opentype'),
            url('https://cdn.jsdelivr.net/gh/webfontworld/locus/LocusSangsang.woff2') format('woff2'),
            url('https://cdn.jsdelivr.net/gh/webfontworld/locus/LocusSangsang.woff') format('woff'),
            url('https://cdn.jsdelivr.net/gh/webfontworld/locus/LocusSangsang.ttf') format("truetype");
            font-display: swap;
        }


        .hover__wrap {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: -100px;
        }

        .hover__wrap > div {
            margin: 3%;
            position: relative;
            perspective: 1000px;
        }


        .hover__wrap > div .front {
            transition: transform 1s;
            backface-visibility: hidden;
            transform-style: preserve-3d;
        }

        .hover__wrap > div .back {
            position: absolute;
            left: 0;
            top: 0;
            z-index: -1;
            transition: transform 1s;
            transform-style: preserve-3d;
        }

        .hover__wrap > div figcaption {
            background: rgba(0, 0, 0, 0.4);
            color: #f8f8ff;
            text-align: center;
            padding: 10px;
            line-height: 1.5;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%) translatez(100px);
            width: 80%;
            backface-visibility: hidden;
        }

        /*  mouse hover effect */
        .hover__updown .front {
            transform: rotateX(0deg);
        }

        .hover__updown:hover .front {
            transform: rotateX(180deg);
        }

        .hover__updown .back {
            transform: rotateX(-180deg);
        }

        .hover__updown:hover .back {
            transform: rotateX(0deg);
        }

        .hover__leftright .front {
            transform: rotateY(0deg);
        }

        .hover__leftright:hover .front {
            transform: rotateY(180deg);
        }

        .hover__leftright .back {
            transform: rotateY(-180deg);
        }

        .hover__leftright:hover .back {
            transform: rotateY(0deg);
        }

        .card-info {
            border: 2px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            background-color: #f9f9f9;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 480px;
            margin: 0 auto;
        }

        .card-info > div {
            padding: 5px;
        }

        .cardNum {
            font-family: "Hana2.0 L";
            color: #333;
        }

        .cardName {
            font-family: "Hana2.0 L";
            color: #555;
        }

        .cardExpiryDate,
        .CVV {
            font-family: "Hana2.0 L";
            color: #777;
        }

        .cardType {
            font-family: "Hana2.0 L";
            color: #888;
        }



        #cardButton {
            background-color: #9bc5bc; /* 배경색 */
            color: #fff; /* 글자색 */
            padding: 10px 20px; /* 내부 여백 */
            margin-top: 30px;
            border: none; /* 테두리 없음 */
            width: 400px;
            border-radius: 5px; /* 모서리 둥글게 */
            cursor: pointer; /* 마우스 커서 모양 변경 */
            display: flex; /* 내용을 가로 정렬하기 위해 */
            justify-content: center; /* 가로 정렬 */
            align-items: center; /* 세로 정렬 */

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
            <img src="<c:url value='../../resources/img/ic_cards.svg' />" alt="Main Wish List"
                 width="80" style="vertical-align: middle; margin-right: 10px;">
            나의 카드조회
        </div>

        <div class="description-box">
            <div class="description-text1">💳 등록된 카드를 조회해보세요!
                🧐
            </div>
            <div class="description-text2">➡️ 카드를 선택하여 나의 소비패턴을 확인해보세요 ~</div>
        </div>
        <hr class="divider">

        <div class="cardtitle">• 내가 보유한 카드</div>

        <div class="container">
            <div class="row">
                <c:forEach items="${registeredCards}" var="card">
                    <div class="col-md-6">
                        <div class="hover__wrap">
                            <div class="hover__leftright">
                                <figure class="front">
                                    <img src="../../resources/img/${card.imageFront}" alt="hoverLeft 이미지"
                                         width="400px">
                                    <figcaption>
                                        <h6>${card.cardOwnerName}님이 보유한  ${card.cardType}</h6>
                                    </figcaption>
                                </figure>
                                <figure class="back">
                                    <img src="../../resources/img/${card.imageBack}" alt="hoverRight 이미지"
                                         width="400px">
                                    <figcaption>
                                        <h6>${card.cardOwnerName}님이 보유한 ${card.cardType}</h6>
                                    </figcaption>
                                </figure>

                                <div class="card-info">
                                    <div class="cardID" style="display: none;">카드아이디: ${card.cardID}</div>
                                    <div class="cardNum">카드번호: ${card.cardNumber}</div>
                                    <div class="cardName">이름: ${card.cardOwnerName}</div>
                                    <div class="cardExpiryDate">카드유효기간: ${card.cardExpiryDate}</div>
                                    <div class="CVV">CVV: ${card.CVV}</div>
                                    <div class="cardType">Type: ${card.cardType}</div>

                                </div>
                                <button class="getCardIDButton" id="cardButton">소비내역 조회하기</button>
                                <script>
                                    var buttons = document.querySelectorAll('.getCardIDButton'); // 모든 버튼 요소 선택

                                    buttons.forEach(function (button) {
                                        button.addEventListener('click', function () {
                                            // 클릭한 버튼의 부모 요소에서 .cardID 요소를 찾음
                                            var cardInfoDiv = button.parentElement.querySelector('.cardID');

                                            // cardInfoDiv에서 cardID를 추출
                                            var cardID = cardInfoDiv.textContent.split(': ')[1];

                                            // cardID 값을 콘솔에 출력
                                            console.log("Card ID: " + cardID);

                                            // Ajax 요청 설정
                                            var xhr = new XMLHttpRequest();
                                            xhr.open('GET', '/checkMyExpenseData?cardID=' + cardID, true);
                                            // 데이터를 localStorage에 저장
                                            localStorage.setItem('cardID', cardID);
                                            // 요청 완료 후의 처리
                                            xhr.onload = function () {
                                                if (xhr.status === 200) {
                                                    // 서버로부터 받은 데이터를 처리
                                                    var responseData = JSON.parse(xhr.responseText);

                                                    // 콘솔에 데이터 출력
                                                    console.log("Top Category: " + responseData.topCategory.expenseCategoryCode + ", Count: " + responseData.topCategory.categoryCount);
                                                    console.log("Top Amount Category: " + responseData.topAmount.expenseCategoryCode + ", Total Amount: " + responseData.topAmount.totalAmount);

                                                    // totalExpenseAmount 출력
                                                    console.log("Total Expense Amount: " + responseData.totalExpenseAmount.totalExpenseAmount);

                                                    // 결과 데이터를 가지고 페이지 이동
                                                    // 여기에서 원하는 방식으로 데이터를 페이지로 전달할 수 있습니다.
                                                    // 페이지 이동 URL을 생성
                                                    var redirectUrl = '/checkMyExpensePattern?'
                                                        + 'topCategory=' + responseData.topCategory.expenseCategoryCode
                                                        + '&categoryCount=' + responseData.topCategory.categoryCount
                                                        + '&topAmount=' + responseData.topAmount.expenseCategoryCode
                                                        + '&totalAmount=' + responseData.topAmount.totalAmount
                                                        + '&totalExpenseAmount=' + responseData.totalExpenseAmount.totalExpenseAmount;

                                                    // 페이지 이동
                                                    window.location.href = '/checkMyExpensePattern';
                                                } else {
                                                    // 요청이 실패한 경우 에러 처리
                                                    console.error('Request failed. Status: ' + xhr.status);
                                                }
                                            };

                                            // 요청 보내기
                                            xhr.send();
                                        }); // button.addEventListener 끝
                                    }); // buttons.forEach 끝

                                </script>

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

    </main>

    <!-- 푸터 -->
    <%@ include file="include/footer.jsp" %>
    <!-- 부트스트랩 JavaScript 연결 -->
    <!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">

    <!— 부트스트랩 JavaScript 연결 —>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>

    <!— Unpkg AOS 연결 —>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css">

    <!— jQuery 연결 —>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>
