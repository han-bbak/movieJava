<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰페이지</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
#menu-icon {
	color: #ffffff;
	padding: 30px 0;
	font-size: 4em;
}
</style>
<style>
.logo {
	position: relative;
	margin: 20px 50px;
	max-width: 130%;
}

body {
	background: #363636;
}

/*
 		div {
			border: 1px solid white;
			box-sizing: border-box;
		} 
*/
p {
	color: white;
	text-align: center;
}

#wrapper {
	width: 1190px;
	height: 1400px;
	margin: auto;
}

#header {
	width: 100%;
	height: 10%;
}

#content2 {
	padding-top: 20px;
	width: 100%;
	height: 80%;
}

#footer {
	background-color: rgb(24, 24, 24);
	width: 100%;
	height: 10%;
}

.header {
	float: left;
}

#header-menu {
	width: 5%;
	height: 100%;
	position: relative;
}

#header1 {
	width: 15%;
	height: 100%;
}

#header2 {
	width: 55%;
	height: 100%;
	position: relative;
}

#header2>#search-form {
	width: 70%;
	height: 40%;
	top: 0;
	bottom: 0;
	left: 140px;
	right: 0;
	position: absolute;
	margin: auto;
}

#search-text-area {
	height: 100%;
	width: 85%;
	float: left;
}

#search-btn-area {
	height: 100%;
	width: 15%;
	float: left;
}

#search-input {
	width: 100%;
	height: 100%;
	box-sizing: border-box;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
}

#search-btn {
	width: 100%;
	height: 100%;
	box-sizing: border-box;
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
}

#header3 {
	width: 25%;
	height: 100%;
	position: relative;
}

#header3 a {
	text-decoration: none;
	font-size: 18px;
	color: #949494;
	font-weight: bold;
	float: left;
}

#logform {
	width: 60%;
	height: 20%;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	position: absolute;
}

#loginform {
	height: 100%;
	width: 50%;
	float: left;
}

#joinform {
	height: 100%;
	width: 50%;
	float: left;
}

#header3 a:hover {
	color: #f1f1f1;
}

#content1 {
	width: 100%;
	height: 35%;
}

#content2 {
	letter-spacing: 0.2ch;
	font-weight: bold;
	font-size: x-large;
	width: 100%;
	height: 32.5%;
}

#content3 {
	letter-spacing: 0.2ch;
	font-weight: bold;
	font-size: x-large;
	width: 100%;
	height: 32.5%;
}

html.open {
	overflow: hidden;
}

.btn {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0px;
	top: 0px;
	z-index: 1;
	background-size: 50%;
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
}

.close {
	width: 50px;
	height: 50px;
	position: absolute;
	right: 0px;
	top: 0px;
	background-size: 50%;
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
}

#menu a {
	padding: 10px 40px 10px 20px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	font-weight: bold;
	float: left;
}

#menu a:hover {
	color: #f1f1f1;
}

#menu {
	width: 250px;
	height: 100%;
	position: fixed;
	top: 0px;
	left: -252px;
	z-index: 10;
	background-color: black;
	text-align: center;
	transition: All 0.2s ease;
	-webkit-transition: All 0.2s ease;
	-moz-transition: All 0.2s ease;
	-o-transition: All 0.2s ease;
}

#menu.open {
	left: 0px;
}

.page_cover.open {
	display: block;
}

.page_cover {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	left: 0px;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 4;
	display: none;
}

    .right-align {
      text-align: right;
    }
    
    
    @media only screen and (min-width: 0) {
      html {
        font-size: 14px;
      }
    }
    
    @media only screen and (min-width: 992px) {
      html {
        font-size: 14.5px;
      }
    }
    
    
    h1, h2, h3, h4, h5, h6 {
      font-weight: 400;
      line-height: 1.3;
    }
    
    h3 {
      font-size: 2.92rem;
    }
    
    
    .mslider {
      position: relative;
      height: 400px;
      width: 100%;
    }
    
    .mslider.fullscreen {
      height: 100%;
      width: 100%;
      position: relative;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
    }
    

    
    .mslider .slidess {
      background-color: #9e9e9e;
      margin: 0;
      height: 400px;
    }
    
    .mslider .slidess li {
      opacity: 0;
      position: absolute;
      top: 0;
      left: 0;
      z-index: 1;
      width: 100%;
      height: inherit;
      overflow: hidden;
    }
    
    .mslider .slidess li img {
      height: 100%;
      width: 100%;
      background-size: cover;
      background-position: relative;
    }
    
    .mslider .slidess li .caption {
      color: #fff;
      position: absolute;
      top: 15%;
      left: 15%;
      width: 70%;
      opacity: 0;
    }


     /* 바로가기 버튼 */
     .linkbtn{
	width: 157px;
	height: 44px;
	border-radius: 5px;
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	line-height: 20px;
	color: #FFFFFF;
	outline: none;
	margin: 10px;
  transition: all .2s ease-in-out;
  cursor: pointer;
}
	/* Outline Button */
	.btn-outline{
		border: 2px solid #FFFFFF;
		background: transparent;
	}
  .btn-outline:hover,
	.btn-outline-hover{
		background-color: #FFFFFF;
		color: #181C25;
	}
</style>
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div class="header" id="header-menu">
				<div class="btn">
					<link
						href="https://fonts.googleapis.com/icon?family=Material+Icons"
						rel="stylesheet">
					<i id="menu-icon" class="material-icons">menu</i>
				</div>
			</div>
			<div class="header" id="header1">
				<img class="logo" src="images/logo.png">
			</div>
			<div class="header" id="header2">
				<form id="search-form">
					<section id="search-btn-area">
						<button type="submit" id="search-btn">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path
									d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                          </svg>
						</button>
					</section>
					<section id="search-text-area">
						<input type="text" id="search-input" name="search-input"
							placeholder="  보고싶은 영화를 검색해보세요.">
					</section>

				</form>
			</div>
			<div class="header" id="header3">

				<form id="logform">
					<section id="loginform">
						<a href="<%=request.getContextPath()%>/views/member/loginView.jsp">로그인</a>
					</section>
					<section id="joinform">
						<a
							href="<%=request.getContextPath()%>/views/member/joinMember.jsp">회원가입</a>
					</section>
				</form>
			</div>
		</div>
		<div onclick="history.back();" class="page_cover"></div>
		<div id="menu" class="">
			<div onclick="history.back();" class="close">
				<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%"
					fill="white" class="bi bi-x-circle" viewBox="0 0 16 16">
                    <path
						d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
                    <path
						d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"></path>
                  </svg>

			</div>
			<br> <br> <br> <br> <a href="#">HOME</a><br>
			<a href="#">마이페이지</a><br> <a href="#">관심 영화</a><br> <a
				href="#">Watcha Party</a><br> <a href="#">Netflix Party</a><br>
			<a href="#">Q&amp;A</a><br> <a href="#">STORE - Goods</a><br>
			<a href="#">STORE - Ticket</a><br>
		</div>

		<div id="content">
			<div class="content" id="content1">
				<body>
					<div class="mslider">
						<ul class="slidess">
							<li><img src="views/movie/image/slide/banner1.jpg">
								<div class="caption right-align">
									<h3 class="push_1">역대 국내 흥행영화</h3>
									<button class="linkbtn btn-outline">바로가기</button>
								</div></li>
							<li><img src="views/movie/image/slide/banner2.jpg">
								<div class="caption right-align">
									<h3 class=push_2>
										나만 넷플릭스 없을땐?<br>파티구하기!
									</h3>
									<button class="linkbtn btn-outline">바로가기</button>
								</div></li>
							<li><img src="views/movie/image/slide/banner3.jpg">
								<div class="caption right-align">
									<h3 class=push_3>
										영화 굿즈<br>온라인 단독 판매
									</h3>
									<button class="linkbtn btn-outline">바로가기</button>
								</div></li>
						</ul>
					</div>
					<script
						src='https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.1/js/materialize.js'></script>

					 <script id="rendered-js">
	                  const mslider = document.querySelector('.mslider');
	                  M.mslider.init(mslider, {
	                    height: 400,
	                    indicators: false,
	                    interval: 5000,
	                    transition: 5000
	                  });
            
              </script>
</body>
</html>