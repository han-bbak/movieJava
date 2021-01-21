<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<script src="http://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<title>신작 영화</title>
<meta charset="UTF-8">

<style type="text/css">
.slick-slider {
	position: relative;
	display: block;
	box-sizing: border-box;
}

.slick-list {
	position: relative;
	display: block;
	overflow: hidden;
}

.slick-track:before, .slick-track:after {
	display: table;
	content: '';
}

.slick-slide {
	display: none;
	float: left;
	height: 100%;
	min-height: 1px;
}

.slick-initialized .slick-slide {
	display: block;
}

/* 화살표 */
.slick-prev, .slick-next {
	font-size: 0;
	line-height: 0;
	position: absolute;
	top: 50%;
	display: block;
	width: 20px;
	height: 20px;
	padding: 0;
	-webkit-transform: translate(0, -50%);
	-ms-transform: translate(0, -50%);
	transform: translate(0, -50%);
	cursor: pointer;
	color: transparent;
	border: none;
	background: transparent;
}

.slick-prev:before, .slick-next:before {
	font-family: 'slick';
	font-size: 20px;
	line-height: 1;
	opacity: .75;
	color: white;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.slick-prev {
	left: -35px;
}

.slick-prev:before {
	content: '◀';
}

.slick-next {
	right: -35px;
}

.slick-next:before {
	content: '▶';
}

/* 도트바 */
.slick-dots {
	position: absolute;
	bottom: -20px;
	display: block;
	width: 100%;
	padding: 0;
	margin: 10;
	list-style: none;
	text-align: center;
}

.slick-dots li {
	position: relative;
	display: inline-block;
	width: 20px;
	height: 20px;
	margin: 0 5px;
	padding: 0;
	cursor: pointer;
}

.slick-dots li button {
	display: block;
	width: 20px;
	height: 20px;
	padding: 5px;
	cursor: pointer;
	color: transparent;
	border: 0;
	background: transparent;
}

.slick-dots li button:hover:before, .slick-dots li button:focus:before {
	opacity: 1;
}

/* 도트 속성 */
.slick-dots li button:before {
	font-family: 'slick';
	font-size: 10px;
	line-height: 40px;
	position: absolute;
	top: 0;
	left: 0;
	width: 20px;
	height: 20px;
	content: '●';
	text-align: center;
	opacity: .25;
	color: black;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.slick-dots li.slick-active button:before {
	opacity: .75;
	color: black;
}

/* html, body {
	margin: 0;
	padding: 0;
}

* {
	box-sizing: border-box;
} */
.slider {
	width: 70%;
	margin: 100px auto;
}

.slick-slide {
	margin: 0px 20px;
}

.slick-slide img {
	width: 100%;
}

.slick-prev:before, .slick-next:before {
	color: black;
}

.center {
	display: flex;
	justify-content: center;
}

.card {
	max-width: 460px;
	margin: 50px auto;
}

.caption {
	font-weight: bold;
	font-size: 15px;
}
</style>
</head>
<body>
	<header>
		<a href="<%=request.getContextPath()%>views/movie/main/released.jsp"></a>
	</header>
	<section class="center slider">
		<div>
			<img src="../image/released/released1.jpg">
			<span class=center><p class=caption></p></span>
		</div>
		<div>
			<img src="../image/released/released2.jpg"> <span
				class=center><p class=caption></p></span>
		</div>
		<div>
			<img src="../image/released/released3.jpg"> <span
				class=center><p class=caption></p></span>
		</div>
		<div>
			<img src="../image/released/released4.jpg"> <span
				class=center><p class=caption></p></span>
		</div>
		<div>
			<img src="../image/released/released5.jpg"> <span
				class=center><p class=caption></p></span>
		</div>
		<div>
			<img src="../image/released/released6.jpg"> <span
				class=center><p class=caption></p></span>
		</div>
		<div>
			<img src="../image/released/released7.jpg"> <span
				class=center><p class=caption></p></span>
		</div>
		<div>
			<img src="../image/released/released8.jpg"> <span class=center><p
					class=caption></p></span>
		</div>
		<div>
			<img src="../image/released/released9.jpg"> <span class=center><p
					class=caption></p></span>
		</div>
	</section>



</body>
	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script src="WebContent/views/movie/lib/slick/slick.js" type="text/javascript" charset="utf-8"></script>
	<!-- js 파일 include -->
<script type="text/javascript" src="released.js"></script>
	
</html>
