<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, movie.MovieVO, manager.model.vo.*" %>
<%
	ArrayList<MovieVO> list = (ArrayList<MovieVO>)request.getAttribute("list");
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
    <title>컨텐츠 관리 - 영화 전체 조회</title>
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
            margin-left: 80px;
            min-height : 850px;
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
            width : 100px;
        }

		.tableDiv th:nth-child(2) {
            width : 200px;
        }
		
        .tableDiv th:nth-child(3) {
            width : 350px;
        }

        .tableDiv th:last-child {
            width : 100px;
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
        .searchImg button {
        	margin : 0;
        	padding : 0;
        	border : none;
        	background : none;
        	color : none;
        }
        
        #movieThumbnail {
        	width : 100px;
        	height : 150px;
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
    </style>
</head>
<body>
	<%@ include file="/views/common/manager_main.jsp" %>
    <section class="contentSection">
        <div class="contentMenuWrap">
            <div class="subTitle">
                <p class="subText" id="p-sub1">등록 영화 관리</p>
                <p class="subText" id="p-sub2">등록 된 영화 수</p>
                <p class="subText" id="p-sub3">
                    <span id="countMovie">000</span>건
                </p>
                <hr>
                <ul>
                    <li><a href="content1_1_inquiry.jsp">전체 목록 조회</a></li>
                    <li><a href="content1_2_tagInquiry.jsp">태그별 목록 조회</a></li>
                    <!-- <li><a href="content1_3_movieInquiry.jsp">영화 검색</a></li> -->
                </ul>

                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
            </div>
        </div>
        <div class="contentWrap">
            <div class="titleDiv">
                <p>영화 조회</p>
            </div>
            <hr>
            <div class="searchDiv">
            	<form method="get" action="<%= request.getContextPath() %>/manager/movieSearch">
                    <input type="text" name="search" placeholder="검색할  상품명 키워드 입력" size="30" style="height: 30px;" value="<%= search %>">
                    <div class="searchImg">
                    	<button type="submit">
                        	<img src="<%= request.getContextPath() %>/images/search.png" style="width:33px; height:33px;">
                        </button>
                    </div>
                </form>
            </div>
            <div class="tableDiv">
                <table>
                    <tr>
                        <th>영화코드</th>
                        <th>썸네일</th>
                        <th>영화명</th>
                        <th>사용여부</th>
                    </tr>
                    <% if(list.isEmpty()) { %>
                    	<tr>
                    		<td colspan="4">등록 된 영화가 없습니다.</td>
                    	</tr>
                    <% } else { %>
                    	<% for(int i = 0; i < list.size(); i++) { %>
                    		<tr>
                    			<td><%= list.get(i).getM_code() %></td>
                    			<td><img id="movieThumbnail" src='<%= list.get(i).getM_image() %>'></td>
                    			<td><%= list.get(i).getM_title() %></td>
                    			<td><%= list.get(i).getStatus() %></td>
                    		</tr>
                    	<% } %>
                    <% } %>
                </table>
            </div>
            <div class="pagingBtnDiv">
            	<!-- 처음으로 -->
            	<% if(s == null) { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/movie?currentPage=1'"> &lt;&lt; </button>
            	<% } else { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/movieSearch?currentPage=1&search=<%= search %>'"> &lt;&lt; </button>
            	<% } %>
            	<!-- 이전으로 -->
            	<% if(pi.getCurrentPage() == 1) { %>
            		<button disabled> &lt; </button>
            	<% } else if(s == null) { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/movie?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
            	<% } else {%>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/movieSearch?currentPage=<%= pi.getCurrentPage() - 1 %>&search=<%= search %>'"> &lt; </button>
            	<% } %>
            	
            	<!-- 10개 페이지 목록 -->
            	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
            		<% if(p == pi.getCurrentPage()) { %>
            			<button style="background:rgb(255,192,0); color:black;" disabled> <%= p %></button>
            		<% } else if(s == null) { %>
            			<button onclick="location.href='<%= request.getContextPath() %>/manager/movie?currentPage=<%= p %>'"><%= p %></button>
            		<% } else { %>
            			<button onclick="location.href='<%= request.getContextPath() %>/manager/movieSearch?currentPage=<%= p %>&search=<%= search %>'"><%= p %></button>
            		<% } %>
            	<% } %>
            	
            	<!-- 다음으로 -->
            	<% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
            		<button disabled> &gt; </button>
            	<% } else if(s == null) { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/movie?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
            	<% } else {%>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/movieSearch?currentPage=<%= pi.getCurrentPage() + 1 %>&search=<%= search %>'"> &gt; </button>
            	<% } %>
            	
            	<!-- 맨 끝으로 -->
            	<% if(s == null) { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/movie?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
            	<% } else { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/movieSearch?currentPage=<%= pi.getMaxPage() %>&search=<%= search %>'"> &gt;&gt; </button>
            	<% } %>
            </div>
        </div>
    </section>
    <script>
	    $(function(){
			var countMovie = $("#countMovie");
			
			$.ajax({
				url : "<%= request.getContextPath() %>/manager/movieCount",
				type : "post",
				success : function(data){
					countMovie.text(data);
				},
				error : function(e) {
					console.log(e);
				}
			});
		});
    </script>
</body>
</html>