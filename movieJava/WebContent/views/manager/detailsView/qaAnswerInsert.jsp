<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board, qaAnswer.model.vo.QAAnswer" %>
<%
	Board b = (Board)request.getAttribute("board");
	QAAnswer qa = (QAAnswer)request.getAttribute("qa");
	
	String answer = "";
	
	if(qa != null) {
		answer = (qa.getAnsContent()).replace("\n", "<br>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%= request.getContextPath() %>/resources/css/reset.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <title>문의 답변</title>
    <style>
        body {
            text-align: center;
            background-color: rgb(64,64,64);
            margin : 8px auto;
        }

        .contentSection {
            box-sizing: border-box;
            display: inline-block;
            width: 500px;
            height: 730px;
            margin : 0 auto;
            border: 3px solid rgb(255,192,0);
            border-radius: 10px;
            background : #fff;
        }

        .titleDiv {
            margin: 20px auto;
            width: 100%;
            text-align: center;
        }

        .titleDiv > span::before {
            width : 40px;
            height: 1px;
            background: #dadada;
            position: absolute;
            top: 70px;
            left: 50%;
            margin-left: -20px;
            content: "";
        }

        #title {
            color : #0065e3;
            font-weight: bold;
        }

        .insertDiv {
            margin : 30px 0 0 0;
        }

        .insertDiv input {
            outline: none;
            width: 335px;
            height: 10px;
            padding: 15px;

            border: 1px solid #e7e7e7;
            transition: border 0.3s;
            cursor: pointer;
        }

        .insertDiv input:focus {
            border: 1px solid #1c81ff;
        }

        .pDiv {
            text-align: left;
            margin : 10px 0 0 10px;
        }
        
        .insertDiv p {
            margin-bottom: 5px;
        }

        .insertTitle {
            font-size: 14px;
            font-weight: bold;
        }
        
        .tableDiv table {
        	border-collapse : collapse;
        	font-size : 12px;
        }
        
        .tableDiv table thead {
        	text-align : center;
        	font-weight : bold;
        }
        
        .tableDiv thead tr:first-child {
        	height : 40px;
        	line-height : 40px;
        	border-top : 1px solid rgb(64,64,64);
        	border-bottom : 1px solid rgb(64,64,64);
        }
        
        .tableDiv thead tr:first-child td:nth-child(1) {
        	width : 230px;
        }
        
        .tableDiv thead tr:first-child td:nth-child(even) {
        	background : lightgray;
        }
        
        .tableDiv textarea {
        	width : 435px;
        	outline : none;
        	padding : 15px;
        	
        	transition: background-color 0.3s, border-color 0.3s;
        }
        
        .tableDiv textarea:focus {
        	border: 1px solid #1b7df8;
        }

        #qaContent {
            width : 435px;
            padding : 15px;
            min-height : 225px;
            overflow-y : scroll;

            border: 1px solid #e7e7e7;
            transition: border 0.3s;
        }

		.btnDiv {
			text-align : left;
			margin : 10px 0 0 10px;
		}
		
        .btnDiv button {
            width: 467px;
            height: 50px;
            vertical-align: middle;
            cursor: pointer;
            background: #1c81ff;
            border: 1px solid #1b7df8;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .btnDiv button:hover {
            background-color: #0065e3;
            border-color: #0061db;
        }


    </style>
    <% if(request.getAttribute("msg") != null) { %>
    	<script>
    		alert('<%= request.getAttribute("msg") %>');
    		window.opener.location.reload();
    		window.close();
    	</script>
    <%
    	request.removeAttribute("msg");
    	}
    %>
</head>
<body onbeforeunload="refreshAndClose();">
    <section class="contentSection">
        <div class="titleDiv">
            <span id="title">답변 등록</span>
        </div>

        <div class="insertDiv">
            <form id="answerInsertForm" action="<%= request.getContextPath() %>/manager/answerInsert" method="post">
            <br>
                <div class="tableDiv pDiv">
                	<table>
                		<thead>
	                		<tr>
	                			<td><%= b.getBrd_title() %></td>
	                			<td>작성자</td>
	                			<td><%= b.getBrd_writer() %></td>
	                			<td>작성일</td>
	                			<td><%= b.getBrd_modify() %></td>
	                		</tr>
                		</thead>
                		<tbody>
	                		<tr>
	                			<td colspan="5">
	                				<p id="qaContent"><%= (b.getBrd_content()).replace("\n", "<br>") %></p>
	                			</td>
	                		</tr>
	                		<tr>
	                			<td colspan="5">
	                				<textarea rows="15" cols="5" id="qaAnswer" name="qaAnswer" style="resize:none"><%= answer %></textarea>
	                				<input type="hidden" name="brdNo" value="<%= b.getBrd_no() %>">
	                			</td>
	                		</tr>
                		</tbody>
                	</table>
                </div>
                <div class="btnDiv">
                    <button id="insertBtn" onclick="onSubmit();">
                    	<% if(qa == null) { %>
                    		답변 등록
                    	<% } else { %>
                    		답변 수정
                    	<% } %>
                    </button>
                </div>
            </form>
        </div>
    </section>
    <script>
        function onSubmit() {
            var qaAnswer = document.getElementById("qaAnswer");

            if (qaAnswer.value == "") {
                alert('답변을 입력해주세요.');
                qaAnswer.focus();
                return;
            }

            $("#answerInsertForm").submit();
        }
        
        function refreshAndClose(){
       		window.opener.location.reload();
       		window.close();
        }
    </script>
</body>
</html>