<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sideMenu CSS -->
    <link href="<%= request.getContextPath() %>/resources/css/content1_movie.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <title>컨텐츠 관리 - 등록 영화 관리</title>
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
                    <li><a href="content1_1_inquiry.jsp">전체 목록 조회</a></li>
                    <li><a href="content1_2_tagInquiry.jsp">태그별 목록 조회</a></li>
                    <!-- <li><a href="content1_3_movieInquiry.jsp">영화 검색</a></li> -->
                </ul>

                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
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
		});
    </script>
</body>
</html>