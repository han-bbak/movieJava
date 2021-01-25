<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- sideMenu CSS -->
    <link href="<%= request.getContextPath() %>/resources/css/content1_movie.css" rel="stylesheet" type="text/css">
    <title>컨텐츠 관리 - 영화 전체 조회</title>
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
        .tableDiv {
            color: white;
            margin-left: 50px;
            margin-top : 20px;
        }

        .tableDiv th {
            border-top: 2px solid white;
            border-bottom: 1px solid lightgray;
            padding: 10px;
            font-size : 15px;
        }

        .allSelectDiv {
            margin : 20px;
            margin-left: 0px;
        }

        .allSelectDiv input[type=checkbox] {
            width: 15px;
            height: 15px;
        }

        .allSelectDiv input[type="button"], .allSelectDiv input[type="submit"] {
            height: 25px;
            font-weight: bold;
            background : rgb(255,192,0);
            border-radius: 8px;
            border-color: rgb(255,192,0);
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
                    <li><a href="content1_1_inquiry.jsp">전체 목록 조회</a></li>
                    <li><a href="content1_2_tagInquiry.jsp">태그별 목록 조회</a></li>
                    <li><a href="content1_3_movieInquiry.jsp">영화 검색</a></li>
                </ul>

                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
            </div>
        </div>
        <div class="contentWrap">
            <div class="titleDiv">
                <p>전체 목록 조회</p>
            </div>
            <div class="tableDiv">
                <form>
                    <div class="allSelectDiv">
                        <input type="checkbox" name="allSelect">
                        <input type="button" value="모두 선택/해제">&nbsp;
                        <input type="submit" value="선택한 영화 삭제">
                    </div>
                    <!-- 검색 결과 출력 -->
                    <table>
                        <tr>
                            <th>이름</th>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </section>
</body>
</html>