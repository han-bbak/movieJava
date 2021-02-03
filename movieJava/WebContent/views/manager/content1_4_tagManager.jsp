<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, tag.model.vo.Tag" %>
<%
	ArrayList<Tag> list = (ArrayList<Tag>)request.getAttribute("list");	
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
        .registerTag span {
            color : lightgray;
            font-size: 40px;
            font-weight: bolder;
            float: left;
            margin-right: 20px;
            margin-left: 20px;
        }
        .registerTag input[type=text] {
            height: 30px;
            padding-left: 10px;
        }
        #removeBtn, input[type=submit] {
            width: 80px;
            height: 35px;
            font-size: 12px;
            font-weight: bold;
            color : white;
            background : #0059A6;
            border-radius: 8px;
            border-color: #0059A6;
        }
        .tagDiv, .registerTag, .removeTag {
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
                <p>태그별 목록 조회</p>
            </div>
            <hr>
            <div class="tagDiv">
                <p class="subPTag">사용중인 태그</p>
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
            <div class="registerTag">
                <p class="subPTag">태그 추가</p>
                <span># </span>
                <form method="post" action="<%= request.getContextPath() %>/manager/addTag">
                    <input type="text" size="40px" name="addTagName" placeholder="추가할 태그 이름을 입력하세요.">
                    <input type="submit" value="추가">
                </form>
            </div>
            <div class="removeTag">
                <p class="subPTag">태그 삭제</p>
                <div class="removeList" id="removeList">
                    <!-- <button class="tag">#<span>슬픈</span></button> -->
                </div>
                <br>
                    <input type="button" id="removeBtn" value="삭제">
            </div>
        </div>
    </section>
    <script>
    	$(function(){
    		var countTag = $("#countTag");
    		
    		$.ajax({
				url : "<%= request.getContextPath() %>/manager/tagCount",
				type : "post",
				success : function(data){
					countTag.text(data);
				},
				error : function(e) {
					console.log(e);
				}
			});
    		
    		$("#removeBtn").click(function(){
    			if(confirm("해당 태그를 삭제하시겠습니까?")) {
	    			var tagIdInput = $("#removeList").children().children().toArray();
	    			var tagArr = new Array();
	    			for(var i in tagIdInput) {
	    				if(i % 2 == 0) {
	    					tagArr.push(tagIdInput[i].value);
	    				}
	    				tagIdInput[i].style.display = "none";
	    			}
	    			var tagId = tagArr.join(",");
	    			
	    			$.ajax({
	    				url : "<%= request.getContextPath() %>/manager/removeTag",
	    				type : "post",
	    				data : {tagId : tagId},
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

        var tagList = document.getElementById("tagList");
        var removeList = document.getElementById("removeList");

        for(var i in btn) {
            btn[i].onclick = function() {
                if(this.parentElement.parentElement == tagList) {
                	removeList.append(this.parentElement);
                } else {
                	tagList.append(this.parentElement);
                }
            }
        }
    </script>
</body>
</html>