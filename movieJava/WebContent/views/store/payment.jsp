<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member, store.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String storeTitle = (String)request.getAttribute("storeTitle");
	int storeNo = (int)request.getAttribute("storeNo");
	int selQuan = (int)request.getAttribute("selQuan");
	int total = (int)request.getAttribute("total");
	int rtotal = (int)request.getAttribute("rtotal");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link href="<%= request.getContextPath() %>/resources/css/form.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<!-- 아임포트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var IMP = window.IMP;
	IMP.init('imp20648252');
</script>
<style>
#menu-icon { 
            color: #ffffff;
            padding: 30px 0 0;
            font-size: 5em; 
            }
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
<% if(session.getAttribute("msg") != null) { %>
	<script>
		alert('<%= session.getAttribute("msg") %>');
	</script>
	<%
		session.removeAttribute("msg");
		}
	%>
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
            	<a href="<%= request.getContextPath() %>/home.jsp"><img id="logo" src="<%= request.getContextPath() %>/images/logo.png"></a>
            </div>  
			<div class="header" id="header2">
				 <form id="search-form" action="<%=request.getContextPath()%>/movie/search" method="get">
               <section id="search-btn-area">
                  <button type="submit" id="search-btn">
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                        fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path
                           d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                          </svg>
                  </button>
               </section>
               <section id="search-text-area">
                  <input type="text" id="search-input" name="search"
                     placeholder="보고싶은 영화를 검색해보세요."> 
               </section>
            </form>

			</div>
			<div class="header" id="header3">
				<% if(loginUser == null) { %>
				<div id="loginArea">
					<div id="loginform">
						<button type="button" class="loginJoin" id="loginBtn" onclick="location.href='<%=request.getContextPath()%>/views/member/loginView.jsp'">로그인</button>
					</div>
					<div id="joinform">
						<button type="button" class="loginJoin" id="joinBtn" onclick="location.href='<%=request.getContextPath()%>/views/member/joinMember.jsp'">회원가입</button>
					</div>
					<br clear="both">
					<div id="searchDiv">
						<a href="<%= request.getContextPath() %>/views/member/idSearch.jsp"><span>아이디 찾기</span></a>
						<a href="<%= request.getContextPath() %>/views/member/pwdSearch.jsp"><span>비밀번호 찾기</span></a>
					</div>
				</div>
			<% } else { %>
				<div id="userInfoArea">
					<div id="userInfo">
						<span><b><%= loginUser.getMemName() %></b>님 환영합니다!</span>
					</div>
					<div id="userInfoBtn">
						<button id="logout">로그아웃</button>
						<% if(loginUser.getGrade().equals("admin")) { %>
							<button id="managerPage">관리자 메뉴</button>
							<script>
								var managerPage = document.getElementById("managerPage");
								managerPage.addEventListener('click', function(){
									location.href='<%= request.getContextPath() %>/views/common/manager_main.jsp';
								});
							</script>
						<% } %>
					</div>
				</div>
				<script>
					var logout = document.getElementById("logout");
					logout.addEventListener('click', function(){
						location.href='<%= request.getContextPath() %>/member/logout';
					});
				</script>
			<% } %>
			</div>
		</div>
		<div onclick="history.back();" class="page_cover"></div>
		<div id="menu">
			<div onclick="history.back();" class="close">
                <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="#a49e9e" class="bi bi-x-circle" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                  </svg>
            </div>
			<br><br><br><br>
			<a href="<%= request.getContextPath() %>/home.jsp">HOME</a><br>
            <a href="<%= request.getContextPath() %>/views/mypage/mypagemain.jsp">마이페이지</a><br> 
         	<a id="interest">관심 영화</a><br>
            <a id="netflix">공유 계정</a><br>
            <a id="qa">Q&A</a><br>
            <a id="store">STORE</a>
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
						<td colspan="2">
							<span>주문자명: </span> &nbsp; 
							<span style="color:lightblue; font-size:25px;"><%= loginUser.getMemName() %></span>&nbsp; &nbsp; / &nbsp; &nbsp; 
							<span>핸드폰 번호:</span> &nbsp; 
							<span style="color:lightblue; font-size:25px;"><%= loginUser.getPhone() %></span>&nbsp; &nbsp; 
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<span>우편번호:</span> &nbsp; 
							<span class="input_area"> 
								<input type="text" name="address" id="short" class="postcodify_postcode5" readonly>
							</span> &nbsp;
							<button type="button" class="btn" id="postcodify_search_button">검색</button>&nbsp;&nbsp; 
							<span>도로명 주소: </span> &nbsp; 
							<span class="input_area"> 
								<input type="text" name="address" id="long" class="postcodify_address" readonly>
							</span> &nbsp;&nbsp; 
							<span>상세 주소: </span> &nbsp; 
							<span class="input_area">
								<input type="text" name="address" id="detail" class="postcodify_details" placeholder="상세 주소를 입력해 주세요." required>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span style="color:lightblue; font-size:25px;"><%= loginUser.getMemName() %></span>&nbsp;
							<span>님의 사용 가능 포인트 : </span>
							<span><%= loginUser.getPoint() %></span> &nbsp; Point
						</td>
						<td>
							<span>사용하실 포인트: &nbsp;</span>
							<input type="number" id="point" value="0" step="1000" style="padding: 0px; border:0; width: 80px; height:30px; font-size:18px; text-align:center;">
							<button type="button" class="btn" id="pntBtn">확인</button>
						</td>
					</tr>
					<tr>
						<td>
							<span>총 상품 금액&nbsp; <%= total %>원</span><br> 
							<span>배송비 3,000원</span><br>
							<span></span>
						</td>
						<td>
							<span>총 결제 금액</span>
							<span id="realtotal" style="color:blue;"><%= rtotal %></span>원
							<input type="hidden" id="inputtotal" value="<%= rtotal %>">
						</td>
					</tr>
				</table>
				<div class="btnArea">
					<input type="hidden" id="hMemNo" value="<%= loginUser.getMemNo() %>">
					<button type="button" class="btn" id="pay">결제</button>
					<button type="button" class="btn" onclick="history.back();">취소</button>
				</div>
			</div>

		</div>
	</div>
</body>

<script>
//넷플릭스 버튼
const netflix = document.getElementById('netflix');
netflix.addEventListener('click', function(){
	location.href='<%=request.getContextPath()%>/netflix/list';
});

//Q&A 버튼
const qa = document.getElementById('qa');
qa.addEventListener('click', function(){
	location.href='<%=request.getContextPath()%>/qa/list';
});

//관심영화 버튼
const interest = document.getElementById('interest');
interest.addEventListener('click', function(){
   location.href='<%= request.getContextPath() %>/mypage/movie';
});

//STORE 버튼
const store = document.getElementById('store');
store.addEventListener('click', function(){
	location.href='<%=request.getContextPath()%>/store/list';
});
</script>
<script>
	$('#pntBtn').click(function() {
		var havePoint = $(this).parent().parent().children().eq(0).children().eq(2).text();
		var $point = $(this).parent().children().eq(1);
		var p = $point.val();
		var $rtotal = $(this).parent().parent().parent().children().eq(3).children().eq(1).children().eq(1);
		var r = $rtotal.text();
		var $useP = $(this).parent().parent().parent().children().eq(3).children().eq(0).children().eq(4);
		var use = $useP.text();
		var htotal = $(this).parent().parent().parent().children().eq(3).children().eq(1).children().eq(2).val();
		
		if(!havePoint) {
			havePoint = 0;
			p = 0;
			r = 0;
		} else {
			havePoint *= 1;
			p *= 1;
			r *= 1;
		}
		
		if(p < 0) {
			alert('마이너스는 가능하지 않습니다.');
		} else if (p > havePoint) {
			alert('보유한 포인트보다 더 많이 사용할 수 없습니다.');
		} else {
			use = p;
			
			r = $rtotal.text(r - use);
		}
	});
</script>

<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>
const pay = document.getElementById('pay');
pay.addEventListener('click', function(){
		var address1 = document.getElementById('short').value;
		var address2 = document.getElementById('long').value;
		var address3 = document.getElementById('detail').value;
		var point = document.getElementById('point').value;
		var total = document.getElementById('inputtotal').value;
		var memNo = document.getElementById('hMemNo').value;
		
		console.log(memNo);
		
		var real = total - point;

		if(address1 == '' || address2 == '' || address3 == '') {
			alert('주소를 입력해 주세요.');
		} else {
			IMP.request_pay({
		    	pg : 'inicis',
		   	 	pay_method : 'card',
		    	merchant_uid : 'merchant_' + new Date().getTime(),
		    	name : '주문명:<%= storeTitle %>',
		    	amount : real,
		    	buyer_email : '<%= loginUser.getEmail() %>',
		    	buyer_name : '<%= loginUser.getMemName() %>',
		    	buyer_tel : <%= loginUser.getPhone() %>
		    
			},	function(rsp) {
		    	    if(rsp.success ) {
		    	        var msg = '결제가 완료되었습니다.';
		    	        location.href="<%= request.getContextPath() %>/payment/point?memNo=" + memNo + "&point=" + point;
		    	    } else {
		    	    	var msg = '결제가 취소되었습니다.';
		    	    }
		    	    
		    	    alert(msg);
			});
		}
			
		
});
</script>
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