<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link href="../../resources/css/form.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        #board_top {
            width: 100%;
            height: 4%;
            /* border: 1px solid red; */
        }
        #board_name {
            color: whitesmoke;
            font-size: xx-large;
            font-weight: 500;

            top: 0;
            bottom: 0;
            left: 0;
            position: absolute;
            margin: auto;
        }
        
        #logo {
            top: 0;
            bottom: 0;
            right: 0;
            position: absolute;
            margin: auto;
        }

        #board_top_title {
            float: left;
            width: 50%;
            height: 100%;
            position: relative;
        }

        #content a {
            text-decoration: none;
            color: #a49e9e;
        }

        #content a:hover {
            text-decoration: none;
            color: #cecece;
        }

        #goods {
            color: white;
        }

        .paymentArea {
            padding: 20px;
            width: 1000px;
            height: 490px;
            margin: auto;
            background: gray;
        }

        .btnArea {
            width: 850px;
            height: 100px;
            margin: auto;

            text-align: center;
        }

        .btn {
            cursor: pointer;
            width: 90px;
            height: 40px;

            background: rgb(62, 103, 184);
            border: rgb(62, 103, 184);
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            color: white;
            margin-left: 5px;
            /* margin-top: 20px; */
        }

        #payTable {
            width: 95%;
            height: 450px;
            border:5px solid white;
            text-align: center;
            margin:auto; 
            font-size: 20px;
            font-weight: bold;
        }

        #num1 {
            text-align: center;
        }

        #total {
            color: blue;
        }

        p {
            color: black;
            font-size: 25px;
        }

        #goList {
            margin-top: 20px;
        }

    </style>
</head>

<body>
    <div id="wrapper">
        <div id="header">
            <div class="header" id="header1">
                <div class="header" id="header-menu">
                    <section class="menuBtn">
                     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                     <i id="menu-icon" class="material-icons">menu</i>
                    </section>
                </div>
                <div class="header">
                    <img id="logo" src="../../images/logo_167.png">
                </div> 
            </div>
            <div class="header" id="header2">
                <form id="search-form">
                    <section id="search-btn-area">
                        <button type="submit" id="search-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                          </svg></button>
                    </section>
                    <section id="search-text-area">
                        <input type="text" id="search-input" name="search-input" placeholder="보고 싶은 영화를 검색해 보세요.">
                    </section>
                    
                </form>
            </div>
            <div class="header" id="header3">

                <form id="logform">
                    <section id="loginform">
                        <a href="<%= request.getContextPath() %>/views/member/loginView.jsp">로그인</a>
                    </section>
                    <section id="joinform">
                        <a href="<%= request.getContextPath() %>/views/member/joinMember.jsp">회원가입</a>
                    </section>
                </form>
            </div>
        </div>
        <div onclick="history.back();" class="page_cover"></div>
        <div id="menu">
            <div onclick="history.back();" class="close">
                <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="#a49e9e" class="bi bi-x-circle" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                  </svg>
            </div>
            <br><br><br><br>
            <a href="메인페이지.html">Home</a>
            <a href="마이페이지.html">마이페이지</a><br>
            <a href="관심영화.html">관심 영화</a><br>
            <a href="<%= request.getContextPath() %>/views/board/watcha.jsp">공유 계정</a>
            <a href="<%= request.getContextPath() %>/views/board/QA.jsp">Q&A</a>
            <a href="<%= request.getContextPath() %>/views/store/store_goods.jsp">STORE</a>
        </div>

        <div id="content">
            <div id="board_top">
                <div id="board_top_title">
                    <h1 id="board_name">
                         <a href="<%= request.getContextPath() %>/views/store/store_goods.jsp"><span id="goods">Goods</span></a>
                        /
                        <a href="<%= request.getContextPath() %>/views/store/store_ticket.jsp"><span id="ticket">Ticket</span></a>
                        <br>
                    </h1>
                </div>
            </div>
            <div class="paymentArea">
                <table id="payTable">
                    <colgroup>
                        <col width="50%" />
                    </colgroup>
                    <tr>
                        <td rowspan="4">
                            <image class="img" src="" width="400px" height="400px" ></image>
                        </td>
                        <td height="35%">
                            <p id="stTitle">상품 이름1</p>
                            <p id="stPrice"> 30,000원</p>
                        </td>
                    </tr>
                    <tr>
                        <td height="30%">
                            <input type='button' value='-' onClick='fncAdd("num1",-1);'>
                            <input type='text' id='num1' name='num1' value='0' minval='0' size='1'  readonly>
                            <input type='button' value='+' onClick='fncAdd("num1",1);'>
                            <br>
                            <br>
                            택배 배송 2,500원
                        </td>
                    </tr>
                    <tr>
                        <td height="20%">
                            총 상품 금액
                            <span id="total">30,000원</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="15%">
                            <button type="button" class="btn">구매하기</button>
                            <button type="button" class="btn">장바구니</button>
                        </td>
                    </tr>
                </table>
                
            </div>
            <div class="btnArea">
                <button type="button" class="btn" id="goList" onclick="history.back();">목록으로</button>
            </div>
        </div>
    </div>
</body>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>
       $(".menuBtn").click(function () { 
           $("#menu,.page_cover,html").addClass("open"); 
            window.location.hash = "#open"; 
        }); 

        window.onhashchange = function () { 
            if(location.hash != "#open") {
                $("#menu,.page_cover,html").removeClass("open");  
            } 
        };
    </script>
</html>