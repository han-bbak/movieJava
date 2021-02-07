<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, store.model.vo.*, java.util.ArrayList"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Store s = (Store)request.getAttribute("store");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link href="<%= request.getContextPath() %>/resources/css/form.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
    #menu-icon { 
            color: #ffffff;
            padding: 30px 0 0;
            font-size: 5em; 
            }
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
            position: relative;
			margin: 20px 50px;
			max-width: 130%;
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

        #ticket {
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
        
         #searchDiv a {
        	text-decoration: none;
        }

    </style>
<% if(session.getAttribute("msg") != null) { %>
	<script>
		alert('<%= session.getAttribute("msg") %>');
	</script>
	<%
		session.removeAttribute("msg");
		}
	%>
</head>

<body>
    <div id="wrapper">
        <div id="header">
            <div class="header" id="header-menu">
        		<div class="menuBtn">
                     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                     <i id="menu-icon" class="material-icons">menu</i>
                </div>
            </div>
            <div class="header" id="header1">
            	<a href="<%= request.getContextPath() %>/home.jsp"><img id="logo" src="<%= request.getContextPath() %>/images/logo.png"></a>
            </div> 
            <div class="header" id="header2">
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
        <div id="menu">
            <div onclick="history.back();" class="close">
                <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="#a49e9e" class="bi bi-x-circle" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                  </svg>
            </div>
            <br><br><br><br>
            <a href="<%= request.getContextPath() %>/home.jsp">HOME</a><br>
            <a href="<%= request.getContextPath() %>/views/mypage/mypagemain.jsp">마이페이지</a><br> 
         	<a id="interest">관심 영화</a><br>
            <a id="netflix">공유 계정</a><br>
            <a id="qa">Q&A</a><br>
            <a id="store">STORE</a>
        </div>
			
        <div id="content">
			<div id="board_top">
                <div id="board_top_title">
                   <h1 id="board_name">Ticket</h1>
                </div>
            </div>
			<div class="paymentArea">
				<table id="payTable">
					<colgroup>
						<col width="50%" />
					</colgroup>
					<tr>
						<td rowspan="4">
							<img class="img" src="<%= request.getContextPath() %><%= s.getStorePath() %><%= s.getRename() %>" width="400px" height="400px">
						</td>
						<td height="35%">
							<p id="stTitle"><%= s.getStoreTitle() %></p>
							<span id="stPrice"><%= s.getStorePrice() %></span>원
						</td>
					</tr>
					<tr>
						<td height="30%">
							수량 
							<button type="button" class="minus" style="height:30px; width:30px;"><span class="blind">-</span></button>
							 <input type="number" id="no" value="1" step="1" style="padding: 0px; border:0; width: 30px; height:30px; text-align:center;" readonly>
							 <button type="button" class="plus" style="height:30px; width:30px;"><span class="blind">+</span></button>
							<br> <br> 
							택배 배송 3,000원
						</td>
					</tr>
					<tr>
						<td height="20%">
							총 상품 금액 
							<input type="hidden" id="storeNo" value="<%= s.getStoreNo() %>">
							<span id="total"><%= s.getStorePrice() %></span>원
						</td>
					</tr>
					<tr>
						<td height="15%">
							<button type="button" class="btn" id="buy">구매하기</button>
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

<script>
//넷플릭스 버튼
const netflix = document.getElementById('netflix');
netflix.addEventListener('click', function(){
	location.href='<%=request.getContextPath()%>/netflix/list';
});

//Q&A 버튼
const qa = document.getElementById('qa');
qa.addEventListener('click', function(){
	location.href='<%=request.getContextPath()%>/qa/list';
});

//STORE 버튼
const store = document.getElementById('store');
store.addEventListener('click', function(){
	location.href='<%=request.getContextPath()%>/store/list';
});

									
//구매하기 버튼
$(function(){
$("#buy").click(function(){
	var storeNo = $(this).parent().parent().parent().children().eq(2).children().children().eq(0).val();
	var selQuan = $(this).parent().parent().parent().children().eq(1).children().children().eq(1).val();
	var $price = $(this).parent().parent().parent().children().eq(2).children().children().eq(1);
	var price = $price.text();
	var storeTitle = $(this).parent().parent().parent().children().eq(0).children().eq(1).children().eq(0).text();

		<% if(loginUser != null) { %>
			location.href = '<%= request.getContextPath() %>/ticket/payment?storeTitle=' + storeTitle + '&storeNo=' + storeNo + '&selQuan=' + selQuan + '&price=' + price;
		<% } else { %>
			alert('로그인 후 결제가 가능합니다.');
		<% } %>
	});
});

//관심영화 버튼
const interest = document.getElementById('interest');
interest.addEventListener('click', function(){
   location.href='<%= request.getContextPath() %>/mypage/movie';
});
</script>

<script>
	$(".minus").click(function() {
		var $no = $(this).parent().children().eq(1);
		var n = $no.val();
		var $price = $(this).parent().parent().parent().children().eq(2).children().children().eq(1);
		var p = $price.text();
		var $orip = $(this).parent().parent().parent().children().eq(0).children().eq(1).children().eq(1);
		var o = $orip.text(); 
		
		if(!n) {
			n = 0;
			p = 0;
			o = 0;
		} else {
			n *= 1;
			p *= 1;
			o *= 1;
		}
		
		if(n < 2) {
			alert("1개 이상부터 구매하실 수 있습니다.");
			$price.text(p);
		} else {
			$no.val(n - 1);

			p = $price.text(p - o); 
		}
	});
	
	$(".plus").click(function() {
		var $no = $(this).parent().children().eq(1);
		var n = $no.val();
		var $price = $(this).parent().parent().parent().children().eq(2).children().children().eq(1);
		var p = $price.text();
		var $orip = $(this).parent().parent().parent().children().eq(0).children().eq(1).children().eq(1);
		var o = $orip.text(); 
		
		if(!n) {
			n = 0;
			p = 0;
			o = 0;
		} else {
			n *= 1;
			p *= 1;
			o *= 1;
		}
		
		n = $no.val(n + 1);
		
		p = $price.text(p + o); 
		
	});
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