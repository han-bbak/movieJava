<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board, member.model.vo.Member"%>
<%
	Board b = (Board)request.getAttribute("board");
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
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
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
        .tableArea {
            padding: 20px;
            width: 700px;
            height: 650px;
            margin: auto;
            background: gray;
        }
    
        .input_area {
            border: solid 1px #dadada;
            padding: 10px 10px 14px 10px;
            background: white;
            width: 95%;
        }
    
        .input_area input {
            width: 95%;
            height: 30px;
            border: 0;
        }
        
        textarea {
        	width: 95%;
            height: 400px;
            border: 0;
        }
    
        .btnArea {
            text-align: center;
            padding-top: 10px;
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
            margin-left: 10px;
        }
        
        body { background:#363636; }
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
                <div id="board_top_title"><h1 id="board_name">Q&A</h1></div>
            </div>
            <div class="tableArea"> 
            <form action="<%= request.getContextPath() %>/qa/update" method="post">
			<input type="hidden" name="brd_no" value="<%= b.getBrd_no() %>">
                    <h4 class="board_title" id="title">제목</h4>
                    <span class="input_area">
                        <input type="text" name="title" value="<%= b.getBrd_title() %>" required>
                    </span>
                    <br><br>
                    <h4 class="board_title">내용</h4>
                    <textarea class="input_area" rows="5" id="summernote" name="content" style="resize:none;" required><%= b.getBrd_content() %></textarea>
                    
                    <div class="btnArea">
                        <button type="submit" id="btn">등록</button>
                        <button type="button" id="btn" onclick="history.back();">취소</button>
                    </div>
            </form>
            </div>
        </div>
    </div>
</body>
<script>
//넷플릭스 버튼
const netflix = document.getElementById('netflix');
netflix.addEventListener('click', function(){
	location.href='<%= request.getContextPath() %>/netflix/list';
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

//관심영화 버튼
const interest = document.getElementById('interest');
interest.addEventListener('click', function(){
   location.href='<%= request.getContextPath() %>/mypage/movie';
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
        <script>
  	$('#summernote').summernote({
        height: 380, 
        toolbar: [
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['misc', ['undo', 'redo']]
          ],
          focus: true,
          disableResize: true,
          disableResizeEditor: true,
          resize: false  
      });
  </script>
</html>