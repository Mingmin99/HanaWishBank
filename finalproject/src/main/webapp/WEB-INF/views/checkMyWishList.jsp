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

        /* 위시리스트 조회------------------------------------------------------------------------------------------------------- */
        .wishListTitle {
            margin-top: 48px;
            font-size: 24px;
            font-weight: 500;
            font-family: 'Helvetica', sans-serif;
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }


        .card {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
            margin: 1rem;
        }

        /* 카드에 마우스 호버 시 약간 확대 효과 */
        .card:hover {
            transform: scale(1.02);
        }

        .card-img-top {
            border-radius: 0.5rem 0.5rem 0 0;
            width: 15rem; /* 이미지의 너비 조절 */
            height: 10.125rem; /* 이미지의 높이 조절 */
            display: block;
            margin: 1rem auto;
        }

        .item-Title {
            font-size: 1.1rem;
            font-weight: bolder;
            margin-bottom: 1rem;
            white-space: normal; /* 줄바꿈을 위한 속성 */
            word-wrap: break-word; /* 긴 단어의 줄바꿈을 위한 속성 */
            text-align: center;
            color: #555;
        }


        .item-price {
            font-size: 1rem;
            color: #555;
            margin-bottom: 0.5rem;
            text-align: center;
            justify-content: center;
            align-items: center;
        }

        .btn {
            margin-top: 15px;
            display: flex !important;
            text-align: center;
            justify-content: center;
            align-items: center;
            display: flex !important;
        }

        .btn-primary {
            display: flex !important;
            background-color: #ABCBCD !important;
            border-color: #C7AFAF !important;
            text-align: center;
            justify-content: center;
            align-items: center;
        }

        .btn-primary:hover {
            display: flex !important;
            background-color: #ABCBCD !important;
            border-color: #C7AFAF !important;
            text-align: center;
            justify-content: center;
            align-items: center;
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
             width="80" style="vertical-align: middle;"> 나의 위시리스트 조회
    </div>

    <div class="description-box">
        <div class="description-text1">🧞‍♂️ 나의 위시리스트 이룰 수 있을까요?</div>
        <div class="description-text2">➡️ 위시리스트를 클릭!나의 소비와 비교하여 실질가격을
            체감해보아요!
        </div>
    </div>
    <hr class="divider">
    <!---위시리스트 조회   ------------------------------------------------------------------------------------------------------- -->

    <div class="wishListTitle">◆ 나의 위시리스트 목록</div>
    <div class="row" id="item-container">

    </div>
    <script>
        $(document).ready(function () {
            // 페이지 로드 시 Ajax로 데이터 가져오기
            $.ajax({
                type: "GET",
                url: "/wish-list",
                contentType: "application/json",
                success: function (data) {
                    // 각 아이템을 순회하며 화면에 추가
                    $.each(data, function (index, item) {
                        const itemContainer = document.getElementById("item-container");
                        const card = document.createElement("div");
                        card.classList.add("col");
                        card.classList.add("card");
                        card.style.maxWidth = "18rem";
                        card.style.marginTop = "2rem";

                        const textCenter = document.createElement("div");
                        textCenter.classList.add("text-center");

                        const img = document.createElement("img");
                        img.src = item.image;
                        img.classList.add("card-img-top");
                        img.classList.add("mx-auto");
                        img.alt = "...";
                        img.style.width = "18rem";
                        img.style.height = "10.125rem";
                        img.style.display = "block";
                        img.style.marginTop = "1rem";

                        textCenter.appendChild(img);

                        const cardBody = document.createElement("div");
                        cardBody.classList.add("card-body");

                        const itemTitle = document.createElement("h5");
                        itemTitle.classList.add("item-title");
                        itemTitle.textContent = item.itemTitle;

                        const itemPrice = document.createElement("p");
                        itemPrice.classList.add("item-price");
                        itemPrice.textContent = item.price + "원";

                        const detailLink = document.createElement("a");
                        detailLink.href = "myWishListDetail.jsp";
                        detailLink.classList.add("btn");
                        detailLink.classList.add("btn-primary");
                        detailLink.textContent = "상세보기";

                        cardBody.appendChild(itemTitle);
                        cardBody.appendChild(itemPrice);
                        cardBody.appendChild(detailLink);

                        card.appendChild(textCenter);
                        card.appendChild(cardBody);

                        itemContainer.appendChild(card);
                    });
                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
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
