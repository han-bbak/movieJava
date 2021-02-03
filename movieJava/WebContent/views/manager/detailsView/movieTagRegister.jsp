<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, manager.model.vo.*, movieTag.model.vo.MovieTag, tag.model.vo.Tag, movie.model.vo.MovieVO" %>
<%
	ArrayList<Tag> list = (ArrayList<Tag>)request.getAttribute("list");
	MovieVO movie = (MovieVO)request.getAttribute("movie");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sideMenu CSS -->
    <link href="<%= request.getContextPath() %>/resources/css/content1_movie.css" rel="stylesheet" type="text/css">
    <title>컨텐츠 관리 - 태그 관리</title>
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
        .subPTag {
            color:white;
            font-size: 15px;
            font-weight: bold;
        }
        .tableDiv {
            color: white;
            margin-left: 80px;
            min-height : 500px;
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

        .tableDiv tr:first-child td:nth-child(2) {
            width : 100px;
        }

		.tableDiv tr:first-child td:nth-child(3) {
            width : 300px;
        }
		
        #movieThumbnail {
        	width : 350px;
        	height : 500px;
        }
        
        .tagOneSpan {
        	margin : 0;
        	padding : 0;
        }
        
        .tagDiv {
            margin : 30px;
        }

        .tag {
            width: 150px;
            height: 30px;
            font-size: 12px;
            font-weight: bold;
            margin : 4px;
            background : rgb(255,192,0);
            border-radius: 8px;
            border-color: rgb(255,192,0);
        }

        .tag:hover {
            cursor: pointer;
        }
        
        #addBtn {
            width: 80px;
            height: 35px;
            font-size: 12px;
            font-weight: bold;
            color : white;
            background : #0059A6;
            border-radius: 8px;
            border-color: #0059A6;
        }

    </style>
</head>
<body>
	<%@ include file="/views/common/manager_main.jsp" %>
    <section class="contentSection">
        <div class="contentMenuWrap">
            <div class="subTitle">
                <p class="subText" id="p-sub1">태그 관리</p>
                <p class="subText" id="p-sub2">사용중인 태그 수</p>
                <p class="subText" id="p-sub3">
                    <span id="countTag">000</span>건
                </p>
                <hr>
                <ul>
                    <li><a href="<%= request.getContextPath() %>/manager/movieTag">태그 미설정 영화</a></li>
                    <li><a href="<%= request.getContextPath() %>/manager/tagList">태그 추가/삭제</a></li>
                </ul>

                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
            </div>
        </div>
        <div class="contentWrap">
            <div class="titleDiv">
                <p>태그 미등록 영화 : <span id="movieNotTagCount">000</span> 건</p>
            </div>
            <hr>
            <div class="tagDiv">
                <p class="subPTag">태그 목록</p>
                <div class="tagList" id="tagList">
                	<% if(list != null) { %>
                		<% for(int i = 0; i < list.size(); i++) { %>
                		<span class="tagOneSpan">
                			<input type="hidden" name="tagCode" value="<%= list.get(i).getTagNo() %>">
                			<input type="button" class="tag" name="tagName" value="<%= list.get(i).getTagName() %>">
                		</span>
                		<% } %>
                	<% } else {%>
                		<span>사용중인 태그가 없습니다.</span>
                	<% } %>
                    <!-- <button class="tag">#<span>신작</span></button>
                    <button class="tag">#<span>종료예정작</span></button> -->
                </div>
            </div>
            <div class="tableDiv">
                <table>
                    <tr>
                        <td rowspan="3"><img id="movieThumbnail" src="<%= movie.getM_image() %>"></td>
                        <td>영화 코드</td>
                        <td><%= movie.getM_code() %></td>
                    </tr>
                    <tr>
                    	<td>영화명</td>
                    	<td><%= movie.getM_title() %></td>
                    </tr>
                    <tr>
                    	<td>장르</td>
                    	<td><%= movie.getM_genre() %></td>
                    </tr>
                </table>
            </div>
            <br>
            <div class="tagDiv">
            	<p class="subPTag">등록할 태그</p>
	            <div id="addTagDiv">
	            	
	            </div>
	            <br>
	            <input type="button" id="addBtn" value="등록">
	            <input type="hidden" id="movieCode" value="<%= movie.getM_code() %>">
            </div>
        </div>
    </section>
    <script>
	    $(function(){
	    	var countTag = $("#countTag");
			var movieNotTagCount = $("#movieNotTagCount");
			
			$.ajax({
				url : "<%= request.getContextPath() %>/manager/movieTagCount",
				type : "post",
				dataType : "json",
				success : function(data){
					countTag.text(data[0]);
					movieNotTagCount.text(data[1]);
				},
				error : function(e) {
					console.log(e);
				}
			});
			
			$("#addBtn").click(function(){
    			if(confirm("해당 태그를 영화에 등록 하시겠습니까?")) {
	    			var tagIdInput = $("#addTagDiv").children().children().toArray();
	    			var tagArr = new Array();
	    			for(var i in tagIdInput) {
	    				if(i % 2 == 0) {
	    					tagArr.push(tagIdInput[i].value);
	    				}
	    				tagIdInput[i].style.display = "none";
	    			}
	    			
	    			var tagId = tagArr.join(",");
	    			var movieCode = $("#movieCode").val();
	    			
	    			$.ajax({
	    				url : "<%= request.getContextPath() %>/manager/addMovieTag",
	    				type : "post",
	    				data : {tagId : tagId, movieCode : movieCode},
	    				success : function(data) {
	    					if(data != null) {
	    						alert(data + '개의 태그를 등록했습니다.');
	    						location.href="<%= request.getContextPath() %>/manager/movieTag";
	    					} else {
	    						alert('태그 등록에 실패하였습니다.');
	    					}
	    				},
	    				error : function(e) {
	    					console.log(e);
	    				}
	    			});
    			}
    			
    		});
		});
	    
	    var btn = document.getElementsByClassName("tag");

        var tagList = document.getElementById("tagList");
        var addTagDiv = document.getElementById("addTagDiv");

        for(var i in btn) {
        	btn[i].onclick = function() {
                if(this.parentElement.parentElement == tagList) {
                	addTagDiv.append(this.parentElement);
                } else {
                	tagList.append(this.parentElement);
                }
            }
        }
    </script>
</body>
</html>