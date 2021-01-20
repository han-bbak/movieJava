<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sideMenu CSS -->
    <link href="../../resources/css/content1_movie.css" rel="stylesheet" type="text/css">
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
            color : white;
            font-size : 20px;
            font-weight: bold;
        }
        
        .tableDiv {
            color: white;
            margin-left: 50px;
        }

        .tableDiv th {
            border-top: 2px solid white;
            border-bottom: 1px solid lightgray;
            padding: 10px;
            font-size : 15px;
        }


    </style>
</head>
<body>
	<%@ include file="../common/manager_main.jsp" %>
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
                    <a href="content4_share.jsp"><span id="countNetfilx">1,000,000</span></a>건
                </p>
                <p class="subText" id="p-sub6">왓챠</p>
                <p class="subText" id="p-sub7">
                    <a href="content4_2_shareWatcha.jsp"><span id="countWatcha">1,000,000</span></a>건
                </p>
                <hr>

                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
            </div>
        </div>
        <div class="contentWrap">
            <div class="titleDiv">
                <p>넷플릭스 게시판</p>
            </div>
            <hr>
            <div class="tableDiv">
                <!-- 문의글 목록 출력 -->
                <table>
                    <tr>
                        <th>이름</th>
                    </tr>
                </table>
            </div>
        </div>
    </section>
</body>
</html>