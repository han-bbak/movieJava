<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<link href="../../resources/css/form.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
#board_top {
	width: 100%;
	height: 4%;
	/* border: 1px solid red; */
}

#board_name {
	color: whitesmoke;
	font-size: xx-large;
	font-weight: 500;
	top: 0;
	bottom: 0;
	left: 0;
	position: absolute;
	margin: auto;
}

#logo {
            position: relative;
			margin: 20px 50px;
			max-width: 130%;
        }

#board_top_title {
	float: left;
	width: 50%;
	height: 100%;
	position: relative;
}

.paymentArea {
	padding: 20px;
	width: 1100px;
	height: 490px;
	margin: auto;
	background: gray;
}

#payTable {
	width: 95%;
	height: 400px;
	border: 5px solid white;
	text-align: center;
	margin: auto;
	font-size: 20px;
	font-weight: bold;
}

.btnArea {
	width: 850px;
	height: 100px;
	margin: auto;
	text-align: center;
}

.btn {
	cursor: pointer;
	width: 50px;
	height: 30px;
	background: rgb(62, 103, 184);
	border: rgb(62, 103, 184);
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	color: white;
	margin-left: 5px;
	margin-top: 20px;
}

#total {
	color: blue;
}

.input_area {
	border: solid 1px #dadada;
	padding: 5px 5px 5px 5px;
	background: white;
}

.input_area input {
	height: 25px;
	border: 0;
}

.input_area>#short {
	width: 80px;
}

select {
	height: 40px;
}
</style>
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div class="header" id="header-menu">
        		<div class="menuBtn">
                     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                     <i id="menu-icon" class="material-icons">menu</i>
                </div>
            </div>
            <div class="header" id="header1">
            	<a href="<%= request.getContextPath() %>/home.jsp"><img id="logo" src="../../images/logo.png"></a>
            </div> 
			<div class="header" id="header2">
				<form id="search-form">
					<section id="search-btn-area">
						<button type="submit" id="search-btn">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                          </svg>
						</button>
					</section>
					<section id="search-text-area">
						<input type="text" id="search-input" name="search-input"
							placeholder="보고 싶은 영화를 검색해 보세요.">
					</section>

				</form>
			</div>
			<div class="header" id="header3">

				<form id="logform">
                    <section id="loginform">
                        <a href="<%= request.getContextPath() %>/views/member/loginView.jsp">로그인</a>
                    </section>
                    <section id="joinform">
                        <a href="<%= request.getContextPath() %>/views/member/joinMember.jsp">회원가입</a>
                    </section>
                </form>
			</div>
		</div>
		<div onclick="history.back();" class="page_cover"></div>
		<div id="menu">
			<div onclick="history.back();" class="close">
				<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%"
					fill="#a49e9e" class="bi bi-x-circle" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                  </svg>
			</div>
			<br><br><br><br>
			<a href="메인페이지.html">Home</a>
            <a href="마이페이지.html">마이페이지</a><br>
            <a href="관심영화.html">관심 영화</a><br>
            <a href="<%= request.getContextPath() %>/views/board/watcha.jsp">공유 계정</a>
            <a href="<%= request.getContextPath() %>/views/board/QA.jsp">Q&A</a>
            <a href="<%= request.getContextPath() %>/views/store/store_goods.jsp">STORE</a>
		</div>

		<div id="content">
			<div id="board_top">
				<div id="board_top_title">
					<h1 id="board_name">결제</h1>
				</div>
			</div>
			<div class="paymentArea">
				<table id="payTable">
					<tr>
						<td colspan="2"><span>주문자명:</span> &nbsp; <span
							class="input_area"> <input type="text" name="userName"
								id="short" maxlength="5">
						</span> &nbsp;&nbsp; <span>핸드폰 번호:</span> &nbsp; <span class="input_area">
								<input type="tel" name="userPhone" maxlength="11">
						</span></td>
					</tr>
					<tr>
						<td colspan="2"><span>우편번호:</span> &nbsp; <span
							class="input_area" id="short"> <input type="text"
								name="address" id="short" class="postcodify_postcode5" readonly>
						</span> &nbsp;
							<button type="button" class="btn" id="postcodify_search_button">검색</button>
							&nbsp;&nbsp; <span>도로명 주소: </span> &nbsp; <span
							class="input_area"> <input type="text" name="address"
								class="postcodify_address" readonly>
						</span> &nbsp;&nbsp; <span>상세 주소: </span> &nbsp; <span class="input_area">
								<input type="text" name="address" class="postcodify_address">
						</span></td>
					</tr>
					<tr>
						<td colspan="2"><span>카드사: </span> &nbsp; <select>
								<option value="sinhan" selected>신한은행</option>
								<option value="hana">하나은행</option>
								<option value="kb">국민은행</option>
								<option value="woori">우리은행</option>
								<option value="kakao">카카오뱅크</option>
						</select> &nbsp;&nbsp; <span>카드 번호</span> &nbsp; <span class="input_area">
								<input type="text" name="card_number">
						</span></td>
					</tr>
					<tr>
						<td><span>총 상품 금액 120,000원</span> <br> <span>배송비
								2,500원</span></td>
						<td><span>총 결제 금액</span> <span id="total">122,500원</span></td>
					</tr>
				</table>
				<div class="btnArea">
					<button type="button" class="btn">결제</button>
					<button type="button" class="btn" onclick="history.back();">취소</button>
				</div>
			</div>

		</div>
	</div>
</body>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>
       $(".menuBtn").click(function () { 
           $("#menu,.page_cover,html").addClass("open"); 
            window.location.hash = "#open"; 
        }); 

        window.onhashchange = function () { 
            if(location.hash != "#open") {
                $("#menu,.page_cover,html").removeClass("open");  
            } 
        };
    </script>
</html>