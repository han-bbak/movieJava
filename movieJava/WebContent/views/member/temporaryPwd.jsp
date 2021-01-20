<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <title>무비자바(MovieJava) - 임시비밀번호</title>
    <style>
        html {
            height: 100%;
        }
        body {
            height: 100%;
            padding: 0px;
            margin: 0 auto;
            line-height: 1;
            background : rgba(64,64,64,1);

        }
        .bg {
            width : 100%;
            height: 100%;
            padding: 0;
            margin: 0;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            position: absolute;

            transition : all 0.5s;
        }

        #bg1 {
            background : url("../../images/bg1-1.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            z-index: -2;
        }

        #bg2 {
            background : url("../../images/bg1-2.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            z-index: -2;
        }

        #bg3 {
            background : url("../../images/bg1-3.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            z-index: -2;
        }
        #bg4 {
            background : url("../../images/bg1-4.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            z-index: -2;
        }
        #bg5 {
            background : url("../../images/bg1-5.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            z-index: -2;
        }

        #cover {
            width: 100%;
            height : 100%;
            background : rgba(64,64,64,0.9);
            position: absolute;
            z-index: -1;
        }

        #cover_1 {
            width: 100%;
            height : 100%;
            background : rgba(64,64,64,1);
            position: absolute;
            z-index: -3;
        }

        .wrapper {
            width: 100%;
            height: 100%;
            margin: auto;
        }

        .login_wrapper {
            padding : 192px 0;
            margin: auto;
            min-width: 1200px;
            min-height: 582px;
        }

        .login_area {
            text-align: center;
            margin: 0 auto;
            width: 390px;
            min-height: 582px;
            background : #fff;
            border : 1px solid rgba(64,64,64,1);
        }

        .footer p {
            color: white;
            text-align: center;
        }

        .footer {
            padding-bottom: 52px;
        }

        .login_area .confirmIdDiv {
            width : 318px;
            margin: 0 auto 24px;
            /* padding: 20px 8px; */
            height : 130px;
            border : 1px solid #e7e7e7;
        }

        .confirmIdDiv input {
            margin: 56px auto 56px;
            font-size : 18px;
            line-height: 18px;
            border : none;
            text-align :center;
            background : none;
        }

        .confirmIdDiv input:focus {
            outline: none;
        }


        .login_logo {
            width: 390px;
            height: 150px;
            margin: auto;
        }

        .login_logo img {
            padding : 20px;
            width : 310px;
        }

        .login_header span {
            display: inline-block;
            position: relative;
            padding-top: 4px;
            height: 56px;
            line-height: 56px;
        }

        .login_area span{
            display : inline-block;
            padding-top: 4px;
            position: relative;
        }

        .login_header span::before,
        .login_area span::before {
            position: absolute;
            left: 50%;
            top: 0;
            margin-left: -20px;
            width: 40px;
            height: 1px;
            background: #dadada;
            content : "";
        }

        .login_header span b {
            color : #0065e3;
        }

        .login_ok {
            display: block;
            margin: 0 auto 24px;
            width: 318px;
            height: 66px;
            background: #1c81ff;
            border : 1px solid #1b7df8;
            font-size: 16px;
            color : #fff;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .login_ok:hover {
            background-color : #0065e3;
            border-color : #0061db;
        }

        .login_ok sup {
            color: red;
            font-weight: bold;
        }

        ul.list {
            list-style: none;
            text-align: center;
            font-size: 12px;
            margin: 0;
            padding: 0;
            margin-bottom: 30px;
        }

        ul.list li {
            display: inline-block;
            padding: 0 14px;
            height: 14px;
            text-align: center;
            line-height: 14px;
            border-left : 1px solid #a1a1a1;
        }

        ul.list li:first-child {
            border-left: none;
        }

        ul.list li a {
            text-decoration: none;
            color : #6f6f6f;
        }

        ul.list li a:hover {
            color : #343434;
        }

        #goMain {
            display: block;
            margin: 12px auto 12px;
            width: 68px;
            height: 22px;
            background: rgb(64,64,64);
            border : 1px solid #fff;
            font-size: 12px;
            color : #fff;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        
        @keyframes main_shake{
            10%, 90%{transform:translate3d(0, -1px, 0);}
            30%, 70%{transform:translate3d(0, 2px, 0);}
            50%{transform:translate3d(0, -3px, 0);}
        }
        
        #goMain:hover {
            background-color : #0065e3;
            border-color : #0061db;
            animation:main_shake 0.5s;
        }
    </style>
</head>
<body>
    <div id="cover_1"></div>
    <div class="bg" id="bg1"></div>
    <div class="bg" id="bg2"></div>
    <div class="bg" id="bg3"></div>
    <div class="bg" id="bg4"></div>
    <div class="bg" id="bg5"></div>
    <div id="cover"></div>
    <div class="wrapper">
        <div class="login_wrapper">
            <div class="login_area">
                <div class="login_header">
                    <div class="login_logo">
                        <img src="../../images/logo-eng.png">
                    </div>
                    <span>
                        <b id="userNameTab">OOO님</b>의 임시비밀번호
                    </span>

                </div>
                <form id="tempPwd_Form" method="POST">
                    <div class="confirmIdDiv">
                    <!-- 제출하고 action 연결 : 임시비밀번호로 정보 수정 -->
                        <input type="text" id="tempPwdText" name="tempPwd" readonly>
                    </div>
                    <button type="button" class="login_ok" onclick="onSubmit();"><sup>* </sup>임시비밀번호로 변경</button>
                </form>
                <ul class="list">
                    <li>
                        <a href="<%= request.getContextPath() %>/views/member/joinMember.jsp">회원가입</a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/views/member/idSearch.jsp">아이디 찾기</a>
                    </li>
                    <li>
                        <a href="<%= request.getContextPath() %>/views/member/pwdSearch.jsp">비밀번호 찾기</a>
                    </li>
                </ul>
                <span></span>
                <div class="returnMain">
                    <button type="button" id="goMain" onclick="history.back();">메인으로</button>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <p>
            © 2020 MOVIEJAVA | 요금제 및 소개 : NETFLIX(넷플릭스) |  왓챠플레이<br>
            Data & Content Image Based On Netflix.inc , Watcha.inc, TVNNG<br>
            <br><br>
            Copyright© 2020, Moviejava , All Rights Reserved.
        </p>
    </div>
    <script>
        var slides = document.getElementsByClassName("bg");
        var totalSlides = slides.length;
        var slideWidth = slides[0].clientWidth;
        var bgIndex = 0;

        function changeBg() {
            for(var i = 0; i < slides.length; i++) {
                // slides[i].style.visibility = 'hidden';
                slides[i].style.width = '0';
            }
            // slides[bgIndex].style.visibility = "visible";
            slides[bgIndex].style.width = '100%';
            bgIndex++;
            if(bgIndex >= totalSlides) {
                bgIndex = 0;
            }
        }
        setInterval(changeBg, 2500);

        $(document).ready(function() {
            var arr = "1,2,3,4,5,6,7,8,9,0,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z".split(",");
            var tempPwd = "";

            for(var i = 0; i < 8; i++) {
                tempPwd += arr[Math.floor(Math.random() * arr.length)];
            }

            $("#tempPwdText").attr('value',tempPwd);
        });

        function onSubmit() {
            $("#tempPwd_Form").submit();
            alert("로그인 후 마이페이지에서 비밀번호를 변경해주세요.")
            location.href = "<%= request.getContextPath() %>/views/member/loginView.jsp";
        }
    </script>
</body>
</html>