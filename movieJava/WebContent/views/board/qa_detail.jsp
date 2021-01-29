<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList, member.model.vo.Member"%>
<%
	Board b = (Board)request.getAttribute("board");
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<Reply> rList = (ArrayList<Reply>)request.getAttribute("rList");
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
        .button {
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
            height: 70px;
            text-align: center;
        }
        
        .replyListArea{
        	position: relative;
        }
        
        .replyTable {
        	left: 0;
            right: 0;
            position: absolute;
            margin: auto;
            
            width: 100%;
            text-align: center;
            font-size: 15px;
            font-weight: lighter;
            
        
        }
        
        .replyTable td {
          border-bottom: 1px solid black;
          padding: 8px 8px 8px 8px;
        }
        
        .replyTable td:nth-child(1) {
         border: 0;
         font-weight: bold;
        }
        
        
        .replyTable td:nth-child(2) {
         background: #dadada;
         opacity: 80%;
         text-align: center;
         
        }
        
        .replyTable td:nth-child(3) {
         text-align: left;
        }
        
        .replyTable td:nth-child(4) {
         text-align: center;

        }
        
        #replyDelete, #replyUpdate {
        	width: 40px;
        	height:30px;
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
                        <td><%= b.getBrd_title() %></td>
                        <td>작성자</td>
                        <td><%= b.getBrd_writer() %></td>
                        <td>조회수</td>
                        <td><%= b.getBrd_cnt() %></td>
                        <td>작성일</td>
                        <td><%= b.getBrd_date() %></td>
                    </tr>
                    <tr>
                        <td colspan ="8">
                            <p id="content"><%= (b.getBrd_content()).replace("\n", "<br>") %></p>
                        </td>
                    </tr>
                </table>
                <div class="btnArea">
                    <button type="button" class="button" id="backBtn">목록</button>
                    <button type="button" class="button" id="updateBtn">수정</button>
                    <button type="button" class="button" id="deleteBtn">삭제</button>
                    	
                    	<script>
							// 수정
							const updateBtn = document.getElementById('updateBtn');
							updateBtn.addEventListener('click', function(){
							$("#brd_noForm").attr("action", "<%= request.getContextPath() %>/qa/updateForm");
								$("#brd_noForm").submit();
							});
	
							// 삭제
							const deleteBtn = document.getElementById('deleteBtn');
							deleteBtn.addEventListener('click', function(){
							$("#brd_noForm").attr("action", "<%= request.getContextPath() %>/qa/delete");
								$("#brd_noForm").submit();
							});
						</script>
                </div>
                <hr>
                <div class="replyArea">
                    <br>
                    <span class="input_area">
                        <input id="replyContent" type="text" name="input" placeholder="댓글을 작성해 보세요">
                    </span>
                    <button class="button" type="button" id="replyBtn">등록하기</button>
                 </div>
                 <div class="replyListArea">
                 	<table class="replyTable">
                 	<colgroup>
                        <col width="5%" />
                        <col width="8%" />
                        <col width="60%" />
                        <col width="13%" />
                        <col width="14%" />
                    </colgroup>
                   	 <% if(rList != null && !rList.isEmpty()) { %>
                    	<% for(Reply r : rList) { %>
                    			<tr>
                    				<td><%= r.getRp_no() %></td>
                    				<td><%= r.getMem_name() %></td>
                    				<td><%= r.getRp_content() %></td>
                    				<td><%= r.getRp_date() %></td>
                    				<td>
                    					<button class="button" type="button" id="replyUpdate">수정</button>
                    					<button class="button" type="button" id="replyDelete">삭제</button>
                    					<form action="" id="rp_noForm" method="post">
                    						<input type="hidden" name="rp_no" value="<%= r.getRp_no() %>" />
                    						<input type="hidden" name="brd_no" value="<%= b.getBrd_no() %>" />
                    						<input type="hidden" name="rp_content" value="<%= r.getRp_content() %>" />
                    					</form>
                    				</td>

                    			</tr>
                    		<% } %>
                    	<% } else { %>
                        <tr>
                            <td colspan="5" style="background: #dadada; opacity: 80%;" >작성된 댓글이 없습니다.</td>
                        </tr>
                    <% } %>
                    </table>
                 </div>
            </div>
        </div>
    </div>
</body>

				<form action="" id="brd_noForm" method="post">
					<input type="hidden" name="brd_no" value="<%= b.getBrd_no() %>">
				</form>

<script>
	//넷플릭스 버튼
	const netflix = document.getElementById('netflix');
	netflix.addEventListener('click', function(){
		location.href='<%= request.getContextPath() %>/netflix/list';
	});

	// 목록
	const listBtn = document.getElementById('backBtn');
	backBtn.addEventListener('click', function(){
		location.href='<%= request.getContextPath() %>/qa/list';
	});
	
	// 댓글 삭제
	const replyDelete = document.getElementById('replyDelete');
	$("#replyDelete").on("click", function(){
		$("#rp_noForm").attr("action", "<%= request.getContextPath() %>/qa/deleteReply");
		$("#rp_noForm").submit();
	});
	
	// Q&A 버튼
	const qa = document.getElementById('qa');
	qa.addEventListener('click', function(){
		location.href='<%= request.getContextPath() %>/qa/list';
	});
	
	
	// 댓글 수정 -> 나중에..ㅠ
//	const replyUpdate = document.getElementById('replyUpdate');
//	$("#replyUpdate").on("click", function(){
//		var text = $(this).text();
//		if(text == '수정') {
//			var rp_content = $(this).parent().parent().children().eq(2).text();
//			var rp_no = $(this).parent().parent().children().eq(0).text();
//			console.log(rp_content);
//			console.log(rp_no);
//			$($(this).parent().parent().children().eq(2)).html("<input type='text' name='comment' style='width : 100%; padding:5px 5px 5px 5px;' value='" + rp_content + "'>");
//			$(this).parent().children().eq(0).text('완료');
//			$(this).parent().children().eq(1).text('취소');
//		} else if(text == '완료') {
//			var rp_content = $(this).parent().parent().children().eq(2).text();
//			var rp_no = $(this).parent().parent().children().eq(0).text();
//			$('input[name=rp_content]').val(rp_content);
//			
//			$(this).parent().parent().children().eq(2).submit();
//		} else if (text == '취소'){
//			$(this).attr("action", "<%= request.getContextPath() %>/netflix/detail?brd_no='<%= b.getBrd_no() %>'");
//		}
//	});
	
$(function() {
		$("#replyBtn").on('click', function() {
			var rp_writer = <%= loginUser.getMemNo() %>;
			var brd_no = <%= b.getBrd_no() %>;
			var content = $("#replyContent").val();
			
			if(content == '') {
				alert("내용을 작성해 주세요");
				$("#replyContent").val('');
				$("#replyContent").focus();
			} else {
				$.ajax({
					url: "<%= request.getContextPath() %>/qa/insertReply",
					type: "post",
					dataTaype: "json",
					data: {rp_writer:rp_writer, brd_no:brd_no, content:content},
					success: function(data) {
						replyTable = $(".replyTable");
						replyTable.html("");
					
						for(var key in data){
							var tr = $("<tr>");
							var writerTd = $("<td style='width : 10%; background: #dadada; opacity: 80%;'>").text(data[key].mem_name);
							var contentTd = $("<td style='width : 75%; background: gray; text-align:left;'>").text(data[key].rp_content);
							var dateTd = $("<td style='width : 15%;'>").text(data[key].rp_date);
				
							tr.append(writerTd, contentTd, dateTd);
						
							replyTable.append(tr);
						}
					
						$("#replyContent").val("");
			
					}, 
					error: function(e) {
						console.log(e);
					}
				});
			}
		});
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