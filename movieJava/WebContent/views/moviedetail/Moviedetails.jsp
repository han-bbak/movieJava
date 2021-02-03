<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="movie.model.vo.MovieVO,member.model.vo.Member" %>
<% 
	MovieVO movie = (MovieVO)request.getAttribute("movie");
// 별점을 등록할떄 어떤회원이 등록하는지 알아야하기때문에 로그인정보를 가져온다 
    Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>moviedetail</title>
<style>
body {
    background: #363636;
}
.inline {
    float: left;
}

#Information {
    color: white;
    width : 100%;
    
}
/* story 보드 및 전체 포함(이미지뺴고) */
#summary {
    color: white;
    width : 66%;
   
}

.inline{

}

div {
    border: 1px;
    box-sizing: border-box;
}

p {
    color: white;
    text-align: center;

}

#wrapper {
    width: 1190px;
    height: 1400px;
    margin: auto;
    border: 1px solid white;
}

#header {
    width: 100%;
    height: 10%;
    border: 1px solid white;
}

#content {
    width: 100%;
    height: 80%;
}

#footer {
    background-color: rgb(24, 24, 24);
    width: 100%;
    height: 10%;
    border: 1px solid white;
}

.header {
    float: left;
    border: 1px solid white;
}

#header-menu {
    width: 5%;
    height: 100%;
    position: relative;
}

#header1 {
    width: 15%;
    height: 100%;
}

#header2 {
    width: 55%;
    height: 100%;
    position: relative;
}

#header2 > #search-form {
    width: 70%;
    height: 40%;

    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    position: absolute;
    margin: auto;
}

#search-text-area {
    height: 100%;
    width: 85%;
    float: left;
}

#search-btn-area {
    height: 100%;
    width: 15%;
    float: left;
}

#search-input {
    width: 100%;
    height: 100%;
    box-sizing: border-box;
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
}

#search-btn {
    width: 100%;
    height: 100%;
    box-sizing: border-box;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
}

#header3 {
    width: 25%;
    height: 100%;
    padding: 6px 8px 6px 16px;
    position: relative;
}

#header3 a {
    text-decoration: none;
    font-size: 18px;
    color: #a49e9e;
    display: block;
    font-weight: bold;
    float: left;
    margin: 0 8px;
    top: 0;
    bottom: 0;
    position: absolute; 

}

#logform {
    width: 60%;
    height: 20%;

    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
    position: absolute; 
}

#loginform {
    height: 100%;
    width: 50%;
    float: left;
}

#joinform {
    height: 100%;
    width: 50%;
    float: left;
}

#header3 a:hover {
    color: #f1f1f1;
}

#content1 {
    width: 100%;
    height: 35%;
}

#content2 {
    width: 100%;
    height: 32.5%;
}

#content3 {
    width: 100%;
    height: 32.5%;
}

html.open { 
    overflow: hidden; 
} 

.btn { 
    width: 100%; 
    height: 100%; 
    position: absolute; 
    left: 0px; 
    top: 0px; 
    z-index: 1; 
    background-size: 50%; 
    background-repeat: no-repeat; 
    background-position: center; 
    cursor: pointer; 
} 

.close { 
    width: 50px; 
    height: 50px; 
    position: absolute; 
    right: 0px; 
    top: 0px; 
    background-size: 50%; 
    background-repeat: no-repeat; 
    background-position: center; 
    cursor: pointer; 
}

#menu a {
    padding: 10px 40px 10px 20px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    font-weight: bold;
    float: left;
} 

#menu a:hover {
    color: #f1f1f1;
} 

#menu { 
    width: 250px; 
    height: 100%; 
    position: fixed; 
    top: 0px; 
    left: -252px; 
    z-index: 10; 
    background-color: black; 
    text-align: center; 
    transition: All 0.2s ease; 
    -webkit-transition: All 0.2s ease; 
    -moz-transition: All 0.2s ease; 
    -o-transition: All 0.2s ease; 
}

#menu.open { 
    left: 0px; 
} 

.page_cover.open { 
    display: block; 
} 

.page_cover { 
    width: 100%; 
    height: 100%; 
    position: fixed; 
    top: 0px; 
    left: 0px; 
    background-color: rgba(0,0,0,0.4); 
    z-index: 4; 
    display: none; 
}

/*=============별점============*/
.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:30px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
    cursor : pointer;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:yellow;}
/*==============   상세페이지 전체=======================*/
#Information{

}

#Average{
   

}
#story{
    
     margin-top: -7%;
}
.star_rating{
   

}
#detail{

}
.Attention{
    

}
#comment-input{
    margin-top: 12%;
    
}


/*====================리뷰 전체페이지==================*/
#form-commentInfo{ width: 100%; 
} 
  #comment-count{ margin-bottom: 10px; }

  #comment-input{     width: 100%; height: 100px;
}  
  #submit{ background-color: rgb(0, 128,255); width: 5.5em; height: 3.3em;; font-size: 15px; font-weight: bold; color: aliceblue; 
}
   #comments{ margin-top: 10px;
    } 

  
   </style>
</head>
<body>

    <div id="wrapper">
        <div id="header">
            <div class="header" id="header-menu">
                <div class="btn">
                    <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="currentColor"
                        class="bi bi-justify" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                            d="M2 12.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z">
                        </path>
                    </svg>
                </div>
            </div>
            <div class="header" id="header1">
                <p>로고</p>
            </div>
            <div class="header" id="header2">
                <form id="search-form">
                    <section id="search-btn-area">
                        <button type="submit" id="search-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path
                                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z">
                                </path>
                            </svg></button>
                    </section>
                    <section id="search-text-area">
                        <input type="text" id="search-input" name="search-input" placeholder="  보고싶은 영화를 검색해보세요.">
                    </section>

                </form>
            </div>
            <div class="header" id="header3">

                <form id="logform">
                    <section id="loginform">
                        <a href="#">로그인</a>
                    </section>
                    <section id="joinform">
                        <a href="#">회원가입</a>
                    </section>
                </form>
            </div>
        </div>
        <div onclick="history.back();" class="page_cover"></div>
        <div id="menu" class="">
            <div onclick="history.back();" class="close">
                <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="white" class="bi bi-x-circle"
                    viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
                    <path
                        d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z">
                    </path>
                </svg>
            </div>
            <br><br><br><br>
            <a href="%>/views/mypage/mypagemain.jsp">마이페이지</a><br>
            <a href="%>/views/mypage/mypageInterest.jsp">관심 영화</a><br>
            <a href="#">Watcha Party</a><br>
            <a href="#">Netflix Party</a><br>
            <a href="#">Q&amp;A</a><br>
            <a href="#">STORE - Goods</a><br>
            <a href="#">STORE - Ticket</a><br>
            <!-- ==================================여기서부터 바디내용 시작-======================================-->
        </div>
        <!-- 이미지-->
        <div class="moviemain">
            <div id="movieimg" class="inline">
           <img src="<%= movie.getM_image() %>"
            style="width:400px; 
            height:500px;">
               
            </div>

 </div>   <div id="summary" class="inline">
    <div id="Information">
        <br>
        <h2><%= movie.getM_title() %></h2> 
        <h3><%= movie.getM_date() %>/<%= movie.getM_country() %>/<%= movie.getM_genre() %></h3>
        <h4>감독:<%= movie.getM_director() %></h4> 
        <div id="Average">
            <h3>평균★:<%= movie.getM_grade() %></h3> </div>

        
    </div>
    <br><br>
    <div id=" story">
    <h2>기본정보</h2> 
    <br>
   <%= movie.getM_summary() %>
</div>   
           <!--  별점      
             로그인이 안되면  로그인페이지로  (if문)
       그러면 로그인이 된지 안된지를 어떻게 확인하지?  
      만약에 로그인상태에서 별점을 등록하면  강제 f5 로 평균 넘어오기 
      db에서 입력하고 그값을 다시 불러올 쿼리문도 필요  
      별점html 라디오버튼으로 (여기서 submit 전송이필요한가?) 한다음에 클릭버튼을 ★이걸로 대체한다 
      이벤트 효과로 별점등록 완료 창까지 뜨게 만든다 
      마우스로 클릭하면 css에서는 검은색별에서 클릭한수만큼 노란색으로 변경 
   html로 라디오버튼을 만든다음 라디오 버튼클릭버튼을 ★로 바꾼다음  div를 하나로 묶어서
      form태그안에 input type = radio 로 만들어서 id= star 
      id=star1 value=1    
                         
              --> 
             <div id="stargrade">               
           <div class="star_rating">
            <a class="on">★</a>
            <a class="on">★</a>
            <a class="on">★</a>
            <a>★</a>
            <a>★</a>
            
            
 
        </div> 
         <button id="starto">별점넣기</button>
         </div>  

        <!--    버튼-->      
        <div class="Attention">
            <button class="button">관심목록</button>
        </div>
    <details id="detail">
        <summary><h3>더보기</h3></summary>
        <p> 시간남으면 유투브 리소스로 영화예고편 or 영화 주연배우들 넣을 계획</p>
      </details>
</div>

<!-- -->
    <div id="form-commentInfo">
           
    <input id="comment-input" placeholder="댓글을 입력해 주세요.">
    <button id="submit">등록</button>
    <div id="comment-count">댓글 <span id="count">0</span></div> 
   <div class="score">
       <ul>
           <li>
               
              <div class="star_score">★★★★★ <em>별점점수</em></div> 
              <span class="st_on"></span>
              
              <div class="score_reple">
                    <p id="score">
                    <!-- 스포일러 컨텐츠로 처리되는지 여부 -->
                 <h3>wwwww</h3>>
    </p>
    <dl>
        <dt>
            <em>
                <a href="#" onclick="javascript:showPointListByNid(16402064);return false;">
                    <span>베베(alfn****)    yy/mm/dd</span> 
                </a>
                <!--줄바꿈-->
                <hr>
            </em>
       
        </dt>
        
    </dl>
    </div>
    
    </li>
    <li>
               
        <div class="star_score">★★★★★<em>별점점수</em></div> 
        <span class="st_on"></span>
        
        <div class="score_reple">
              <p id="score">
              <!-- 스포일러 컨텐츠로 처리되는지 여부 -->
           <h3>wwwww</h3>>
</p>
<dl>
  <dt>
      <em>
          <a href="#" onclick="javascript:showPointListByNid(16402064);return false;">
              <span>베베(alfn****)    yy/mm/dd</span> 
          </a>
          <!--줄바꿈-->
          <hr>
      </em>
 
  </dt>
  
</dl>
</div>

</li>
    </ul>
    </div>
    </div>
   
            </div>

 
    <div id="footer">
        <p>
            © 2021 MOVIEJAVA | 요금제 및 소개 : NETFLIX(넷플릭스) | 왓챠플레이<br>
            Data &amp; Content Image Based On Netflix.inc , Watcha.inc, TVNNG<br>
            <br><br>
            Copyright© 2021, Moviejava , All Rights Reserved.
        </p>
    </div>
    </div>
   <script>

        $(".btn").click(function () {
            $("#menu,.page_cover,html").addClass("open");
            window.location.hash = "#open";
        });

        window.onhashchange = function () {
            if (location.hash != "#open") {
                $("#menu,.page_cover,html").removeClass("open");
            }
        };
    </script>
    <script>
        // html dom 이 다 로딩된 후 실행된다.
        $(document).ready(function () {
            // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
            $(".menu>a").click(function () {
                var submenu = $(this).next("ul");

                // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
                if (submenu.is(":visible")) {
                    submenu.slideUp();
                } else {
                    submenu.slideDown();
                }
            });
        });
    </script>
    
    <!--  별점 기능 -->
    <script>
        $(".star_rating a").click(function () {
            $(this).parent().children("a").removeClass("on");
            $(this).addClass("on").prevAll("a").addClass("on");
            return false;
        });
          
                //페이지가 열렸을때 해당코드를 실행할수있게  $(function(){
                 // 서블렛을 생성하고 url 만들기 
                  $(function(){
                	  $("#starto").click(function(){
                		  var star= document.getElementsByClassName("on");
                          // stargrade 에 별점 길이가들어간다 
                   		var stargrade= star.length;
                	  
                  <% if(loginUser != null) {%>
                	 $.ajax({
                		  url: "<%= request.getContextPath()%>/Star",
                		  data : {stargrade:stargrade,
                			    MovieVo:<%=movie.getM_code()%>
                			  },
                		  type :"post", 
                		  success: function(result){
                			  var Average = 
                				  // 
                				  "<h3>평균: </h3>" +result; 
                			  $("#Average").html(Average);
                		  },
                		  error : function(e){
                			  console.log(e);
                		  }
                			  
                	  })
                <% } else { %>
                alert("로그인후 이용가능한 서비스입니다.");
                <% } %>
                	  })
                  }) 
           
    </script>

    <!-- 댓글 150자이상 금지 -->
<script>
    $(document).ready(function(){
        // textarea에서 keyup 이벤트 발생했을 경우
        $("textarea").keyup(function(){
            // textarea의 길이 값 저장
            var inputLength = $(this).val().length;
            $("#counter").html(inputLength);

            var remain = 150 - inputLength;

            if(remain >= 0)
                $("#counter").css("color", "black");
            else
                $("#counter").css("color", "red");
        });
    });
</script>

</body>
</html>