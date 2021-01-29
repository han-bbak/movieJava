<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.Board" %>
<%
	Board b = (Board)request.getAttribute("board");
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
            color: white;
            font-size: 20px;
            font-weight: bold;
        }

        .netflixDetails {
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

        .netflixDetails table {
            width: 100%;
            text-align: center;
            color: white;
            border-collapse : collapse;
        }

        .netflixDetails th {
            width: 15%;
            padding: 15px 5px;
            text-align: right;
        }

        .netflixDetails td {
            text-align: justify;
            padding-left: 20px;
        }
        
        .netflixDetails thead {
        	background : lightgray;
        	color : black;
        }
        
        .netflixDetails tbody p {
        	min-height : 500px;
        	overflow-y: scroll;
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
        

    </style>
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
                <p>게시글 상세 정보</p>
            </div>
            <hr>
            <div class="netflixDetails">
                <table>
                	<thead>
	                	<tr>
	                		<th>번호</th>
	                		<td><%= b.getBrd_no() %></td>
	                		<th>작성일</th>
	                		<td><%= b.getBrd_modify() %></td>
	                		<th>조회수</th>
	                		<td><%= b.getBrd_cnt() %></td>
	                	</tr>
	                	<tr>
	                		<td colspan="4" style="text-align:center"><b><%= b.getBrd_title() %></b></td>
	                		<th>작성자</th>
	                		<td><%= b.getBrd_writer() %></td>
	                	</tr>
	                </thead>
	                <tbody>
	                	<tr>
	                		<td colspan="6">
	                			<p id="brdContent"><%= (b.getBrd_content()).replace("\n", "<br>") %></p>
	                		</td>
	                	</tr>
	                </tbody>
                </table>
            </div>
            <form id="removeForm" method="post" action="<%= request.getContextPath() %>/manager/boardRemove">
	            <div class="buttonDiv">
	                <button type="button" id="removeBoardBtn" onclick="onSubmit();">삭제</button>
	                <input type="hidden" name="removeBoardNo" value="<%= b.getBrd_no() %>">
	                <input type="hidden" name="removeBoardCategory" value="<%= b.getBrd_category() %>">
	            </div>
            </form>
            <div class="backDiv">
                <button onclick="history.back()">목록으로</button>
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
		});
	    
	    function onSubmit() {
	    	if(confirm("해당 게시글을 삭제하시겠습니까?")) {
	    		$("#removeForm").submit();
	    	}
	    }
	    
    </script>
</body>
</html>