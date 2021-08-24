<%@page import="basketVO.BasketVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



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
  <script src="js/jquery-3.5.1.js"></script>
  
</head>
<body>

  
  <!-- 헤더 -->
 
  <jsp:include page ="header.jsp" flush="true"/>
  
  
  <!--서브 타이틀 -->
  
  <div class="sub_tit_wrap">
                <div class="sub_tit_inner">
                    <h2>결제</h2>
                    <ul class="smap">
                        <li><a href="index.jsp"><img src="./images/home.png" alt="홈으로"></a></li>
                        <li><img class="arrow" src="./images/next9_11.png" alt="하위메뉴"></li>
                        <li class="en">MY ORDER</li>
                        <li><img class="arrow" src="./images/next9_11.png" alt="하위메뉴"></li>
                        <li><a href="./cart1.jsp" class="this">결제</a></li>
                    </ul>
                </div>
            </div>
  
  <!-- 서브타이틀 끝 -->
  
  
  
  <!-- 결제 -->
  <div id="container" >                  
    <div class="cart_wrap">
    <table class="cart_tb" border="0" align="left" style="margin-top:10px;  width: 45%;"> 
	
	<tr><td id="title" colspan="7" align="left">결제상품</td>
	<tr align="center" id="title" class="menu">
		<td width=20% >이미지</td>
		<td width=30%>상품명</td>
		<td width=20%>가격</td>
		<td width=10%>수량</td>
		<td width=20%>합계</td>
		
	 <c:forEach var="cart" items="${sessionScope.cartlist}" >
	 	<tr align="center" id='table'>
		<td width="20"><img src=${cart.p_image}  width='70'></td>
	 	<td width="30" name="p_name" class="cart_cont">${cart.p_name}</td>
	    <td width="20" name="price" class="cart_cont">${cart.price}</td>
	 	<td width="10" class="cart_cont">${cart.cnt}</td>
	 	<c:set var="one_total" value="${cart.price * cart.cnt}"/>
	 	<td width="20" name="one_total" class="cart_cont">${one_total}</td>
	 	<c:set var="all_total" value="0"/>
    <c:forEach var="result" items="${sessionScope.cartlist}">   
    	<c:set var="all_total" value="${all_total + (result.price * result.cnt)}"/> 
 	</c:forEach> 
	
	</c:forEach>
		<tr><td align="right" id="title" colspan="7">상품구매금액  <fmt:formatNumber value="${all_total}" pattern="#,###"/> + 무료배송 = 결제 총 금액 : <fmt:formatNumber value="${all_total}" pattern="#,###"/> 원</td></tr>
	</table>
  		
	<form name="p1" action="pay.jsp" method="post">
		<table class="cart_tb" border="0" align="right" style="margin-top:10px; width: 50%;">
	<!-- 값 가져오기 -->

	<tr><td><div id="container" class="deliInfoArea">
      <div class="deli_info" align="center">
        
        <h5 class="deli_title">배송 정보 입력</h5>
        <span style="font-size:20px; padding-right:50px;">이름</span><input type="text" name="name" class="deli_name" id="id_name" style="width: 300px; height: 20px;" required/><br>
        <span style="font-size:20px; padding-right:32px;">이메일</span><input type="email" name="email" class="deli_email" id="id_email" placeholder="example@matkit.com" style="width: 300px; height: 20px;" required/><br>
        <span style="font-size:20px; padding-right:17px;">전화번호</span><input type="text" name="phone" class="deli_phone" id="id_phone" placeholder="'-' 제외한 숫자만 입력" style="width: 300px; height: 20px;"required/><br>
        <span style="font-size:20px; padding-right:17px;">배송주소</span><input type="text" name="address" class="deli_address" id="id_address" style="width: 300px; height: 20px;" required/><br>
        <span style="font-size:20px; padding-right:17px;">요청사항</span><input type="text" name="req" class="deli_req" id="id_req" style="width: 300px; height: 20px;" placeholder="ex) 배송 전 연락부탁드립니다."><br><br>
       
		<p>
		<span style="font-size:22px; font-weight:800;">총 주문금액 : ${all_total} 원</span><input type="hidden" value="${all_total}" name="totalPrice"><%-- <input type="hidden" value="${param.p_name}" name="p_name"> --%>
		</p><br>
		
		<input type="submit" style="height:35px; width:145px; font-size:14px;" class="btn_order" value="결제하기"> 
		<input type="reset" style="height:35px; width:145px; font-size:14px;" class="btn_cncl" onclick="history.go(-1)" value="취소하기"> 
		<input type="button" style="height:35px; width:145px; font-size:14px;" class="btn_gohome" value="홈으로 가기" onclick="location.href='index.jsp';">
		</div></div></td></tr>
	
	</table>
	</form>
      
    </div>
                
  </div> <!-- container 끝 --><!-- 공지사항 end -->
  
  	<table class="cart_tb" border="0" align="center">
  	</table><br><br>
  

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