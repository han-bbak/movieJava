<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.Board, manager.model.vo.*" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	Search s = (Search)request.getAttribute("search");
	String search = "";
	if(s != null) {
		search = s.getSearch();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sideMenu CSS -->
    <link href="<%= request.getContextPath() %>/resources/css/content1_movie.css" rel="stylesheet" type="text/css">
    <title>공유 계정 게시판</title>
    <style>
        .contentWrap {
            box-sizing: border-box;
            display: inline-block;
            width: 85%;
            height: 100%;
            position: relative;
        }
        .titleDiv {
            margin: 20px;
        }

        .titleDiv p {
            color : white;
            font-size : 20px;
            font-weight: bold;
        }
        
        .tableDiv {
            color: white;
            margin-left: 50px;
            min-height : 700px;
        }

        .tableDiv table {
        	text-align : center;
        }

        .tableDiv th {
            border-top: 2px solid white;
            border-bottom: 1px solid lightgray;
            padding: 10px;
            font-size : 15px;
        }
        
        .tableDiv tr {
        	height : 30px;
        }
        
        .tableDiv tr:nth-child(odd) {
        	background : lightgray;
        	color : rgb(64, 64, 64);
        }
        
        .tableDiv tr:first-child {
        	background : #fff;
        	color : black;
        }
        
        .tableDiv table {
        	border-top : 2px solid white;
        	border-bottom : 2px solid white;
        }
        
        .tableDiv th:nth-child(1) {
        	width : 80px;
        }
        
        .tableDiv th:nth-child(2) {
        	width : 300px;
        }
        
        .tableDiv th:nth-child(3) {
        	width : 80px;
        }
        
        .tableDiv th:nth-child(4) {
        	width : 80px;
        }
        
        .tableDiv th:nth-child(5) {
        	width : 120px;
        }
        
        .tableDiv th:nth-child(6) {
        	width : 50px;
        }
        
        td #removeBrd {
        	cursor : pointer;
        }
        
        .pagingBtnDiv {
        	text-align : center;
        }
        
        .pagingBtnDiv button {
        	background : lightgray;
        	border : none;
        	width : 30px;
        	height : 30px;
        	border-radius : 5px;
        	outline : none;
        	cursor : pointer;
        }
        
        .searchImg button {
        	margin : 0;
        	padding : 0;
        	border : none;
        	background : none;
        	color : none;
        }

		.searchDiv {
            margin: 20px;
        }
        .searchDiv input {
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }
        .searchDiv img {
            padding : 2px;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }
        .searchDiv input {
            float: left;
        }
        .searchDiv img:hover {
            cursor: pointer;
        }
    </style>
    <% if(request.getAttribute("msg") != null) { %>
    	<script>
    		alert('<%= request.getAttribute("msg") %>');
    	</script>
    <%
    	request.removeAttribute("msg");
    	}
    %>
</head>
<body>
	<%@ include file="/views/common/manager_main.jsp" %>
    <section class="contentSection">
        <div class="contentMenuWrap">
            <div class="subTitle">
                <p class="subText" id="p-sub1">공유 계정<br><br>게시판</p>
                <p class="subText" id="p-sub2">등록된 게시글 수</p>
                <p class="subText" id="p-sub3">
                    <span id="count">000</span>건
                </p>
                <p class="subText" id="p-sub4">넷플릭스</p>
                <p class="subText" id="p-sub5">
                    <a href="<%= request.getContextPath() %>/manager/shareNetflix"><span id="countNetflix">000</span></a>건
                </p>
                <p class="subText" id="p-sub6">왓챠</p>
                <p class="subText" id="p-sub7">
                    <a href="<%= request.getContextPath() %>/manager/shareWatcha"><span id="countWatcha">000</span></a>건
                </p>
                <hr>

                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
            </div>
        </div>
        <div class="contentWrap">
            <div class="titleDiv">
                <p>왓챠 게시판</p>
            </div>
            <hr>
            <form method="get" action="<%= request.getContextPath() %>/manager/searchWatcha">
	            <div class="searchDiv">
	                    <input type="text" name="search" placeholder="검색할 키워드 입력" size="30" style="height: 30px;" value="<%= search %>">
	                    <div class="searchImg">
	                    	<button type="submit">
	                        	<img src="<%= request.getContextPath() %>/images/search.png" style="width:33px; height:33px;">
	                        </button>
	                    </div>
	            </div>
            </form>
            <div class="tableDiv">
                <!-- 검색 결과 출력 -->
                <table>
                    <tr>
                        <th>No.</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>상태</th>
                    </tr>
                    <% if(list.isEmpty()) { %>
                    	<tr>
                    		<td colspan="5">조회 된 게시글이 없습니다.</td>
                    	</tr>
                    <% } else {%>
                    	<% for(Board b : list) { %>
                    		<tr>
                    			<td><%= b.getBrd_no() %></td>
	                    		<td><%= b.getBrd_title() %></td>
	                    		<td><%= b.getBrd_writer() %></td>
	                    		<td><%= b.getBrd_cnt() %></td>
	                    		<td><%= b.getBrd_date() %></td>
	                    		<td><%= b.getBrd_status() %></td>
                    		</tr>
                    	<% } %>
                    <% } %>
                </table>
            </div>
            <div class="pagingBtnDiv">
            	<!-- 처음으로 -->
            	<% if(s == null) { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/shareWatcha?currentPage=1'"> &lt;&lt; </button>
            	<% } else { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/searchWatcha?currentPage=1&search=<%= search %>'"> &lt;&lt; </button>
            	<% } %>
            	<!-- 이전으로 -->
            	<% if(pi.getCurrentPage() == 1) { %>
            		<button disabled> &lt; </button>
            	<% } else if(s == null) { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/shareWatcha?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
            	<% } else {%>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/searchWatcha?currentPage=<%= pi.getCurrentPage() - 1 %>&search=<%= search %>'"> &lt; </button>
            	<% } %>
            	
            	<!-- 10개 페이지 목록 -->
            	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
            		<% if(p == pi.getCurrentPage()) { %>
            			<button style="background:rgb(255,192,0); color:black;" disabled> <%= p %></button>
            		<% } else if(s == null) { %>
            			<button onclick="location.href='<%= request.getContextPath() %>/manager/shareWatcha?currentPage=<%= p %>'"><%= p %></button>
            		<% } else { %>
            			<button onclick="location.href='<%= request.getContextPath() %>/manager/searchWatcha?currentPage=<%= p %>&search=<%= search %>'"><%= p %></button>
            		<% } %>
            	<% } %>
            	
            	<!-- 다음으로 -->
            	<% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
            		<button disabled> &gt; </button>
            	<% } else if(s == null) { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/shareWatcha?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
            	<% } else {%>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/searchWatcha?currentPage=<%= pi.getCurrentPage() + 1 %>&search=<%= search %>'"> &gt; </button>
            	<% } %>
            	
            	<!-- 맨 끝으로 -->
            	<% if(s == null) { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/shareWatcha?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
            	<% } else { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/searchWatcha?currentPage=<%= pi.getMaxPage() %>&search=<%= search %>'"> &gt;&gt; </button>
            	<% } %>
            </div>
        </div>
    </section>
	<script>
		$(function(){
			var count = $("#count");
			var countNetflix = $("#countNetflix");
			var countWatcha = $("#countWatcha");
			
			$.ajax({
				url : "<%= request.getContextPath() %>/manager/boardCount",
				type : "post",
				dataType : "json",
				success : function(data){
					count.text(data[0]);
					countNetflix.text(data[1]);
					countWatcha.text(data[2]);
					
				},
				error : function(e) {
					console.log(e);
				}
			});
			
			$(".tableDiv table td").mouseenter(function(){
				$(this).parent().css({"background":"#FFDD71", "cursor":"pointer", "color":"rgb(64,64,64)"});
			}).mouseout(function(){
				$(".tableDiv tr:nth-child(odd)").css({"background":"lightgray", "color":"rgb(64,64,64)"});
				$(".tableDiv tr:nth-child(even)").css({"background":"none" , "color":"white"});
				$(".tableDiv tr:first-child").css({"background":"#fff" , "color":"black"});
			}).click(function() {
				var num = $(this).parent().children().eq(0).text();
				location.href="<%= request.getContextPath() %>/manager/watchaDetail?brdNo=" + num;
			});
		});
	</script>
</body>
</html>