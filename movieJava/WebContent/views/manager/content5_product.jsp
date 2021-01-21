<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sideMenu CSS -->
    <link href="../../resources/css/content1_movie.css" rel="stylesheet" type="text/css">
    <title>상품 관리</title>
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
        .searchDiv {
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

        .tableDiv th:nth-child(1) {
            width : 100px;
        }

        .tableDiv th:nth-child(2) {
            width : 500px;
        }

        .tableDiv th:last-child {
            width : 100px;
        }

        .productInsertDiv {
            margin : 20px;
        }

        .productInsertDiv input[type="button"] {
            height: 25px;
            font-weight: bold;
            background : rgb(255,192,0);
            border-radius: 8px;
            border-color: rgb(255,192,0);
            cursor: pointer;
            outline: none;
        }
    </style>
</head>
<body>
	<%@ include file="../common/manager_main.jsp" %>
    <section class="contentSection">
        <div class="contentMenuWrap">
            <div class="subTitle">
                <p class="subText" id="p-sub1">상품 관리</p>
                <p class="subText" id="p-sub2">등록 된 상품 수</p>
                <p class="subText" id="p-sub3">
                    <span id="countProduct">000</span>건
                </p>
                <hr>
            </div>
        </div>
        <div class="contentWrap">
            <!-- <div class="titleDiv">
                <p>영화 검색</p>
            </div> -->
            <div class="searchDiv">
                <form>
                    <input type="text" name="search" placeholder="검색할 키워드 입력" size="30" style="height: 30px;">
                    <div class="searchImg">
                        <img src="../../images/search.png" style="width:33px; height:33px;">
                    </div>
                </form>
            </div>
            <div class="productInsertDiv">
                <input type="button" value="상품 등록" onclick="window.open('detailsView/product1_insert.jsp','popup', 'width=450px, height=680px')">
            </div>
            <div class="tableDiv">
                <!-- 검색 결과 출력 -->
                <table>
                    <tr>
                        <th>번호</th>
                        <th>상품명</th>
                        <th>재고</th>
                    </tr>
                </table>
            </div>
        </div>
    </section>
</body>
</html>