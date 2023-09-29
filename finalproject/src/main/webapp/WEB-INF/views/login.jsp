<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Animated Login Form</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            background-color: white;
        }

        /* 메인 ------------------------------------------------------------------------------------------------------- */
        main {
            margin-top: 3%;
            margin-left: 25%;
            margin-bottom: 10%;
        }

        .WelcomeTitle {
            margin-top: 20px;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: 800;
            font-family: "Hana2.0 CM";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .wave {
            position: fixed;
            bottom: 0;
            left: 0;
            height: 100%;
            z-index: -1;
        }

        .container {
            width: 100vw;
            height: 100vh;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 7rem;
            padding: 0 2rem;
        }

        .img {
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        .login-content {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            text-align: center;
        }

        .img img {
            width: 500px;
        }

        form {
            width: 360px;
        }

        .login-content {
            margin-left: 120px;
        !important;
        }

        .login-content img {
            height: 100px;
        }

        .login-content h2 {
            margin: 15px 0;
            color: #333;
            text-transform: uppercase;
            font-size: 2.9rem;
        }

        .login-content .input-div {
            position: relative;
            display: grid;
            grid-template-columns: 7% 93%;
            margin: 35px 0;
            padding: 5px 0;
            border-bottom: 2px solid #d9d9d9;
        }

        .login-content .input-div.one {
            margin-top: 0;
        }

        .i {
            color: #d9d9d9;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .i i {
            transition: .3s;
        }

        .input-div > div {
            position: relative;
            height: 45px;
        }

        .input-div > div > h5 {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
            font-size: 18px;
            transition: .3s;
        }

        .input-div:before, .input-div:after {
            content: '';
            position: absolute;
            bottom: -2px;
            width: 0%;
            height: 2px;
            background-color: #38d39f;
            transition: .4s;
        }

        .input-div:before {
            right: 50%;
        }

        .input-div:after {
            left: 50%;
        }

        .input-div.focus:before, .input-div.focus:after {
            width: 50%;
        }

        .input-div.focus > div > h5 {
            top: -5px;
            font-size: 15px;
        }

        .input-div.focus > .i > i {
            color: #38d39f;
        }

        .input-div > div > input {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            border: none;
            outline: none;
            background: none;
            padding: 0.5rem 0.7rem;
            font-size: 1.2rem;
            color: #555;
            font-family: 'poppins', sans-serif;
        }

        .input-div.pass {
            margin-bottom: 4px;
        }


        a:hover {
            color: #38d39f;
        }

        .btn {
            display: block;
            width: 100%;
            height: 50px;
            border-radius: 25px;
            outline: none;
            border: none;
            background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
            background-size: 200%;
            font-size: 1.2rem;
            color: #fff;
            font-family: 'Poppins', sans-serif;
            text-transform: uppercase;
            margin: 1rem 0;
            cursor: pointer;
            transition: .5s;
        }

        .btn:hover {
            background-position: right;
        }


        @media screen and (max-width: 1050px) {
            .container {
                grid-gap: 5rem;
            }
        }

        @media screen and (max-width: 1000px) {
            form {
                width: 290px;
            }

            .login-content h2 {
                font-size: 2.4rem;
                margin: 8px 0;
            }

            .img img {
                width: 400px;
            }
        }

        @media screen and (max-width: 900px) {
            .container {
                grid-template-columns: 1fr;
            }

            .img {
                display: none;
            }

            .wave {
                display: none;
            }

            .login-content {
                justify-content: center;
            }
        }
    </style>
    <title>Animated Login Form</title>

    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<%@ include file="include/header.jsp" %>
<body>
<img class="wave" src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png">
<div class="container">
    <div class="img">
        <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg">
    </div>
    <div class="login-content">
        <form>
            <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg">
            <div class="WelcomeTitle">WELCOME TO
                <br>HANA WISH BANK!
            </div>
            <div class="input-div one">
                <div class="i">
                    <i class="fas fa-user"></i>
                </div>
                <div class="div">
                    <h5>UserID</h5>
                    <input type="text" class="input" id="memberID"> <!-- memberID 입력 필드에 id 추가 -->
                </div>
            </div>
            <div class="input-div pass">
                <div class="i">
                    <i class="fas fa-lock"></i>
                </div>
                <div class="div">
                    <h5>Password</h5>
                    <input type="password" class="input" id="memberPW"> <!-- memberPW 입력 필드에 id 추가 -->
                </div>
            </div>
            <a href="#">Forgot Password?</a>
            <input type="button" class="btn" value="Login" onclick="loginFormFunc()">
            <!-- 버튼의 타입을 'submit'에서 'button'으로 변경, 클릭 이벤트 핸들러 추가 -->
        </form>

    </div>
</div>


<script>
    const inputs = document.querySelectorAll(".input");


    function addcl() {
        let parent = this.parentNode.parentNode;
        parent.classList.add("focus");
    }

    function remcl() {
        let parent = this.parentNode.parentNode;
        if (this.value == "") {
            parent.classList.remove("focus");
        }
    }


    inputs.forEach(input => {
        input.addEventListener("focus", addcl);
        input.addEventListener("blur", remcl);
    });

    //Source :- https://github.com/sefyudem/Responsive-Login-Form/blob/master/img/avatar.svg
    let container = document.getElementById('container');

    toggle = () => {
        container.classList.toggle('sign-in');
        container.classList.toggle('sign-up');
    };

    // setTimeout(() => {
    //     container.classList.add('sign-in');
    // }, 200);

    function loginFormFunc() {
        // 아이디와 비밀번호 가져오기
        var memberID = $("#memberID").val();
        var memberPW = $("#memberPW").val();

        // Ajax를 통해 서버에 요청 전송
        $.ajax({
            type: "POST",
            url: "/login-member",
            data: JSON.stringify({
                memberID: memberID,
                memberPW: memberPW
            }),
            contentType: 'application/json',
            error: function (xhr, status, error) {
                alert("Error: " + error); // 에러 메시지 수정
            },
            success: function (response) {
                if (response === "로그인 성공") {
                    // 로그인 성공 시 처리
                    alert("로그인 성공");
                    console.error("로그인 성공");
                    window.location.href = "/"; // 로그인 성공 시 홈페이지로 리다이렉트
                } else {
                    // 로그인 실패 시 처리
                    console.error("로그인 실패");
                    alert("로그인 실패");
                }
            }
        });
    }
</script>


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
