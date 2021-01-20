<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sideMenu CSS -->
    <link href="../../resources/css/content1_movie.css" rel="stylesheet" type="text/css">
    <title>회원 관리</title>
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
                <p class="subText" id="p-sub1">회원 관리</p>
                <p class="subText" id="p-sub2">등록 된 회원 수</p>
                <p class="subText" id="p-sub3">
                    <span id="countMember">000</span>건
                </p>
                <hr>
                <!-- <span class="subText" id="span-sub1">등록 영화 관리</span> -->
            </div>
        </div>
        <div class="contentWrap">
            <div class="radioDiv">
                <form>
                    <input type="radio" name="category" value="name" id="name" checked>
                    <label for="name" class="radioLabel">이름</label>&nbsp;&nbsp;
                    <input type="radio" name="category" value="userId" id="userId">
                    <label for="userId" class="radioLabel">아이디</label>&nbsp;&nbsp;
                    <input type="radio" name="category" value="userPhone" id="userPhone">
                    <label for="userPhone" class="radioLabel">핸드폰<small>(뒤 4자리)</small></label>
                </form>
            </div>
            <hr>
            <div class="searchDiv">
                <form>
                    <input type="text" name="search" placeholder="검색할 키워드 입력" size="30" style="height: 30px;">
                    <div class="searchImg">
                        <img src="../../images/search.png" style="width:33px; height:33px;">
                    </div>
                </form>
            </div>
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