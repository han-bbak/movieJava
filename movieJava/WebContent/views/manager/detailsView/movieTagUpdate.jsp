<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, manager.model.vo.*, movieTag.model.vo.MovieTag, tag.model.vo.Tag, movie.MovieVO" %>
<%
	ArrayList<MovieTag> movieTag = (ArrayList<MovieTag>)request.getAttribute("movieTag");
	MovieVO movie = (MovieVO)request.getAttribute("movie");
	ArrayList<Tag> tag = (ArrayList<Tag>)request.getAttribute("tag");
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
            min-height : 450px;
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
        	width : 250px;
        	height : 400px;
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
        
        #addBtn, #removeBtn {
            width: 80px;
            height: 35px;
            font-size: 12px;
            font-weight: bold;
            color : white;
            background : #0059A6;
            border-radius: 8px;
            border-color: #0059A6;
        }
        
        #removeBtn {
        	background: #902000;
            border-color: #902000;
            color: white;
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
                <p>태그 수정</p>
            </div>
            <hr>
            <div class="tagDiv">
                <p class="subPTag">등록된 태그 목록</p>
                <div class="tagList" id="useTagList">
                	<% if(movieTag != null) { %>
                		<% for(int i = 0; i < movieTag.size(); i++) { %>
                		<span class="tagOneSpan">
                			<input type="hidden" name="tagCode" value="<%= movieTag.get(i).getTagNo() %>">
                			<input type="button" class="tag" name="tagName" value="<%= movieTag.get(i).getTagName() %>">
                		</span>
                		<% } %>
                	<% } else {%>
                		<span>등록된 태그가 없습니다.</span>
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
            	<p class="subPTag">태그 목록</p>
            	<div id="tagList">
	            	<% if(tag.isEmpty()) { %>
	            		<p class="subPTag">등록 가능한 태그가 없습니다.</p>
	            	<% } else { %>
	            		<% for(int i = 0; i < tag.size(); i++) { %>
	            			<span class="tagOneSpan">
	                			<input type="hidden" name="tagCode" value="<%= tag.get(i).getTagNo() %>">
	                			<input type="button" class="tag" name="tagName" value="<%= tag.get(i).getTagName() %>">
	                		</span>
	            		<% } %>
	            	<% } %>
            	</div>
            </div>
            <div class="tagDiv">
            	<p class="subPTag">등록할 태그</p>
	            <div id="addTagDiv">
	            	
	            </div>
	            <p class="subPTag">삭제할 태그</p>
	            <div id="removeTagDiv">
	            
	            </div>
	            <br>
	            <input type="button" id="addBtn" value="등록">
	            <input type="button" id="removeBtn" value="삭제">
	            <input type="hidden" id="movieCode" value="<%= movie.getM_code() %>">
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
			
			$("#addBtn").click(function(){
    			if(confirm("해당 태그를 등록 하시겠습니까?")) {
	    			var tagIdInput = $("#addTagDiv").children().children().toArray();
	    			var tagArr = new Array();
 					var movieTagArr = new Array();
 					var useFlag = false;
	    			for(var i in tagIdInput) {
	    				if(i % 2 == 0) {
	    					<% for(int k = 0; k < movieTag.size(); k++) { %>
	    						movieTagArr.push(<%= movieTag.get(k).getTagNo() %>);
	    					<% } %>
	    					for(var k in movieTagArr) {
	    						if(tagIdInput[i].value == movieTagArr[k]) {
	    							useFlag = true;
	    							break;
	    						}
	    					}
	    					if(!useFlag){
			    				tagArr.push(tagIdInput[i].value);
	    					}
	    				}
	    				tagIdInput[i].style.display = "none";
	    			}
	    			if(tagArr.length != 0) {
		    			var tagId = tagArr.join(",");
		    			var movieCode = $("#movieCode").val();
		    			
		    			$.ajax({
		    				url : "<%= request.getContextPath() %>/manager/addMovieTag",
		    				type : "post",
		    				data : {tagId : tagId, movieCode : movieCode},
		    				success : function(data) {
		    					if(data != null) {
		    						alert(data + '개의 태그를 등록했습니다.');
		    						location.reload(true);
		    					} else {
		    						alert('태그 등록에 실패하였습니다.');
		    					}
		    				},
		    				error : function(e) {
		    					console.log(e);
		    				}
		    			});
	    			} else {
	    				alert('모두 등록되어 있는 태그 입니다.');
	    				location.reload();
	    			}
    			}
    		});
			
			$("#removeBtn").click(function(){
    			if(confirm("해당 태그를 삭제 하시겠습니까?")) {
	    			var tagIdInput = $("#removeTagDiv").children().children().toArray();
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
	    				url : "<%= request.getContextPath() %>/manager/removeMovieTag",
	    				type : "post",
	    				data : {tagId : tagId, movieCode : movieCode},
	    				success : function(data) {
	    					if(data != null) {
	    						alert(data + '개의 태그를 삭제했습니다.');
	    						location.reload(true);
	    					} else {
	    						alert('태그 삭제에 실패하였습니다.');
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

	    var useTagList = document.getElementById("useTagList");
        var tagList = document.getElementById("tagList");
        var addTagDiv = document.getElementById("addTagDiv");
        var removeTagDiv = document.getElementById("removeTagDiv");

        for(var i in btn) {
        	btn[i].onclick = function() {
                if(this.parentElement.parentElement == useTagList) {
                	removeTagDiv.append(this.parentElement);
                } else if(this.parentElement.parentElement == addTagDiv){
                	tagList.append(this.parentElement);
                } else if(this.parentElement.parentElement == removeTagDiv){
                	useTagList.append(this.parentElement);
                } else {
                	addTagDiv.append(this.parentElement);
                }
            }
        }
    </script>
</body>
</html>