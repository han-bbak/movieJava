<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- sideMenu CSS -->
    <link href="../../resources/css/content1_movie.css" rel="stylesheet" type="text/css">
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
        }
        input[type=submit] {
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
            background : rgb(255,192,0);
            border-radius: 8px;
            border-color: rgb(255,192,0);
        }

        .tag:hover {
            cursor: pointer;
        }

    </style>
</head>
<body>
	<%@ include file="../common/manager_main.jsp" %>
    <section class="contentSection">
        <div class="contentMenuWrap">
            <div class="subTitle">
                <p class="subText" id="p-sub1">태그 관리</p>
                <p class="subText" id="p-sub2">등록된 태그 수</p>
                <p class="subText" id="p-sub3">
                    <span id="countTag">000</span>건
                </p>
                <hr>
                <ul>
                    <li><a href="content1_tag.jsp">태그 미설정 영화</a></li>
                    <li><a href="content1_4_tagManager.jsp">태그 관리</a></li>
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
                <p class="subPTag">등록 된 태그</p>
                <div class="tagList">
                    <button class="tag">#<span>신작</span></button>
                    <button class="tag">#<span>종료예정작</span></button>
                </div>
            </div>
            <div class="registerTag">
                <p class="subPTag">태그 추가</p>
                <span># </span>
                <form>
                    <input type="text" size="40px" name="tagName" placeholder="추가할 태그 이름을 입력하세요.">
                    <input type="submit" value="추가">
                </form>
            </div>
            <div class="removeTag">
                <p class="subPTag">태그 삭제</p>
                <div class="ramoveList">
                    <button class="tag">#<span>슬픈</span></button>
                </div>
                <br>
                <form>
                    <input type="submit" value="삭제">
                </form>
            </div>
        </div>
    </section>
</body>
</html>