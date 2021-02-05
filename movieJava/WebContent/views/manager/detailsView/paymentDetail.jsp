<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="payment.model.vo.Payment" %>
<%
	Payment pay = (Payment)request.getAttribute("payment");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sideMenu CSS -->
    <link href="<%= request.getContextPath() %>/resources/css/content1_movie.css" rel="stylesheet" type="text/css">
    <title>컨텐츠 관리 - 회원 관리</title>
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
            color: white;
            font-size: 20px;
            font-weight: bold;
        }

        .paymentDetails {
            margin: 30px;
            margin-bottom: 10px;
            width: 80%;
        }

        .buttonDiv {
            width: 65%;
            padding: 10px 30px;
            box-sizing: border-box;
            float: left;
        }

        .backDiv {
            text-align: right;
            padding-top: 10px;
            width: 20%;
            box-sizing: border-box;
            float: left;
        }

        .paymentDetails table {
            width: 100%;
            text-align: center;
            color: white;
            border: 2px solid lightgray;
            border-left: none;
            border-right: none;
        }

        .paymentDetails th {
            width: 15%;
            padding: 15px 5px;
            text-align: right;
            border-bottom: 1px dashed lightgray;
            /* border : 1px dotted lightgray; */
        }

        .paymentDetails td {
            text-align: justify;
            padding-left: 20px;
            border-bottom: 1px dashed lightgray;
        }

        .paymentDetails tr:last-of-type th,
        .paymentDetails tr:last-of-type td {
            border-bottom: none;
        }

        button {
            width: 130px;
            height: 35px;
            font-weight: bold;
            background: rgb(255, 192, 0);
            border-radius: 8px;
            border-color: rgb(255, 192, 0);
            outline : none;
        }

        button:hover {
            cursor: pointer;
        }

        .div-last {
            width: 40%;
            height: 150px;
            margin: 20px;
            margin-left: 40px;

            background: rgb(224, 224, 224);
            box-shadow: 5px 5px 15px 3px lightgray;

            text-align: center;

            display: none;
        }

        .div-last>p {
            padding-top: 20px;
            font-size: 18px;
            font-weight: bold;
        }

        .div-last input[type=text] {
            height: 30px;
            text-align: center;
        }

        .div-last input:not([type=text]) {
            cursor: pointer;
        }

        .div-last input[type=submit], .div-last input[type=button] {
            width: 100px;
            height: 35px;
            font-weight: bold;
            background: rgb(64, 64, 64);
            border-radius: 8px;
            border-color: rgb(64, 64, 64);
            color: white;
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
            <div class="titleDiv">
                <p>결제 상세 정보</p>
            </div>
            <hr>
            <div class="paymentDetails">
                <table>
                    <tr>
                        <th>주문 번호 : </th>
                        <td><span><%= pay.getOrd_no() %></span></td>
                    </tr>
                    <tr>
                        <th>아이디 : </th>
                        <td><span><%= pay.getMem_id() %></span></td>
                    </tr>
                    <tr>
                        <th>주문자명 : </th>
                        <td><span><%= pay.getMem_name() %></span></td>
                    </tr>
                    <tr>
                        <th>주문상품 : </th>
                        <td><span><%= pay.getSt_title() %></span></td>
                    </tr>
                    <tr>
                        <th>주문수량 : </th>
                        <td><span><%= pay.getOrd_quantity() %></span></td>
                    </tr>
                    <tr>
                        <th>결제 금액 : </th>
                        <td><span><%= pay.getPrice() %></span></td>
                    </tr>
                    <tr>
                        <th>결제 카드 : </th>
                        <td><span><%= pay.getPayCard() %></span></td>
                    </tr>
                    <tr>
                        <th>결제일 : </th>
                        <td><span><%= pay.getPayDate() %></span></td>
                    </tr>
                </table>
            </div>
            <div class="backDiv">
                <button onclick="history.back()">목록으로</button>
            </div>
            <br clear="both">
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
			
		});
	    
    </script>
</body>
</html>