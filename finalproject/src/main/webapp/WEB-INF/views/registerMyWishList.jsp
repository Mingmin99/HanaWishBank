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
            height: 3000px;
        }

        .RegisterMyWishListtitle {
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
            font-family:"Hana2.0 L";
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .description-text2 {
            padding: 10px;
            font-size: 16px;
            font-weight: 500;
            font-family:"Hana2.0 L";
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            /* 	display: flex;
            justify-content: center; */
        }

        .wishListSearchTitle {
            margin-top: 48px;
            font-size: 24px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);

        }

        #search-results h3 {
            margin-top: 48px;
            font-size: 24px;
            font-weight: 500;
            font-family: "Hana2.0 CM";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);

        }

        .howToRegister {
            margin-top: 2%;
            font-size: 16px;
            font-weight: 500;
            font-family: "Hana2.0 L";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);


        }

        #search-form {
            display: flex;
            align-items: center;
            margin: 20px 0;
        }

        #search-query {
            padding: 10px;
            border: none;
            border-radius: 50px;
            font-size: 18px;
            background-color: #f2f2f2;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 500px;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        #search-query::placeholder {
            color: #aaa;
        }

        #search-query:focus {
            background-color: #fff;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            outline: none;
        }

        #search-button {
            background-color: #7ba299;
            color: #fff;
            border: none;
            border-radius: 50px;
            padding: 10px 30px;
            font-size: 18px;
            margin-left: 8px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        #search-button:hover {
            background-color: #7ba299;
            transform: scale(1.05);
        }


        table {
            margin-top: 4%;
            width: 90%;
            border-collapse: collapse;
            border: 1px solid #ddd;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        th, td {
            font-size: medium;
            padding: 10px;
            vertical-align: middle;
            font-family: "Hana2.0 CM";
        }

        th {
            background-color: #99aca8;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .item-info {
            color: #4F4F4F;
            display: flex;
            align-items: center;


        }

        .item-image {
            width: 10%;
            margin-right: 10px;
        }

        .item-title {
            color: #4F4F4F !important;
            font-family: "Hana2.0 CM";
        }


        .title {
            color: #4F4F4F;
            font-weight: bold;
            word-wrap: break-word;
            max-width: 200px;
            font-size: medium;
            margin-bottom: 5px;
            text-align: left;
            font-family: "Hana2.0 CM";
            cursor: pointer;
            text-decoration: none;
        }

        a {
            color: #0d6efd;
            text-decoration: none !important;
            font-family: "Hana2.0 CM";

        }

        .price {
            margin-left: auto;
            font-size: medium;
            font-family: "Hana2.0 CM";
        }

        .left-align {
            text-align: left;
        }

        .right-align {
            text-align: right;
        }

        .pagination {
            margin-top: 20px;
            text-align: center;
        }

        .pagination a, .pagination span {
            display: inline-block;
            padding: 8px 16px;
            margin: 0 5px;
            border: 1px solid #ddd;
            text-decoration: none;
            color: #333;
        }

        .pagination a:hover {
            background-color: #f2f2f2;
        }

        .current-page {
            background-color: #007bff;
            color: #fff;
            border: 1px solid #007bff;
        }

        /* 모달 창 스타일 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 1000;
        }

        .modal-content {
            background-color: white;
            width: 60%;
            max-width: 400px;
            margin: 10% auto;
            padding: 20px;
            border-radius: 2rem;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        .modal-content p {
            font-size: 16px;
            margin-bottom: 20px;
            text-align: center;
        }

        .modal-content button {
            padding: 10px 20px;
            margin-right: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-content button#modal-confirm {
            background-color: #7ba299;
            color: white;
            margin-bottom: 10px;
        }

        .modal-content button#modal-cancel {
            background-color: #ddd;
            color: black;
        }

        /* 링크 스타일 */
        .item-title {
            color: #007bff;
            text-decoration: underline;
            cursor: pointer;
        }

    </style>
    <!-- 부트스트랩 연결 -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<%@ include file="include/header.jsp" %>
<body>


<!-- 사이드바  ------------------------------------------------------------------------------------------------------- -->
<div class="sidebar">
    <h3>나의 위시리스트</h3>
    <ul>
        <li><a href="/checkMyWishList">나의 위시리스트 조회</a></li>
        <li><a href="/registerMyWishList">나의 위시리스트 등록</a></li>
        <!-- <li><a href="#">대출신청</a></li>
        <li><a href="#">카드신청</a></li>
        <li><a href="#">고객센터</a></li> -->
    </ul>
</div>
<!---메인  ------------------------------------------------------------------------------------------------------- -->
<main>
    <div class="RegisterMyWishListtitle">
        <img src="<c:url value='../../resources/img/ic_wishList.svg' />" alt="Main Wish List"
             width="70" style="vertical-align: middle;"> 나의 위시리스트 등록
    </div>

    <div class="description-box">
        <div class="description-text1">💍 사고 싶은 것들이 너무 많나요? 고민하지 말아요!
            😎
        </div>
        <div class="description-text2">➡️ 위시리스트 등록 후 나만의 위시리스트를 작성해보세요!</div>
    </div>
    <hr class="divider">
    <!-- 검색 api  ------------------------------------------------------------------------------------------------------- -->
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <div class="wishListSearchTitle">◆ 나의 위시리스트 아이템 검색</div>
    <form id="search-form" action="/search" method="get">
        <input type="text" id="search-query" name="text" placeholder="아이템 검색">
        <button type="submit" id="search-button">검색</button>
    </form>


    <div id="search-results">
        <h3>◆ 검색결과</h3>
        <div class="howToRegister"> • 상품명을 클릭하시면 위시리스트에 등록하실 수 있습니다.</div>

        <table>
            <thead>
            <tr>
                <th>이미지</th>
                <th>상품명</th>
                <th>가격</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${items}" varStatus="status">
                <tr>
                    <td><img src="<c:out value="${item.image}" />" alt="<c:out value="${item.image}" />" width="100" height="100">
                    </td>
                    <td>
                        <div class="item-info">
                            <a href="#" class="item-title"
                               data-title="<c:out value="${item.title}" />"
                               data-lprice="<c:out value="${item.lprice}" />"
                               data-image="<c:out value="${item.image}" />">${item.title}</a>
                        </div>
                    </td>
                    <td class="price">
                        <c:set var="formattedLprice">
                            <fmt:formatNumber value="${item.lprice}" pattern="###,###"></fmt:formatNumber>
                        </c:set>
                            ${formattedLprice} 원
                    </td>
                </tr>

                <c:if test="${status.index % 3 == 2}"></c:if>
            </c:forEach>
            </tbody>
        </table>

        <!-- 모달 창 -->
        <div id="custom-modal" class="modal">
            <div class="modal-content">
                <p id="modal-text"></p>
                <button id="modal-confirm">등록하기</button>
                <button id="modal-cancel">취소</button>
            </div>
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const modal = document.getElementById("custom-modal");
                const modalText = document.getElementById("modal-text");
                const modalConfirm = document.getElementById("modal-confirm");
                const modalCancel = document.getElementById("modal-cancel");
                const itemTitleLinks = document.querySelectorAll(".item-title");

                let selectedItem = null; // 선택한 아이템 정보를 담을 변수

                // 제목을 클릭하면 모달 창을 열고 문구를 설정합니다.
                itemTitleLinks.forEach(link => {
                    link.addEventListener("click", function (event) {
                        event.preventDefault();
                        const image = this.getAttribute("data-image");
                        const lprice = this.getAttribute("data-lprice");
                        const title = this.getAttribute("data-title");
                        const cleanTitle = title.replace(/<b>/g, '').replace(/<\/b>/g, ''); // <b> 태그 제거
                        console.log("Cleaned title:", cleanTitle);
                        modalText.textContent = cleanTitle + "을(를) 정말 위시리스트에 등록하시겠어요?";
                        modal.style.display = "block";
                        selectedItem = {
                            title: cleanTitle,
                            image: image,
                            price: lprice
                        };
                    });
                });

                // 등록하기 버튼을 누르면 처리를 수행합니다.
                modalConfirm.addEventListener("click", function () {
                    modal.style.display = "none";

                    if (selectedItem) {
                        console.log("선택된 아이템:", selectedItem);

                        fetch('/addToWishList', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify(selectedItem),
                        })
                            .then(response => response.text())
                            .then(data => {
                                if (data === "success") {
                                    alert('아이템이 위시리스트에 추가되었습니다!');
                                } else {
                                    alert('아이템 추가에 실패했습니다.');
                                }
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                alert('오류가 발생했습니다.');
                            });
                    }
                });

                // 취소 버튼을 누르면 모달 창을 닫습니다.
                modalCancel.addEventListener("click", function () {
                    modal.style.display = "none";
                });
            });
        </script>


        <!-- 페이지네이션 UI -->
        <%--        <div class="pagination">--%>
        <%--            <c:choose>--%>
        <%--                <c:when test="${totalPages > 1}">--%>
        <%--                    <c:forEach begin="1" end="${totalPages}" varStatus="pageStatus">--%>
        <%--                        <c:choose>--%>
        <%--                            <c:when test="${pageStatus.index + 1 == currentPage}">--%>
        <%--                                <a href="?page=${pageStatus.index + 1}&text=${param.text}" class="current-page">${pageStatus.index + 1}</a>--%>
        <%--                            </c:when>--%>
        <%--                            <c:otherwise>--%>
        <%--                                <c:if test="${pageStatus.index < 5}">--%>
        <%--                                    <a href="?page=${pageStatus.index + 1}&text=${param.text}">${pageStatus.index + 1}</a>--%>
        <%--                                </c:if>--%>
        <%--                            </c:otherwise>--%>
        <%--                        </c:choose>--%>
        <%--                    </c:forEach>--%>
        <%--                </c:when>--%>
        <%--            </c:choose>--%>
        <%--        </div>--%>


    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


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
