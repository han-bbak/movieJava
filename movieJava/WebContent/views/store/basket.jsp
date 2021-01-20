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
        #bascket_top {
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

        #board_top_title {
            float: left;
            width: 50%;
            height: 100%;
            position: relative;
        }

        .bascketArea {
            padding: 20px;
            width: 1000px;
            height: 740px;
            margin: auto;
            background: gray;

            position: relative;

            font-weight: bold;
        }

        #bascket_list {
            width: 950px;
            text-align: center;

            top: 40px;
            bottom: 0;
            left: 0;
            right: 0;
            position: absolute;
            margin: auto;
            font-size: 20px;
        }

        #bascket_list thead td {
            border-bottom: 2px solid black;
            background-color: rgb(167, 167, 167);
            height: 40px;
        }

        #bascket_list tbody td {
            /* border: 1px yellow solid; */
            border-bottom: 1px solid rgb(37, 37, 37);
            border-left: 1px solid rgb(37, 37, 37);
            border-right: 1px solid rgb(37, 37, 37);

            position: relative;
        }

        input[type=checkbox] {
            zoom: 1.5;
            margin: auto;
        }

        .img {
            margin-right: 80px;
        }

        .store_name {
            top: 45px;
            position: absolute;
            margin: auto;
        }

        .store_price {
            top: 80px;
            position: absolute;
            margin: auto;
        }

        #num1 {
            text-align: center;
        }

        .bascket_list tfoot td {
            /* border-bottom:  1px solid; */
            height: 60px;
        }

        #btn {
            cursor: pointer;
            width: 80px;
            height: 40px;

            background: rgb(62, 103, 184);
            border: rgb(62, 103, 184);
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            color: white;
            margin: 15px 15px 15px 15px;
        }

        #total {
            color: blue;
        }
        
        #bascket_list tfoot td {
            /* border: 1px solid blue; */
            border-bottom: 1px solid;
            height: 50px;
        }

        tfoot tr:nth-child(1) #btn {
            width: 120px;
            margin: auto;
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
                <div class="header" id="logo">
                    <p>로고</p>
                </div>
            </div>
            <div class="header" id="header2">
                <form id="search-form">
                    <section id="search-btn-area">
                        <button type="submit" id="search-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path
                                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
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
                        <a href="#">로그인</a>
                    </section>
                    <section id="joinform">
                        <a href="#">회원가입</a>
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
            <a href="Watch.html">공유 계정</a><br>
            <a href="Q&A.html">Q&A</a><br>
            <a href="goods.html">STORE</a><br>
        </div>

        <div id="content">
            <div id="bascket_top">
                <div id="board_top_title">
                    <h1 id="board_name">장바구니</h1>
                </div>
            </div>
            <div class="bascketArea">
                <table id="bascket_list">
                    <colgroup>
                        <col width="10%" />
                        <col width="60%" />
                        <col width="30%" />
                    </colgroup>
                    <thead>
                        <tr id="first">
                            <td colspan="2">상품 정보</td>
                            <td>옵션</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                 <input class="check" type="checkbox" checked>
                            </td>
                            <td> 
                                <image class="img" src="" width="150px" height="150px" ></image>
                                <span class="store_name">상품 이름1</span>
                                <span class="store_price">30,000원</span>       
                            </td>
                            <td>
                                상품 주문 수량
                                <input type='button' value='-' onClick='fncAdd("num1",-1);'>
                                <input type='text' id='num1' name='num1' value='0' minval='0' size='1'  readonly>
                                <input type='button' value='+' onClick='fncAdd("num1",1);'>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <input class="check" type="checkbox" checked>
                            </td>
                            <td> 
                                <image class="img" src="" width="150px" height="150px"></image>
                                <span class="store_name">상품 이름2</span>
                                <span class="store_price">40,000원</span>         
                            </td>
                            <td>
                                상품 주문 수량
                                <input type='button' value='-' onClick='fncAdd("num1",-1);'>
                                <input type='text' id='num1' name='num1' value='0' minval='0' size='1'  readonly>
                                <input type='button' value='+' onClick='fncAdd("num1",1);'>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <input class="check" type="checkbox" checked>
                            </td>
                            <td> 
                                <image class="img" src="" width="150px" height="150px" ></image>
                                <span class="store_name">상품 이름3</span>
                                <span class="store_price">50,000원</span>
                            </td>
                            <td>
                                상품 주문 수량
                                <input type='button' value='-' onClick='fncAdd("num1",-1);'>
                                <input type='text' id='num1' name='num1' value='0' minval='0' size='1'  readonly>
                                <input type='button' value='+' onClick='fncAdd("num1",1);'>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                            <tr>
                                <td>
                                    <input class="check" type="checkbox">
                                </td>
                                <td colspan="2" align="left">
                                    <button type="button" id="btn">선택 상품 삭제</button>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="right">
                                    총 상품 금액
                                    <span id="total">120,000원</span>
                                    <button type="button" id="btn">결제하기</button>
                                </td>
                            </tr>
                        </tfoot>
                </table>
            </div>
        </div>
    </div>
</body>
<script>
    function fncAdd(id, add) {
        var tgt = document.getElementById(id);
        var num = Number(tgt.value) + add;

        if(num > 0) {
            tgt.value = num;
        }
        
    }
</script>
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