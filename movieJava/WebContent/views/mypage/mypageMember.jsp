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
<title>개인정보수정</title>
<%
	if(request.getAttribute("result") != null){
		if(request.getAttribute("result").equals("success")) {
%>
<script>
	alert("성공적으로 비밀번호를 변경하였습니다.");
	window.close();
</script>
<%      } else { %>
<script>
	alert("비밀번호 변경에 실패하였습니다.");
</script>
<%		}
	}%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<link href="../../resources/css/form.css" rel="stylesheet"
	type="text/css">
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

#content {
	padding: 150px;
	text-align: center;
}

h3 {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
}

.box {
	display: block;
	width: 100%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	background: #fff;
	position: relative;
}

.int {
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
}

input {
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}

.box.int_id {
	padding-right: 110px;
}

.box.int_pass {
	padding-right: 40px;
}

.box.int_pass_check {
	padding-right: 40px;
}

.pswdImg {
	width: 18px;
	height: 20px;
	display: inline-block;
	position: absolute;
	top: 50%;
	right: 16px;
	margin-top: -10px;
	cursor: pointer;
}

#bir_wrap {
	display: table;
	width: 100%;
}

#bir_yy {
	display: table-cell;
	width: 147px;
}

#bir_mm {
	display: table-cell;
	width: 147px;
	vertical-align: middle;
}

#bir_dd {
	display: table-cell;
	width: 147px;
}

#bir_mm, #bir_dd {
	padding-left: 10px;
}

select {
	width: 100%;
	height: 29px;
	font-size: 15px;
	background: #fff
		url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100%
		50% no-repeat;
	background-size: 20px 8px;
	-webkit-appearance: none;
	display: inline-block;
	text-align: start;
	border: none;
	cursor: default;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}

/* 에러메세지 */
.error_next_box {
	margin-top: 9px;
	font-size: 12px;
	color: red;
	display: none;
}

#alertTxt {
	position: absolute;
	top: 19px;
	right: 38px;
	font-size: 12px;
	color: red;
	display: none;
}

/* 버튼 */
.btn_area {
	margin: 30px 0 91px;
}

#updatePwdBtn {
	width: 100%;
	padding: 21px 0 17px;
	border: 0;
	cursor: pointer;
	color: #fff;
	background-color: orange;
	font-size: 20px;
	font-weight: 400;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}

body {
	font-family: Open Sans;
	color: #555555;
}

h1 {
	font-size: 24px;
	font-weight: normal;
	margin: 0.4em 0;
}

#logo1 {
	width: 240px;
	height: 44px;
	cursor: pointer;
}

#wrapper1 {
	position: relative;
	height: 100%;
}

#content1 {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	width: 460px;
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
				<a href="home.jsp"><img class="logo" src="../../images/logo.png"></a>
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

			</div>
			<br> <br> <br> <br> <a
				href="<%= request.getContextPath() %>home.jsp">HOME</a><br> <a
				href="<%= request.getContextPath() %>/views/mypage/mypagemain.jsp">마이페이지</a><br>
			<a
				href="<%= request.getContextPath() %>/views/mypage/mypageInterest.jsp">관심
				영화</a><br> <a id="netflix">공유 계정</a><br>
			<!--  <a href="<%= request.getContextPath() %>/views/board/watcha.jsp">공유 계정</a>-->
			<a href="<%=request.getContextPath()%>/views/board/QA.jsp">Q&A</a> <a
				href="<%=request.getContextPath()%>/views/store/store_goods.jsp">STORE</a>
		</div>


		<div id="wrapper1">

			<!-- content-->
			<div id="content1">
				<form id="updatePwdForm"
					action="<%=request.getContextPath()%>/member/updatePwd"
					method="post" onsubmit="return checkPwd();">
					<!-- ID -->
					<div>
						<h3 class="join_title">
							<label for="id">아이디</label>
						</h3>
						<span class="box int_id"> <input type="text" id="id"
							class="int" maxlength="12"
							placeholder="<%=loginUser.getMemId()%>" readonly>

						</span>
					</div>



					<div>
						<h3 class="join_title">
							<label for="pswd1">현재 비밀번호</label>
						</h3>
						<span class="box int_pass"> <input type="password"
							name="userPwd" id="userPwd" class="int" maxlength="20"> <span
							id="alertTxt">사용불가</span> <img src="" id="pswd1_img1"
							class="pswdImg">
						</span> <span class="error_next_box"></span>
					</div>
					<!-- PW1 -->
					<div>
						<h3 class="join_title">
							<label for="pswd1">변경 할 비밀번호</label>
						</h3>
						<span class="box int_pass"> <input type="password"
							name="newPwd" id="newPwd" class="int" maxlength="20"
							placeholder="8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."> <span
							id="alertTxt">사용불가</span> <img src="" id="pswd1_img1"
							class="pswdImg" visible>
						</span> <span class="error_next_box"></span>
					</div>

					<!-- PW2 -->
					<div>
						<h3 class="join_title">
							<label for="pswd2">변경 할 비밀번호 재확인</label>
						</h3>
						<span class="box int_pass_check"> <input type="password"
							name="newPwd2" id="newPwd2" class="int" maxlength="20"> <img
							src="" id="pswd2_img1" class="pswdImg">
						</span> <span class="error_next_box"></span>
					</div>


					<!-- JOIN BTN-->
					<div class="btn_area">
						<button id="updatePwdBtn">
							<span>변경하기</span>
						</button>
					</div>


				</form>
			</div>
			<!-- content-->

		</div>
		<!-- wrapper -->
</body>
<script>
	$(".btn").click(function() {
		$("#menu,.page_cover,html").addClass("open");
		window.location.hash = "#open";
	});

	window.onhashchange = function() {
		if (location.hash != "#open") {
			$("#menu,.page_cover,html").removeClass("open");
		}
	};
</script>

<script>
	function checkPwd() {
		let userPwd = document.getElementById('userPwd');
		let newPwd = document.getElementById('newPwd');
		let newPwd2 = document.getElementById('newPwd2');

		if (userPwd.value != <%=loginUser.getMemPwd()%>) {
			alert("현재 비밀번호가 틀립니다");
			return false;
		}
		
		if (userPwd.value == "" || newPwd.value == "" || newPwd2.value == "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		}

		if (newPwd.value != newPwd2.value) {
			alert("비밀번호가 다릅니다.");
			newPwd2.select();
			return false;
		}

		return true;
	}
</script>
<script src="main.js"></script>
</html>