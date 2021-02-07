<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="member.model.vo.Member, java.util.ArrayList, java.net.URLEncoder, movie.model.dao.MovieDAO, movie.model.vo.MovieVO"%>
<%
	request.setCharacterEncoding("UTF-8"); //검색결과 한글일 때
	String result = request.getParameter("result");
	String search = request.getParameter("search");
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<MovieVO> list = (ArrayList<MovieVO>)request.getAttribute("list");
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화 검색 결과</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
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
    float: left;
    margin-top: 300px;
    padding: 20px;
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
				<a href="<%= request.getContextPath() %>/home.jsp"><img class="logo"
					src="/movieJava/images/logo.png"></a>
			</div>
			<div class="header" id="header2">

				<!----- 영화 검색 ----->
				<form id="search-form" action="<%=request.getContextPath()%>/movie/search" method="get">
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
						<input type="text" id="search-input" name="search"
							placeholder="보고싶은 영화를 검색해보세요."> 
							<%-- <%=request.getParameter("search")%> --%>
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
					<div id="searchDiv">
						<a
							href="<%= request.getContextPath() %>/views/member/idSearch.jsp"><span>아이디
								찾기</span></a> <a
							href="<%= request.getContextPath() %>/views/member/pwdSearch.jsp"><span>비밀번호
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

<head>
<style>
h1.sub{
color: #cecece;
}
.sub {
	text-align: center;
	font: bold 15px Arial;
	padding: 10px;
	border-bottom: 2px solid rgb(76 76 76);
	width: 1230px;
	margin: 0 auto 25px;
}

/* .toggles{ 
  width: 800px;
  margin: auto;
  display: block;
  clear: both;
  overflow: hidden;
} */

b {
    font-weight: normal;
}

option {
	color: rgb(0, 0, 0);
}

#filter option[value="all"] {
	color: rgb(165, 165, 165);
}
#filter{
margin-left: 77px;
}

#filter2 {
    margin-left: 855px;
}

div.posts {
margin-left : 90px;
}

[id^=filter] {
    border: 0px solid;
    border-radius: 9px;
    display: block;
    float: left;
    padding: 10px;
    font-size: 15px;
    margin: -9px 0px 4px;
}
/* 
#wwrapper{
    width: 1200px;
} */
.posts tr>td {
	/* font: 16px/250px Arial; */
	width: 245px;
	height: 250px;
	float: left;
	margin: 10px;
	display: block;
	text-align: center;
	/* background: black; */
	color: #fff;
}
</style>
</head>
<body>
	<script>

  <%--   $(function() {			
		$('#search-input').add('#filter').add('#filter2').on('keyup change', function() {
			$('.posts').hide(500);
		
			var search = <%=request.getParameter("search") %>;
			/*  console.log('#search-input.val()'); */
			var select = $('#filter').val();
		    var select2 = $('#filter2').val();
			/* console.log('#filter.val()');
			console.log('#filter2.val()'); */
			select = select == "all" ? "item" : select;
		    select2 = select2 == "all" ? "item" : select2;
			search = search == "" ? "item" : search;
				$('.item').each(function() {
				var $this = $(this)
				if ($this.is('[class*=' + <%=%> + ']') && $this.is('[class*=' + select + ']') && $this.is('[class*=' + select2 + ']') {
					$this.show(500);
				}}
				)}
				)}); --%>

</script>
</body>
<div id="content">
	<div class="content" id="content1">
		<h1 class="sub">
			<br>"<%=request.getParameter("search")%>" 영화 검색 결과입니다.
		</h1>
		
		
		<body>
		</body>
		<div class="toggles">
		<form id="filtering" action="<%=request.getContextPath()%>/movie/search">
		<input type="hidden" name="search" value= "<%=request.getParameter("search")%>">
			<select id="filter" name="genre">
				<option value="all">장르선택</option>
				<option value="드라마">드라마</option>
				<option value="액션">액션</option>
				<option value="멜로">멜로</option>
				<option value="액션">로맨스</option>
				<option value="코미디">코미디</option>
				<option value="스릴러">스릴러</option>
				<option value="범죄">범죄</option>
				<option value="전쟁">전쟁</option>
				<option value="판타지">판타지</option>
				<option value="어드벤처">어드벤처</option>
				<option value="미스터리">미스터리</option>
				<option value="SF">SF</option>
				<option value="애니메이션">애니메이션</option>
				<option value="모험">모험</option>
				<option value="뮤지컬">뮤지컬</option>
			</select>
			 <select id="filter2" name="sort">
				<option value="all">정렬</option>
				<option value="평점">평점순</option>
				<option value="최신">최신개봉순</option>
			</select>
			</form>
		</div>
		<script>
		$(function(){
			$("#filter").change(function(){
				$("#filtering").submit();
			});
			$("#filter2").change(function(){
				$("#filtering").submit();
			})
		})
		
		</script>

		<div class="posts">
			<table width="1200">
				<!--전체 영화  -->
				<%
					//4개씩 보여주고 다시 실행할 수 있도록 하는 변수 선언
					int j = 0;
					for (int i = 0; i < list.size(); i++) {
						MovieVO Movie = list.get(i);
						//4번마다 0이 돌아온다는 뜻. 즉 4번에 한번 실행하는 구문
						if (j % 4 == 0) {}
				%>
					<td width="333" align="center">
						<a
						href="detail?mCode=<%= Movie.getM_code() %>"> <img
							alt="" src="<%= Movie.getM_image()%>" width="150" height="200">
						</a>
							<p>
							<font size="3" color="white"><b><%=Movie.getM_title()%></b>
							</font>
					</td>

					<%
						j = j + 1; //j값을 증가하여 하나의 행에 총 4개의 영화 불러오기
						}
					%>
				
			</table>

		</div>
	</div>
</div>
</div>

</div>

<div id="footer">
	<p>
		<br> © 2021 MOVIEJAVA | 요금제 및 소개 : NETFLIX(넷플릭스) | 왓챠플레이<br>
		Data &amp; Content Image Based On Netflix.inc , Watcha.inc, TVNNG<br>
		<br> <br> Copyright© 2021, MOVIEJAVA , All Rights Reserved.
	</p>
</div>
</div>
</body>

</body>
</html>