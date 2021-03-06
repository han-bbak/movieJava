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
    <title>컨텐츠 관리 - 태그 목록 조회</title>
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

        .tagDiv {
            margin : 30px;
        }

        .tagDiv .tag {
            width: 150px;
            height: 30px;
            font-size: 12px;
            font-weight: bold;
            background : rgb(255,192,0);
            border-radius: 8px;
            border-color: rgb(255,192,0);
        }

        .tagDiv .tag:hover {
            cursor: pointer;
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
                <p>태그별 목록 조회</p>
            </div>
            <div class="tagDiv">
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
            <hr>
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
		});
	    
	    var btn = document.getElementsByClassName("tag");

        for(var i in btn) {
            btn[i].onclick = function() {
            	var num = $(this).parent().children().eq(0).val();
				location.href="<%= request.getContextPath() %>/manager/tagMovieList?tagNo=" + num;
            }
        }
    </script>
</body>
</html>