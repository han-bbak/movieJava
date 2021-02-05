<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.Board, manager.model.vo.*" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sideMenu CSS -->
    <link href="<%= request.getContextPath() %>/resources/css/content1_movie.css" rel="stylesheet" type="text/css">
    <title>문의 관리</title>
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
        	width : 380px;
        }
        
        .tableDiv th:nth-child(3) {
        	width : 80px;
        }
        
        .tableDiv th:nth-child(4) {
        	width : 120px;
        }
        
        .tableDiv th:nth-child(5) {
        	width : 100px;
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
                <p class="subText" id="p-sub1">문의 & 답변</p>
                <p class="subText" id="p-sub2">등록된 문의 수</p>
                <p class="subText" id="p-sub3">
                    <span id="count">000</span>건
                </p>
                <p class="subText" id="p-sub4">답변 대기</p>
                <p class="subText" id="p-sub5">
                    <a href="<%= request.getContextPath() %>/manager/qaWait"><span id="countWait">000</span></a>건
                </p>
                <p class="subText" id="p-sub6">답변 완료</p>
                <p class="subText" id="p-sub7">
                    <span id="countComplete">000</span>건
                </p>
                <hr>

                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
            </div>
        </div>
        <div class="contentWrap">
            <div class="titleDiv">
                <p>문의글 전체 목록</p>
            </div>
            <hr>
            <div class="tableDiv">
                <!-- 문의글 목록 출력 -->
                <table>
                    <tr>
                        <th>No.</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>답변 상태</th>
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
	                    		<td><%= b.getBrd_date() %></td>
	                    		<td class="waitCondition"><%= b.getBrd_qa_wait() %></td>
                    		</tr>
                    	<% } %>
                    <% } %>
                </table>
            </div>
            <div class="pagingBtnDiv">
            	<!-- 처음으로 -->
           		<button onclick="location.href='<%= request.getContextPath() %>/manager/QAList?currentPage=1'"> &lt;&lt; </button>
            	
            	<!-- 이전으로 -->
            	<% if(pi.getCurrentPage() == 1) { %>
            		<button disabled> &lt; </button>
            	<% } else { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/QAList?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
            	<% } %>
            	
            	<!-- 10개 페이지 목록 -->
            	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
            		<% if(p == pi.getCurrentPage()) { %>
            			<button style="background:rgb(255,192,0); color:black;" disabled> <%= p %></button>
            		<% } else { %>
            			<button onclick="location.href='<%= request.getContextPath() %>/manager/QAList?currentPage=<%= p %>'"><%= p %></button>
            		<% } %>
            	<% } %>
            	
            	<!-- 다음으로 -->
            	<% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
            		<button disabled> &gt; </button>
            	<% } else { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/QAList?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
            	<% } %>
            	
            	<!-- 맨 끝으로 -->
           		<button onclick="location.href='<%= request.getContextPath() %>/manager/QAList?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
            </div>
        </div>
    </section>
    <script>
	    $(function(){
			var count = $("#count");
			var countWait = $("#countWait");
			var countComplete = $("#countComplete");
			
			$.ajax({
				url : "<%= request.getContextPath() %>/manager/qaCount",
				type : "post",
				dataType : "json",
				success : function(data){
					count.text(data[0]);
					countWait.text(data[1]);
					countComplete.text(data[2]);
					
				},
				error : function(e) {
					console.log(e);
				}
			});
			
			$('.waitCondition:contains("대기")').css('color', '#CE2E00').css('font-weight', 'bold');
			$('.waitCondition:contains("완료")').css('color', '#0059A6').css('font-weight', 'bold');
		});
	    
	    $(".tableDiv table td").mouseenter(function(){
			$(this).parent().css({"background":"#FFDD71", "cursor":"pointer", "color":"rgb(64,64,64)"});
		}).mouseout(function(){
			$(".tableDiv tr:nth-child(odd)").css({"background":"lightgray", "color":"rgb(64,64,64)"});
			$(".tableDiv tr:nth-child(even)").css({"background":"none" , "color":"white"});
			$(".tableDiv tr:first-child").css({"background":"#fff" , "color":"black"});
		}).click(function() {
			var num = $(this).parent().children().eq(0).text();
			var root = '<%= request.getContextPath() %>/manager/qaDetail?brdNo=' + num;
			window.open(root,'popup', 'width=550px, height=760px');
		});
    </script>

</body>
</html>