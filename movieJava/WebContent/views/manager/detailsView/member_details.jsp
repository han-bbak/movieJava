<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("member");

	String birth = m.getMemBirth().substring(0, 2) + "년 " + m.getMemBirth().substring(2, 4) + "월 " + m.getMemBirth().substring(4) + "일";
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

        .memberDetails {
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

        .memberDetails table {
            width: 100%;
            text-align: center;
            color: white;
            border: 2px solid lightgray;
            border-left: none;
            border-right: none;
        }

        .memberDetails th {
            width: 15%;
            padding: 15px 5px;
            text-align: right;
            border-bottom: 1px dashed lightgray;
            /* border : 1px dotted lightgray; */
        }

        .memberDetails td {
            text-align: justify;
            padding-left: 20px;
            border-bottom: 1px dashed lightgray;
        }

        .memberDetails tr:last-of-type th,
        .memberDetails tr:last-of-type td {
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

        #plus,
        #activeBtn {
            background: #0059A6;
            border-color: #0059A6;
            color: white;
        }

        #minus,
        #stopBtn {
            background: #902000;
            border-color: #902000;
            color: white;
        }

        #stop {
            background: rgb(64, 64, 64);
            border-color: white;
            color: white;
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

        #stopMemberDiv {
            height: 110px;
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
                    <span id="countMember">000</span>건
                </p>
                <hr>
                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
            </div>
        </div>
        <div class="contentWrap">
            <div class="titleDiv">
                <p>회원 상세 정보</p>
            </div>
            <hr>
            <div class="memberDetails">
                <table>
                    <tr>
                        <th>이름 : </th>
                        <td><span><%= m.getMemName() %></span></td>
                    </tr>
                    <tr>
                        <th>아이디 : </th>
                        <td><span><%= m.getMemId() %></span></td>
                    </tr>
                    <tr>
                        <th>생년월일 : </th>
                        <td><span><%= birth %></span></td>
                    </tr>
                    <tr>
                        <th>핸드폰 : </th>
                        <td><span><%= m.getPhone() %></span></td>
                    </tr>
                    <tr>
                        <th>이메일 : </th>
                        <td><span><%= m.getEmail() %></span></td>
                    </tr>
                    <tr>
                        <th>주소 : </th>
                        <td><span><%= (m.getAddress()).replace(",", " ") %></span></td>
                    </tr>
                    <tr>
                        <th>회원상태 : </th>
                        <td><span id="statusSpan"><%= (m.getMemStatus().equals("Y") ? "활동" : "정지") %></span></td>
                    </tr>
                    <tr>
                        <th>가입일 : </th>
                        <td><span><%= m.getEntDate() %></span></td>
                    </tr>
                    <tr>
                        <th>포인트 : </th>
                        <td><span id="pointSpan"><%= m.getPoint() %></span> 포인트</td>
                    </tr>
                </table>
            </div>
            <div class="buttonDiv">
                <button id="plus" onclick="showDiv(this);">포인트 추가</button>
                <button id="minus" onclick="showDiv(this);">포인트 차감</button>
                <button id="stop" onclick="showDiv(this);">회원 정지</button>
            </div>
            <div class="backDiv">
                <button onclick="history.back()">목록으로</button>
            </div>
            <br clear="both">
            <div class="div-last" id="addPointDiv">
                <p>포인트 추가</p>
                    <input type="text" name="addPoint" id="addPoint" size="30"><br><br>
                    <input type="button" id="addPointBtn" value="확인">
                    <input type="button" onclick="cancelDiv(this);" value="취소">
            </div>
            <div class="div-last" id="removePointDiv">
                <p>포인트 차감</p>
                    <input type="text" name="removePoint" id="removePoint" size="30"><br><br>
                    <input type="button" id="removePointBtn" value="확인">
                    <input type="button" onclick="cancelDiv(this);" value="취소">
            </div>
            <div class="div-last" id="stopMemberDiv">
                <p>회원 정지</p>
                    <input type="button" value="활동" name="active" id="activeBtn">
                    <input type="button" value="정지" name="stop" id="stopBtn">
                    <input type="button" onclick="cancelDiv(this);" value="취소">
            </div>
        </div>
    </section>

    <script>
	    $(function(){
			var countMember = $("#countMember");
			var stopBtn = $("#stopBtn");
			
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
			
		});
	    
	    $("#addPointBtn").click(function(){
	    	var addPoint = $("#addPoint");
			
	    	$.ajax({
	    		url : "<%= request.getContextPath() %>/manager/memberChangePoint",
	    		type : "post",
	    		data : {memNo : <%= m.getMemNo() %>, addPoint : addPoint.val()},
	    		success : function(data){
	    			if(data != null) {
	    				addPoint.val("");
    					$("#pointSpan").text(data);
    					$("#addPointDiv").css("display", "none");
	    			}
	    		},
	    		error : function(e){
	    			console.log(e);
	    		}
	    	});
	    });
	    
	    $("#removePointBtn").click(function(){
	    	var removePoint = $("#removePoint");
	    	
	    	$.ajax({
	    		url : "<%= request.getContextPath() %>/manager/memberChangePoint",
	    		type : "post",
	    		data : {memNo : <%= m.getMemNo() %>, removePoint : removePoint.val()},
	    		success : function(data){
	    			if(data != null) {
	    				removePoint.val("");
    					$("#pointSpan").text(data);
    					$("#removePointDiv").css("display", "none");
	    			}
	    		},
	    		error : function(e){
	    			console.log(e);
	    		}
	    	});
	    });
	    
	    $("#activeBtn").click(function(){
	    	$.ajax({
	    		url : "<%= request.getContextPath() %>/manager/memberStatusChange",
	    		type : "post",
	    		data : {memNo : <%= m.getMemNo() %>, status : "Y"},
	    		success : function(data) {
	    			if(data != null) {
	    				$("#statusSpan").text(data);
	    				$("#stopMemberDiv").css("display", "none");
	    			}
	    		},
	    		error : function(e){
	    			console.log(e);
	    		}
	    	});
	    });
	    
	    $("#stopBtn").click(function(){
	    	$.ajax({
	    		url : "<%= request.getContextPath() %>/manager/memberStatusChange",
	    		type : "post",
	    		data : {memNo : <%= m.getMemNo() %>, status : "N"},
	    		success : function(data) {
	    			if(data != null) {
	    				$("#statusSpan").text(data);
	    				$("#stopMemberDiv").css("display", "none");
	    			}
	    		},
	    		error : function(e){
	    			console.log(e);
	    		}
	    	});
	    });
	    
        function showDiv(value) {
            var divBox = document.getElementsByClassName("div-last");

            for (var i = 0; i < divBox.length; i++) {
                divBox[i].style.display = "none";
            }

            if (value == document.getElementById("plus")) {
                document.getElementById("addPointDiv").style.display = "block";
            } else if (value == document.getElementById("minus")) {
                document.getElementById("removePointDiv").style.display = "block";
            } else if (value == document.getElementById("stop")) {
                document.getElementById("stopMemberDiv").style.display = "block";
            }
        }

        function cancelDiv(value) {
            var divBox = document.getElementsByClassName("div-last");

            for(var i = 0; i < divBox.length; i++) {
                divBox[i].style.display = "none";
            }
        }
    </script>
</body>
</html>