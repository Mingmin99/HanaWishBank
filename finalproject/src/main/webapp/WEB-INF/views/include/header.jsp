<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../../resources/css/header.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<div class="header">
    <!-- 메뉴바 내용 -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <c:url var="logoUrl" value="../../../resources/img/logo.png"/>
            <a class="navbar-brand" href="/"> <img src="${logoUrl}"
                                                   alt="로고" class="logo-img">
            </a>

            <div class="collapse navbar-collapse ml-auto"
                 id="navbarSupportedContent1">
                <!-- 첫 번째 메뉴 내용 -->
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active"
                                            aria-current="page" href="/checkMyCard">나의 소비패턴</a></li>
                    <li class="nav-item"><a class="nav-link"
                                            href="/checkMyWishList">나의 위시리스트</a></li>
                    <li class="nav-item"><a class="nav-link" href="/checkMyPurchasePlanList">나의
                        구매계획리스트</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">나의 챌린지
                        계좌</a></li>
                </ul>
            </div>

            <div class="collapse navbar-collapse" id="navbarSupportedContent2">
                <!-- 두 번째 메뉴 내용 -->
                <ul class="navbar-nav">

                    <%-- 로그인이 된 상태이면 로그아웃, 아니면 로그인 --%>
                    <%
                        String name = (String) session.getAttribute("name");
                        if (name != null) {
                    %>
                    <div class="login-register">
                        <a href="/logout" class="logout">로그아웃</a>
                        <span class="myinfo"><%=name%>님 반갑습니다 :)</span>
                    </div>
                    <%} else {%>
                    <div class="login-register">
                        <a href="/login" class="login">로그인</a>
                        <a href="/signup" class="signup">회원가입</a>
                    </div>
                    <%}%>
                    <li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
                </ul>
            </div>

        </div>
    </nav>
</div>
<hr class="navbar-divider" style="border-top: 2px solid #009591; margin-top: 0; margin-bottom: 0; width: 100%;">


