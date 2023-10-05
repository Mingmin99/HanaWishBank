<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>웹 페이지</title>
    <style>
        /* 사이드 바 ------------------------------------------------------------------------------------------------------- */
        .sidebar {
            margin-top: 4%;
            margin-left: 5%;
            width: 200px;
            position: absolute;
            /* 	border-right: 1px solid #ccc; */
        }

        .sidebar h4 {
            color: #009591;
            font-family: "Hana2.0 CM";
            margin-bottom: 20px;
            position: relative;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .sidebar h4::before {
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

        .notice-gray {
            margin-top: 10px;
            font-size: 16px;
            font-weight: 500;
            font-family: "Hana2.0 L";
            color: #5A5A5A;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        /* 이자율 테이블 ------------------------------------------------------------------------------------------------------- */
        .interestRateTableTitle {
            margin-top: 30px;
            font-size: 20px;
            font-weight: 500;
            font-family: "Hana2.0 L";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .goalAmountMessage {
            font-family: "Hana2.0 CM";
        }

        .interest-table {
            font-size: 0.9rem;
            border-collapse: collapse;
            margin-top: 1rem;
            width: 40%;
            border-collapse: collapse;
        }

        .interest-table th, .interest-table td {
            border: 1px solid #ddd;
            padding: 0.5rem;
            text-align: center;
        }

        .interest-table th {
            background-color: #9CC5C0;
            font-weight: bold;
        }

        /* 납입계획 입력 양식------------------------------------------------------------------------------------------------------- */
        .paymntPlanTitle {
            margin-top: 2rem;
            margin-bottom: 2rem;
            font-size: 24px;
            font-weight: 500;
            font-family: "Hana2.0 L";
            color: #4F4F4F;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .payment-plan-form {
            margin-right: 5rem;
            width: 100% !important;
            font-family: "Hana2.0 L";
            color: #333;
            padding: 2rem;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .section {
            margin-bottom: 2rem;
        }

        h3 {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            font-family: "Hana2.0 CM";
        }

        .input-container {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        label {
            width: 30%;
            font-weight: bold;
            margin-right: 1rem;
            font-family: "Hana2.0 CM";
        }


        input[type="text"], input[type="number"], select {
            flex: 1;
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            color: black;
        }

        .section {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h3 {
            font-size: 18px;
            margin-top: 10px;
            margin-bottom: 10px;
            font-family: "Hana2.0 CM";
        }

        /*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

        .ratio-container {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
        }

        .ratio-input {
            display: flex;
            align-items: center;
            font-family: "Hana2.0 CM";
            justify-content: space-between;
            flex-wrap: wrap; /* 추가 */
        }

        .PlanName {
            font-weight: bold;
            margin-right: 10px;
            font-family: "Hana2.0 CM";
        }

        .PlanAmount {
            font-weight: bold;
            margin-right: 10px;
            font-family: "Hana2.0 CM";
        }

        .selectPlanName {
            width: 180px;
            margin-right: 5%;
        }

        .selectPlanAmount {
            margin-right: 10%;
            width: 100px;
        }

        .ratio-label {
            width: 10% !important;
            font-weight: bold;
            margin-right: 5px;
            font-family: "Hana2.0 CM";
        }

        .percent-label {
            font-family: "Hana2.0 CM";
            width: 0% !important;
            font-weight: bold;
            margin-left: 5px;
        }

        input[type="number"] {
            width: 50px;
            padding: 5px;
            font-family: "Hana2.0 CM";
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .ratio-info {
            font-size: 14px;
            color: #888;
            margin-top: 5px;
            font-family: "Hana2.0 CM";
        }

        .error-message {
            color: red;
        }

        .success-message {
            color: green;
        }

        /*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

        .section:not(:last-child) {
            border-bottom: 1px solid #ddd;
            padding-bottom: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .payment-day-of-week {
            display: none;
        }

        .input-container textarea[readonly] {
            flex: 1;
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            resize: none;
            background-color: #f5f5f5;
        }


        .button-container {
            text-align: center;
            margin-top: 2rem;
        }

        button {
            background-color: #ABCBCD;
            border: none;
            color: #fff;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #C7AFAF;
        }

        .ButtonContainer {
            margin-top: 3rem;
            margin-right: 10rem !important;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .backButton {
            margin-left: 2rem;
        }

        .makeAccountButton {
            margin-left: 2rem;
        }

        /*--약관동의--*/

        #terms-accordion {
            width: 90%;
            margin-top: 20px;
        }

        /* 아코디언 버튼 스타일링 */
        .accordion-button {
            background-color: #ABCBCD !important;
            color: #4a4949 !important;
            border: none;
            border-radius: 5px;
            margin: 5px 0;
            padding: 10px 15px;
            text-align: left;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .accordion-button:focus {
            box-shadow: none;
            background-color: #ABCBCD !important;
        }

        .accordion-button:hover {
            background-color: #ABCBCD !important;
        }

        /* 아코디언 본문 스타일링 */
        .accordion-body {
            border: 1px solid #ccc;
            border-top: none;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 0 0 5px 5px;
        }

        #overall-agreement {
            margin-top: 30px !important;
        }

    </style>

    <!-- 부트스트랩 연결 -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<%@ include file="include/header.jsp" %>
<body>
<!-- 사이드바 ------------------------------------------------------------------------------------------------------- -->
<div class="sidebar">
    <h4>나의 챌린지 계좌</h4>
    <ul>
        <li><a href="registerMyWishList.jsp">나의 납입계획 등록</a></li>
        <li><a href="registerMyPurchasePlanList.jsp">나의 챌린지 적금 조회</a></li>
    </ul>
</div>
<!---메인 ------------------------------------------------------------------------------------------------------- -->
<main>
    <div class="title">
        <img src="<c:url value='../../resources/img/ic_paymentPlan.svg' />" alt="paymentPlan"
             width="80" style="vertical-align: middle;"> 나의 납입계획 등록
    </div>

    <div class="description-box">
        <div class="description-text1">🎲 챌린지 적금 계좌 개설을 위해 납입계획을
            등록해주세요!
        </div>
        <div class="description-text2">➡️ 확실한 납입계획 설정은 목표에 효율적으로 도달할 수
            있도록 도와줍니다.
        </div>
    </div>
    <hr class="divider">
    <!---위시리스트 조회 ------------------------------------------------------------------------------------------------------- -->

    <div class="interestRateContainer">
        <div class="interestRateTableTitle">• 챌린지 적금 기간별 이자율</div>
        <table class="interest-table">
            <thead>
            <tr>
                <th>기간</th>
                <th>금리 (연율, 세전)</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>6개월 - 12개월</td>
                <td>연 3.50%</td>
            </tr>
            <tr>
                <td>12개월 - 24개월</td>
                <td>연 3.80%</td>
            </tr>
            <tr>
                <td>24개월 - 36개월</td>
                <td>연 3.80%</td>
            </tr>
            <tr>
                <td>36개월 이상</td>
                <td>연 3.80%</td>
            </tr>
            </tbody>
        </table>
    </div>


    <%-------------------------------------------------------약관동의------------------------------------------------------------%>
    <div class="interestRateTableTitle">• 적금상품 가입 약관동의</div>
    <div class="notice-gray">상품가입 등 금융거래를 위하여 관련 법률과 규정에 따라 각종 항목에 대한 동의 및 확인이 필요합니다.</div>
    <div id="terms-accordion">
        <!-- 상품가입 약관 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#terms1">
                    상품가입 약관
                </button>
            </h2>
            <div id="terms1" class="accordion-collapse collapse">
                <div class="accordion-body">
                    <!-- 상품가입 약관 내용 -->
                    <!-- 상품가입 약관 동의 체크박스 -->
                    <label for="agreement1">동의
                        <input type="checkbox" id="agreement1" class="agreement-checkbox">
                    </label>
                </div>
            </div>
        </div>

        <!-- 예금거래기본 약관 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#terms2">
                    예금거래기본 약관
                </button>
            </h2>
            <div id="terms2" class="accordion-collapse collapse">
                <div class="accordion-body">
                    <dd style="display: block;" tabindex="0">
                        <p class="top-area">
                            <!-- 230509 수정[S] -->
                            <span class="area-left">2023. 5. 11 개정</span>
                            <span class="area-right">준법감시인 심의필 제2023-약관-058호(2023.03.28)</span>
                            <!-- //230509 수정[E] -->
                        </p>

                        <h5>예금거래 기본약관</h5>

                        <p>이 예금거래기본약관(이하 “약관”이라 한다)은 (주)하나은행(이하 “은행”이라 한다)과 거래처(또는 예금주)가 서로 믿음을 바탕으로 예금거래를 빠르고 틀림 없이
                            처리하는 한편,
                            서로의 이해관계를 합리적으로 조정하기 위하여 기본적이고 일반적인 사항을 정한 것이다. 은행은 이 약관을 영업점에 놓아두고, 거래처는 영업시간 중 언제든지 이 약관을
                            볼 수 있고 또한
                            그 교부를 청구할 수 있다.</p>

                        <strong>제1조 적용범위</strong>
                        <p>이 약관은 입출금이 자유로운 예금, 거치식예금 및 적립식예금 거래에 적용한다.</p>

                        <strong>제2조 실명거래 </strong>
                        <ol>
                            <li>① 거래처는 실명으로 거래하여야 한다.</li>
                            <li>② 은행은 거래처의 실명확인을 위하여 주민등록증ㆍ사업자등록증 등 실명확인증표 또는 그밖에 필요한
                                서류의 제시나 제출을 요구할 수 있고, 거래처는 이에 따라야 한다.
                            </li>
                        </ol>

                        <strong>제3조 거래장소</strong>
                        <p>거래처는 예금계좌를 개설한 영업점(이하 “개설점”이라 한다)에서 모든 예금거래를 한다. 다만, 은행이 정하는 바에 따라 다른 영업점이나 다른 금융기관,
                            또는 현금자동지급기ㆍ현금자동입출금기ㆍ컴퓨터ㆍ전화기 등(이하 “전산통신기기”)을 통하여 거래할 수 있다. </p>

                        <strong>제4조 거래방법</strong>
                        <!-- 210322 강병욱 - 문구추가 [S] -->
                        <p>
                            거래처는 은행에서 내준 통장(증서· 전자통장을 포함한다) 또는 수표· 어음용지로 거래하여야 한다. 그러나 입금할 때, 자동이체약정ㆍ전산통신 기기이용약정에 따라
                            거래하는 경우 및 기등록된 생체정보(이하”바이오 정보”),
                            실명확인증표 등을 통해 본인확인된 경우에는 통장없이(이하”무통장”)도 거래할 수 있다.
                        </p>
                        <!-- //210322 강병욱 - 문구추가 [E] -->

                        <strong>제5조 인감, 비밀번호 등의 신고 </strong>
                        <!-- 210322 강병욱 - 문구추가 및 수정 [S] -->
                        <ol>
                            <li>① 거래처는 예금계좌를 개설할 때 인감 또는 서명, 비밀번호, 성명, 상호, 대표자명, 대리인명, 주소 등 거래에 필요한 사항을 신고하여야 한다. 다만,
                                비밀번호는 비밀번호 입력기(이하 “PIN-Pad기”라 한다)에 의하여 거래처가 직접 등록할 수 있으며, 거래처가 은행에 내점할 수 없는 경우 거래처는 개설된
                                예금의 첫거래 전에 은행이 정한 방법에 따라 전산통신기기를 이용하여 비밀번호를 등록하여야 한다.
                            </li>
                            <li>② 제 1항에 불구하고 거치식·적립식 예금은 비밀번호를 신고하지 않을 수 있다.</li>
                            <li>③ 거래처는 인감과 서명을 함께 신고하거나, 인감 또는 서명을 추가 신고할 수 있다.</li>
                            <li>④ 통장을 발행하지 않은 경우, 은행은 거래처로부터 인감 또는 서명의 신고 절차를 생략할 수 있다.</li>
                        </ol>
                        <!-- //210322 강병욱 - 문구추가 및 수정 [E] -->
                        <strong>제6조 입 금 </strong>
                        <ol>
                            <li>① 거래처는 현금이나 즉시 추심할 수 있는 수표ㆍ어음, 기타 증권(이하 “증권”이라 한다) 등으로 입금할 수 있다.</li>
                            <li>② 거래처는 현금이나 증권으로 계좌송금(거래처가 개설점 이외에서 자기계좌에 입금하거나, 제3자가 개설점 또는 다른 영업점이나,
                                다른 금융기관에서 거래처 계좌에 입금하는 것)하거나, 계좌이체(거래처의 신청에 따라 은행이 특정계좌에서 자금을 출금하여 같은 은행 또는 다른 은행의 다른
                                계좌에 입금하는 것) 할 수 있다.
                            </li>
                            <li>③ 증권으로 입금할 때 입금인은 증권의 백지보충이나 배서 또는 영수기명날인 등 필요한 절차를 밟아야 하며, 은행은 백지보충 등의 의무를 지지 않는다.</li>
                            <li>④ 입금하는 증권이 수표나 어음일 때 은행은 소정금액란에 적힌 금액으로 처리한다.</li>
                        </ol>

                        <strong>제7조 예금이 되는 시기 </strong>
                        <ol>
                            <li>① 제6조에 따라 입금한 경우 다음 각호의 시기에 예금이 된다.
                                <ol>
                                    <li>1. 현금으로 입금한 경우 : 은행이 이를 받아 확인하였을 때</li>
                                    <li>2. 현금으로 계좌송금하거나 계좌이체한 경우 : 예금원장에 입금의 기록이 된 때</li>
                                    <li>3. 증권으로 입금하거나 계좌송금한 경우 : 은행이 그 증권을 교환에 돌려 부도반환시한이 지나고 결제를 확인한 때. 다만, 개설점에서 지급하여야
                                        할 증권은 그날 안에 결제를 확인한 때
                                    </li>
                                </ol>
                            </li>
                            <li>② 제1항제3호에도 불구하고 증권이 자기앞수표이고 지급제시기간 안에, 사고신고가 없으며 결제될 것이 틀림없음을 은행이 확인하였을 때에는 예금원장에 입금의
                                기록이 된 때 예금이 된다.
                            </li>
                            <li>③ 은행은 특별한 사정이 없는 한 제1항 및 제2항의 확인 또는 기록처리를 신속히 하여야 한다.</li>
                        </ol>

                        <strong>제8조 증권의 부도 </strong>
                        <ol>
                            <li>① 제6조제1항에 따라 입금한 증권이 지급거절되었을 때는 은행은 그 금액을 예금원장에서 뺀 뒤,
                                거래처(무통장입금일 때는 입금의뢰인)가 신고한 연락처로 그 사실을 알린다. 다만, 통화불능 등 부득이한 사유로 그 사실을 알릴 수 없는 경우에는 그러하지
                                아니하다.
                            </li>
                            <li>② 은행은 지급거절된 증권을 그 권리보전절차를 거치지 아니하고, 입금한 영업점에서 거래처(무통장 입금일 때는 입금의뢰인)가 반환청구할 때 돌려준다.
                                다만, 증권 발행인이 지급거절한 날의 다음 영업일까지 증권을 입금할 예금계좌에 해당자금을 현금이나 즉시 현금으로 바꿀 수 있는 증권으로 입금했을 때는
                                발행인에게 돌려줄 수 있다.
                            </li>
                        </ol>

                        <strong>제9조 이 자 </strong>

                        <ol>
                            <li>① 이자는 원을 단위로, 약정한 예치기간 또는 제7조에 따라 예금이 된 날(자기앞수표ㆍ가계수표는 입금일)부터 지급일 전날까지의 기간에 대하여 은행이 정한
                                이율로 셈한다.
                            </li>
                            <li>② 은행은 예금종류별 예금이율표를 영업점 및 인터넷 홈페이지에 비치ㆍ게시하고, 이율을 바꾼 때는 그 바꾼 내용을 영업점 및 인터넷 홈페이지에 1개월 동안
                                게시한다.
                            </li>
                            <li>③ 제2항에 따라 이율을 바꾼 때에는, 입출금이 자유로운 예금은 바꾼 날로부터 바꾼 이율을 적용하며,
                                거치식ㆍ적립식 예금은 계약당시의 이율을 적용함을 원칙으로 하되, 변동금리가 적용되는 예금은 바꾼 날로부터 바꾼 이율을 적용한다.
                            </li>
                            <!-- 210322 강병욱 - 문구수정 [S] -->
                            <li>④ 변동이율을 적용하는 거치식· 적립식 예금은 최초 거래시 이율적용방법 을 통장, 전산통신기기 등으로 표시하며, 변동이율을 적용하는 적립식예금은
                                이율을 바꾼 떄마다 바뀐 이율을 통장에 기록하거나 전산통신기기 등으로 안내한다.
                            </li>
                            <!-- //210322 강병욱 - 문구수정 [E] -->
                            <li>⑤ 거래처가 실제 받는 이자는 제1항에 따라 셈한 이자에서 소득세법 등 관계법령에 따라 원천징수한 세액을 뺀 금액이다.</li>
                        </ol>


                        <strong>제9조의2 휴면예금및출연</strong>
                        <ol>
                            <li>① 은행은 예금이 다음 각 호에 해당할 때에는 예금채권의 소멸시효가 완성된 것(이하"휴면예금"이라 한다)으로 본다.
                                <ol>
                                    <li>1. 입출금이 자유로운 예금은 이자지급을 포함한 최종거래일로부터 5년 이상 경과한 예금</li>
                                    <li>2. 거치식, 적립식 예금은 만기일 또는 이자지급을 포함한 최종거래일로부터 5년이상 경과한 예금</li>
                                </ol>
                            </li>
                            <li>② 제1항에 따른 휴면예금은 「서민의 금융생활 지원에 관한 법률」제40조에 따라 "서민금융진흥원"으로 출연될 수 있으며, 원권리자는 출연된 휴면예금을 동법
                                제45조에 따라 지급 청구할 수 있다.
                            </li>
                            <!-- 210322 강병욱 - 문구추가 [S] -->
                            <li>③ 예금계약은 예금이 제1항 각호에 따라 휴면예금에 해당하게 된 시점에 자동 종료하며, 해당 계좌는 더 이상 이용이 불가하다. 잔액이 0원으로 된 예금이
                                제1항 각호에 해당하게 된 경우도 같다.
                            </li>
                            <!-- //210322 강병욱 - 문구추가 [E] -->
                        </ol>

                        <strong>제10조 지급ㆍ해지청구 </strong>
                        <!-- 210322 강병욱 - 문구추가 및 수정 [S] -->
                        <ol>
                            <li>① 거래처가 예금·이자를 찾거나 예금계약을 해지하고자 할 때에는 신고한 필요사항 등을 기재하거나 비밀번호를 PIN-Pad기에 입력하고, 거래인감을 날인하거나
                                서명감과 일치되게 서명한 지급 또는 해지청구서를 제출하여야 한다.
                            </li>
                            <li>② 거래처가 무통장으로 거래하고 실명확인증표 등에 의해 본인확인된 경우, 은행이 정하는 바에 따라 제 ⓛ항에 따른 절차의 전부 또는 일부를 생략할 수
                                있다.
                            </li>
                            <li>③ 거래처가 자동이체 ·전산통신기기· 바이오정보 등을 이용하여 찾을 떄는 그 약정에서 정한 바에 따른다.</li>
                        </ol>
                        <!-- //210322 강병욱 - 문구추가 및 수정 [E] -->

                        <strong>제11조 금융사고자금 지급정지 </strong>
                        <ol>
                            <li>① 은행은 “금융사고예방을 위한 공동협약”(이하 “협약”이라 한다) 및 “금융사고예방을 위한 공동협약
                                시행세칙(이하 “세칙”이라 한다)에서 정하는 금융사고(이하 “금융사고”라 한다)로 인한 사고자금이 이체된
                                거래처의 계좌(이하 “사고계좌”라 한다)에 대하여 금융사고가 발생한 금융기관의 요청이 있는 경우 지체없이 지급정지를 취한다.
                            </li>
                            <li>② 제1항의 지급정지 금액은 금융사고로 인해 이체된 금액 이내로 한다.</li>
                            <li>③ 제1항의 지급정지기간은 지급정지한 날로부터 10영업일 이내로 한다. 다만, 지급정지를 요청한 금융 기관의 신청으로 법원에 의한 결정문 송달이
                                이루어진 경우에는 그러하지 아니하며, 법원의 결정문 송달이 지연되어 지급정지를 요청한 금융기관이 관련 증빙서류를 첨부하여 서면으로
                                지급정지기간의 연장을 요청하는 경우 은행은 10영업일 이내에서 연장할 수 있다.
                            </li>
                            <li>④ 은행이 제1항의 지급정지를 한 때에는 지체없이 거래처에 지급정지 사실과 이의신청절차를 유선 또는
                                이와 상응하는 방법으로 통지하여야 하며, 거래처가 이의를 신청한 때에는 은행이 정한 민원처리절차에 의하여 처리한다.
                            </li>
                            <li>⑤ 거래처가 지급을 청구하는 경우에는 금융사고에 의해 이체된 자금을 제외하고 지급한다.</li>
                            <li>⑥ 은행은 금융사고와 관련한 사항이 해소된 경우 지체없이 지급정지를 해지하여야 한다.</li>
                            <li>⑦ 은행은 거래처의 계좌에서 금융사고로 인한 사고자금이 다른 금융기관에 이체된 경우 사고발생을 인지한 날로부터 10일 이내에 그 다른 금융기관에 대하여
                                지급정지를 요청할 수 있다.
                            </li>
                            <li>⑧ 이 조의 금융사고자금 지급정지와 관련하여 이 조에서 정하지 아니한 사항은 제1항의 협약 및 세칙에서 정하는 바에 따른다.</li>
                        </ol>

                        <strong>제12조 지급시기</strong>
                        <ol>
                            <li>① 입출금이 자유로운 예금은 거래처가 찾을 때 지급한다. 이 경우 기업자유예금은 먼저 예금한 금액부터 지급한다.</li>
                            <li>② 거치식ㆍ적립식 예금은 만기일이 지난 다음 거래처가 찾을 때 지급한다.</li>
                        </ol>

                        <strong>제13조 양도 및 질권설정 </strong>
                        <ol>
                            <li>① 거래처가 예금을 양도하거나 질권설정하려면 사전에 은행에 통지하고 동의를 받아야 한다. 다만, 법령에 의하여 금지되는 경우에는 양도나 질권설정을 할 수
                                없다.
                            </li>
                            <li>② 입출금이 자유로운 예금은 질권설정할 수 없다.</li>
                        </ol>

                        <strong>제14조 사고ㆍ변경사항의 신고</strong>
                        <ol>
                            <li>① 거래처는 통장ㆍ도장ㆍ카드 또는 증권이나 그 용지를 분실ㆍ도난ㆍ멸실ㆍ훼손했을 때는 곧
                                서면으로 신고하여야 한다. 다만, 긴급하거나 부득이 할 때는 영업시간 중에 전화 등으로 신고할 수 있으며 이 때는 다음 영업일 안에 서면신고하여야 한다.
                            </li>
                            <li>② 거래처는 인감 또는 서명, 비밀번호, 성명, 상호, 대표자명, 대리인명, 주소, 전화번호 기타 신고사항을 바꿀 때에는 서면으로 신고하여야 한다. <br>
                                다만, 비밀번호는 서면신고없이 전산통신기기를 이용하여 바꿀 수 있으며, 이 경우 계좌번호, 주민등록번호, 비밀번호 등 은행이 정한 요건이 맞으면 은행은 새로운
                                비밀번호로 변경처리한다.
                            </li>
                            <li>③ 거래처는 주소, 전화번호 등의 일부 신고사항에 대하여는 은행이 정한 방법에 따라 전산통신기기를 이용하여 변경할 수 있다.</li>
                            <li>④ 제1항 및 제2항의 신고는 은행이 이를 접수한 뒤 전산입력 등 필요한 조치를 하는데 걸리는 합리적인 시간이
                                지나면 그 효력이 생기며 전산장애 등 불가항력적인 사유로 처리하지 못한 때는 복구 등 사유해제시 즉시 처리하여야 한다.
                            </li>
                            <!-- 210322 강병욱 - 문구수정 [S] -->
                            <li>⑤ 제1항의 신고를 철회한 때는 거래처 본인이 서면 또는 전산통신기기 등으로 하여야 한다.</li>
                            <!-- //210322 강병욱 - 문구수정 [E] -->
                        </ol>

                        <strong>제15조 통장, 카드의 재발급 등 </strong>
                        <p>제14조에 따라 통장ㆍ도장ㆍ카드에 대한 사고신고가 있을 때에는 은행은 신고인이 거래처 본인임을 확인하는 등 필요한 조치를 마친 뒤에 재발급하거나 지급한다. </p>

                        <strong>제16조 통지방법 및 효력 </strong>
                        <ol>
                            <li>① 은행은 오류의 정정 등 예금거래에서 발생하는 일반적 사항을 통보하는 경우에는 거래처가 신고한 연락처로 전화통보할 수 있다. 이 때,
                                통화자가 거래처 본인이 아닌 경우, 그 통화자가 은행의 통지내용을 이해하고 이를 거래처에 전달할 것이라고 믿을 충분한 이유가 있는 때에는 거래처에 정당하게
                                통보한 것으로 본다.
                            </li>
                            <li>② 은행이 예금거래에서 발생하는 일반적 사항을 서면으로 통지했을 때는 천재지변 등 불가항력적인 경우 외에는 보통의 우송기간이 지났을 때 도달한 것으로
                                본다.
                            </li>
                            <li>③ 은행은 예금계약의 임의해지 등 중요한 의사표시를 하는 때에는 서면으로 하여야 하며 그 통지가 거래처 에 도달되어야 의사표시의 효력이 생긴다.
                                다만, 관계법령 또는 어음교환소규약 등에 의하여 예금계약을 해지한 경우나 거래처가 제14조에 의한 변경신고를 게을리하여 도달되지 않은 때에는 그러하지
                                아니하다.
                            </li>
                        </ol>

                        <strong>제17조 면책 </strong>
                        <ol>
                            <li>① 은행은 예금지급청구서, 증권(어음교환소에서 전자적정보의 형태로 제시된 어음ㆍ수표 등 포함) 또는 신고서 등에 찍힌 인영(또는 서명)을 신고한
                                인감(또는 서명감)과 육안으로 주의 깊게 비교ㆍ대조하여 틀림없다고 여기고, 은행이 정한 방법에 따라 전산통신기기를 이용하여 입력된 비밀번호가
                                신고 또는 등록한 것과 같아서 예금을 지급하였거나 기타 거래처가 요구하는 업무를 처리하였을 때에는 인감이나 서명의 위조ㆍ변조 또는 도용이나
                                그밖의 다른 사고로 인하여 거래처에 손해가 생겨도 그 책임을 지지 않는다. 다만, 은행이 거래처의 인감이나 서명의 위조ㆍ변조 또는 도용 사실을 알았거나 알 수
                                있었을 때는 그러하지 아니하다.
                            </li>
                            <li>② 전산통신기기 등을 이용하거나 거래정보 등의 제공 및 금융거래명세 등의 통보와 관련하여 은행이 책임질 수 없는 사유로 계좌번호,
                                비밀번호 등의 금융정보가 새어나가 거래처에 손해가 생겨도 은행은 그 책임을 지지 않는다.
                            </li>
                            <!-- 210322 강병욱 - 문구추가 및 수정 [S] -->
                            <li>③ 은행이 거래처의 실명확인증표 등으로 주의 깊게 본인확인하여 예금을 지급하였거나 기타 거래처가 요구하는 업무를 처리하였을 떄에는 위조·변조 또는 도용이나
                                그밖의 다른 사고로 인하여 거래처에 손해가 생겨도 그 책임을 지지 않는다. 다만, 은행의 고의 또는 과실로 인한 귀책사유가 있는 경우 은행은 그 책임의 일부
                                또는 전부를 부담한다.
                            </li>
                            <li>④ 은행이 주민등록증 등 실명확인증표로 주의 깊게 실명확인하거나 실명전환한 계좌는 거래처가 실명확인증표 또는 서류의
                                위조ㆍ변조ㆍ도용 등을 한 경우, 이로 인하여 거래처에 손해가 생겨도 은행은 그 책임을 지지 않는다.
                            </li>
                            <li>⑤ 거래처가 제14조 제1항, 제2항, 제4항의 신고나 절차를 미루어 생긴 손해에 대해 은행은 그 책임을 지지 않는다.<br>
                                다만, 이 경우에도 은행은 거래처에 손해가 발생하지 않도록 선량한 관리자로서의 주의를 다하여야 한다.
                            </li>
                            <!-- //210322 강병욱 - 문구추가 및 수정 [E] -->
                        </ol>

                        <strong>제18조 수수료 </strong>
                        <ol>
                            <li>① 거래처가 개설점이 아닌 다른 영업점이나 다른 금융기관 또는 전산통신기기 등을 통해 거래할 때 은행은 온라인수수료나 추심수수료 등을 받을 수 있다.</li>
                            <li>② 은행은 제1항의 경우 외에도 거래처가 자기앞수표 발행 등을 원하거나 거래처 잘못으로 통장재발행 등을 요청하는 경우 그 사무처리와 관련하여 수수료를 받을 수
                                있다.
                            </li>
                            <!-- 210322 강병욱 - 문구수정 [S] -->
                            <li>③ 제1항, 제2항과 관련한 수수료표는 영업점 및 인터넷 홈페이지에 게시한다.</li>
                            <!-- //210322 강병욱 - 문구수정 [E] -->
                        </ol>

                        <strong>제19조 오류처리 등 </strong>
                        <ol>
                            <li>① 은행이 예금원장이나 통장거래내용을 사실과 다르게 처리하였을 때에는 이를 확인하여 바르게 고치고 그 사실을 거래처에 통지하여야 한다.</li>
                            <li>② 거래처는 거래를 마친 때 그 내용이 맞는가를 확인하고, 거래내용이 사실과 다를 때에는 바르게 고칠 것을 요구할 수 있으며, 은행은 그 사실을 확인하고
                                바르게 처리하여야 한다.
                            </li>
                        </ol>

                        <strong>제20조 예금의 비밀보장 </strong>
                        <ol>
                            <li>① 은행은 금융실명거래및비밀보장에관한법률 등 법령에서 정한 경우를 제외하고는 거래처의 거래내용에 대한 자료나 정보를 남에게 제공하지 않는다.</li>
                            <li>② 은행은 거래처가 전산통신기기 등으로 무통장입금(송금 포함), 예금잔액 등에 관한 정보의 제공을 요청한 때에는
                                명의인ㆍ계좌번호ㆍ비밀번호(자동응답서비스(ARS)는 계좌번호ㆍ비밀번호)가 맞으면
                                그 요청자를 본인으로 여겨 입금인, 입금액, 예금잔액 등에 관한 정보를 제공할 수 있으며, 이로 인하여 금융거래 정보누설 등으로 거래처에 손해가 생겨도 그
                                책임을 지지 않는다.
                            </li>
                        </ol>

                        <strong>제21조 약관의 변경 </strong>
                        <!-- 230509 수정[S] -->
                        <ol>

                            <li>① 은행이 이 약관이나 입출금이자유로운예금약관, 거치식·적립식예금약관 (이하 총칭하여 본조에서 “약관 등”이라 한다)을 변경하고자 하는 경우에는 변경되는 약관
                                등의 시행일 1개월 전에 그 내용을 영업점과 인터넷 홈페이지에 게시하여 거래처에 알린다. 다만, 법령의 개정이나 제도의 개선 등으로 인하여 긴급히 약관 등을
                                변경한 때에는 즉시 이를 게시 또는 공고하여야 한다
                            </li>
                            <li>② 은행은 약관 등을 변경하는 경우 제1항에 따른 게시와는 별도로 변경 되는 약관 등의 시행일 1개월 전에 거래처에 변경 내용 (신‧구조문 대비 표 포함)을
                                다음 각 호 중 1개(거래처에 불리한 변경인 경우에는 3개) 이상의 방법으로 알리되, 제1호 내지 제3호의 방법이 포함되어야 한다. 다만, 법령의 개정이나
                                제도의 개선 등으로 인하여 긴급히 약관 등을 변경한 때에는 즉시 거래처에 알린다.<br>
                                1. 거래처가 신고한 정보에 따른 우편 또는 전자우편(E-mail)에 의한 통지<br>
                                2. 거래처가 신고한 휴대전화 문자메시지(SMS, MMS) 또는 이에 준하는 거래처가 사전 동의한 전자적 의사표시에 의한 통지<br>
                                3. 거래처와 약정한 별도의 전자기기(앱푸쉬 등)에 의한 통지<br>
                                4. 거래통장에 표기<br>
                                5. 현금자동지급기/현금자동입출금기 설치장소에 게시(이 경우 큰 문자를 사용하고 알아보기 쉬운 위치에 게시한다)<br>
                                6. 인터넷뱅킹 및 모바일뱅킹 초기화면에 게시
                            </li>
                            <li>③ 제2항에도 불구하고, 내용의 실질적 변경을 수반하지 않는 오탈자나 자구 수정 등 단순한 문구 변경(상호·명칭 등)인 경우는 제2항을 적용하 지
                                아니한다.
                            </li>
                            <li>④ 제1항의 게시 또는 제2항의 통지를 할 경우 “예금주가 변경에 동의하지 아니한 경우 제1항의 게시일 또는 제2항의 통지를 받은 날로부터 1개월 이내에
                                계약을 해지할 수 있으며, 계약해지의 의사표시를 하지 아니한 경우에는 변경에 동의한 것으로 본다”라는 취지의 내용을 함께 게시 또는 통지한다.
                            </li>
                            <li>⑤ 제4항의 게시일 또는 통지를 받은 날로부터 1개월 이내에 계약해지의 의사표시가 도달하지 않으면 거래처가 변경에 동의한 것으로 본다.</li>
                        </ol>
                        <!-- //230509 수정[E] -->

                        <strong>제22조 약관적용의 순서 </strong>
                        <ol>
                            <li>① 은행과 거래처 사이에 개별적으로 합의한 사항이 약관조항과 다를 때에는 그 합의사항을 약관에 우선하여 적용한다.</li>
                            <li>② 이 약관에 정한 사항과 입출금이 자유로운 예금약관 또는 거치식ㆍ적립식 예금약관에서 정한 사항이 다를 때는 입출금이 자유로운 예금 약관이나 거치식ㆍ적립식
                                예금약관을 먼저 적용한다.
                            </li>
                        </ol>

                        <strong>제23조 기타</strong>
                        <p>이 약관과 입출금이 자유로운 예금약관 또는 거치식ㆍ적립식 예금약관에서 정하지 않은 사항은 따로 약정이 없으면 관계법령, 어음교환소규약을 적용한다. </p>

                        <strong>제24조 이의제기</strong>
                        <p>거래처는 은행거래와 관련 하여 이의가 있을 때 거래 은행의 분쟁처리기구에 해결을 요구하거나 금융분쟁조정위원회 등을 통해 분쟁조정을 신청할 수 있다. </p>

                        <!-- 210322 강병욱 - 문구추가 [S] -->
                        <strong>제25조 위법계약의 해지</strong>
                        <p>
                            금융소비자는 「금융소비자보호에 관한 법률」 제47조 및 관련 규정이 정하는 바에 따라 서면 등으로 해당 계약의 해지를 요구할 수 있다.
                            <br>
                            <br>
                            ※ 이 약관은 금융소비자 보호에 관한 법령 및 내부통제기준에 따른 절차를 거쳐 제공됩니다.
                        </p>

                        <!-- 230509 수정[S] -->
                        <strong>&lt;부칙1&gt;</strong>
                        <p>이 약관은 2008.02.01부터 적용합니다.</p>
                        <strong>&lt;부칙2&gt;</strong>
                        <p>이 약관은 2009.10.01부터 적용합니다.</p>
                        <strong>&lt;부칙3&gt;</strong>
                        <p>이 약관은 2015.09.01부터 적용합니다.</p>
                        <strong>&lt;부칙4&gt;</strong>
                        <p>이 약관은 2016.06.07부터 적용합니다.</p>
                        <strong>&lt;부칙5&gt;</strong>
                        <p>이 약관은 2016.12.30부터 적용합니다.</p>
                        <strong>&lt;부칙6&gt;</strong>
                        <p>이 약관은 2019.08.26부터 적용합니다.</p>
                        <strong>&lt;부칙7&gt;</strong>
                        <p>이 약관은 2021.03.25부터 적용합니다.</p>
                        <strong>&lt;부칙8&gt;</strong>
                        <p>이 약관은 2022.08.18부터 적용합니다.</p>
                        <strong>&lt;부칙9&gt;</strong>
                        <p>이 약관은 2023.05.11부터 적용합니다.</p>
                        <!-- //230509 수정[E] -->


                    </dd>
                    <label for="agreement2">동의
                        <input type="checkbox" id="agreement2" class="agreement-checkbox">
                    </label>
                </div>
            </div>
        </div>

        <!-- 적립식예금 약관 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#terms3">
                    적립식예금 약관
                </button>
            </h2>
            <div id="terms3" class="accordion-collapse collapse">
                <div class="accordion-body">
                    <dd style="display: block;" tabindex="0">
                        <p class="top-area">
                            <span class="area-left">2016. 6. 7 개정</span>
                            <span class="area-right">준법감시인 심사필번호 제2021-약관-121호(2021.03.22)</span>
                        </p>
                        <h5>[적립식예금약관]</h5>

                        <strong>제1조 적용범위</strong>
                        <ol>
                            <li>① 적립식예금(이하 '이 예금'이라 한다)이라 함은 기간을 정하고 그 기간중에 미리 정한 금액이나 불특정 금액을 정기 또는 부정기적으로 입금하는 예금을
                                말한다.
                            </li>
                            <li>② 이 약관에서 정하지 아니한 사항은 예금거래기본약관의 규정을 적용한다.</li>
                        </ol>

                        <strong>제2조 지급시기</strong>
                        <p>이 예금은 약정한 만기일 이후 거래처가 청구할 때 지급한다. 다만 거래처가 부득이한 사정으로 청구할 때에는 만기전이라도 지급할 수 있다. </p>

                        <strong>제3조 저축금의 입금 </strong>
                        <p>거래처는 계약기간 동안 매월 약정한 날짜에 월저축금을 입금하여야 한다 </p>

                        <strong>제4조 이자 및 만기지급금과 지연입금</strong>
                        <ol>
                            <li>① 이 예금의 월저축금을 매월 약정한 날짜에 입금하였을 때에는 은행은 저축금마다 입금일부터 만기일전날까지의 기간에 대하여 계약일 당시 영업점에 게시한 이율로
                                셈한 이자를 저축금 총액(이하 '원금''이라 한다)에 더한 금액(이하 '계약금액'이라 한다)을 만기지급금으로서 지급한다.
                            </li>
                            <li>② 이 예금중 변동금리를 적용하는 예금은 이율을 바꾼 때 바꾼 날부터 바꾼 이율로 셈하여 이자를지급한다.</li>
                            <li>③ 거래처가 월저축금을 약정일보다 늦게 입금하였을 때에는 은행은 거래처의 요청에 따라 총지연일수에서 총선납일수를 뺀 순지연일수에 대하여 계약일 당시 영업점에
                                게시한 입금지연이율로 셈한 금액을 계약금액에서 빼거나 순지연일수를 계약월수로 나눈 월평균 지연일수만큼 만기일을 늦출 수 있다.
                            </li>
                            <li>④ 총선납일수가 총지연일수보다 많은 경우에는 은행은 계약금액만을 지급한다.</li>
                        </ol>

                        <strong>제5조 만기앞당김 지급</strong>
                        <p>거래처가 모든 회차의 월저축금을 입금한 후 만기일 전 1개월 안에 청구하면 은행은 지급하는 날부터 만기일 전날까지의 기간에 대하여 계약일 당시 영업점에 게시한
                            만기앞당김 이율로 셈한 금액을 계약 금액에서 빼고 지급한다. </p>

                        <strong>제6조 중도해지이율 및 만기후이율</strong>
                        <ol>
                            <li>① 거래처가 만기일 후 지급청구한 때에는 만기지급금에 만기일부터 지급일 전날까지 기간에 대해 계약일 당시 영업점에 게시한 만기후 이율로 셈한 이자를 더하여
                                지급한다.
                            </li>
                            <li>② 거래처가 만기일 전에 지급청구한 때에는 월저축금마다 입금일부터 지급일 전날까지의 기간에 대해 계약일 당시 영업점에 게시한 중도해지이율로 셈한 이자를 원금에
                                더하여 지급한다.
                            </li>
                            <li>③ 거래처가 만기일까지 약정한 모든 회차의 월저축금을 입금하지 않고 만기일 이후에 청구하였을 때에는 전항의 중도해지이율로 셈한 이자를 지급한다.</li>
                        </ol>

                        <strong>제7조 자유적립식예금 특례 </strong>
                        <ol>
                            <li>① 자유적립식예금이란 계약기간 동안 저축금을 달리하여 수시로 입금하는 예금을 말한다.</li>
                            <li>② 자유적립식예금은 입금횟수에 관계없이 저축금마다 입금일부터 만기일 전날까지의 기간에 대하여 계약일 당시 영업점에 게시한 이율로 셈한 이자와 원금을
                                만기지급금으로 한다.
                            </li>
                            <li>③ 자유적립식예금에는 제3조, 제4조 제①항, 제③항, 제④항, 제5조 및 제6조 제③항의 규정을 적용하지 아니한다.</li>
                        </ol>

                        <strong>제8조 법령위반시 처리</strong>
                        <p>법령에 따라 시행하는 예금에 있어서 거래처가 법령에서 정하는 가입자격, 저축한도 등 거래조건을 위반한 것으로 판명된 때는 은행은 임의로 그 예금을 해지하고 제6조
                            제②항의 규정에 따라 처리한 후 이를 즉시 거래처에 통보한다.</p>

                        <p>※이 약관은 금융소비자 보호에 관한 법령 및 내부통제기준에 따른 절차를 거쳐 제공됩니다.</p>


                    </dd>
                    <label for="agreement3">동의
                        <input type="checkbox" id="agreement3" class="agreement-checkbox">
                    </label>
                </div>
            </div>
        </div>

        <!-- 비과세종합저축 특약 약관 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#terms4">
                    비과세종합저축 특약 약관
                </button>
            </h2>
            <div id="terms4" class="accordion-collapse collapse">
                <div class="accordion-body">
                    <dd tabindex="0" style="display: block;">

                        <p class="top-area">
                            <span class="area-right">준법감시인 심사필 : 2021-약관-123호(2021.03.22)</span>
                        </p>

                        <h5>비과세 종합저축 특약</h5>

                        <strong>제1조(약관의 적용)</strong>
                        <p>비과세종합저축(이하 “저축”이라 한다)의 거래시 이 특약에서 정하지 않은 사항은 예금거래기본약관,금전신탁거래 기본약관, 은행이 취급하는 각종 예금·신탁·채권 등(이하
                            “예금 등”이라 한다)의 약관(특약포함)과 조세특례제한법 등 법령에서 정하는 바에 따릅니다.</p>

                        <strong>제2조(가입대상자)</strong>
                        <p>이 저축에 가입할 수 있는 자는 소득세법 제1조의2 제1항 제1호의 규정에 의한 거주자 (단, 계좌의 가입일 또는 연장일이 속한 직전 3개 과세기간 중 1회이상
                            『소득세법』 제14조 제3항 제6호에 따른 소득의 합계액이 종합과세 기준금액을 초과한 자는 제외한다) 로서 다음 각호의 1에 해당하는 요건을 갖추어야 합니다.<br>1.
                            만 65세 이상인 거주자<br>2. 장애인복지법 제32조의 규정에 의하여 등록한 장애인<br>3. 독립유공자 예우에 관한 법률 제6조의 규정에 의하여 등록한
                            독립유공자와 그 유족 또는 가족, 국가유공자등 예우 및 지원에 관한 법률 제6조의 규정에 의하여 등록한 상이자<br>4. 국민기초생활보장법 제2조 제2호의 규정에
                            의한 수급자<br>5. 고엽제후유의증환자 지원 등에 관한 법률 제2조 제3호의 규정에 의한 고엽제후유의증 환자<br>6. 5 · 18민주유공자 예우에 관한 법률
                            제4조 제2호의 규정에 의한 5 · 18민주화운동부상자</p>

                        <strong>제3조(대상 예금 등)</strong>
                        <p>은행이 취급하는 모든 예금 등을 원칙으로 합니다. 다만, 다음 각 호의 예금 등과 각 취급은행이 별도로 정하는 예금 등은 제외합니다.<br>1. 증서로 발행되고 유통이
                            가능한 예금 : CD, 표지어음, 무기명정기예금 등<br>2. 어음·수표 등에 의해 지급이 가능한 예금 : 당좌예금, 가계당좌예금 등<br>3. 조세특례제한법 등에
                            따라 기 취급중인 비과세 예금 등<br>4. 외화예금</p>

                        <strong>제4조(예치한도)</strong>
                        <p>① 이 저축으로 거래하는 모든 예금 등 계좌의 예치한도는 원금을 합하여 5천만원(다만, 세금우대 종합저축에 가입한 경우에는 5천만원에서 세금우대종합저축의 계약금액
                            총액을 차감한 금액)을 초과할 수 없습니다.<br>② 이 저축에서 발생하여 원금에 전입되는 이자 등은 1인당 한도계산에 있어서 이를 산입하지 않습니다. 다만,
                            입출금이 자유로운 예금은 최종 이자원가로 인하여 한도가 초과되는 경우를 제외하고는 저축한도에 포함합니다.<br>③ 동일한 계좌에서 일부 금액만을 이 저축의 한도로
                            정할 수 없습니다.</p>

                        <strong>제5조(예치한도 산정)</strong>
                        <p>① 거치식 예금 등은 가입자가 가입한 예치원금으로 합니다.<br>② 정액(정기)적립식예금 등은 월저축금에 계약기간을 곱한 금액으로 합니다.<br>③ 입출금이
                            자유로운예금, 자유적립식 및 추가불입이 가능한 거치식예금 등은 저축가입자가 사전에 약정한 금액으로 합니다.</p>

                        <strong>제6조(예치한도 변경)</strong>
                        <p>이 저축의 한도를 증액 또는 감액하고자 하는 경우에는 별도로 거래 금융기관에 신청하여야 합니다.</p>

                        <strong>제7조(비과세처리)</strong>
                        <p>이 저축에서 발생하는 이자소득 등은 조세특례제한법 등에서 정한 원천징수 세율로 과세합니다.</p>

                        <strong>제8조(표시방법)</strong>
                        <p>이 저축가입자는 신규 가입시 『비과세종합저축』으로 신청하여야 하며, 은행은 통장의 표지·내지 또는 거래내역서 등에 『비과세종합저축』이라는 문구를 표시하여야
                            합니다.</p>

                        <strong>제9조(적용이율)</strong>
                        <p>이 저축으로 가입한 각 예금 등의 적용이율은 개별 약관에서 정한 바에 따릅니다.</p>

                        <strong>제10조(상속에 의한 특별중도해지)</strong>
                        <p>저축가입자의 사망으로 인한 상속의 경우, 상속인은 은행에 이 저축의 해지를 신청해야 하며, 이때 은행은 당초 약정이율을 적용합니다. 다만, 신탁·채권 등은 개별약관이
                            정하는 바에 따릅니다.</p>

                        <strong>제11조(저축의 전환여부)</strong>
                        <p>이 저축과 이 저축이 아닌 예금 등은 상호 전환할 수 없습니다.</p>

                        <strong>제12조(중복가입자에 대한 처리)</strong>
                        <p>제11조에 불구하고 가입자가 여러 금융기관에서 중복하여 가입한 때에는 가입자가 이 저축으로 선택한 계좌 이외의 계좌에 대해 가입자의 요청에 따라 일반과세계좌로
                            전환하여야 합니다.</p>

                        <strong>제13조(명의변경 등)</strong>
                        <p>명의변경 및 양수도는 허용하지 않습니다. 다만, 법원의 개명에 의한 명의변경은 가능합니다.</p>

                        <strong>제14조(예치한도 초과 입금 제한에 따른 책임)</strong>
                        <p>예치한도 초과로 입금(무통장 입금 및 타행환송금 포함)이 되지 않아 수표의 지급결제 불가, 신용카드 이용대금 연체, 자동이체 미처리 등의 손해가 발생하여도 은행은 그
                            책임을 지지 않습니다.</p>

                        <p>※이 약관은 금융소비자 보호에 관한 법령 및 내부통제기준에 따른 절차를 거쳐 제공됩니다.</p>

                        <p style="text-align:center;">[부 칙1]</p>
                        <p style="text-align:center;">①［시행일］이 특약은 2015년 1월 1일부터 시행합니다.<br>②［과세처리에 대한 경과조치］이 특약의 시행 전에 기존
                            '생계형저축'에 가입한 자의 이자소득 등은 가입 기간에 관계없이 전액 비과세 처리합니다. 다만, 2015년 이후에 만기일을 연장한 경우에는 연장된 만기 종료 이후의
                            이자소득 등은 과세처리 합니다.</p>

                        <p style="text-align:center;">[부 칙2]</p>
                        <p style="text-align:center;">① [시행일］이 특약은 2020년 1월 1일부터 가입하는 계좌에 대하여 적용하며 기존가입자는 기존특약을
                            적용받습니다.</p>

                        <p style="text-align:center;">[부 칙3]</p>
                        <p style="text-align:center;">① [시행일］이 특약은 2021년 1월 1일부터 가입하는 계좌에 대하여 적용하며 기존가입자는 기존특약을
                            적용받습니다.</p>

                    </dd>
                    <label for="agreement4">동의
                        <input type="checkbox" id="agreement4" class="agreement-checkbox">
                    </label>
                </div>
            </div>
        </div>
        <!-- 계좌간 자동이체 약관 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#terms5">
                    계좌간 자동이체 약관
                </button>
            </h2>
            <div id="terms5" class="accordion-collapse collapse">
                <div class="accordion-body">
                    <dd tabindex="0" style="display: block;">


                        <p class="top-area">
                            <span class="area-left">2022.03.24 개정</span>
                            <span class="area-right">준법감시인 심의필 제 2022-약관-050호(2022.03.22)</span>
                        </p>
                        <h5>계좌간 자동이체 약관</h5>
                        <strong>제1조 약관의 적용</strong>
                        <p>예금주가 하나은행계좌간 이체를 희망하는 경우에는 별도 지급표를 징구하지 않고 정해진 기일에 계정간에 이체처리하는 업무를 말한다.</p>

                        <strong>제2조 영업일</strong>
                        <p>다음 각호의 휴일을 제외한 날을 영업일로 합니다.</p>
                        <ol>
                            <li>1.대통령령에 의한 관공서의 공휴일</li>
                            <li>2.토요일</li>
                            <li>3.근로자의 날</li>
                        </ol>

                        <strong>제3조 신청, 변경 및 해지</strong>
                        <ol>
                            <li>① 이체지정일 2일전까지 자동이체 신청서에 의해 신규 및 변경, 해지 할 수 있습니다.</li>
                            <li>② 입금계좌는 당좌, 가계당좌, 보통, 저축, 자유저축, 기업자유예금, MMDA, MMF, 수익증권, 적립식예금(신탁), 대출계좌 등입니다.</li>
                        </ol>

                        <strong>제4조 출금</strong>
                        <ol>
                            <li>① 은행의 예금약관이나 약정서의 규정에 불구하고 예금청구서 기타 관련증서 없이 자동이체 처리절차에 의하여 출금할수 있습니다.</li>
                            <li>② 이체지정일에 출금계좌의 지급자금이 이체금액에 미달 하면 부족자금이 채워지는 날에 이체 처리 합니다.</li>
                            <li>③ 대출금이자, 원(리)금은 부분 인출 가능합니다(상환 약정기일에 약정 금액이 납입되지 않은 경우 연체 상태가 완전히 해소 될 때까지는 23시 40분까지
                                입금할 경우에 당일 처리 가능합니다.
                            </li>
                            <li>④ 자동이체대금으로 입금된 어음, 수표등이 부도처리되는 경우에는 현금이체분을 포함한 전액이 출금취소 됩니다.</li>
                            <li>⑤ 이체지정일이 (거래처가 지정한 날이 없는 월의 경우에는 해당 월의 말일 영업일) 이 휴일 등 영업일이 아닌 경우에는 익영업일에 이체 됩니다. 다만,
                                요구불계좌간자동이체는 예금주가 전영업일과 익영업일중 이체일을 선택할 수 있습니다.
                            </li>
                        </ol>

                        <strong>제5조 최초 개시일</strong>
                        <p>자동이체 신규신청에 의한 이체개시일은 예금주가 최초 이체지정한 날을 기준으로 하며, 이체일 및 금액에 대한 지정없이 자동이체를 신청한 때는 은행은 그 대상거래가
                            발생했을 때 이체합니다. 다만, 천재지변 등 불가피한 사유가 발생하였을 때에는 지연 처리될 수 있습니다.</p>

                        <strong>제6조 과실책임</strong>
                        <p>자동이체 지정계좌 예금잔액(자동대출약정이 있는 경우 대출한도 포함)이 납기일 현재 청구금액보다 부족하거나, 예금의 지급 제한, 약정대출의 연체, 잔액증명서 발급,
                            연체, 법적제한 등 예금주의 과실에 의하여 이체가 불가능한 경우의 손해는 은행이 책임을 지지 아니합니다. 다만, 은행의 고의 또는 과실로 인한 귀책사유가 있는 경우
                            은행은 그 책임을 일부 또는 전부를 부담합니다.</p>

                        <strong>제7조 출금 우선순위</strong>
                        <p>같은 날에 이체대상이 여러건 있는 때, 이체처리 순서는 은행이 정한 바에 따릅니다.</p>

                        <strong>제8조 계좌이동서비스</strong>
                        <ol>
                            <li>① 계좌간자동이체는 계좌이동서비스 대상이며, 계좌이동서비스를 신청하는 경우 계좌이동서비스 이용약관을 따릅니다.</li>
                            <li>② 은행은 자동이체 통합관리시스템(Payinfo.or.kr)에 자동이체 신청등록내역을 제공하여 신청인이 조회하고 해지 및 변경 신청이 가능하도록 합니다.
                            </li>
                            <li>③ 고객은 은행 영업점, 인터넷뱅킹(스마트폰뱅킹 포함), 자동이체 통합관리시스템(Payinfo.or.kr), 애플리케이션에서 계좌이동서비스를 신청할 수
                                있습니다.
                            </li>
                            <li>④ 고객이 은행 영업점 또는 인터넷뱅킹(스마트폰뱅킹 포함), 자동이체 통합관리시스템(Payinfo.or.kr), 애플리케이션에서 자동이체 출금계좌를 당행
                                계좌로 변경 신청할 경우 타은행 출금계좌에 등록되어 있는 자동이체 해지 후, 당행 출금계좌로 신규 등록 됩니다.
                            </li>
                        </ol>

                        <strong>제9조 다른 약관과의 관계</strong>
                        <p>계좌간 자동이체 거래에는 이 약관외에도 예금거래 기본약관, 입출금이 자유로운예금 약관, 전자금융거래 기본 약관관련 예금, 신탁약관 및 은행 내규를 준용합니다. 다만,
                            여신의 경우 여신거래기본약관이 우선합니다.</p>

                        <strong>별첨. 자동이체 출금 우선순위</strong>
                        <ol>
                            <li>1)요구불간자동이체</li>
                            <li>2)여신상환</li>
                            <li>3)여신이자수입</li>
                            <li>4)하나카드자동이체</li>
                            <li>5)지로자동이체</li>
                            <li>6)CMS자동이체</li>
                            <li>7)CMS자동이체(당일출금)</li>
                            <li>8)아파트관리비(금융결제원, 이지스효성)</li>
                            <li>9)월부금자동이체</li>
                            <li>10)펌뱅킹자동이체</li>
                            <li>11)아파트관리비(일괄출금)</li>
                            <li>12)일일상환서비스원금</li>
                            <li>13)일일상환서비스이자</li>
                        </ol>

                        <p>* CMS자동이체(당일출금) 업무는13시에 처리가 시작되기 때문에 그 이전에는 자동이체우선순위에서 제외됩니다.</p>
                        <p>* 펌뱅킹자동이체는 업체에서 출금의뢰가 수시로 일어나기 때문에 업체사정에 따라 자동이체우선순위가 아파트관리비(일괄출금)와 바뀔 수 있습니다.</p>
                        <p>* 납부자자동이체는 금융결제원 파일전송 시간을 맞추기 위해 20:00 에 1회만 처리되며, 부분이체는 불가합니다.</p>
                        <p>* 18시 이후 입금시 자동이체 우선순위와 관계없이 처리될 수 있습니다.</p>
                        <p>※ 이 약관은 금융소비자 보호에 관한 법령 및 내부통제기준에 따른 절차를 거쳐 제공됩니다.</p>

                    </dd>
                    <label for="agreement5">동의
                        <input type="checkbox" id="agreement5" class="agreement-checkbox">
                    </label>
                </div>
            </div>
        </div>

        <!-- 챌린지 적금 상품특약 약관 -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#terms6">
                    챌린지 적금 상품특약 약관
                </button>
            </h2>
            <div id="terms6" class="accordion-collapse collapse">
                <div class="accordion-body">
                    <dd tabindex="0" style="display: block;">


                        <p class="top-area">
                            <span class="area-left">2019. 3.18 제정</span> <span class="area-right">준법감시인
			심의필 제2022-약관-125호(2022.07.27)</span>
                        </p>

                        <h5>「챌린지 적금」특약</h5>

                        <strong>제1조 적용범위</strong>
                        <p>“(내맘) 적금 (이하 "이 예금"이라 함)”의 거래에는 이 특약을 적용하고, 이 특약에서 정하지 않은 사항은
                            『적립식예금 약관』, 『예금거래 기본약관』, 『전자금융거래기본약관』 및 『전자금융서비스이용약관』 을 적용합니다.</p>

                        <strong>제2조 가입대상</strong>
                        <p>이 예금의 가입대상은 실명의 개인 또는 개인사업자입니다.</p>

                        <strong>제3조 예금종류</strong>
                        <p>이 예금의 예금종류는 적립식예금으로 합니다.</p>

                        <strong>제4조 계약기간</strong>
                        <p>이 예금의 계약기간은 6개월이상 60개월이내에서 월 또는 일단위로 지정이 가능합니다.</p>

                        <strong>제5조 가입금액 및 적립방법</strong>
                        <ol>
                            <li>① 이 예금의 가입 금액은 1천원 이상 10백만원 이내입니다.</li>
                            <li>② 이 예금 가입 시 매월 약정일에 동일한 금액을 적립하는 정액적립식과 매월 월 적립한도 내에서 자유롭게 적립할
                                수 있는 자유적립식 중에서 적립방법을 선택할 수 있습니다.
                            </li>
                            <li>③ 제2항의 정액적립식 적립방법을 선택한 경우 적립한도는 매월 1천원 이상 10백만원 이내에서 선택한 금액을
                                약정일에 적립할 수 있습니다.
                            </li>
                            <li>④ 제2항의 자유적립식 적립방법을 선택한 경우 적립한도는 매월 1원 이상 10백만원 이내에서 자유롭게 적립할 수
                                있습니다. 다만 계약기간 2/3 경과후 나머지 계약기간 동안에는 경과전 납입한 적립잔액의 1/2을 초과하여 입금할 수
                                없습니다.
                            </li>
                        </ol>

                        <strong>제6조 자동재예치</strong>
                        <ol>
                            <li>① 이 예금을 자유적립식으로 가입하고 자동재예치를 선택한 경우, 만기일에 최초 계약기간 단위로 총 3회
                                자동재예치되며, 최소 가입금액 1천원을 제외한 나머지 세후원리금은 사전에 지정한 본인명의 입출금통장으로 이체됩니다.
                            </li>
                            <li>② 만기일이 휴일인(주1) 경우에는 익영업일에 재예치하고, 해당일이 없는 경우에는 그 달의 마지막 영업일에
                                재예치하며, 재예치일을 새로운 계약일로 간주합니다.
                            </li>
                            <li>③ 압류 등 지급제한이 있거나 만기일 전에 고객이 자동재예치를 해제하는 등 기타 재예치를 할 수 없는 경우에는
                                재예치 대상에서 제외됩니다.
                            </li>
                        </ol>

                        <strong>제7조 이자지급</strong>
                        <ol>
                            <li>① 이 예금은 적립금마다 입금일부터 만기일 전날까지의 기간에 대하여 예금 가입일(또는 재예치일) 당시 영업점 및
                                은행 홈페이지에 고시한 기본금리에 제8조에서 정한 우대금리를 더하여 셈한 이자를 원금에 더하여 만기일에 일시 지급합니다. 단,
                                만기일이 휴일인(주1) 경우 만기일의 전영업일 또는 익영업일에 해지하여도 본항을 적용합니다.
                            </li>
                            <li>② 이 예금의 만기일 전에 지급을 청구할 때에는 적립금마다 입금일부터 지급일 전날까지 기간에 대해 예금
                                가입일(또는 재예치일) 당시 영업점 및 은행 홈페이지에 고시한 중도해지금리로 셈한 이자를 원금에 더하여 지급합니다.
                            </li>
                            <li>③ 이 예금의 만기일 이후에 지급을 청구한 때에는 만기일부터 지급일 전일까지의 기간에 대하여 예금 가입일 (또는
                                재예치일) 당시 영업점 및 은행 홈페이지에 고시한 만기 후 금리로 셈한 이자를 원금에 더하여 지급합니다.
                            </li>
                        </ol>

                        <strong>제8조 우대금리</strong>
                        <ol>
                            <li>① 이 예금은 가입후(또는 재예치후) 매 계약기간별 만기월 전월까지 하나은행의 입출금이 자유로운 예금을 통하여
                                계약기간의 1/2이상 월부금 자동이체실적이 있는 경우 연 0.5%의 우대금리를 만기해지시 제공합니다. <br>(단, 월별
                                1회 납입횟수만 인정)
                            </li>
                            <li>② 금리우대쿠폰을 발급받을 경우 제7조 제1항의 기본금리에 가산하여 우대금리를 지급합니다. 금리우대쿠폰의
                                우대금리는 하나원큐 내 쿠폰함 또는 상품 가입시 제공되는 쿠폰의 우대금리를 따릅니다. <br>단, 신규 가입시에만 쿠폰
                                사용이 가능하며, 재예치 또는 중도해지시에는 적용되지 않습니다.
                            </li>
                        </ol>

                        <strong>제9조 일부해지</strong>
                        <p>
                            이 예금의 일부해지는 계약기간동안 2회까지 입금건별 균등계산방식(주2)에 따라 가능하며, 일부 해지금액에 대하여 가입일(또는
                            재예치일)에 고시한 중도해지금리를 적용합니다. <br>
                            <br> (주1) 휴일 : 토요일, 일요일, 공휴일, 근로자의 날 등 은행의 비영업일<br> (주2) 입금건별
                            균등계산방식 : 일부해지하는 금액을 입금건별로 균등하게 계산한 금액으로 출금하는 방식
                        </p>

                        <p>※이 약관은 금융소비자 보호에 관한 법령 및 내부통제기준에 따른 절차를 거쳐 제공됩니다.</p>

                        <p></p>
                        부칙
                        <br> 1. 이 특약은 2021년 10월 5일부터 가입하는 계좌에 대하여 적용하며, 기존 가입자는 기존 특약을 적용 받습니다.
                        <br>2. 이 특약은 2022년 1월 12일부터 기존 가입자를 포함하여 적용합니다.
                        <br>3. 이 특약은 2022년 8월 31일부터 기존 가입자를 포함하여 적용합니다.
                        <p></p>


                    </dd>
                    <label for="agreement6">동의
                        <input type="checkbox" id="agreement6" class="agreement-checkbox">
                    </label>
                </div>
            </div>
        </div>

        <!-- 전체 동의 체크박스 -->
        <label for="overall-agreement">상품가입 약관 전체 동의
            <input type="checkbox" id="overall-agreement">
        </label>
        <script>// 전체 동의 체크박스
        const allAgreements = document.querySelectorAll('.agreement-checkbox');
        const overallAgreement = document.getElementById('overall-agreement');

        // 각 약관 섹션
        const agreementSections = document.querySelectorAll('.accordion-item');

        // 전체 동의 체크박스 상태 변경 시, 모든 동의 체크박스 업데이트
        overallAgreement.addEventListener('change', function () {
            const isChecked = overallAgreement.checked;
            allAgreements.forEach((checkbox) => {
                checkbox.checked = isChecked;
            });
        });

        // 각 약관 섹션의 동의 체크박스 상태 확인
        agreementSections.forEach((section, index) => {
            section.querySelector('.agreement-checkbox').addEventListener('change', function () {
                updateOverallAgreementStatus();
            });
        });

        // 전체 동의 체크박스 상태 업데이트
        function updateOverallAgreementStatus() {
            const allChecked = Array.from(allAgreements).every((checkbox) => checkbox.checked);
            overallAgreement.checked = allChecked;
        }
        </script>

        <%-------------------------------------------------------약관동의------------------------------------------------------------%>
        <div class="check"></div>


        <div class="paymntPlanTitle">◆ 납입계획 세우기</div>
        <%--        <c:forEach var="plan" items="${PaymentPlanList}">--%>
        <%--            <div class="selectPurchasePlanID">${plan.purchasePlanID}</div>--%>
        <%--        </c:forEach>--%>

        <form id="myForm" action="/insertPaymentPlan" method="post">
            <div class="payment-plan-form">
                <div class="section">
                    <h3>납입계획 작성</h3>
                    <c:forEach var="plan" items="${PaymentPlanList}">
                        <input style="display: none" type="number" name="selectPurchasePlanID"
                               value="${plan.purchasePlanID}">
                    </c:forEach>
                    <div class="input-container">
                        <label for="planName">계획명</label> <input type="text" id="planName"
                                                                 name="planName" placeholder="계획명을 입력하세요" required>
                    </div>
                    <p id="planNameInfo"></p>


                    <div class="input-container">
                        <label for="goalDuration">목표기간</label>
                        <input type="number" id="goalDuration" name="goalDuration" placeholder="개월" required
                               value="${PaymentPlanList[0].planPeriod}">
                    </div>

                    <div class="input-container">
                        <label for="goalAmount">목표금액</label> <input type="text"
                                                                    id="goalAmount" name="goalAmount" placeholder="원"
                                                                    required>
                    </div>

                    <div id="goalAmountMessage"></div>

                </div>

                <div class="section">
                    <h3>납입 정보</h3>
                    <div class="input-container">
                        <label for="paymentFrequency">납입주기</label> <select
                            id="paymentFrequency" name="paymentFrequency">
                        <option value="매월">매월</option>
                        <option value="매주">매주</option>
                        <option value="매일">매일</option>
                    </select>
                    </div>
                    <div class="input-container payment-date">
                        <label for="paymentDate">납입일</label>
                        <select id="paymentDate" name="paymentDate">
                            <!-- 1일부터 30일까지의 모든 일자를 드롭다운으로 표시 -->
                            <option value="1">1일</option>
                            <option value="2">2일</option>
                            <option value="3">3일</option>
                            <option value="4">4일</option>
                            <option value="5">5일</option>
                            <option value="6">6일</option>
                            <option value="7">7일</option>
                            <option value="8">8일</option>
                            <option value="9">9일</option>
                            <option value="10">10일</option>
                            <option value="11">11일</option>
                            <option value="12">12일</option>
                            <option value="13">13일</option>
                            <option value="14">14일</option>
                            <option value="15">15일</option>
                            <option value="16">16일</option>
                            <option value="17">17일</option>
                            <option value="18">18일</option>
                            <option value="19">19일</option>
                            <option value="20">20일</option>
                            <option value="21">21일</option>
                            <option value="22">22일</option>
                            <option value="23">23일</option>
                            <option value="24">24일</option>
                            <option value="25">25일</option>
                            <option value="26">26일</option>
                            <option value="27">27일</option>
                            <option value="28">28일</option>
                            <option value="29">29일</option>
                            <option value="30">30일</option>
                        </select>
                    </div>
                    <div class="input-container payment-day-of-week"
                         style="display: none;">
                        <label for="paymentDayOfWeek">납입일 (요일)</label> <select
                            id="paymentDayOfWeek" name="paymentDayOfWeek">
                        <option value="월요일">월요일</option>
                        <option value="화요일">화요일</option>
                        <option value="수요일">수요일</option>
                        <option value="목요일">목요일</option>
                        <option value="금요일">금요일</option>
                        <option value="토요일">토요일</option>
                        <option value="일요일">일요일</option>
                    </select>
                    </div>


                    <div class="input-container">
                        <label for="paymentAmount">납입금액</label>
                        <input type="text" id="paymentAmount" name="paymentAmount" placeholder="원" required readonly>
                    </div>


                    <div class="input-container">
                        <label for="transferMethod">이체방식</label> <select
                            id="transferMethod" name="transferMethod">
                        <option value="자동이체">자동이체</option>
                        <option value="직접이체">직접이체</option>
                    </select>
                    </div>

                    <div class="input-container">
                        <label for="autoTransferAccount">자동이체 계좌</label>
                        <select id="autoTransferAccount" name="autoTransferAccount"></select>
                    </div>


                </div>

                <div class="section">
                    <h3>분배 비율</h3>
                    <c:forEach var="plan" items="${PaymentPlanList}">
                        <div class="ratio-container">
                            <div class="ratio-input">
                                <div class="PlanName">계획명</div>
                                <input style="display: none" type="number" name="selectPurchasePlanID"
                                       value="${plan.purchasePlanID}">
                                <div class="selectPlanName">${plan.planName}</div>
                                <div class="PlanAmount">목표금액</div>
                                <div class="selectPlanAmount">
                                    <script>
                                        // 가격을 3자리마다 쉼표(,)로 포매팅
                                        var formattedAmount = numberWithCommas(${plan.planAmount}) + "원";
                                        document.write(formattedAmount);

                                        function numberWithCommas(x) {
                                            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                        }
                                    </script>
                                </div>

                                <label class="ratio-label">분배비율</label>
                                <input id="planRatio" type="number" class="ratio" name="ratio"
                                       value="${plan.allocationRatio}">
                                <label class="percent-label">%</label>
                            </div>
                        </div>
                    </c:forEach>

                    <p class="ratio-info">* 연결된 구매계획리스트 분배 비율 합이 100이 되어야 합니다.</p>
                    <button id="updateButton">분배비율 수정하기</button> <!-- 업데이트 버튼 추가 -->
                </div>

                <script>
                    $(document).ready(function () {
                        $("#updateButton").click(function () {
                            var dataToSend = [];

                            // 각 계획 항목과 ratio를 매핑하여 데이터를 준비
                            $(".ratio-container").each(function () {
                                var selectPurchasePlanID = $(this).find("input[name='selectPurchasePlanID']").val();
                                var ratio = $(this).find("input[name='ratio']").val();

                                // JavaScript 객체로 데이터를 생성
                                var planData = {
                                    selectPurchasePlanID: parseInt(selectPurchasePlanID), // 문자열을 정수로 변환
                                    ratio: parseInt(ratio) // 문자열을 정수로 변환
                                };

                                dataToSend.push(planData);
                            });

                            // 준비한 데이터를 서버로 전송
                            $.ajax({
                                type: "POST",
                                url: "/updatePurchasePlan", // 업데이트를 처리하는 컨트롤러 엔드포인트
                                data: JSON.stringify(dataToSend), // 데이터를 JSON 문자열로 변환하여 전송
                                contentType: "application/json", // Content-Type을 JSON으로 설정
                                success: function (response) {
                                    // 성공 시 처리
                                    console.log("성공:", response);
                                },
                                error: function (error) {
                                    // 오류 시 처리
                                    console.log("오류:", error);
                                }
                            });
                        });
                    });
                </script>

                <div class="section">
                    <h3>만기 예상</h3>
                    <!-- 만기 예상 원금 입력 필드 -->
                    <div class="input-container">
                        <label for="expectedPrincipal">만기 예상 원금</label>
                        <input type="text" id="expectedPrincipal" name="expectedPrincipal"
                               placeholder="클릭하여 만기 예상 이자를 확인하세요!"
                               onclick="calculateInterest()">
                    </div>

                    <!-- 만기 예상 이자 입력 필드 -->
                    <div class="input-container">
                        <label for="expectedInterest">만기 예상 이자</label>
                        <input type="text" id="expectedInterest" name="expectedInterest"
                               placeholder="클릭하여 만기 예상 이자를 확인하세요!"
                               onclick="calculateInterest()">
                    </div>
                    <div class="input-container">
                        <label for="terminationMethod">해지방식</label> <select
                            id="terminationMethod" name="terminationMethod">
                        <option value="자동해지">자동해지</option>
                        <option value="직접해지">직접해지</option>
                    </select>
                    </div>

                    <div class="input-container">
                        <label for="expectedTerminationDate">예상 만기 일자</label>
                        <input type="text" name="expectedTerminationDate" id="expectedTerminationDate" readonly>
                    </div>
                    <div class="input-container">
                        <label for="challengeSavingsAccountPW">계좌 비밀번호 생성</label>
                        <input type="text" id="challengeSavingsAccountPW" name="challengeSavingsAccountPW">
                    </div>
                    <div class="error-message"></div>

                    <script>
                        var passwordInput = document.getElementById('challengeSavingsAccountPW');
                        var errorMessage = document.querySelector('.error-message');

                        // 입력 필드의 내용이 변경될 때마다 검증 함수를 호출합니다.
                        passwordInput.addEventListener('input', validatePassword);

                        function validatePassword() {
                            var password = passwordInput.value;
                            var isValid = /^\d{4}$/.test(password);

                            if (password === '') {
                                errorMessage.textContent = '비밀번호를 입력하세요.';
                                errorMessage.className = 'error-message';
                            } else if (isValid) {
                                errorMessage.textContent = '사용 가능한 비밀번호입니다.';
                                errorMessage.className = 'success-message';
                            } else {
                                errorMessage.textContent = '4자리의 숫자만 입력하세요.';
                                errorMessage.className = 'error-message';
                            }

                            // 입력 길이가 4자리를 초과하면 마지막 4자리만 유지합니다.
                            if (password.length > 4) {
                                passwordInput.value = password.slice(0, 4);
                            }
                        }
                    </script>

                    <div class="input-container" style="display:none;">
                        <label for="challengeSavingsAccountNumber">계좌번호</label>
                        <input type="text" id="challengeSavingsAccountNumber" name="challengeSavingsAccountNumber"
                               readonly>
                    </div>

                </div>
            </div>
            <div class="ButtonContainer ">
                <div class="row">
                    <div class="col">
                        <c:url var="backButton" value="../../resources/img/btnBack.svg"/>
                        <a class="backButton" href="/checkMyWishList"> <img
                                src="${backButton}" alt="버튼" class="backButton">
                        </a>
                    </div>
                    <div class="col">
                        <c:url var="makeAccountButton" value="../../resources/img/btn_makeAccount.svg"/>
                        <a class="makeAccountButton" href="javascript:void(0);" onclick="submitFormOnClick()">
                            <img src="${makeAccountButton}" alt="버튼" class="makeAccountButton" width="190">
                        </a>
                    </div>
                </div>
            </div>
            <input type="submit" value="저장" style="display: none;">
        </form>

        <%--    <script>--%>
        <%--        // 이미지 클릭 시 폼 제출 함수--%>
        <%--        function submitFormOnClick() {--%>
        <%--            generateRandomAccountNumber(); // 계좌 번호 생성--%>
        <%--            document.getElementById('myForm').submit(); // 폼 제출--%>
        <%--        }--%>
        <%--    </script>--%>
        <script>
            $(document).ready(function () {
                // 계획명 입력 필드를 선택
                var planNameInput = $("#planName");

                // 입력 필드 값 변경 이벤트 리스너 추가
                planNameInput.on("input", function () {
                    var planNameInfo = $("#planNameInfo");

                    if (planNameInput.val().trim() === "") {
                        planNameInfo.text("* 계획명은 필수 입력 사항입니다.").css("color", "red");
                    } else {
                        planNameInfo.text("* 계획명 입력 완료하셨습니다.").css("color", "green");
                    }
                });
            });
            <%--// 목표금액 정하기--%>
            <%--var planAmountSum = 0;--%>
            <%--<c:forEach var="item" items="${PaymentPlanList}">--%>
            <%--planAmountSum += ${item.planAmount};--%>
            <%--</c:forEach>--%>
            <%--// 목표금액 input 요소에 합계를 할당--%>
            <%--document.getElementById("goalAmount").value = planAmountSum;--%>
            var planAmountSum = 0;
            <c:forEach var="item" items="${PaymentPlanList}">
            planAmountSum += ${item.planAmount};
            </c:forEach>

            // planAmountSum를 가격 형식으로 형식화 (예: 500,000 원)
            var formattedPlanAmountSum = planAmountSum.toLocaleString() + " 원";

            // 목표금액 input 요소에 가격 형식으로 할당
            document.getElementById("goalAmount").value = formattedPlanAmountSum;

            // goalAmount 입력 필드 값 변경 이벤트 리스너 추가
            document.getElementById("goalAmount").addEventListener("input", function () {
                var enteredAmount = parseFloat(this.value.replace(" 원", "").replace(",", "")); // 입력값에서 " 원" 제거 및 숫자로 변환
                var messageElement = document.getElementById("goalAmountMessage"); // 메시지를 표시할 요소

                if (enteredAmount < planAmountSum) {
                    messageElement.style.color = "red"; // 빨간색 텍스트로 설정
                    messageElement.textContent = "* 최소 목표 금액보다 낮은 가격입니다.";
                } else {
                    messageElement.style.color = "green"; // 초록색 텍스트로 설정
                    messageElement.textContent = "* 최소 목표 금액 조건을 만족하였습니다.";
                }

            });

            // 사용자 입력값 가져오기
            var goalAmountStr = document.getElementById("goalAmount").value; // 가격 형식의 문자열을 가져옴
            var goalAmount = parseInt(goalAmountStr.replace(/[,원]/g, '')); // 콤마와 '원'을 제거하고 숫자로 변환

            console.log("목표금액 잘 받아오고 있니? " + goalAmount);
            var goalDuration = parseInt(document.getElementById("goalDuration").value);
            var paymentFrequency = document.getElementById("paymentFrequency").value;

            // 납입주기에 따라 납입금액 계산
            var paymentAmount = 0;

            function calculatePaymentAmount() {
                if (paymentFrequency === "매월") {
                    paymentAmount = Math.ceil(goalAmount / goalDuration);
                } else if (paymentFrequency === "매주") {
                    // 현재 날짜에서 목표 기간 후의 날짜 계산
                    var currentDate = new Date();
                    var endDate = new Date(currentDate);
                    endDate.setMonth(endDate.getMonth() + goalDuration);
                    // 날짜 차이 계산
                    var daysDifference = Math.ceil((endDate - currentDate) / (1000 * 60 * 60 * 24));
                    // 주차로 날짜 차이를 계산하고 소수점 자리가 있을 경우 올림
                    var weeksDifference = Math.ceil(daysDifference / 7);

                    console.log("몇주인가" + weeksDifference);
                    // 주 단위로 나눈 뒤 올림
                    paymentAmount = Math.ceil(goalAmount / weeksDifference);

                } else if (paymentFrequency === "매일") {
                    // 현재 날짜에서 목표 기간 후의 날짜 계산
                    var currentDate = new Date();
                    var endDate = new Date(currentDate);
                    endDate.setMonth(endDate.getMonth() + goalDuration);
                    // 날짜 차이 계산
                    var daysDifference = Math.ceil((endDate - currentDate) / (1000 * 60 * 60 * 24));
                    console.log("날짜차이" + daysDifference);

                    // 일 단위로 나눈 뒤 올림
                    paymentAmount = Math.ceil(goalAmount / daysDifference);
                }
            }

            // document.getElementById("paymentAmount").addEventListener("input", function () {
            //     var enteredAmount = parseFloat(this.value.replace(" 원", "").replace(",", "")); // 입력값에서 " 원" 제거 및 숫자로 변환
            //     var messageElement = document.getElementById("paymentAmountMessage"); // 메시지를 표시할 요소
            //
            //     if (enteredAmount < paymentAmount) {
            //         messageElement.style.color = "red"; // 빨간색 텍스트로 설정
            //         messageElement.textContent = "목표 기간 안에 목표 금액을 모으기 위한 최소 금액보다 낮은 금액입니다.";
            //     } else {
            //         messageElement.style.color = "green"; // 초록색 텍스트로 설정
            //         messageElement.textContent = "조건이 성립되었습니다.";
            //     }
            // });


            // 납입주기 변경 감지
            document.getElementById("paymentFrequency").addEventListener("change", function () {
                paymentFrequency = this.value;
                calculatePaymentAmount();
                updatePaymentAmount();
            });

            // 결과 표시
            function updatePaymentAmount() {
                // 계산된 paymentAmount를 가격 형식으로 포맷
                var formattedPaymentAmount = paymentAmount.toLocaleString() + " 원";
                console.log("포맷팅된 납입금액" + formattedPaymentAmount);

                // 납입금액 input 필드에 가격 형식으로 할당
                document.getElementById("paymentAmount").value = formattedPaymentAmount;
            }

            // 초기 계산
            calculatePaymentAmount();
            updatePaymentAmount();

            // ------------------------------------------------------------------------------
            // AJAX로 계좌 목록 가져오기
            $.ajax({
                url: "/getAllAccounts",
                method: "GET",
                dataType: "json",
                success: function (data) {
                    // 드롭다운을 참조
                    var dropdown = document.getElementById("autoTransferAccount");

                    // 각 계좌 정보에 대한 option 엘리먼트를 생성하여 추가
                    data.forEach(function (account) {
                        var option = document.createElement("option");
                        option.value = BigInt(account.accountNumber); // 문자열을 BigInt로 변환하여 할당
                        option.text = account.accountNumber;

                        // 드롭다운에 옵션 추가
                        dropdown.appendChild(option);
                    });

                    // 받아온 데이터를 콘솔에 출력
                    console.log("계좌 목록 데이터: ", data);
                },
                error: function (error) {
                    console.log("Error fetching account data: " + error);
                }
            });


            // 드롭다운 값이 변경될 때 발생하는 이벤트 핸들러
            $("#autoTransferAccount").on("change", function () {
                // 선택한 값 가져오기
                var selectedValue = $(this).val();
                console.log("선택한 계좌 번호: " + selectedValue);
            });

            $(document).ready(function () {
                // 모든 .ratio 인풋 필드를 선택
                var ratioInputs = $(".ratio");

                // 초기에도 한 번 실행
                checkRatioSum();

                // 입력 필드 값 변경 이벤트 리스너 추가
                ratioInputs.on("input", function () {
                    checkRatioSum();
                });

                // 비율 합계 체크 함수
                function checkRatioSum() {
                    // 모든 입력 필드 값을 합산
                    var total = 0;
                    ratioInputs.each(function () {
                        var inputValue = parseFloat($(this).val()) || 0;
                        total += inputValue;
                    });

                    // 합계가 100이 아닌 경우 경고 표시
                    if (total !== 100) {
                        $(".ratio-info").text("* 연결된 구매계획리스트 분배 비율 합이 100이 되어야 합니다.").css("color", "red");
                    } else {
                        $(".ratio-info").text("* 연결된 구매계획리스트 분배 비율 합이 100이 되었습니다.").css("color", "green");
                    }
                }
            });

            function calculateInterest() {
                // 사용자 입력
                var goalDurationStr = document.getElementById("goalDuration").value;
                var paymentAmountStr = document.getElementById("paymentAmount").value;
                console.log("paymentAmountStr" + paymentAmountStr);

                // 입력 값이 비어 있는지 확인
                if (goalDurationStr === "" || paymentAmountStr === "") {
                    alert("목표 기간과 결제 금액을 확인하세요.");
                    return;
                }

                // 입력 값을 정수 또는 부동 소수점으로 변환
                var goalDuration = parseInt(goalDurationStr);
                var goalAmountStr = document.getElementById("goalAmount").value; // 가격 형식의 문자열을 가져옴
                var goalAmount = parseInt(goalAmountStr.replace(/[,원]/g, '')); // 콤마와 '원'을 제거하고 숫자로 변환
                console.log("납입 금액 잘 받아지고 있는지 " + paymentAmount);
                console.log("납입 기간 잘 받아지고 있는지 " + goalDuration);

                // 목표 기간에 따른 이자율 설정
                var interestRate;

                if (goalDuration >= 6 && goalDuration < 12) {
                    interestRate = 0.035; // 연 3.50%
                } else if (goalDuration >= 12 && goalDuration < 24) {
                    interestRate = 0.038; // 연 3.80%
                } else if (goalDuration >= 24 && goalDuration <= 36) {
                    interestRate = 0.038; // 연 3.80%
                } else {
                    alert("설정된 목표 기간은 유효하지 않습니다.");
                    return;
                }

                var monthlyInterest;
                var totalInterest;

                if (paymentFrequency === "매월") {
                    monthlyInterest = paymentAmount * interestRate / 12;
                    totalInterest = monthlyInterest * goalDuration;
                } else if (paymentFrequency === "매주") {
                    var weeklyInterest = paymentAmount * interestRate / 52;
                    monthlyInterest = weeklyInterest * 4; // 주 단위 이자를 월로 환산 (주로 4주)
                    totalInterest = monthlyInterest * goalDuration;
                } else if (paymentFrequency === "매일") {
                    var dailyInterest = paymentAmount * interestRate / 365;
                    monthlyInterest = dailyInterest * 30; // 일 단위 이자를 월로 환산 (일반적으로 30일로 계산)
                    totalInterest = monthlyInterest * goalDuration;
                }
                totalInterest = Math.floor(totalInterest);
                // 만기 예상 원금 및 이자 계산
                var totalPrincipal = goalAmount + totalInterest;


                // 만기 예상 원금 및 이자 계산
                // var totalPrincipal = paymentAmount * goalDuration;
                // var totalInterest = monthlyInterest * goalDuration;

                // 결과를 입력 필드에 설정
                document.getElementById("expectedPrincipal").value = totalPrincipal.toLocaleString() + " 원";
                document.getElementById("expectedInterest").value = totalInterest.toLocaleString() + " 원";
            }

            var goalDurationMonths = parseInt(document.getElementById("goalDuration").value);

            // 현재 날짜를 가져옴
            var currentDate = new Date();

            // goalDuration 값을 월에 더한 날짜를 계산
            var endDate = new Date(currentDate);
            endDate.setMonth(endDate.getMonth() + goalDurationMonths);

            // 예상 만기 일자를 날짜 형식으로 변환
            var formattedEndDate = endDate.getFullYear() + '-' + ('0' + (endDate.getMonth() + 1)).slice(-2) + '-' + ('0' + endDate.getDate()).slice(-2);

            console.log(formattedEndDate);
            // calculatedEndDate 값을 해당 <input> 요소의 value로 설정
            document.getElementById("expectedTerminationDate").value = formattedEndDate;


            document.getElementById("paymentFrequency").addEventListener(
                "change",
                function () {
                    var selectedValue = this.value;
                    var paymentDateInput = document.querySelector(".payment-date");
                    var paymentDayOfWeekInput = document.querySelector(".payment-day-of-week");

                    if (selectedValue === "매월") {
                        paymentDateInput.style.display = "block";
                        paymentDayOfWeekInput.style.display = "none";
                    } else if (selectedValue === "매주") {
                        paymentDateInput.style.display = "none";
                        paymentDayOfWeekInput.style.display = "block";
                    } else {
                        paymentDateInput.style.display = "none";
                        paymentDayOfWeekInput.style.display = "none";
                    }
                }
            );

            function generateRandomAccountNumber() {
                const randomSuffix = Math.floor(10000000 + Math.random() * 90000000); // 6자리 랜덤 숫자 생성
                const accountNumber = 1002 + randomSuffix.toString(); // 1002와 6자리 랜덤 숫자를 합침
                const accountNumberField = document.getElementById('challengeSavingsAccountNumber');
                accountNumberField.value = parseInt(accountNumber); // 정수로 변환하여 할당
            }

            // 이미지 클릭 시 폼 제출 함수
            function submitFormOnClick() {
                generateRandomAccountNumber(); // 계좌 번호 생성
                document.getElementById('myForm').submit(); // 폼 제출
            }

            $(document).ready(function () {
                // 이미지 버튼 클릭 이벤트 핸들러
                $(".makeAccountButton").click(function () {
                    submitFormOnClick(); // 이미지 클릭 시 폼 제출 함수 호출
                });

                // 폼 제출 이벤트 핸들러
                $("#myForm").submit(function (event) {
                    event.preventDefault(); // 폼 기본 제출 동작 방지
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
