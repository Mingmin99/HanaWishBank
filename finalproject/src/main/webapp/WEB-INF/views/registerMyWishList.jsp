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

        .navbar {
            position: relative;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            background-color: white;
            justify-content: space-between;
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
            height: 3000px;
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

        .wishListSearchTitle {
            margin-top: 48px;
            font-size: 24px;
            font-weight: 500;
            font-family: 'Helvetica', sans-serif;
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);

        }

        #search-results h3 {
            margin-top: 48px;
            font-size: 24px;
            font-weight: 500;
            font-family: 'Helvetica', sans-serif;
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
            background-color: #009591;
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
            background-color: #009591;
            transform: scale(1.05);
        }


        table {
            width: 90%;
            border-collapse: collapse;
            border: 1px solid #ddd;
        }

        th, td {
            font-size: medium;
            padding: 10px;
            vertical-align: middle;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .item-info {
            display: flex;
            align-items: center;
        }

        .item-image {
            width: 10%;
            margin-right: 10px;
        }

        .title {
            font-weight: bold;
            word-wrap: break-word;
            max-width: 200px;
            font-size: medium;
            margin-bottom: 5px;
            text-align: left;
        }

        .price {
            margin-left: auto;
            font-size: medium;
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
    <div class="title">
        <img src="<c:url value='../../resources/img/ic_wishList.svg' />" alt="Main Wish List"
             width="80" style="vertical-align: middle;"> 나의 위시리스트 등록
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
                    <td><img src="<c:out value="${item.image}" />" alt="<c:out value="${item.image}" />" width="100">
                    </td>
                    <td>
                        <div class="item-info">
                            <span class="title">${item.title}</span>
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


        <script>
            const titleElements = document.querySelectorAll('.title');
            titleElements.forEach(element => {
                element.innerHTML = element.textContent; // <b> 태그 제거
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
