<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sideMenu CSS -->
    <link href="../../resources/css/content1_movie.css" rel="stylesheet" type="text/css">
    <title>문의 관리</title>
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
                <p class="subText" id="p-sub1">문의 & 답변</p>
                <p class="subText" id="p-sub2">등록된 문의 수</p>
                <p class="subText" id="p-sub3">
                    <span id="count">000</span>건
                </p>
                <p class="subText" id="p-sub4">답변 대기</p>
                <p class="subText" id="p-sub5">
                    <a href="content4_1_wait.jsp"><span id="countWait">1,000,000</span></a>건
                </p>
                <p class="subText" id="p-sub6">답변 완료</p>
                <p class="subText" id="p-sub7">
                    <span id="countComplete">1,000,000</span>건
                </p>
                <hr>

                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
            </div>
        </div>
        <div class="contentWrap">
            <div class="titleDiv">
                <p>문의글 전체 목록</p>
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