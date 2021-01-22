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

        #content {
            padding: 150px;
            text-align: center;
        }
body{font-family:Open Sans; color:#555555;}
h1{font-size:24px; font-weight:normal; margin:0.4em 0;}

.container { width: 100%; margin: 0 auto;}
.container .row { float: left; clear: both; width: 100%; }
.container .col { float: left; margin: 0 0 1.2em; padding-right: 1.2em; padding-left: 1.2em; }
.container .col.three{ width: 100%; margin-bottom: 30px;}


* {-moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box;}
a{text-decoration:none;}

.btn {font-size: 18px; white-space:nowrap; width:100%; padding:.8em 1.5em; font-family: Open Sans, Helvetica,Arial,sans-serif; line-height:18px;
     display: inline-block;zoom: 1; color: #fff; text-align: center; position:relative; -webkit-transition: border .25s linear,
     color .25s linear, background-color .25s linear; transition: border .25s linear, color .25s linear, background-color .25s linear; }


.btn.btn-dark-blue{background-color: #237fbc; border-color: #237fbc; -webkit-box-shadow: 0 3px 0 #1a5c87; box-shadow: 0 3px 0 #1a5c87;}
.btn.btn-dark-blue:hover{background-color:#166ea8;}
.btn.btn-dark-blue:active{ top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}
	
.btn.btn-rouge{background-color: #c0392b; border-color: #c0392b; -webkit-box-shadow: 0 3px 0 #8f2a1f; box-shadow: 0 3px 0 #8f2a1f;}
.btn.btn-rouge:hover{background-color:#ac3420;}
.btn.btn-rouge:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}
		
.btn.btn-dark{background-color: #2c3d51; border-color: #2c3d51; -webkit-box-shadow: 0 3px 0 #080c0f; box-shadow: 0 3px 0 #080c0f;}
.btn.btn-dark:hover{background-color:#202d3d;}
.btn.btn-dark:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}

	
.btn.btn-sunflower{background-color: #f2c500; border-color: #f2c500; -webkit-box-shadow: 0 3px 0 #b19001; box-shadow: 0 3px 0 #b19001; }
.btn.btn-sunflower:hover{background-color:#e3ba02;}
.btn.btn-sunflower:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}



		

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
            <a href="<%= request.getContextPath() %>/views/mypage/mypagemain.jsp">Home</a>
            <a href="마이페이지.html">마이페이지</a><br>
            <a href="관심영화.html">관심 영화</a><br>
            <a href="<%= request.getContextPath() %>/views/board/watcha.jsp">공유 계정</a>
            <a href="<%= request.getContextPath() %>/views/board/QA.jsp">Q&A</a>
            <a href="<%= request.getContextPath() %>/views/store/store_goods.jsp">STORE</a>
        </div>

        <div id="content">
            <div id="menudiv"></div>
           
        
		<div class="col three">				
			<a href="<%= request.getContextPath() %>/views/mypage/mypageMember.jsp" class="btn btn-sunflower">개인정보수정</a>			
		</div>

		<div class="col three">
			<a href="<%= request.getContextPath() %>/views/mypage/mypageInterest.jsp" class="btn btn-dark-blue">관심영상목록</a>		
		</div>

		<div class="col three">
			<a href="<%= request.getContextPath() %>/views/mypage/mypagePoint.jsp" class="btn btn-rouge">포인트</a>			
		</div>

		<div class="col three">
			<a href="<%= request.getContextPath() %>/views/mypage/mypagePay.jsp" class="btn btn-dark">결제내역</a>		
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