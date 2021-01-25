<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.Member, manager.model.vo.PageInfo" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sideMenu CSS -->
    <link href="<%= request.getContextPath() %>/resources/css/content1_movie.css" rel="stylesheet" type="text/css">
    <title>회원 관리</title>
    <style>
        .contentWrap {
            box-sizing: border-box;
            display: inline-block;
            width: 85%;
            height: 100%;
            position: relative;
        }

        .radioDiv, .searchDiv {
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
        .radioLabel {
            color : white;
            font-weight: 100;
        }
        .searchDiv input {
            float: left;
        }
        .searchDiv img:hover {
            cursor: pointer;
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
        	width : 150px;
        }
        
        .tableDiv th:nth-child(3) {
        	width : 150px;
        }
        
        .tableDiv th:nth-child(4) {
        	width : 200px;
        }
        
        .tableDiv th:nth-child(5) {
        	width : 200px;
        }
        
        .tableDiv th:nth-child(6) {
        	width : 80px;
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
                <p class="subText" id="p-sub1">회원 관리</p>
                <p class="subText" id="p-sub2">등록 된 회원 수</p>
                <p class="subText" id="p-sub3">
                    <span id="countMember">000</span>명
                </p>
                <hr>
                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
            </div>
        </div>
        <div class="contentWrap">
            <div class="radioDiv">
                <form>
                    <input type="radio" name="category" value="name" id="name" checked>
                    <label for="name" class="radioLabel">이름</label>&nbsp;&nbsp;
                    <input type="radio" name="category" value="userId" id="userId">
                    <label for="userId" class="radioLabel">아이디</label>&nbsp;&nbsp;
                    <input type="radio" name="category" value="userPhone" id="userPhone">
                    <label for="userPhone" class="radioLabel">핸드폰<small>(뒤 4자리)</small></label>
                </form>
            </div>
            <hr>
            <div class="searchDiv">
                <form>
                    <input type="text" name="search" placeholder="검색할 키워드 입력" size="30" style="height: 30px;">
                    <div class="searchImg">
                        <img src="<%= request.getContextPath() %>/images/search.png" style="width:33px; height:33px;">
                    </div>
                </form>
            </div>
            <div class="tableDiv">
                <!-- 검색 결과 출력 -->
                <table>
                    <tr>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>휴대폰</th>
                        <th>이메일</th>
                        <th>상태</th>
                    </tr>
                    <% if(list.isEmpty()) { %>
                    	<tr>
                    		<td colspan="6">조회 된 회원이 없습니다.</td>
                    	</tr>
                    <% } else {%>
                    	<% for(Member m : list) { %>
                    		<tr>
                    			<td><%= m.getMemNo() %></td>
                    			<td><%= m.getMemId() %></td>
                    			<td><%= m.getMemName() %></td>
                    			<td><%= m.getPhone() %></td>
                    			<td><%= m.getEmail() %></td>
                    			<td><%= m.getMemStatus() %></td>
                    		</tr>
                    	<% } %>
                    <% } %>
                </table>
            </div>
            <div class="pagingBtnDiv">
            	<!-- 처음으로 -->
            	<button onclick="location.href='<%= request.getContextPath() %>/manager/memberList?currentPage=1'"> &lt;&lt; </button>
            	
            	<!-- 이전으로 -->
            	<% if(pi.getCurrentPage() == 1) { %>
            		<button disabled> &lt; </button>
            	<% } else { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/memberList?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
            	<% } %>
            	
            	<!-- 10개 페이지 목록 -->
            	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
            		<% if(p == pi.getCurrentPage()) { %>
            			<button style="background:rgb(255,192,0); color:black;" disabled> <%= p %></button>
            		<% } else { %>
            			<button onclick="location.href='<%= request.getContextPath() %>/manager/memberList?currentPage=<%= p %>'"><%= p %></button>
            		<% } %>
            	<% } %>
            	
            	<!-- 다음으로 -->
            	<% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
            		<button disabled> &gt; </button>
            	<% } else { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/memberList?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
            	<% } %>
            	
            	<!-- 맨 끝으로 -->
            	<button onclick="location.href='<%= request.getContextPath() %>/manager/memberList?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
            </div>
        </div>
    </section>
	<script>
		$(function(){
			var countMember = $("#countMember");
			
			$.ajax({
				url : "<%= request.getContextPath() %>/manager/memberCount",
				type : "post",
				success : function(data){
					countMember.text(data);
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
				location.href="<%= request.getContextPath() %>/manager/memberDetail?memNo=" + num;
			});
		});
	</script>
</body>
</html>