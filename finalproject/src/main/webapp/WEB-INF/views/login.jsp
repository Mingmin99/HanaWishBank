<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <!-- 부트스트랩 연결 -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css"/>
    <link rel="stylesheet" href="../../../resources/css/login.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<%@ include file="include/header.jsp" %>
<body>
<div id="container" class="container">
    <!-- FORM SECTION -->
    <div class="row">
        <div class="col align-items-center flex-col sign-up">
        </div>
        <!-- SIGN IN -->
        <div class="col align-items-center flex-col sign-in" style="
    padding-left: 50px;
">
            <div class="form-wrapper align-items-center">
                <div class="form sign-in">
                    <form id="loginForm" method="post"> <!-- 로그인 폼 시작 -->
                        <div class="input-group">
                            <i class='bx bxs-user'></i>
                            <input type="text" placeholder="id" id="memberID">
                        </div>
                        <div class="input-group">
                            <i class='bx bxs-lock-alt'></i>
                            <input type="password" placeholder="password" id="memberPW" autocomplete="current-password">
                        </div>
                        <button class="button" onclick="loginFormFunc(); return false;">LogIn</button>

                    </form> <!-- 로그인 폼 종료 -->
                    <p>
                        <b>
                            비밀번호 찾기
                        </b>
                    </p>
                    <p>
              <span>
                회원이 아니신가요?
              </span>
                        <b onclick="toggle()" class="pointer">
                            <a href="/signup">가입하기</a>
                        </b>
                    </p>
                </div>
            </div>
            <div class="form-wrapper">
            </div>
        </div>
        <!-- END SIGN IN -->
    </div>
    <!-- END FORM SECTION -->
    <!-- CONTENT SECTION -->
    <div class="row content-row">
        <!-- SIGN IN CONTENT -->
        <div class="col align-items-center flex-col">
            <div class="text sign-in">
                <h2>
                    Welcome
                    <br> HANA WISH BANK
                </h2>

            </div>
            <div class="img sign-in">

            </div>
        </div>
        <!-- END SIGN IN CONTENT -->
        <!-- SIGN UP CONTENT -->
        <div class="col align-items-center flex-col">
            <div class="img sign-up">

            </div>
            <div class="text sign-up">
                <h2>
                    Join with us
                </h2>

            </div>
        </div>
        <!-- END SIGN UP CONTENT -->
    </div>
    <!-- END CONTENT SECTION -->
</div>
<%@ include file="include/footer.jsp" %>
</body>
<script>

    let container = document.getElementById('container');

    toggle = () => {
        container.classList.toggle('sign-in');
        container.classList.toggle('sign-up');
    };

    setTimeout(() => {
        container.classList.add('sign-in');
    }, 200);

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
                alert(error + "error");
            },
            success: function (response) {
                if (response === "로그인 성공") {
                    // 로그인 성공 시 처리
                    alert("로그인 성공");
                    console.error("로그인 성공");
                    var link = document.createElement("a");
                    window.location.href = "/";
                } else {
                    // 로그인 실패 시 처리
                    console.error("로그인 실패");
                }
            }
        });
    }
</script>
</html>