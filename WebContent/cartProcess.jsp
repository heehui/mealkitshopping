<%@page import="basketVO.BasketVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MatKiT</title>
	<!-- 파비콘  -->
  <link rel="icon" href="./favicon.png"> <!-- title 탭에  파비콘(로고이미지) 띄우기 -->

	<!--브라우저 스타일 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css"/>
  
  <!-- google font -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
  
  <!-- google icon -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

 <!--fontawesome icon : 수량 아이콘 -,+ 아이콘   -->
  <script src="https://kit.fontawesome.com/8702da1fc5.js" crossorigin="anonymous"></script>
  
	<!-- css파일 link 연결 -->
  <link rel="stylesheet" href="./css/main.css"/>
  <link rel="stylesheet" href="./css/footer.css"/>
  <link rel="stylesheet" href="./css/header.css"/>
  <link rel="stylesheet" href="./css/cartIn.css"/>
  <link rel="stylesheet" href="../css/prod_detail.css" />
  
  <!--GSAP & ScrollToPlugin-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js" integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q==" crossorigin="anonymous"></script>
  
  <!--Swiper-->
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
 
  <!--ScrollMagic-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"></script>
  
  <!--Lodash-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.20/lodash.min.js" integrity="sha512-90vH1Z83AJY9DmlWa8WkjkV79yfS2n2Oxhsi2dZbIv0nC4E6m5AbH8Nh156kkM7JePmqD6tcZsfad1ueoaovww==" crossorigin="anonymous"></script>

	<!-- js 파일  -->
  <script defer src="./js/main.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script src="js/jquery-3.5.1.js"></script>
  
</head>
<body>
<script>
/* function goCart(){

Swal.fire({	
	  position: 'center',
	  icon: 'success',
	  title: '장바구니에 상품이 \n 정상적으로 담겼습니다',
	  showConfirmButton: false,
	  timer: 3000
	}).then((result) => {
		
		document.getElementById('send').click();

	})	

} */


	$(document).ready(function() {
		document.getElementById('send').click();
	});
</script>
  
  <!-- 헤더 -->
 
  <jsp:include page ="header.jsp" flush="true"/>
  
  
  <!--서브 타이틀 -->
  
  <div class="sub_tit_wrap">
                <div class="sub_tit_inner">
                    <h2>장바구니</h2>
                    <ul class="smap">
                        <li><a href="index.jsp"><img src="./images/home.png" alt="홈으로"></a></li>
                        <li><img class="arrow" src="./images/next9_11.png" alt="하위메뉴"></li>
                        <li class="en">MY CART</li>
                        <li><img class="arrow" src="./images/next9_11.png" alt="하위메뉴"></li>
                        <li><a href="./cart1.jsp" class="this">장바구니</a></li>
                    </ul>
                </div>
            </div>
  
  <!-- 서브타이틀 끝 -->
  
  
  
  <!-- 장바구니 -->
  <div id="container">
	                    
    <div class="cart_wrap">
    
    <table class="cart_tb" border="0" align="center" style="margin-top:50px;"> 
	<tr><h1>loading...</h1></tr>
	<tr>
	<form action="cart_in.do" method="get">
		<input type="hidden" name="p_image" value="'${param.p_image}'">
		<input type="hidden" name="p_name" value="'${param.p_name}'">
		<input type="hidden" name="price" value="${param.price}">
		<input type="hidden" name="cnt" value="${param.cnt}">
		<input type="hidden" name="user_id" value="${param.user_id}">
		<input type="submit"  id="send" value="" style="background-color:transparent;  border:0px transparent solid;"> 
	</form>
	</tr>
	
	</table>
	</form>
        
    </div>
                
  </div> <!-- container 끝 --><!-- 공지사항 end -->
  
  
  
  

 <!--AWARDS-->
  <section class="awards">
    <div class="inner">

      <div class="swiper-container">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <img src="./images/awards_slide1.jpg" alt="대통령 표창" />
          </div>
          <div class="swiper-slide">
            <img src="./images/awards_slide2.jpg" alt="우수사업주 인증" />
          </div>
          <div class="swiper-slide">
            <img src="./images/awards_slide3.jpg" alt="대한상의회장상" />
          </div>
          <div class="swiper-slide">
            <img src="./images/awards_slide4.jpg" alt="기업사회공헌 활동 부문" />
          </div>
          <div class="swiper-slide">
            <img src="./images/awards_slide5.jpg" alt="KSI 1위 (5년 연속)" />
          </div>
          <div class="swiper-slide">
            <img src="./images/awards_slide6.jpg" alt="KS-SQI 1위 (5년 연속)" />
          </div>
          
          
        </div>
      </div>

      <div class="swiper-prev">
        <span class="material-icons">arrow_back</span>
      </div>
      <div class="swiper-next">
        <span class="material-icons">arrow_forward</span>
      </div>

    </div>
  </section>



    <!-- footer  -->
  <jsp:include page ="footer.jsp" flush="true"/>


  <!--TO TOP BUTTON-->
  <div id="to-top">
    <div class="material-icons">arrow_upward</div>
  </div>



</body>
</html>