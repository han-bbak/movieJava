<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비자바 - 회원가입</title>
    <link href="<%= request.getContextPath() %>/resources/css/reset.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <style>
        html {
            width: 100%;
            height: 100%;
        }

        body {
            margin: 0 auto;
            background : rgb(64,64,64);
        }

        .footer p {
            color: white;
            text-align: center;
        }

        .footer {
            padding-bottom: 52px;
        }

        .contentWrapper {
            margin: 80px auto;
            width: 600px;
            min-height: 1200px;
            border: 3px solid rgb(255,192,0);
            border-radius: 10px;
            background : #fff;
        }

        .logoDiv {
            padding: 20px;
            margin: 0 auto;
            text-align: center;
        }

        .logoDiv img {
            width: 40%;
        }

        .titleDiv {
            text-align: center;
            margin : 0 auto 20px;
        }

        .titleDiv > h1 {
            font-size: 15px;
            color : #0065e3;
            font-weight: lighter;
            position: relative;
        }

        .titleDiv > h1::before {
            width : 60px;
            height: 1px;
            background: #dadada;
            position: absolute;
            top: 30px;
            left: 50%;
            margin-left: -30px;
            content: "";
        }

        .joinDiv {
            text-align: center;
        }

        .joinDiv .subTitle {
            text-align: left;
            font-size: 15px;
            font-weight: bold;
            /* color : #fff; */
            margin: 15px 5px 10px;
            /* margin-bottom: 10px; */
        }

        .joinDiv .subTitle2 {
            text-align: left;
            font-size: 15px;
            font-weight: bold;
            /* color : #fff; */
            margin: 15px 15px 10px;
            /* margin-bottom: 10px; */
        }

        #userId,
        #address {
            width: 430px;
        }

        #chkDuplicate,
        .searchAddress {
            width: 130px;
            height: 50px;
            vertical-align: middle;
            cursor: pointer;
            background: #1c81ff;
            border: 1px solid #1b7df8;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .joinDiv input {
            box-sizing: border-box;
            width: 572px;
            height: 50px;
            margin: 0 5px;
            vertical-align: middle;
            border: 1px solid #e7e7e7;
            transition: border 0.3s;
            cursor: pointer;

            padding: 10px;
            outline: none;
        }

        .joinDiv input:focus {
            border: 1px solid #1c81ff;
        }

        .idDiv {
            margin: 0 auto 10px;
        }

        .chkSpan {
            float: left;
            margin-top: 5px;
            margin-left: 30px;
            font-size: 11px;
        }

        .plusInfoDiv {
            margin : 50px auto 10px;
        }

        .plusInfoDiv .birth {
            width: 183px;
            height: 50px;
            vertical-align: middle;
            border: 1px solid #e7e7e7;
            transition: border 0.3s;
            cursor: pointer;

            outline: none;
        }

        #submitBtn {
            width: 572px;
            height: 50px;
            background: #1c81ff;
            border: 1px solid #1b7df8;
            font-size: 16px;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        #submitBtn:hover,
        #chkDuplicate:hover,
        .searchAddress:hover {
            background-color: #0065e3;
            border-color: #0061db;
        }

    </style>
    <% if(session.getAttribute("msg") != null) { %>
    <script>
    	alert('<%= session.getAttribute("msg") %>');
 		location.href='<%= request.getContextPath() %>';
    </script>
    <%  session.removeAttribute("msg"); %>
    <% } else if(request.getAttribute("msg") != null) {%>
    <script>
    	alert('<%= request.getAttribute("msg") %>');
    </script>
    <% } %>
</head>
<body>
    <div class="contentWrapper">
        <div class="logoDiv">
            <a href="<%= request.getContextPath() %>"><img src="<%= request.getContextPath() %>/images/logo.png"></a>   <!-- 메인 화면으로 이동 연결 -->
        </div>
        <div class="titleDiv">
            <h1>무비자바 회원가입</h1>
        </div>
        <form id="joinForm" method="POST" action="<%= request.getContextPath() %>/member/join">
            <div class="joinDiv">
                <div class="idDiv">
                    <h3 class="subTitle">* 아이디</h3>
                    <input type="text" id="userId" name="userId" maxlength="12" placeholder="아이디를 입력하세요">
                    <button type="button" id="chkDuplicate">중복확인</button><br>
                    <span class="chkSpan" id="chkId">※ 영소문자/숫자 6~12자리(특수문자 불가)</span>
                </div>
                <br clear="both">
                <div class="pwdDiv">
                    <h3 class="subTitle">* 비밀번호</h3>
                    <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요">
                    <h3 class="subTitle">* 비밀번호 확인</h3>
                    <input type="password" id="userPwd2" name="userPwd2" placeholder="비밀번호를 한번 더 입력하세요"><br>
                    <span class="chkSpan" id="chkPwd">※ 영대소문자/숫자/특수문자 포함 8자리 이상</span>
                </div>
                <div class="plusInfoDiv">
                    <h3 class="subTitle">* 이름</h3>
                    <input type="text" id="userName" name="userName" placeholder="이름을 입력하세요">
                    <h3 class="subTitle">* 생년월일</h3>
                    <input type="text" class="birth" id="birthYear" name="birthYear" maxlength="4" placeholder="년(4자리)">
                    <select id="selectMonth" class="birth" name="birthMonth">
                        <option value="" selected>월</option>
                        <option value="01">1월</option>
                        <option value="02">2월</option>
                        <option value="03">3월</option>
                        <option value="04">4월</option>
                        <option value="05">5월</option>
                        <option value="06">6월</option>
                        <option value="07">7월</option>
                        <option value="08">8월</option>
                        <option value="09">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                    <input type="text" class="birth" id="birthday" name="birthday" maxlength="2" placeholder="일">
                    <h3 class="subTitle2">이메일</h3>
                    <input type="email" id="email" name="email" placeholder="이메일을 입력하세요">
                    <h3 class="subTitle2">핸드폰</h3>
                    <input type="tel" id="phone" name="phone" maxlength="11" placeholder="핸드폰 번호(-제외)를 입력하세요">

                    <h3 class="subTitle2">우편번호</h3>
                    <input type="text" id="address" name="address" class="postcodify_postcode5" placeholder="우편번호 검색">
                    <button type="button" id="postcodify_search_button" class="searchAddress">검색</button><br>
                    <h3 class="subTitle2">도로명주소</h3>
                    <input type="text" name="address" class="postcodify_address" placeholder="우편번호 검색">
                    <h3 class="subTitle2">상세주소</h3>
                    <input type="text" name="address" class="postcodify_details" placeholder="상세주소를 입력하세요">
                </div>
                <br>
                <button type="button" id="submitBtn" onclick="onSubmit();">회원 가입</button>
            </div>
        </form>
    </div>
    <div class="footer">
        <p>
			© 2021 MOVIEJAVA | 요금제 및 소개 : NETFLIX(넷플릭스) | 왓챠플레이<br> Data
			&amp; Content Image Based On Netflix.inc , Watcha.inc, TVNNG<br>
			<br> <br> Copyright© 2021, MOVIEJAVA , All Rights Reserved.
		</p>
    </div>
    <!-- jQuery와 Postcodify를 로딩한다 -->
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

    <!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
    <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
    <script>
   		var isUsable = false;
    	$(function() {
    		var chkId = document.getElementById("chkId");
    		
    		$("#chkDuplicate").click(function(){
    			var userId = document.getElementById("userId");
    			if (userId.value == "") {
                    alert('아이디를 입력해주세요.');
                    userId.focus();
                    return;
                }
    			
    			if(!chk(/^[a-z][a-z\d]{5,11}$/, userId, "아이디를 다시 입력해주세요.")) { // 영소문자 시작, 6~12자리
    				chkId.innerHTML = "아이디 입력이 잘못 되었습니다.(영소문자/숫자 6~12자리, 특수문자 사용 불가)";
                    chkId.style.color = "red";
                    userId.focus();
                } else {
                	$.ajax({
                		url : "<%= request.getContextPath() %>/member/idCheck",
                		type : "post",
                		data : {userId : userId.value},
                		success : function(data) {
                			if(data == "fail") {
                				alert('사용할 수 없는 아이디 입니다.');
                				chkId.innerHTML = "사용할 수 없는 아이디 입니다.";
                				userId.focus();
                			} else {
                				if(confirm("사용 가능한 아이디 입니다. 사용 하시겠습니까?")) {
                					userId.prop('readonly', true);
                					isUsable = true;
                				} else {
                					userId.prop('readonly', false);
                					isUsable = false;
                					userId.focus();
                				}
                			}
                			
                		},
                		error : function(e) {
                			console.log(e);
                		}
                	});
                }
    		});
    	});
    
        function onKeyDown() {
            if (event.keyCode == 13) {
                event.preventDefault();
                onSubmit();
            }
        }

        function onSubmit() {
            var userId = document.getElementById("userId");
            var chkId = document.getElementById("chkId");
            var userPwd = document.getElementById("userPwd");
            var userPwd2 = document.getElementById("userPwd2");
            var chkPwd = document.getElementById("chkPwd");
            var userName = document.getElementById("userName");
            var birthYear = document.getElementById("birthYear");
            var birthday = document.getElementById("birthday");

            if (userId.value == "") {
                alert('아이디를 입력해주세요.');
                userId.focus();
                return;
            }

            if (userPwd.value == "") {
                alert('비밀번호를 입력해주세요');
                userPwd.focus();
                return;
            }

            if (userPwd2.value == "") {
                alert('비밀번호 확인란을 입력해주세요');
                userPwd2.focus();
                return;
            }

            if (userName.value == "") {
                alert('이름을 입력해주세요');
                userName.focus();
                return;
            }

            if(birthday.value > 31 || birthday.value < 1) {
                alert('생년월일을 다시 입력해주세요.');
                birthday.value = "";
                birthday.focus();
                return;
            }
            
            if(!chk(/^[a-z][a-z\d]{5,11}$/, userId, "아이디를 다시 입력해주세요.")) { // 영소문자 시작, 6~12자리
                chkId.innerHTML = "아이디 입력이 잘못 되었습니다.(영소문자/숫자 6~12자리, 특수문자 사용 불가)";
                chkId.style.color = "red";
                return;
            }
            
            if(!isUsable) {
            	alert('아이디 중복 체크를 해주세요!');
            	userId.focus();
            	return;
            }

            if(!chk(/(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}$/, userPwd, "비밀번호를 다시 입력해주세요.")) { // 특수문자,숫자,영대소문자 포함 8자 이상
                return;
            }

            if(!chk(/^[가-힣]{2,}$/, userName, "이름을 한글로 두글자 이상 입력해주세요.")) {
                return;
            }

            if(!chk(/^[1-2][0-9]{3}$/, birthYear, "생년월일을 다시 입력해주세요.")) {
                return;
            }

            if(document.getElementById("selectMonth").value == "") {
                alert("월을 선택해주세요.");
                return;
            }

            if(!chk(/^[0-9]{1,}$/, birthday, "생년월일을 다시 입력해주세요.")) {
                return;
            }

            $("#joinForm").submit();
        }

        // 정규 표현식, 검사할 함수
        function chk(reg, e, msg) {

            if (reg.test(e.value)) {
                return true;
            }
            alert(msg);
            e.value = "";
            e.focus();
            return false;
        }

        userPwd2.addEventListener('keyup', function(){
            if(userPwd.value === userPwd2.value){
                chkPwd.innerHTML = "비밀번호가 일치합니다!";
                chkPwd.style.color = "green";
            } else {
                chkPwd.innerHTML = "비밀번호가 일치하지 않습니다.";
                chkPwd.style.color = "red";
            }
        });
    </script>
</body>
</html>