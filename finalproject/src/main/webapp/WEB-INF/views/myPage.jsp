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

        .sectionTitle {
            margin-top: 3%;
            margin-left: 4%;
            font-size: 30px;
            font-family: "Hana2.0 CM";
            color: #4a4949;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);

        }

        .Title {
            margin-top: 5% !important;
            margin-bottom: 2% !important;
            margin-left: 4%;
            font-size: 26px;
            font-family: "Hana2.0 CM";
            color: #646464;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* 탭 스타일 */
        .tabs {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        .tabs li {
            margin-top: 30px;
            margin-left: 20px;
        }

        .tabs a {
            font-size: 20px;
            font-family: "Hana2.0 CM";
            padding: 10px 30px;
            background-color: #c3d5d1;
            border: 1px solid #c3d5d1;
            border-radius: 40px;
            color: #4a4949;
            text-decoration: none; /* 밑줄 제거 */
            transition: background-color 0.3s, color 0.3s, box-shadow 0.3s;
        }

        .tabs a:hover {
            text-decoration: none; /* 밑줄 제거 */
            background-color: #b4d0ca;
            color: #4a4949;
        }

        .tab-content {
            padding-bottom: 5% !important;
            margin-top: -10px;
            display: none;
            padding: 20px;
            background-image: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
            /*background-color: #ecdede;*/
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .tab-content.active {
            display: block;
        }

        section {
            width: 95%;

        }

        /*----------------------프로필---------------------- */
        .profileDataImg {
            margin-top: 15%;
        }

        /* 프로필 데이터 스타일 */
        .profileData {
            margin-left: -180px;
            margin-top: 3%;
            background-color: #fffefe;
            border: 1px solid #E0E0E0;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0px 0px 5px #B0B0B0;
        }

        /* 각 데이터 항목 스타일 */
        .profileDataInfo {
            margin-bottom: 10px;
            font-family: "Hana2.0 CM";
            color: #4a4949 !important;
            font-size: 16px;
        }

        /* 라벨 스타일 */
        .profileDataInfo::before {
            content: attr(id);
            color: #7f9899;
            font-weight: bold !important;
            margin-right: 5px;
        }

        /* 데이터 값 스타일 */
        .profileDataInfo::after {
            content: attr(data-value);

        }

        /*----------상세정보------------------------------------------------------*/
        .detailInfoContainer {
            justify-content: center;
            align-items: center;

        }

        .detailInfoContainer-col {
            background-color: #fff; /* 박스 배경 색상 */
            border: 1px solid #ddd; /* 테두리 스타일 */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            padding: 10px;
            margin: 20px;
            border-radius: 8px; /* 박스 모서리를 둥글게 만듦 */
            text-align: center;
        }

        @keyframes border-glow {
            0% {
                box-shadow: 0 0 5px #f4b8a3;
            }
            50% {
                box-shadow: 0 0 20px #f4b8a3;
            }
            100% {
                box-shadow: 0 0 5px #f4b8a3;
            }
        }

        .completedSavingsDetailInfoContainer-col {
            background-color: #fff; /* 박스 배경 색상 */
            border: 1px solid #ddd; /* 테두리 스타일 */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            padding: 10px;
            margin: 15px;
            border-radius: 8px; /* 박스 모서리를 둥글게 만듦 */
            text-align: center;
            animation: border-glow 2s infinite;
        }

        .countName {
            margin-bottom: 10px;
            font-family: "Hana2.0 CM";
            color: #4a4949 !important;
        }

        .count {
            font-family: "Hana2.0 CM";
            color: #4a4949 !important;

        }

        #completedSavingsCount {
            font-family: "Hana2.0 CM";
            font-size: 30px;
            display: flex;
            text-align: center;
            justify-content: flex-start;
            margin-top: 6%;
            margin-left: -200px;
            color: #7f9899 !important;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }


        .completedCheerMsg {
            font-family: "Hana2.0 L";
            font-size: 20px;
            display: flex;
            text-align: center;
            justify-content: flex-start;
            margin-top: 3%;
            margin-bottom: 3%;
            margin-left: -200px;
            color: #4a4949 !important;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .custom-buttonContainer {
            margin-top: 1%;
            justify-content: center;
            align-items: center;
        }

        .custom-button {
            margin-top: -30px;
            padding: 10px 20px;
            background-color: #c3d5d1; /* 버튼 배경 색상 */
            color: #4a4949; /* 텍스트 색상 */
            text-decoration: none;
            border-radius: 20px;
            font-weight: bold;
            transition: background-color 0.3s ease; /* 애니메이션 효과 */
            font-family: "Hana2.0 CM";
        }

        /*---------------이체내역 ---------------*/

        /* 테이블 타이틀 스타일 */
        .transferRecordContainer .Title {
            margin-bottom: 30px;
            margin-top: 50px;
        }

        /* 테이블 스타일 */
        .transferRecordContainer table {
            width: 96%;
            border-collapse: collapse;
            margin: auto;
        }

        /* 테이블 헤더 스타일 */
        .transferRecordContainer th {
            background-color: #c3d5d1;
            color: #4a4949;
            padding: 10px;
            text-align: center;
            font-size: 16px;
        }

        /* 테이블 셀 스타일 */
        .transferRecordContainer td {
            border: 1px solid #4a4949;
            padding: 5px;
            text-align: center;
            font-size: 14px;
        }

        /* 짝수 행 배경
/* 짝수 행 배경색 스타일 */
        .transferRecordContainer tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* 테이블 테두리 스타일 */
        .transferRecordContainer td, .transferRecordContainer th {
            border: 1px solid #b3b3b3;
        }

        /* 마우스 호버 스타일 */
        .transferRecordContainer tbody tr:hover {
            background-color: #c3d5d1;
            cursor: pointer;
        }

        /* 테이블 내용 중앙 정렬 스타일 */
        .transferRecordContainer td {
            text-align: center;
        }

        /* Pagination 컨테이너 */
        .pagination {
            display: flex;
            justify-content: center;
            text-align: center;
            margin-top: 20px; /* 위쪽 여백 조정 */
            font-size: 15px;
        }

        /* 이전 및 다음 버튼 스타일 */
        #prevPage, #nextPage {
            background-color: #c3d5d1;
            color: #252525;
            font-family: "Hana2.0 CM";
            border: none;
            border-radius: 10px;
            padding: 5px 20px;
            cursor: pointer;

            font-size: 15px;
        }

        button#prevPage:hover {
            background-color: #f2f2f2;
        }

        button#nextPage:hover {
            background-color: #f2f2f2;
        }
        /* 현재 페이지 텍스트 스타일 */
        #currentPage {
            margin: 0 20px;
            margin-top: 5px !important;
            font-family: "Hana2.0 CM";
            font-size: 15px;
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
    <!---위시리스트 조회   ------------------------------------------------------------------------------------------------------- -->

    <nav>
        <!-- 네비게이션 메뉴 탭 -->
        <ul class="tabs">
            <li><a href="#profile">기본정보</a></li>
            <li><a href="#detailInfo">상세정보</a></li>
        </ul>
    </nav>


    <section id="profile" class="tab-content">
        <!-- 프로필 정보 표시 -->
        <div class="sectionTitle"> 기본정보</div>
        <div class="row">
            <div class="col mx-2">
                <div class="profileDataImg">
                    <img src="<c:url value='../../resources/img/iv_profileDataImg.svg' /> ">
                </div>
            </div>
            <!-- HTML 부분 -->
            <div class="col mx-2">
                <div class="profileData">
                    <div class="profileDataInfo" id="Name"></div>
                    <div class="profileDataInfo" id="Gender"></div>
                    <div class="profileDataInfo" id="Email"></div>
                    <div class="profileDataInfo" id="Phone"></div>
                    <div class="profileDataInfo" id="Birth"></div>
                    <div class="profileDataInfo" id="Zipcode"></div>
                    <div class="profileDataInfo" id="Address"></div>
                    <div class="profileDataInfo" id="DetailAddress"></div>
                    <div class="profileDataInfo" id="RegisterDate"></div>
                </div>
            </div>

            <script>
                $(document).ready(function () {
                    // Ajax 요청 수행
                    $.ajax({
                        url: '/getHWBMemberInfoByID', // 데이터를 가져올 엔드포인트
                        method: 'GET', // GET 요청

                        success: function (data) {
                            // 서버에서 가져온 JSON 데이터를 파싱
                            var memberInfo = data;
                            console.log(memberInfo);

                            // 프로필 데이터 항목 채우기
                            $('#Name').text(': ' + memberInfo.name);
                            $('#Gender').text(': ' + memberInfo.gender);
                            $('#Email').text(': ' + memberInfo.email);
                            $('#Phone').text(': ' + memberInfo.phone);
                            $('#Birth').text(': ' + memberInfo.birth);
                            $('#Zipcode').text(': ' + memberInfo.zipCode);
                            $('#Address').text(': ' + memberInfo.address);
                            $('#DetailAddress').text(': ' + memberInfo.detailAddress);
                            $('#RegisterDate').text(': ' + memberInfo.registerDate);
                        },
                        error: function (error) {
                            console.log('Ajax 요청 에러: ' + error);
                        }
                    });
                });
            </script>
        </div>
    </section>

    <section id="detailInfo" class="tab-content">
        <div class="sectionTitle"> 상세정보</div>

        <div class="Title">• 달성한 챌린지 개수</div>
        <div class="col completedSavingsDetailInfoContainer-col">
            <div class="row">
                <div class="col completedSavingsImg-col"><img class="menu-icon"
                                                              src="../../resources/img/iv_completedSavings.png"
                                                              alt="아이콘 3" style="margin-left: -200px !important;"></div>
                <div class="col completedSavingsMsg-col">
                    <div class="count" id="completedSavingsCount"></div>
                    <div class="completedCheerMsg">목표를 이루기까지 고생 많으셨습니다. 부자가 될 날이 멀지 않았어요!</div>
                </div>
            </div>


        </div>

        <div class="Title">• 등록 현황</div>
        <div class="detailInfoContainer text-center">
            <div class="row">
                <div class="col detailInfoContainer-col">
                    <img class="menu-icon" src="../../resources/img/ic_wishList.svg" alt="아이콘 3"
                         style="margin-bottom: 10px; margin-top: 5px;">
                    <div class="countName">나의 위시리스트 아이템 개수</div>
                    <div class="count" id="wishListItemCount"></div>
                </div>
                <div class="col detailInfoContainer-col">
                    <img class="menu-icon" src="../../resources/img/ic_purchasePlanList.svg" alt="아이콘 3">
                    <div class="countName"> 나의 구매계획리스트 아이템 개수</div>
                    <div class="count" id="purchasePlanCount"></div>
                </div>
                <div class="col detailInfoContainer-col">
                    <img class="menu-icon" src="../../resources/img/ic_challengeSaving.svg" alt="아이콘 3"
                         style="margin-bottom: 10px; margin-top: 5px;">
                    <div class="countName"> 나의 챌린지 적금 개수</div>
                    <div class="count" id="challengeSavingsCount"></div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $.ajax({
                    type: "GET",
                    url: "/getCounts", // 위에서 정의한 컨트롤러 메서드 엔드포인트
                    success: function (data) {
                        $("#wishListItemCount").text(data.wishListItemCount + "개");
                        $("#purchasePlanCount").text(data.purchasePlanCount + "개");
                        $("#challengeSavingsCount").text(data.challengeSavingsCount + "개");
                        $("#completedSavingsCount").text(data.completedSavingsCount + "개의 챌린지 달성!");

                    },
                    error: function () {
                        console.log("에러 발생");
                    }
                });
            });
        </script>
        <div class="custom-buttonContainer text-center">
            <div class="row">
                <div class="col custom-button-col">
                    <a href="/checkMyWishList" class="custom-button">나의 위시리스트 바로가기</a>
                </div>
                <div class="col  custom-button-col">
                    <a href="/checkMyPurchasePlanList" class="custom-button">나의 구매계획리스트 바로가기 </a>
                </div>
                <div class="col  custom-button-col">
                    <a href="/checkMyChallengeSavings" class="custom-button">나의 챌린지 적금 바로가기</a>
                </div>
            </div>
        </div>
        <div class="transferRecordContainer">
            <div class="Title">• 이체 내역</div>
            <table>
                <thead>
                <tr>
                    <th>번호</th>
                    <th>입금 계좌</th>
                    <th>출금 계좌</th>
                    <th>이체 금액</th>
                    <th>이체 날짜</th>
                    <th>이체 방법</th>
                </tr>
                </thead>
                <tbody id="transferRecords">
                <!-- 이곳에 이체 내역이 동적으로 추가될 것입니다 -->
                </tbody>
            </table>
        </div>
        <div class="pagination">
            <button id="prevPage">이전</button>
            <span id="currentPage">1</span>
            <button id="nextPage">다음</button>
        </div>

        <script>
            $(document).ready(function () {
                var data; // AJAX로 가져온 데이터 저장
                var currentPage = 1; // 현재 페이지
                var recordsPerPage = 10; // 페이지당 표시할 레코드 수

                var tbody = $("#transferRecords"); // 표 데이터가 들어갈 tbody 요소
                var prevPageBtn = $("#prevPage");
                var nextPageBtn = $("#nextPage");
                var currentPageText = $("#currentPage");

                // AJAX로 데이터 가져오는 부분
                $.ajax({
                    type: "GET",
                    url: "/getTransferRecordByID",
                    success: function (responseData) {
                        data = responseData;
                        updateTable();
                    },
                    error: function () {
                        console.log("에러 발생");
                    }
                });

                // 이전 페이지로 이동
                prevPageBtn.on("click", function () {
                    if (currentPage > 1) {
                        currentPage--;
                        updateTable();
                    }
                });

                // 다음 페이지로 이동
                nextPageBtn.on("click", function () {
                    var totalRecords = data.length;
                    var totalPages = Math.ceil(totalRecords / recordsPerPage);
                    if (currentPage < totalPages) {
                        currentPage++;
                        updateTable();
                    }
                });

                // 테이블 업데이트 함수
                function updateTable() {
                    var start = (currentPage - 1) * recordsPerPage;
                    var end = start + recordsPerPage;
                    var displayedData = data.slice(start, end);

                    tbody.empty();

                    for (var i = 0; i < displayedData.length; i++) {
                        var record = displayedData[i];
                        var newRow = $("<tr>");

                        newRow.append($("<td>").text(i + 1));
                        newRow.append($("<td>").text(record.depositAccount));
                        newRow.append($("<td>").text(record.accountNumber));
                        newRow.append($("<td>").text(record.transferAmount.toLocaleString() + "원"));
                        newRow.append($("<td>").text(record.transferDate));
                        newRow.append($("<td>").text(record.transferMethod));

                        tbody.append(newRow);
                    }

                    currentPageText.text(+currentPage);
                }
            });

        </script>
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
