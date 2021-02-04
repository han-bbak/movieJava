<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member, movie.model.vo.*, interest.model.vo.*" %>
<%
	request.setCharacterEncoding("UTF-8"); //검색결과 한글일 때
	String result = request.getParameter("result");
	
	Member loginUser = (Member)session.getAttribute("loginUser");
	MovieVO movie = (MovieVO)request.getAttribute("movie");
	Interest interest = (Interest)request.getAttribute("interest");
	String title = "";
	String title2 = "";
	
	String mcode = "";
	if(interest != null){
		mcode = interest.getmCode();
	}
	if(movie != null){
		
		title = movie.getM_title();
		title2 = movie.getM_genre();
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관심영상</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link href="<%= request.getContextPath() %>/resources/css/form.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style> 

         #content {
            
            padding: 150px;
            text-align: center;
        }
        #text1{
            font-size: 30px;
            color : black;
            font-weight: bold;
        }
.card{
  width: 360px;
  background: #f1f1f1;
  margin: 40px;
  float: left;
  
  
}

#image-container{
  width: 350px;
  height: 250px;
}
.nav{
  text-align: center;
}
.nav img{
  width: 80px;
  height: 50px;
  border: 1px solid #ddd;
  margin: 8px 2px;
  cursor: pointer;
  transition: 0.3s;
}

.price{
  position: absolute;
  top: 20px;
  right: 20px;
  color: red;
  font-size: 24px;
}
.product-info{
  padding: 24px;
}
.name{
  text-transform: uppercase;
  font-size: 24px;
  color: #333;
}
.dis{
  font-size: 16px;
  opacity: 0.7;
}
.btn1{
  display: block;
  background: #333;
  text-align: center;
  color: #fff;
  padding: 10px;
  margin-top: 10px;
  transition: 0.3s;
}
.btn:hover{
  background: #333;
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
	padding : 10px;
	text-align: center;
}

#loginArea {
	width : 100%;
	padding : 20px;
	margin: auto;
	text-align : center;
}

#loginform, #joinform {
	margin: 10px 5px 10px;
	width: 40%;
	float: left;
}

#searchDiv {
	width : 100%;
	text-align: left;
}

#searchDiv span {
	color : #fff;
	font-size : 12px;
	margin : 0px 16px;
}

.loginJoin {
	width: 100%;
	height: 40px;
	background: #1c81ff;
	border: 1px solid #1b7df8;
	font-size: 14px;
	color: #fff;
	cursor: pointer;
	transition: background-color 0.3s, border-color 0.3s;
}

.loginJoin:hover, #userInfoBtn button:hover {
	background-color: #0065e3;
	border-color: #0061db;
}

#userInfo {
	color : white;
	padding-top : 35px;
	padding-bottom : 5px;
}

#userInfo span {
	font-weight : lighter;
}

#userInfo b {
	font-weight : bold;
}

#userInfoBtn button {
	margin: 5px;
	background: #1c81ff;
	color: #fff;
	border: 1px solid #1b7df8;
	cursor: pointer;
	outline : none;
	
	transition: background-color 0.3s, border-color 0.3s;
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
.linkbtn {
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
.btn-outline {
	border: 2px solid #FFFFFF;
	background: transparent;
}

.btn-outline:hover, .btn-outline-hover {
	background-color: #FFFFFF;
	color: #181C25;
}


#menu-icon {
	color: #ffffff;
	padding: 30px 0;
	font-size: 4em;
}
.logo {
	position: relative;
	margin: 20px 50px;
	max-width: 130%;
}
    </style>
    
</head>

<body>
    <div id="wrapper">
		<div id="header">
			<div class="header" id="header-menu">
				<div class="btn">
					<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
					<i id="menu-icon" class="material-icons">menu</i>
				</div>
			</div>
			<div class="header" id="header1">
				<a href="home.jsp"><img class="logo" src="<%= request.getContextPath() %>/images/logo.png"></a>
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
			<% if(loginUser == null) { %>
				<div id="loginArea">
					<div id="loginform">
						<button type="button" class="loginJoin" id="loginBtn" onclick="location.href='<%=request.getContextPath()%>/views/member/loginView.jsp'">로그인</button>
					</div>
					<div id="joinform">
						<button type="button" class="loginJoin" id="joinBtn" onclick="location.href='<%=request.getContextPath()%>/views/member/joinMember.jsp'">회원가입</button>
					</div>
					<br clear="both">
					<div id="searchDiv">
						<a href="<%= request.getContextPath() %>/views/member/idSearch.jsp"><span>아이디 찾기</span></a>
						<a href="<%= request.getContextPath() %>/views/member/pwdSearch.jsp"><span>비밀번호 찾기</span></a>
					</div>
				</div>
			<% } else { %>
				<div id="userInfoArea">
					<div id="userInfo">
						<span><b><%= loginUser.getMemName() %></b>님 환영합니다!</span>
					</div>
					<div id="userInfoBtn">
						<button id="logout">로그아웃</button>
						<% if(loginUser.getGrade().equals("admin")) { %>
							<button id="managerPage">관리자 메뉴</button>
							<script>
								var managerPage = document.getElementById("managerPage");
								managerPage.addEventListener('click', function(){
									location.href='<%= request.getContextPath() %>/views/common/manager_main.jsp';
								});
							</script>
						<% } %>
					</div>
				</div>
				<script>
					var logout = document.getElementById("logout");
					logout.addEventListener('click', function(){
						location.href='<%= request.getContextPath() %>/member/logout';
					});
				</script>
			<% } %>
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
			<br> <br> <br> <br> 
			<a href="<%= request.getContextPath() %>home.jsp">HOME</a><br>
			<a href="<%= request.getContextPath() %>/views/mypage/mypagemain.jsp">마이페이지</a><br> 
			<a href="<%= request.getContextPath() %>/views/mypage/mypageInterest.jsp">관심 영화</a><br> 
			<a id="netflix">공유 계정</a><br>
			<!--  <a href="<%= request.getContextPath() %>/views/board/watcha.jsp">공유 계정</a>-->
            <a href="<%= request.getContextPath() %>/views/board/QA.jsp">Q&A</a>
            <a href="<%= request.getContextPath() %>/views/store/store_goods.jsp">STORE</a>
		</div>
        <div id="content">
            <div class="card" padding="50px">
                <div class="top-section">
                  <!-- <img id="image-container" src="1.png" alt=""> -->
                  
                  
                </div>
              
                <div class="product-info">
                  <div class="name"><%= title %></div>
                  <div class="dis"><%= title2 %></div>
                  <a class="btn1" href="http://localhost:8800/movieJava/views/movie.moviedetail/Moviedetails.jsp">보러 가기</a>
                </div>
              
              </div>

              <div class="card">
                <div class="top-section">
                 <!--   <img id="image-container" src="1.png" alt=""> -->
                  
        
                </div>
              
                <div class="product-info">
                  <div class="name"><%= mcode %></div>
                  <div class="dis">영화 설명</div>
                  <a class="btn1" href="#">보러 가기</a>
                </div>
              
              </div>

              
                <script type="text/javascript">
                  var container = document.getElementById("image-container");
                  function change_img(image) {
                    container.src = image.src;
                  }
                </script>



            </div>
</body>
<script>
$(".btn").click(function () { 
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