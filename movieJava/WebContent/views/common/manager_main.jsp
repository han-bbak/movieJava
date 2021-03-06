<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/resources/css/manager_main.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <title>관리자 페이지 - Main</title>
</head>
<body>
    <header>
    	<div class="titleDiv">
		    <h1 id="head-title"><a href="<%= request.getContextPath() %>/views/common/manager_main.jsp">관리자 메뉴</a></h1>
    	</div>
    </header>
    <nav id="menuWrap">
        <section id="menuBar" class="menuSection">
            <ul class="mainMenu">
            	<li>
                    <a href="<%= request.getContextPath() %>">무비자바 메인</a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/views/manager/content1_movie.jsp">컨텐츠 관리</a>
                    <ul class="subMenu sub1">
                        <li><a href="<%= request.getContextPath() %>/views/manager/content1_movie.jsp">등록 영화 관리</a></li>
                        <li><a href="<%= request.getContextPath() %>/manager/movieTag">태그 관리</a></li>
                        <!-- <li><a href="<%= request.getContextPath() %>/views/manager/content1_review.jsp">리뷰 관리</a></li> -->
                    </ul>
                </li>
                <li><a href="<%= request.getContextPath() %>/manager/memberList">회원 관리</a></li>
                <li>
                    <a href="<%= request.getContextPath() %>/views/manager/content3_payment.jsp">결제 관리</a>
                    <ul class="subMenu sub2">
                        <li><a href="<%= request.getContextPath() %>/views/manager/content3_payment.jsp">결제 내역</a></li>
                        <!-- <li><a href="<%= request.getContextPath() %>/views/manager/content3_refund.jsp">환불 내역</a></li> -->
                    </ul>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/manager/QAList">게시판 관리</a>
                    <ul class="subMenu sub3">
                        <li><a href="<%= request.getContextPath() %>/manager/QAList">문의 & 답변</a></li>
                        <li><a href="<%= request.getContextPath() %>/manager/shareNetflix">공유 계정 게시판</a></li>
                    </ul>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/manager/storeList">상품 관리</a>
                </li>
            </ul>
        </section>
    </nav>
    <section>

    </section>

    <!-- 메뉴 바 JS -->
    <script src="<%= request.getContextPath() %>/resources/js/menuBar.js"></script>
</body>
</html>