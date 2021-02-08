<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	request.setCharacterEncoding("UTF-8"); //검색결과 한글일 때
	String result = request.getParameter("result");
	
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script> 
<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
</style>


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

/* // div선
 		div {
			border: 1px solid white;
			box-sizing: border-box;
		} 
*/
p {
	color: white;
	text-align: center;
}

a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
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
	margin-top: 70px;
	padding:20px;
	background-color: rgb(24, 24, 24);
	width: 100%;
	height: 150px;
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
	width: 53%;
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
	padding-left: 15px;
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
	padding: 10px;
	text-align: center;
}

#loginArea {
	width: 100%;
	padding: 20px;
	margin: auto;
	text-align: center;
}

#loginform, #joinform {
	margin: 10px 5px 10px;
	width: 40%;
	float: left;
}

#searchDiv {
	width: 100%;
	text-align: left;
}

#searchDiv a {
	text-decoration : none;
}

#searchDiv span {
	color: #fff;
	font-size: 12px;
	margin: 0px 16px;
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
	color: white;
	padding-top: 35px;
	padding-bottom: 5px;
}

#userInfo span {
	font-weight: lighter;
}

#userInfo b {
	font-weight: bold;
}

#userInfoBtn button {
	margin: 5px;
	background: #1c81ff;
	color: #fff;
	border: 1px solid #1b7df8;
	cursor: pointer;
	outline: none;
	transition: background-color 0.3s, border-color 0.3s;
}

#content1 {
	width: 100%;
	height: 35%;
}

#content2 {
	background-color: black;
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
</style>
<style>
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

.mslider.fullscreen ul.slides {
	height: 100%;
}

.mslider.fullscreen ul.indicators {
	z-index: 2;
	bottom: 30px;
}

.mslider .slides {
	background-color: #9e9e9e;
	margin: 0;
	height: 400px;
}

.mslider .slides li {
	opacity: 0;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1;
	width: 100%;
	height: inherit;
	overflow: hidden;
}

.mslider .slides li img {
	height: 100%;
	width: 100%;
	background-size: cover;
	background-position: relative;
}

.mslider .slides li .caption {
	color: #fff;
	position: absolute;
	top: 22%;
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

.font1{
		font-size : 30px
      	font-family: 'Noto Sans KR', sans-serif;
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
				<a href="home.jsp"><img class="logo" src="images/logo.png"></a>
			</div>
			<div class="header" id="header2">
			
			<!----- 영화 검색 ----->
				<form id="search-form" action="<%= request.getContextPath() %>/movie/search" method="get">
					<section id="search-btn-area">
						<button type="submit" id="search-btn">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                          </svg>
						</button>
					</section>
					<section id="search-text-area">
						<input type="text" id="search-input" name="search"
							placeholder="보고싶은 영화를 검색해보세요.">
					</section>
				</form>
			<!-- ------------- -->
			
			</div>
			<div class="header" id="header3">
				<% if(loginUser == null) { %>
				<div id="loginArea">
					<div id="loginform">
						<button type="button" class="loginJoin" id="loginBtn"
							onclick="location.href='<%=request.getContextPath()%>/views/member/loginView.jsp'">로그인</button>
					</div>
					<div id="joinform">
						<button type="button" class="loginJoin" id="joinBtn"
							onclick="location.href='<%=request.getContextPath()%>/views/member/joinMember.jsp'">회원가입</button>
					</div>
					<br clear="both">
					<div id="searchDiv" class="font1">
						<a 
							href="<%= request.getContextPath() %>/views/member/idSearch.jsp"><span>&nbsp;&nbsp;&nbsp;&nbsp;아이디
								찾기</span></a> <a
							href="<%= request.getContextPath() %>/views/member/pwdSearch.jsp"><span>&emsp;&nbsp;&nbsp;비밀번호
								찾기</span></a>
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
</body>
</div>
<br>
<br>
<br>
<br>
<a href="<%= request.getContextPath() %>/home.jsp">HOME</a>
<br>
<a href="<%= request.getContextPath() %>/views/mypage/mypagemain.jsp">마이페이지</a>
<br>
<a
	href="<%= request.getContextPath() %>/views/mypage/mypageInterest.jsp">관심
	영화</a>
<br>
<a id="netflix">공유 계정</a>
<br>
<a id="qa">Q&A</a>
<br>
<a id="store">STORE</a>
</div>
<script>
//넷플릭스 버튼
const netflix = document.getElementById('netflix');
netflix.addEventListener('click', function(){
	location.href='<%= request.getContextPath() %>/netflix/list';
});

//Q&A 버튼
const qa = document.getElementById('qa');
qa.addEventListener('click', function(){
	location.href='<%= request.getContextPath() %>/qa/list';
});

//Store 버튼
const store = document.getElementById('store');
store.addEventListener('click', function(){
	location.href='<%= request.getContextPath() %>/store/list';
});
</script>

<div id="content">
	<div class="content" id="content1">
		<body>
			<div class="mslider">
				<ul class="slides">
					<li><img src="views/movie/image/slide/banner1.jpg">
						<div class="caption right-align">
							<h3 class="push_1">역대 국내 흥행영화</h3>
							<button type="button" class="linkbtn btn-outline"
								onclick="location.href='<%=request.getContextPath()%>#">바로가기</button>
						</div></li>
					<li><img src="views/movie/image/slide/banner2.jpg">
						<div class="caption right-align">
							<h3 class=push_2>
								나만 넷플릭스 없을땐?<br>파티구하기!
							</h3>
							<button type="button" class="linkbtn btn-outline"
								onclick="location.href='<%=request.getContextPath()%>/views/board/netflix.jsp'">바로가기</button>
						</div></li>
					<li><img src="views/movie/image/slide/banner3.jpg">
						<div class="caption right-align">
							<h3 class=push_3>
								영화 굿즈<br>온라인 단독 판매
							</h3>
							<button type="button" class="linkbtn btn-outline"
								onclick="location.href='<%=request.getContextPath()%>/store/list'">바로가기</button>
						</div></li>
				</ul>
			</div>
			<script
				src='https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.1/js/materialize.js'></script>

			<script id="rendered-js">
                  const mslider = document.querySelector('.mslider');
                  M.Slider.init(mslider, {
                    height: 400,
                    indicators: false,
                    interval: 5000,
                    transition: 5000
                  });
            
              </script>
		</body>


	</div>
	<class class="released" id="content2">
	<p><br><br>#신작</p>
	<title>movie slide</title>
	<meta charset="UTF-8">
	
	<!--/* 영화 슬라이드 시작*/-->
	<style type="text/css">
.slick-slider {
	position: relative;
	display: block;
	box-sizing: border-box;
}

.slick-list {
	position: relative;
	display: block;
	overflow: hidden;
}

.slick-track:before, .slick-track:after {
	display: table;
	content: '';
}

.slick-slide {
	display: none;
	float: left;
	height: 100%;
	min-height: 1px;
}

.slick-initialized .slick-slide {
	display: block;
}

/* 화살표 */
.slick-prev, .slick-next {
	font-size: 0;
	line-height: 0;
	position: absolute;
	top: 50%;
	display: block;
	width: 20px;
	height: 20px;
	padding: 0;
	-webkit-transform: translate(0, -50%);
	-ms-transform: translate(0, -50%);
	transform: translate(0, -50%);
	cursor: pointer;
	color: transparent;
	border: none;
	background: transparent;
}

.slick-prev:before, .slick-next:before {
	font-family: 'slick';
	font-size: 20px;
	line-height: 1;
	opacity: .75;
	color: white;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.slick-prev {
	left: -35px;
}

.slick-prev:before {
	content: '◀';
}

.slick-next {
	right: -35px;
}

.slick-next:before {
	content: '▶';
}

/* Dots */
.slick-dots {
	position: absolute;
	bottom: -40px;
	display: block;
	width: 100%;
	padding: 0;
	margin: 10;
	list-style: none;
	text-align: center;
	
}

 .slick-dots li {
	position: relative;
	display: inline-block;
	width: 20px;
	height: 20px;
	margin: 0 5px;
	padding: 0;
	cursor: pointer;
} 

.slick-dots li button {
	display: inline-block;
	width: 20px;
	height: 20px;
	padding: 5px;
	cursor: pointer;
	color: transparent;
	border: 0;
	background: transparent;
}

.slick-dots li button:hover:before, .slick-dots li button:focus:before {
	opacity: 1;
}

/* 도트 */
.slick-dots li button:before {
	font-family: 'slick';
	font-size: 15px;
	line-height: 40px;
	position: absolute;
	top: 0;
	left: 0;
	width: 20px;
	height: 20px;
	content: '●';
	text-align: center;
	opacity: .25;
	color: black;
	-webkit-font-smoothing: antialiased;
}

.slick-dots li.slick-active button:before {
	opacity: .75;
	color: white;
}

.slider {
	width: 850px;
	margin: 100px auto;
}

.slick-slide {
	margin: 0px 20px;
}

.slick-slide img {
	width: 100%;
}

.slick-prev:before, .slick-next:before {
	color: white;
}

.center {
	display: flex;
	justify-content: center;
}

.card {
	max-width: 460px;
	margin: 50px auto;
}

.caption {
	font-weight: bold;
	font-size: 15px;
}
</style>
	<body>
		<header>
			<a href="<%=request.getContextPath()%>home.jsp"></a>
		</header>
		<section id="slider-div1" class="center slider">
			<div>
				<a href="<%= request.getContextPath() %>/movie/detail?mCode=1001"> 
				<img src="views/movie/image/released/released1.jpg">
				</a> <span class=center><p class=caption>오늘, 우리2</p></span>
			</div>
			<div>
				<a href="<%= request.getContextPath() %>/movie/detail?mCode=1002"> 
				<img src="views/movie/image/released/released2.jpg">
				</a><span class=center><p class=caption>소울</p></span>
			</div>
			<div>
				<a href="<%= request.getContextPath() %>/movie/detail?mCode=1003"> 
				<img src="views/movie/image/released/released3.jpg">
				</a><span class=center><p class=caption>커넥트</p></span>
			</div>
			<div>
				<a href="<%= request.getContextPath() %>/movie/detail?mCode=1004"> 
				<img src="views/movie/image/released/released4.jpg"></a>
				<span class=center><p class=caption>아이엠히어</p></span>
			</div>
			<div>
				<a href="<%= request.getContextPath() %>/movie/detail?mCode=1005">
				<img src="views/movie/image/released/released5.jpg">
				</a><span class=center><p class=caption>차인표</p></span>
			</div>
			<div>
				<a href="<%= request.getContextPath() %>/movie/detail?mCode=1006"> 
				<img src="views/movie/image/released/released6.jpg">
				</a><span class=center><p class=caption>빛의아버지</p></span>
			</div>
			<div>
				<a href="<%= request.getContextPath() %>/movie/detail?mCode=1007">
				<img src="views/movie/image/released/released7.jpg"></a>
				<span class=center><p class=caption>마이 미씽 발렌타인</p></span>
			</div>
			<div>
				<a href="<%= request.getContextPath() %>/movie/detail?mCode=1008"> 
				<img src="views/movie/image/released/released8.jpg"></a>
				<span class=center><p class=caption>크루아상</p></span>
			</div>
			<div>
				<a href="<%= request.getContextPath() %>/movie/detail?mCode=1009"> 
				<img src="views/movie/image/released/released9.jpg"></a>
				<span class=center><p class=caption>438일</p></span>
			</div>
		</section>
			<p>#개봉예정</p>
		<section id="slider-div2" class="center slider">
		<div>
			<a href="<%= request.getContextPath() %>/movie/detail?mCode=2001">
			<img src="views/movie/image/scheduled/scheduled1.jpg"> 
			<!-- <span class=center> -->
			<p class=caption>킹스맨: 퍼스트 에이전트</p></a>
		</div>
		<div>
			<a href="<%= request.getContextPath() %>/movie/detail?mCode=2002">
			<img src="views/movie/image/scheduled/scheduled2.jpg">
			<p class=caption>모비우스</p></a>
		</div>
		<div>
			<a href="<%= request.getContextPath() %>/movie/detail?mCode=2003">
			<img src="views/movie/image/scheduled/scheduled3.jpg">
			<p class=caption>이 안에 외계인이 있다</p></a>
		</div>
		<div>
			<a href="<%= request.getContextPath() %>/movie/detail?mCode=2004">
			<img src="views/movie/image/scheduled/scheduled4.jpg"> 
			<p class=caption>내겐 너무 어려운 연애</p></a>
		</div>
		<div>
			<a href="<%= request.getContextPath() %>/movie/detail?mCode=2005">
			<img src="views/movie/image/scheduled/scheduled5.jpg">
			<p class=caption>좀비타운</p></a>
		</div>
		</section>
		 <script language="javascript" type="text/javascript" src="views/movie/js/released.js"></script> 
		  <script language="javascript" type="text/javascript" src="views/movie/js/scheduled.js"></script> 
		</class>


<div id="footer">
	<p><br>
		© 2021 MOVIEJAVA | 요금제 및 소개 : NETFLIX(넷플릭스) | 왓챠플레이<br> Data
		&amp; Content Image Based On Netflix.inc , Watcha.inc, TVNNG<br>
		<br> <br> Copyright© 2021, MOVIEJAVA , All Rights Reserved.
	</p>
</div>
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
</body>
</html>