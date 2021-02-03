<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, manager.model.vo.PageInfo, tag.model.vo.Tag, movieTag.model.vo.MovieTag" %>
<%
	ArrayList<MovieTag> list = (ArrayList<MovieTag>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	Tag tag = (Tag)request.getAttribute("tag");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- sideMenu CSS -->
    <link href="<%= request.getContextPath() %>/resources/css/content1_movie.css" rel="stylesheet" type="text/css">
    <title>컨텐츠 관리 - 태그 목록 조회</title>
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

        .tagDiv {
            margin : 30px;
        }

        .tagDiv .tag {
            width: 150px;
            height: 30px;
            font-size: 12px;
            font-weight: bold;
            background : rgb(255,192,0);
            border-radius: 8px;
            border-color: rgb(255,192,0);
        }

        .tagDiv .tag:hover {
            cursor: pointer;
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
                    <li><a href="<%= request.getContextPath() %>/manager/movie">전체 목록 조회</a></li>
                    <li><a href="<%= request.getContextPath() %>/manager/movieTagList">태그별 목록 조회</a></li>
                    <!-- <li><a href="content1_3_movieInquiry.jsp">영화 검색</a></li> -->
                </ul>

                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
            </div>
        </div>
        <div class="contentWrap">
            <div class="titleDiv">
                <p>태그별 목록 조회</p>
            </div>
            <div class="tagDiv">
                <div class="tagList" id="tagList">
                	<% if(tag != null) { %>
               			<span class="tagOneSpan">
               				<input type="hidden" name="tagCode" value="<%= tag.getTagNo() %>">
               				<input type="button" class="tag" name="tagName" value="<%= tag.getTagName() %>">
               			</span>
                	<% } else {%>
                		<span>선택한 태그가 없습니다.</span>
                	<% } %>
                </div>
            </div>
            <hr>
            <div class="tableDiv">
                <table>
                    <tr>
                        <th>영화코드</th>
                        <th>썸네일</th>
                        <th>영화명</th>
                        <th>사용태그</th>
                    </tr>
                    <% if(list.isEmpty()) { %>
                    	<tr>
                    		<td colspan="4">해당 태그가 등록된 영화가 없습니다.</td>
                    	</tr>
                    <% } else { %>
                    	<% for(int i = 0; i < list.size(); i++) { %>
                    		<tr>
                    			<td><%= list.get(i).getM_code() %></td>
                    			<td><img id="movieThumbnail" src='<%= list.get(i).getM_image() %>'></td>
                    			<td><%= list.get(i).getM_title() %></td>
                    			<td><%= list.get(i).getTagName() %></td>
                    		</tr>
                    	<% } %>
                    <% } %>
                </table>
            </div>
            <div class="pagingBtnDiv">
            	<!-- 처음으로 -->
           		<button onclick="location.href='<%= request.getContextPath() %>/manager/tagMovieList?currentPage=1&tagNo=<%= tag.getTagNo() %>'"> &lt;&lt; </button>
            	<!-- 이전으로 -->
            	<% if(pi.getCurrentPage() == 1) { %>
            		<button disabled> &lt; </button>
            	<% } else {%>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/tagMovieList?currentPage=<%= pi.getCurrentPage() - 1 %>&tagNo=<%= tag.getTagNo() %>'"> &lt; </button>
            	<% } %>
            	
            	<!-- 10개 페이지 목록 -->
            	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
            		<% if(p == pi.getCurrentPage()) { %>
            			<button style="background:rgb(255,192,0); color:black;" disabled> <%= p %></button>
            		<% } else { %>
            			<button onclick="location.href='<%= request.getContextPath() %>/manager/tagMovieList?currentPage=<%= p %>&tagNo=<%= tag.getTagNo() %>'"><%= p %></button>
            		<% } %>
            	<% } %>
            	
            	<!-- 다음으로 -->
            	<% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
            		<button disabled> &gt; </button>
            	<% } else {%>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/tagMovieList?currentPage=<%= pi.getCurrentPage() + 1 %>&tagNo=<%= tag.getTagNo() %>'"> &gt; </button>
            	<% } %>
            	
            	<!-- 맨 끝으로 -->
           		<button onclick="location.href='<%= request.getContextPath() %>/manager/tagMovieList?currentPage=<%= pi.getMaxPage() %>&tagNo=<%= tag.getTagNo() %>'"> &gt;&gt; </button>
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
			
			$(".tableDiv table td").mouseenter(function(){
				$(this).parent().css({"background":"#FFDD71", "cursor":"pointer", "color":"rgb(64,64,64)"});
			}).mouseout(function(){
				$(".tableDiv tr:nth-child(odd)").css({"background":"lightgray", "color":"rgb(64,64,64)"});
				$(".tableDiv tr:nth-child(even)").css({"background":"none" , "color":"white"});
				$(".tableDiv tr:first-child").css({"background":"#fff" , "color":"black"});
			}).click(function() {
				var num = $(this).parent().children().eq(0).text();
				location.href="<%= request.getContextPath() %>/manager/movieTagUpdate?m_code=" + num;
			});
		});
    </script>
</body>
</html>