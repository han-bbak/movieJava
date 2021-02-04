<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, payment.model.vo.Payment, manager.model.vo.*, java.text.SimpleDateFormat, java.util.Date"%>
<%
	ArrayList<Payment> list = (ArrayList<Payment>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	
	Search s = (Search)request.getAttribute("search");
	String[] search = new String[2];
	String searchCondition = "";
	String[] checked = new String[4];
	Date[] date = new Date[2];
	checked[0] = "checked";
	if(s != null) {
		if(s.getSearch() != "") {
			search = s.getSearch().split(",");
		}
		searchCondition = s.getSearchCondition();
		if(searchCondition.equals("one")) {
			checked[0] = "checked";
		} else if(searchCondition.equals("three")) {
			checked[1] = "checked";
			checked[0] = "";
		} else if(searchCondition.equals("six")){
			checked[2] = "checked";
			checked[0] = "";
		} else {
			checked[3] = "checked";
			checked[0] = "";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sideMenu CSS -->
    <link href="<%= request.getContextPath() %>/resources/css/content1_movie.css" rel="stylesheet" type="text/css">
    <title>결제 관리</title>
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
        #submitBtn {
            width: 60px;
            height: 30px;
            font-weight: bold;
            background : rgb(255,192,0);
            border-radius: 8px;
            border-color: rgb(255,192,0);
            cursor : pointer;
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
                <p class="subText" id="p-sub1">결제 관리</p>
                <p class="subText" id="p-sub2">총 결제 건 수</p>
                <p class="subText" id="p-sub3">
                    <span id="countPay1">0</span>건
                </p>
                <p class="subText" id="p-sub4">총 결제 금액</p>
                <p class="subText" id="p-sub5">
                    <span id="countPay2">1,000,000</span>원
                </p>
                <hr>
                <ul>
                    <li><a href="content3_payment.jsp">결제 관리</a></li>
                    <!-- <li><a href="content3_refund.jsp">환불 관리</a></li> -->
                </ul>

                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
            </div>
        </div>
        <div class="contentWrap">
            <div class="radioDiv">
                <form method="POST" id="searchForm" action="<%= request.getContextPath() %>/manager/paymentList">
                    <input type="radio" name="period" value="one" id="one" <%= checked[0] %>>
                    <label for="one" class="radioLabel">이번 달</label>&nbsp;&nbsp;
                    <input type="radio" name="period" value="three" id="three" <%= checked[1] %>>
                    <label for="three" class="radioLabel">3개월</label>&nbsp;&nbsp;
                    <input type="radio" name="period" value="six" id="six" <%= checked[2] %>>
                    <label for="six" class="radioLabel">6개월</label>&nbsp;&nbsp;
                    <input type="radio" name="period" value="selection" id="selection" <%= checked[3] %>>
                    <input type="date" id="period-start" name="period-start" value="<%= search[0] %>">&nbsp;
                    <label style="color:white"> ~</label>&nbsp;
                    <input type="date" id="period-end" name="period-end" value="<%= search[1] %>">&nbsp;&nbsp;
                    <button type="button" id="submitBtn" onclick="onSubmit();">조회</button>
                </form>
            </div>
            <hr>
            <div class="tableDiv">
                <!-- 검색 결과 출력 -->
                <table>
                    <tr>
                        <th>주문 번호</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>상품명</th>
                        <th>구매 금액</th>
                    </tr>
                    <% if(list.isEmpty()) { %>
                    	<tr>
                    		<td colspan="5">조회 된 구매 이력이 없습니다.</td>
                    	</tr>
                    <% } else {%>
                    	<% for(Payment p : list) { %>
                    		<tr>
                    			<td><%= p.getOrd_no() %></td>
                    			<td><%= p.getMem_id() %></td>
                    			<td><%= p.getMem_name() %></td>
                    			<td><%= p.getSt_title() %></td>
                    			<td><%= p.getPrice() %></td>
                    		</tr>
                    	<% } %>
                    <% } %>
                </table>
            </div>
            <div class="pagingBtnDiv">
            	<!-- 처음으로 -->
            	<% if(s == null) { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/paymentList?currentPage=1'"> &lt;&lt; </button>
            	<% } else { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/paymentList?currentPage=1&period=<%= searchCondition %>&period-start=<%= search[0] %>&period-end=<%= search[1] %>'"> &lt;&lt; </button>
            	<% } %>
            	<!-- 이전으로 -->
            	<% if(pi.getCurrentPage() == 1) { %>
            		<button disabled> &lt; </button>
            	<% } else if(s == null) { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/paymentList?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
            	<% } else {%>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/paymentList?currentPage=<%= pi.getCurrentPage() - 1 %>&period=<%= searchCondition %>&period-start=<%= search[0] %>&period-end=<%= search[1] %>'"> &lt; </button>
            	<% } %>
            	
            	<!-- 10개 페이지 목록 -->
            	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
            		<% if(p == pi.getCurrentPage()) { %>
            			<button style="background:rgb(255,192,0); color:black;" disabled> <%= p %></button>
            		<% } else if(s == null) { %>
            			<button onclick="location.href='<%= request.getContextPath() %>/manager/paymentList?currentPage=<%= p %>'"><%= p %></button>
            		<% } else { %>
            			<button onclick="location.href='<%= request.getContextPath() %>/manager/paymentList?currentPage=<%= p %>&period=<%= searchCondition %>&period-start=<%= search[0] %>&period-end=<%= search[1] %>'"><%= p %></button>
            		<% } %>
            	<% } %>
            	
            	<!-- 다음으로 -->
            	<% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
            		<button disabled> &gt; </button>
            	<% } else if(s == null) { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/paymentList?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
            	<% } else {%>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/paymentList?currentPage=<%= pi.getCurrentPage() + 1 %>&period=<%= searchCondition %>&period-start=<%= search[0] %>&period-end=<%= search[1] %>'"> &gt; </button>
            	<% } %>
            	
            	<!-- 맨 끝으로 -->
            	<% if(s == null) { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/paymentList?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
            	<% } else { %>
            		<button onclick="location.href='<%= request.getContextPath() %>/manager/paymentList?currentPage=<%= pi.getMaxPage() %>&period=<%= searchCondition %>&period-start=<%= search[0] %>&period-end=<%= search[1] %>'"> &gt;&gt; </button>
            	<% } %>
            </div>
        </div>
    </section>
    <script>
	    $(function(){
			var countPay1 = $("#countPay1");
			var countPay2 = $("#countPay2");
			
			$.ajax({
				url : "<%= request.getContextPath() %>/manager/payCount",
				type : "post",
				dataType : "json",
				success : function(data){
					countPay1.text(data[0]);
					countPay2.text(data[1]);
					
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
				location.href="<%= request.getContextPath() %>/manager/paymentDetail?ord_no=" + num;
			});
		});
	    
	    function onSubmit() {
	    	console.log($("#selection").prop('checked'));
	    	console.log($("#period-start").val());
	    	console.log($("#period-end").val());
	    	if($("#selection").prop('checked')) {
	    		if($("#period-start").val() == "") {
	    			alert('시작 기간을 설정해주세요');
	    			return;
	    		}
	    		
	    		if($("#period-end").val() == "") {
	    			alert('끝 기간을 설정해주세요');
	    			return;
	    		}
	    	}
	    	
	    	$("#searchForm").submit();
	    }
    </script>

</body>
</html>