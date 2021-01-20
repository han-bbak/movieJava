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

        #board_top_title {
            float: left;
            width: 50%;
            height: 100%;
            position: relative;
        }

        .tableArea {
            padding: 20px;
            width: 850px;
            height: 900px;
            margin: auto;
            background: gray;
        }
   
        #contentTable {
            width: 95%;
            height: 50%;
            border:5px solid white;
            text-align: center;
            margin:auto; 
        }

        #contentTop {
            height: 50px;
        }

        #contentTable #content {
            text-align:left;
            color: black;
            border-top: 1px solid;
            margin: auto;
            padding-top: 10px;
        }

        #contentTable td {
            padding: 0;
        }
   
        #contentTable td:nth-child(1) {
          width : 50px;
          color: white;
        }
   
        #contentTable td:nth-child(2) {
          width : 500px;
        }
   
        #contentTable td:nth-child(3) {
            width: 80px;
            color: white;
        }
   
        #contentTable td:nth-child(4) {
          width : 110px;
        }
   
        #contentTable td:nth-child(5) {
          width : 70px;
          color: white;
        }
   
        #contentTable td:nth-child(6) {
          width : 10px;
        }

        #contentTable td:nth-child(7) {
          width : 70px;
          color: white;
        }

        #contentTable td:nth-child(8) {
          width : 110px;
        }
    
        .btnArea {
            text-align: right;
            padding-top: 10px;
            padding-right: 15px;
        }

        #title {
            margin-top: 0;
        }

        #btn {
            cursor: pointer;
            width: 80px;
            height: 30px;

            background: rgb(62, 103, 184);
            border: rgb(62, 103, 184);
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            color: white;
            margin-left: 5px;
        }

        .input_area {
            /* border: solid 1px red; */
            padding: 10px 10px 10px 10px;
            background: white;
        }
    
        .input_area input {
            width: 70%;
            border: 0;
        }

        .replyArea {
            margin: auto;
            height: 40%;
            text-align: center;
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
                <div id="board_top_title"><h1 id="board_name">Q&A</h1></div>
            </div>
            <div class="tableArea"> 
                <table id="contentTable">
                    <tr id="contentTop">
                        <td>제목</td>
                        <td>이것은 게시글의 제목입니다</td>
                        <td>작성자</td>
                        <td>작성자이름</td>
                        <td>조회수</td>
                        <td>0</td>
                        <td>작성일</td>
                        <td>2021-01-07</td>
                    </tr>
                    <tr>
                        <td colspan ="8">
                            <p id="content">게시글 내용 1!!!@!!!!!</p>
                        </td>
                    </tr>
                </table>
                <div class="btnArea">
                    <button type="button" id="btn" onclick="history.back();">목록</button>
                    <button type="button" id="btn">수정</button>
                    <button type="button" id="btn">삭제</button>
                </div>
                <hr>
                <div class="replyArea">
                    <br>
                    <span class="input_area">
                        <input type="text" name="input" placeholder="댓글을 작성해 보세요">
                    </span>
                    <button type="button" id="btn">등록하기</button>
                    <table id="replyTable">
                        <tr>
                            <td>댓글 table</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
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