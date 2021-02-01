<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%= request.getContextPath() %>/resources/css/reset.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <title>상품 등록</title>
    <style>
        body {
            text-align: center;
            background-color: rgb(64,64,64);
            margin : 8px auto;
        }

        .contentSection {
            box-sizing: border-box;
            display: inline-block;
            width: 400px;
            height: 730px;
            margin : 0 auto;
            border: 3px solid rgb(255,192,0);
            border-radius: 10px;
            background : #fff;
        }

        .titleDiv {
            margin: 20px auto;
            width: 100%;
            text-align: center;
        }

        .titleDiv > span::before {
            width : 40px;
            height: 1px;
            background: #dadada;
            position: absolute;
            top: 70px;
            left: 50%;
            margin-left: -20px;
            content: "";
        }

        #title {
            color : #0065e3;
            font-weight: bold;
        }

        .insertDiv {
            margin : 30px 0 0 0;
        }

        .insertDiv input {
            outline: none;
            width: 335px;
            height: 10px;
            padding: 15px;

            border: 1px solid #e7e7e7;
            transition: border 0.3s;
            cursor: pointer;
        }

        .insertDiv input:focus {
            border: 1px solid #1c81ff;
        }

        #pImg {
            border : none;
        }


        .pDiv {
            text-align: left;
            margin : 10px 0 0 10px;
        }
        
        .insertDiv p {
            margin-bottom: 5px;
        }

        .insertTitle {
            font-size: 14px;
            font-weight: bold;
        }

        #pContent {
            width : 335px;
            padding : 15px;
            outline: none;

            border: 1px solid #e7e7e7;
            transition: border 0.3s;
            cursor: pointer;
        }

        #pContent:focus {
            border: 1px solid #1c81ff;
        }

        .previewImgDiv {
            text-align: center;
        }

        .btnDiv button {
            width: 365px;
            height: 50px;
            vertical-align: middle;
            cursor: pointer;
            background: #1c81ff;
            border: 1px solid #1b7df8;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .btnDiv button:hover {
            background-color: #0065e3;
            border-color: #0061db;
        }


    </style>
    <% if(request.getAttribute("msg") != null) { %>
    	<script>
    		alert('<%= request.getAttribute("msg") %>');
    		window.opener.location.reload();
    		window.close();
    	</script>
    <%
    	request.removeAttribute("msg");
    	}
    %>
</head>
<body onbeforeunload="refreshAndClose();">
    <section class="contentSection">
        <div class="titleDiv">
            <span id="title">상품 등록</span>
        </div>

        <div class="insertDiv">
            <form id="productInsertForm" action="<%= request.getContextPath() %>/manager/storeInsert" method="post" enctype="multipart/form-data">
                <div class="pNameDiv pDiv">
                    <p class="insertTitle">상품명</p>
                    <input type="text" id="pName" name="pName" placeholder="상품명을 입력하세요.">
                </div>
                <div class="pContentDiv pDiv">
                    <p class="insertTitle">상품 설명</p>
                    <textarea rows="5" id="pContent" name="pContent" placeholder="상품 설명을 입력하세요." style="resize: none;"></textarea>
                </div>
                <div class="pPriceDiv pDiv">
                    <p class="insertTitle">상품 가격</p>
                    <input type="text" id="pPrice" name="pPrice" placeholder="상품 가격을 입력하세요.">
                </div>
                <div class="pQuantityDiv pDiv">
                    <p class="insertTitle">입고 수량</p>
                    <input type="number" id="pQuantity" name="pQuantity" min="1" value="1" step="1">
                    <!-- <input type="hidden" id="pQuan" name="pQuan" value="1"> -->
                </div>
                <div class="pImgDiv pDiv">
                    <p class="insertTitle">상품 이미지</p>
                    <input type="file" name="pImg" id="pImg">
                </div>
                <div class="previewImgDiv pDiv">
                    <img id="previewImg">
                </div>
                <div class="btnDiv pDiv">
                    <button type="button" id="insertBtn" onclick="onSubmit();">상품 등록</button>
                </div>
            </form>
        </div>
    </section>
    <script>
        $(function(){
            $("[type=file]").change(function(){
                loadImg(this);
            });

            function loadImg(element) {
                if(element.files && element.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function(e) {
                        $("#previewImg").attr("src", e.target.result).css({width:"300px", height:"150px", border:"1px solid rgb(255,192,0)"})
                    }

                    reader.readAsDataURL(element.files[0]);
                }
            }
            
            // $("#pQuantity").change(function(){
            // 		$("#pQuan").val($(this).val());
            // });
            
        });

        function onSubmit() {
            var pName = document.getElementById("pName");
            var pContent = document.getElementById("pContent");
            var pImg = document.getElementById("pImg");
            var pQuantity = document.getElementById("pQuantity");
            var pPrice = document.getElementById("pPrice");

            if (pName.value == "") {
                alert('상품명을 입력해주세요.');
                pName.focus();
                return;
            }

            if (pContent.value == "") {
                alert('상품 설명을 입력해주세요');
                pContent.focus();
                return;
            }
            
            if (pPrice.value == "") {
                alert('상품 가격을 입력해주세요');
                pPrice.focus();
                return;
            }

            if(!(pImg.files && pImg.files[0])) {
                alert('상품 이미지를 등록해주세요.')
                return;
            }

            $("#productInsertForm").submit();
        }
        
        function refreshAndClose(){
       		window.opener.location.reload();
       		window.close();
        }
    </script>
</body>
</html>