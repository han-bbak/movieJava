<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link href="../../resources/css/form.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style> 

         #content {
            
            padding: 150px;
            text-align: center;
        }
        #text1{
            font-size: 30px;
            color : black;
            font-weight: bold;
        }
.card{
  width: 360px;
  background: #f1f1f1;
  margin: 40px;
  float: left;
  
  
}

#image-container{
  width: 350px;
  height: 250px;
}
.nav{
  text-align: center;
}
.nav img{
  width: 80px;
  height: 50px;
  border: 1px solid #ddd;
  margin: 8px 2px;
  cursor: pointer;
  transition: 0.3s;
}

.price{
  position: absolute;
  top: 20px;
  right: 20px;
  color: red;
  font-size: 24px;
}
.product-info{
  padding: 24px;
}
.name{
  text-transform: uppercase;
  font-size: 24px;
  color: #333;
}
.dis{
  font-size: 16px;
  opacity: 0.7;
}
.btn1{
  display: block;
  background: #333;
  text-align: center;
  color: #fff;
  padding: 10px;
  margin-top: 10px;
  transition: 0.3s;
}
.btn:hover{
  background: #333;
}

    </style>
    
</head>

<body>
    <div id="wrapper">
        <div id="header">
            <div class="header" id="header1">
                <div class="header" id="header-menu">
                    <section class="menuBtn">
                     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                     <i id="menu-icon" class="material-icons">menu</i>
                    </section>
                </div>
                <div class="header">
                    <img id="logo" src="../../images/logo_167.png">
                </div> 
            </div>
            <div class="header" id="header2">
                <form id="search-form">
                    <section id="search-btn-area">
                        <button type="submit" id="search-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                          </svg></button>
                    </section>
                    <section id="search-text-area">
                        <input type="text" id="search-input" name="search-input" placeholder="보고 싶은 영화를 검색해 보세요.">
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
                <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="#a49e9e" class="bi bi-x-circle" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
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
<p id="text1">관심영상목록<p>
        <div id="content">
            <div class="card" padding="50px">
                <div class="top-section">
                  <img id="image-container" src="1.png" alt="">
                  
                  
                </div>
              
                <div class="product-info">
                  <div class="name">영화 제목</div>
                  <div class="dis">영화 설명</div>
                  <a class="btn1" href="#">보러 가기</a>
                </div>
              
              </div>

              <div class="card">
                <div class="top-section">
                  <img id="image-container" src="1.png" alt="">
                  
        
                </div>
              
                <div class="product-info">
                  <div class="name">영화 제목</div>
                  <div class="dis">영화 설명</div>
                  <a class="btn1" href="#">보러 가기</a>
                </div>
              
              </div>

              
                <script type="text/javascript">
                  var container = document.getElementById("image-container");
                  function change_img(image) {
                    container.src = image.src;
                  }
                </script>



            </div>
</body>
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