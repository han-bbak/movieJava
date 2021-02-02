<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*, member.model.vo.Member"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	Search s = (Search)request.getAttribute("search");
	String search = "";
	String searchCondition = "";
	String[] selected = new String[3];
	if(s != null) {
		search = s.getSearch();
		searchCondition = s.getSearchCondition();
		if(searchCondition.equals("writer")) {
			selected[0] ="selected";
		} else if(searchCondition.equals("title")) {
			selected[1] ="selected";
		} else {
			selected[2] ="selected";
		}
	}
	
	Member loginUser = (Member)session.getAttribute("loginUser");
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
   
      #board_top {
            width: 100%;
            height: 4%;
            /* border: 1px solid red; */
        }

        #board_top_title {
            float: left;
            width: 50%;
            height: 100%;
            position: relative;
        }
        
        #logo {
            position: relative;
			margin: 20px 50px;
			max-width: 130%;
        }

        #content a {
            text-decoration: none;
            color: #a49e9e;
            cursor: pointer;
        }

        #content a:hover {
            text-decoration: none;
            color: #cecece;
        }

        #board_top_btn {
            float: left;
            width: 50%;
            height: 100%;

            position: relative;
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

        .btn {
            cursor: pointer;

            padding: 0;

            background: rgb(62, 103, 184);
            border: rgb(62, 103, 184);
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            color: white;
        }

        #updateBtn {
            float: left;

            width: 85px;
            height: 45px;

            padding: 0;
            font-size: 18px;

            top: 0;
            bottom: 0;
            right: 0;
            position: absolute;
            margin: auto;
        }
        
        .pagingArea {
            /* border: 1px solid yellow; */
            text-align: center;

        }

        #pagingBtn {
            width: 30px;
            height: 30px;
        }
        
        .searchArea {
        	text-align: center;
        }
        
        #searchBtn {
        	width: 60px;
        	height: 25px;
        }

        .board_table {
            width: 100%;
            position: relative;
            height: 30%;
            /* border: 1px solid magenta; */
        }

        .list_table {
            width: 850px;

            left: 0;
            right: 0;
            position: absolute;
            margin: auto;

            /* border: 1px solid red; */
        }

        .list_table tbody td {
            padding: 5px 0;
            text-align: center;
            color: white;
            border-bottom: 1px solid gray;
            font-size: 18px;
        }

        .list_table thead th {
            border: 1px solid black;
            border-bottom: 1px solid gray;
            padding: 5px 0;
            text-align: center;
            background: gray;
            font-size: 20px;
            font-weight: lighter;
            border: gray;
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
			<a href="<%= request.getContextPath() %>/views/mypage/mypageInterest.jsp">관심 영화</a><br>
            <a id="netflix">공유 계정</a><br>
            <a id="qa">Q&A</a><br>
            <a id="store">STORE</a>
        </div>

        <div id="content">
            <div id="board_top">
                <div id="board_top_title">
                    <h1 id="board_name">
                        <a id="netflix1">Netflix</a>
                        /
                        <a id="watcha" style="color:white;">Watcha</a>
                        <br>
                    </h1>
                </div>
                <div id="board_top_btn">
                <% if(loginUser != null) { %>
					<button type="button" class="btn" id="updateBtn" onclick="location.href='<%= request.getContextPath() %>/views/board/watcha_insert.jsp'">글쓰기</button>
				<% } %>
                </div>
            </div>
            <div class="board_table">
                <table class="list_table">
                    <colgroup>
                        <col width="15%" />
                        <col width="45%" />
                        <col width="15%" />
                        <col width="10%" />
                        <col width="15%" />
                    </colgroup>
                    <thead>
                        <tr id="first">
                            <th>No.</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>조회수</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                     <% if(list.isEmpty()) { %>
                    	<tr>
                    		<td colspan="5">조회된 게시글이 없습니다</td>
                    	</tr>
                    <% } else { %>
                    	<% for(Board b : list) { %>
                    	<tr>
                    		<td><%= b.getBrd_no() %></td>
                    		<td><%= b.getBrd_title() %></td>
                    		<td><%= b.getBrd_writer() %></td>
                    		<td><%= b.getBrd_cnt() %></td>
                    		<td><%= b.getBrd_date() %></td>
						</tr>
                    	<% } %>
                    <% } %>
                   </tbody>
                </table>
            </div>
            <div class="pagingArea">
                <% if(s == null) { %>
					<button class="btn" id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/watcha/list?currentPage=1'"> &lt;&lt; </button>
				<% } else { %>
					<button class="btn" id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/watcha/list?currentPage=1&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt;&lt; </button>
				<% } %>
                
                
                <% if(pi.getCurrentPage() == 1) { %>
                	<button class="btn" id="pagingBtn" disabled> &lt; </button>
                <% } else { %>
                	<button class="btn" id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/watcha/list?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
                <% } %>
                
                
                <% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
                	<% if(p == pi.getCurrentPage()) { %>
                		<button class="btn" id="pagingBtn" style="background:lightgray;" disabled><%= p %></button>
                	<% } else if(s == null) { %>
             			<button class="btn" id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/watcha/list?currentPage=<%= p %>'"> <%= p %> </button>
           			<% } else { %>
               			<button class="btn" id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/watcha/search?currentPage=<%= p %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> <%= p %> </button>
                	<% } %>
                <% } %>
                
                
                <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
                	<button class="btn" id="pagingBtn" disabled> &gt; </button>
                <% } else { %>
                 	<button class="btn" id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/watcha/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
         		<% } %>
         		
         		
         		<% if(s == null) { %>
					<button class="btn" id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/watcha/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
				<% } else { %>
					<button class="btn" id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/watcha/list?currentPage=<%= pi.getMaxPage() %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt;&gt; </button>
				<% } %>
            </div>
            <br>
            <div class="searchArea">
            	<form action="<%= request.getContextPath() %>/watcha/search" method="get">
					<select id="searchCondition" name="searchCondition">
						<option>----</option>
						<option value="writer" <%= selected[0] %>>작성자</option>
						<option value="title" <%= selected[1] %>>제목</option>
						<option value="content" <%= selected[2] %>>내용</option> 
					</select>
					<input type="search" name="search"<%= search %> >
					<button class="btn" id="searchBtn" type="submit">검색하기</button>
				</form>
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
    <script>
 	// 넷플릭스 버튼
	const netflix = document.getElementById('netflix');
	netflix.addEventListener('click', function(){
		location.href='<%= request.getContextPath() %>/netflix/list';
	});
	
	const netflix1 = document.getElementById('netflix1');
	netflix1.addEventListener('click', function(){
		location.href='<%= request.getContextPath() %>/netflix/list';
	});
	
	
	// 왓챠 버튼
	const watcha = document.getElementById('watcha');
	watcha.addEventListener('click', function(){
		location.href='<%= request.getContextPath() %>/watcha/list';
	});
	
	// Q&A 버튼
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
    <script>
 // 게시판 상세 보기  기능
	$(function() {
		$(".list_table td").mouseenter(function(){
			$(this).parent().css({"background":"lightgray", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css("background", "#363636");
		}).click(function(){
			var brd_no = $(this).parent().children().eq(0).text();
			console.log(brd_no);
			<% if(loginUser != null) { %>
				location.href='<%= request.getContextPath() %>/watcha/detail?brd_no=' + brd_no;
			<% } else { %>
				alert('로그인 후 게시글 보기가 가능합니다.');
			<% } %>
		});
	});
		
		
		
	</script>
</html>