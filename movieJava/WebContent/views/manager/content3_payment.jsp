<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sideMenu CSS -->
    <link href="../../resources/css/content1_movie.css" rel="stylesheet" type="text/css">
    <title>결제 관리</title>
    <style>
        .contentWrap {
            box-sizing: border-box;
            display: inline-block;
            width: 85%;
            height: 100%;
            position: relative;
        }

        .radioDiv, .searchDiv {
            margin: 20px;
        }
        .searchDiv input {
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }
        .searchDiv img {
            padding : 2px;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }
        .radioLabel {
            color : white;
            font-weight: 100;
        }
        .radioDiv input[type=submit] {
            width: 60px;
            height: 30px;
            font-weight: bold;
            background : rgb(255,192,0);
            border-radius: 8px;
            border-color: rgb(255,192,0);
        }
        .searchDiv input {
            float: left;
        }
        .searchDiv img:hover {
            cursor: pointer;
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
                <p class="subText" id="p-sub1">결제 관리</p>
                <p class="subText" id="p-sub2">총 결제 건 수</p>
                <p class="subText" id="p-sub3">
                    <span id="countPay1">000</span>건
                </p>
                <p class="subText" id="p-sub4">결제 금액</p>
                <p class="subText" id="p-sub5">
                    <span id="countPay2">1,000,000</span>원
                </p>
                <hr>
                <ul>
                    <li><a href="content3_payment.jsp">결제 관리</a></li>
                    <!-- <li><a href="content3_refund.jsp">환불 관리</a></li> -->
                </ul>

                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
            </div>
        </div>
        <div class="contentWrap">
            <div class="radioDiv">
                <form method="POST">
                    <input type="radio" name="period" value="one" id="one" checked>
                    <label for="one" class="radioLabel">이번 달</label>&nbsp;&nbsp;
                    <input type="radio" name="period" value="three" id="three">
                    <label for="three" class="radioLabel">3개월</label>&nbsp;&nbsp;
                    <input type="radio" name="period" value="six" id="six">
                    <label for="six" class="radioLabel">6개월</label>&nbsp;&nbsp;
                    <input type="radio" name="period" value="selection">
                    <input type="date" name="period-start">&nbsp;
                    <label style="color:white"> ~</label>&nbsp;
                    <input type="date" name="period-end">&nbsp;&nbsp;
                    <input type="submit" value="조회">
                </form>
            </div>
            <hr>
            <!-- <div class="searchDiv">
                <form>
                    <input type="text" name="search" placeholder="검색할 키워드 입력" size="30" style="height: 30px;">
                    <div class="searchImg">
                        <img src="../../images/search.png" style="width:33px; height:33px;">
                    </div>
                </form>
            </div> -->
            <div class="tableDiv">
                <!-- 검색 결과 출력 -->
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