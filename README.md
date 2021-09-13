# Front Controller, Oracle을 이용한 밀키트 쇼핑몰 웹사이트 'Matkit'
#### - 제가 맡은 장바구니 기능, Servlet 위주로 작성했습니다. 
##### - 초기시작 URL은 http://localhost:8083/Matkit_Pj/index.jsp 입니다.
---
## 1. 프로젝트 개요 
- 1인 가구의 증가와 언택트 시대에 발맞추어, 밀키트 판매 전문 쇼핑몰인 MatKiT 사이트를 개설하여 고객이 원하는 제품을 직접 선택하고 구입하는 것이 가능하도록 하였다.
- 회원가입을 하여 회원정보를 저장할 수 있고 비회원일지라도 장바구니에 제품을 추가하고 비울 수 있게 하였다.
- 원하는 제품을 장바구니에 담아 온라인 결제를 통해 시간과 장소에 상관없이 편리하게 다양한 음식을 즐길 수 있다.


## 2. 프로젝트 개발의 목적
- 핵가족화를 뛰어넘은 1인가구 증가하고 있다.
- 코로나 확산으로 인한 음식점 방문 기피 현상과, 배달 및 포장 자취 등으로 식사를 해결하는 세대가 증가하고 있다.
- 인스턴트식품보다 건강하고, 간편한 ‘밀키트 제품’이 새롭게 대두되고 있다.
- HTML, CSS, JSP, Servlet등을 사용하여 시스템을 개발하고, DB연동을 활용하여 해당 프로젝트를 개발하고자 한다.

## 3. 프로젝트 상세 내용

![프로그램구조1](https://user-images.githubusercontent.com/78891624/132982176-b742674a-8498-469c-a398-5d8230facac8.PNG)

 ### 1) 메인 페이지
- header<br>
: [LOGIN], [JOIN], [ORDER], [MYPAGE] 각 버튼을 클릭하면 각 해당 페이지로 이동하게 된다.<br>
: [MatKiT], [BEST], [밀키트], [NEWS], [FAQ], [REVIEW] 각 버튼을 클릭하면 해당 페이지로 이동하게 된다.
- body: MatKiT 쇼핑몰에서 판매하는 대표 제품명과 이미지가 표시되도록 디자인되었으며 간략한 쇼핑몰 특징을 기술되어 있다.
- footer: 개인정보처리방침, 운영관리 방침, 페이지 이용약관, 위치정보 이용약관, 사업자등록번호, 대표자명, 전호번호 및 팩스번호, 저작권 표시 등이 표기된다.


 ### 2) 제품 상세페이지
- 메인 페이지의 [밀키트] 버튼을 누르면 [한식], [중식], [양식], [반찬], [샐러드] 버튼이 보이게 된다.
- 각 버튼 클릭 시 해당되는 제품목록 페이지로 이동하게 된다.(한식, 중식, 양식, 반찬, 샐러드 5가지 카테고리와 각 메뉴 별 개별페이지 17개로 구성)
- 제품 상세페이지에서 (-), (+) 를 클릭하여 제품의 수량을 조절하면 상품가격도 함께 계산이 된다.
- 각 제품에 대한 정보와 레시피, 배송정보에 대해 기술되어 있다.


 ### 3) 로그인 및 회원가입
- header부분의 [JOIN] 버튼을 통해 가입정보(아이디, 비밀번호, 이름, 생년월일, 본인확인 이메일, 주소, 전화번호)를 입력하면 DB에 가입 정보가 저장된다.
- [LOGIN] 버튼을 통해 회원가입 되지 않은 아이디와 비밀번호를 입력 시 로그인이 제한되며 회원가입된 정보라면 로그인이 정상적으로 진행되도록 되어있다.


 ### 4) 장바구니
- 장바구니 화면에 제품 상세페이지에서 [장바구니]를 누른 제품에 대한 제품이미지, 제품명, 가격, 수량, 총 가격이 표시된다.
- session에도 각각의 정보가 저장될 수 있도록 하여 페이지가 이동되어도 값이 사라지지 않는다.
- 장바구니 비우기를 통해 session을 끊을 수 있다.


 ### 5) 결제 페이지
 - 장바구니에서 넘어온 제품정보를 받아와 주문을 위해 입력한 이름, 이메일, 전화번호, 주소를 입력한 후 [결제하기] 버튼을 누르면 이니시스(웹 표준결제) 결제시스템으로 연결되어서 결제가 진행된다.
 
 #

<p align="center">
<img src="https://user-images.githubusercontent.com/78891624/133044245-c7577786-397e-49dd-b03e-bab2fcfae727.gif" width="850" height="500"/>
</p>



## 4. 프로젝트 설명

### [4.1 DB 쿼리문](#41-db-테이블-쿼리문)
- 장바구니 테이블 

### [4.2 환경설정 ](#42-환경설정)
- DB 연동 
- Servlet Controller 설정

### [4.3 장바구니 기능 ](#43-장바구니-기능)
- 제품 상세페이지에서 장바구니 이동
- 장바구니 DB 저장
- 장바구니 전체 비우기
- 장바구니 제품정보 DB에 저장
- 장바구니에서 결제페이지 이동


#

### 4.1 DB 테이블 쿼리문

- 장바구니 테이블(ShopCart1)
###### - cart 번호, USER 아이디, 제품이미지, 제품명, 제품 가격, 제품 수량, 제품 총 가격 칼럼을 생성한다.
```
CREATE TABLE SHOPCART1(	
 
  CART_ID NUMBER(3,0) NOT NULL,  --cart 번호
	USER_ID VARCHAR2(50), -- USER 아이디
	P_IMAGE VARCHAR2(100), -- 제품이미지
	P_NAME VARCHAR2(100), -- 제품명
	PRICE NUMBER(9,0), -- 제품 가격
	CNT NUMBER(3,0), -- 제품 수량
	ONE_TOTAL NUMBER(10,0) -- 제품 총 가격
   
 );
```

#

### 4.2 환경설정
#### 4.2.1 BasketDBConn.java
- DB 연동
###### - 오라클 데이터베이스가 연동될 수 있도록 한다.
```
public class BasketDBConn {
	private Connection con;
	
	public Connection getConnection() {
		return con;
	}
	
	public BasketDBConn() throws ClassNotFoundException, SQLException {
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
	}
}
```

- Servlet Controller 설정
###### - Servlet이 Controller 역할을 하여 처리할 수 있도록 한다.
###### - annotation @WebServlet을 통해 .do로 끝나는 모든 URL을 해당 컨트롤러로 불러와 서블릿에서 처리될 수 있도록 매핑해준다.
```
@WebServlet("*.do")
public class shopCartServlet extends HttpServlet {
```
###### - 요청, 응답에 대한 한글처리를 해준다.
```
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
    
    ...

```
###### - getRequestURI()를 이용하여 프로젝트명/파일명.do을 불러온 후 /파일명.do 값을 가져온다(어떤 .do 파일들이 컨트롤러로 넘어왔는 지 파일명을 파악하기 위해)
```
String c = request.getRequestURI().substring(request.getContextPath().length());

String str = null; 
```
###### - switch문을 이용하여 컨트롤러로 들어온 파일명에 따라 작업을 수행할 수 있도록 해준다.
```
switch(c) {
		case "/cart_in.do": 
			
          ... 		
          
		break;
      
          ... 
			
		}
```
###### -  request.getRequestDispatcher();를 이용하여 페이지의 방향을 바꾸면서 인자도 해당 페이지에 함께 가져갈 수 있도록 한다.
```
RequestDispatcher rd1 = request.getRequestDispatcher(str);
rd1.forward(request, response); 

	}

}
```

#

### 4.3 장바구니 기능

- 다음과 같은 흐름으로 웹페이지가 실행된다.

![장바구니 이동1](https://user-images.githubusercontent.com/78891624/132983578-8d8e9e8c-49ad-4318-ac41-a0da345cf859.PNG)


- BasketVO.java
###### - SHOPCART1 DB테이블의 칼럼명과 동일하게 cart 번호, USER 아이디, 제품이미지, 제품명, 제품 가격, 제품 수량, 제품 총 가격 변수를 생성한다.
###### - 각 변수별 getter, setter와 생성자를 생성한다.
```
public class BasketVO implements Serializable{

	private int cart_id;
	private String user_id;
	private String p_image;//제품 이미지
	private String p_name;//제품명
	private int price;//가격
	private int cnt;//수량
	private int one_total;
  	
	...

}

```

#### 4.3.1 제품 상세페이지에서 장바구니 이동
- 각 밀키트 제품 상세페이지에서 <img src="https://user-images.githubusercontent.com/78891624/133028529-f1e79f03-78bc-43c1-924d-9cc2fd39c254.PNG" width="110" height="40"/>를 눌러 장바구니에 담으면 '장바구니에 상품이 정상적으로 담겼습니다'라는 알림 창이 뜬다.
- 그 후 해당 제품의 제품이미지, 제품명, 제품가격, 수량 값이 cartProcess.jsp를 보내진다.
- click()에 의해 장바구니 화면으로 바로 이동할 수 있게 한다.
- 위와 같은 방식으로 원하는 제품을 장바구니에 계속 담을 수 있다.

![MatKiT2](https://user-images.githubusercontent.com/78891624/133044245-c7577786-397e-49dd-b03e-bab2fcfae727.gif)
![MatKiT3](https://user-images.githubusercontent.com/78891624/133044325-f876b8e2-7e2c-4353-92c6-fcaf815dee02.gif)
![MatKiT1_1](https://user-images.githubusercontent.com/78891624/133044375-18c8a5eb-8104-4179-b8e2-4aba1eb53ce3.gif)

|장바구니로 이동|
|:-:|
|![장바구니로 이동](https://user-images.githubusercontent.com/78891624/133044375-18c8a5eb-8104-4179-b8e2-4aba1eb53ce3.gif?h=750&w=1260)|	

#### 1)  제품상세페이지 (예시: view_bibimbab.jsp)
- <img src="https://user-images.githubusercontent.com/78891624/133028529-f1e79f03-78bc-43c1-924d-9cc2fd39c254.PNG" width="110" height="40"/>를 누르면 자바스크립의 goCart() 함수를 실행시켜 '장바구니에 상품이 정상적으로 담겼습니다'라는 알림 창이 뜬다.
- 자바스크립트의 document.getElementById를 이용하여 제품의 제품이미지, 제품명, 제품가격, 수량 값을 cartProcess.jsp로 보낸다.

```
<script>
function goCart(){
					
	Swal.fire({	
		 position: 'center',
		 icon: 'success',
		 title: '장바구니에 상품이 \n 정상적으로 담겼습니다',
		 showConfirmButton: false,
		 timer: 3000
		}).then((result) => {
					
	var p_image1 = document.getElementById('pho_detail');
	var p_image = p_image1.getAttribute("src").substring(1); //이미지
	var p_name=  document.getElementById('item_name').innerText; //제품명	
	var price = document.getElementById('howmuch').innerText.split("원",1); //가격
	var cnt = document.getElementById('result').innerText; //수량
					
	location.href="../cartProcess.jsp?p_image=" + p_image + "&p_name=" + p_name + "&price=" + price + "&cnt=" + cnt;
					
	})	
}
</script>
```


#### 2) cartProcess.jsp
- click()에 의해 id가 send인 버튼을 자동으로 클릭되도록 한다.
```
<script>

$(document).ready(function() {
	document.getElementById('send').click();
});
	
</script>
```
-  제품 상세페이지에서 넘어온 값들을 파라미터로 받은 후 cart_in.do(Controller)로 이동되도록 한다.
```
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
    </div>    
  </div> 

```

#### 3) cart_in.jsp
- 장바구니 화면
- @Controller annotation을 이용하여 Controller임을 나타낸다.
- @Autowired annotation을 이용하여 Service를 객체 형태로 값을 받는다.

```
 <div id="container">                    
    <div class="cart_wrap">
    <table class="cart_tb" border="0" align="center" style="margin-top:50px;"> 
     <tr><td id="title" colspan="8" align="left">구매상품</td>
     <tr><td colspan="8" align="left"><input type="checkbox" name="goods" style="font-weight:700;" checked>일반상품(${fn:length(cartlist)})</td> 
     <tr align="center" id="title" class="menu"><td width=5%></td>
	<td width=20% >이미지</td>
	<td width=30%>상품명</td>
	<td width=20%>가격</td>
	<td width=10%>수량</td>
	<td width=20%>합계</td>
	<td width=30% colspan="2">선택</td>	
	<c:choose>
	<c:when test="${cartlist == null}">
		<tr><td colspan="7" align="center">장바구니가 비어있습니다</td></tr>
	</c:when>
	<c:otherwise>
	 	<c:forEach var="cart" items="${sessionScope.cartlist}"  varStatus="status">
	 	  <tr align="center" id='table'><%-- <td id="count">${status.count}</td> --%>
	 	   <td class="cart_cont"><input type="checkbox" name="select1" checked ></td>
		   <td width="20"><img src=${cart.p_image}  width='90'></td>
	 	   <td width="30" name="p_name" class="cart_cont"><span id="p_name_${status.index}">${cart.p_name}</span></td>
	           <td width="20" name="price" class="cart_cont"><span id="price_${status.index}">${cart.price}</span></td>
	    
	 	<td width=10% class="cart_cont">
	 	 <input type='button' id='${status.index}' onclick='count("minus",this.id)' value='-'/>
               	 <span id='result_${status.index}' class="quantity">${cart.cnt}</span>
            	 <input type='button' id='${status.index}' onclick='count("plus",this.id)' value='+'/></td>
	 	
  	 	 <c:set var="one_total" value="${cart.price * cart.cnt}"/>
	 	  <td width=20% name="one_total" class="cart_cont">
	 	  <span id="totalPrice_${status.index}">${one_total}</span></td>
		
		  <td width="10" class="cart_cont"><input type="button" value="수정"  id='${status.index}' onclick="oneUpdate(this.id)" ></td>
		  <td width="10" class="cart_cont"><input type="button" value="삭제" id='${status.index}' onclick= "deleteRow(this,this.id);"></td>
		  </tr>
	       </c:forEach>
	</c:otherwise>
        </c:choose>	
     </table>	

		<c:set var="all_total" value="0"/>
    		<c:forEach var="result" items="${sessionScope.cartlist}">   
    		 <c:set var="all_total" value="${all_total + (result.price * result.cnt)}"/> 
 		</c:forEach> 

	<table class="cart_tb" border="0" align="center">
	<tr><td align="right" id="title">상품구매금액  <fmt:formatNumber value="${all_total}" pattern="#,###"/> + 무료배송 = 결제 총 금액 : <fmt:formatNumber value="${all_total}" pattern="#,###"/> 원</td><!-- 전체 상품 가격 나오게 --></tr>
	<tr><td align="right"><input type="button" class="btn_chk_del" style="height:35px; width:145px; font-size:14px;" value="선택상품삭제" >
		<input type="button" style="height:35px; width:145px; font-size:14px;" value="장바구니 비우기" class="btn_cart_del" onclick="delAllitem()"></td></tr>
	<tr><td align="center"><input type="button" style="height:35px; width:145px; font-size:14px;" value="결제창이동" class="btn_cart_del" onclick="location.href='payView.jsp'"></td></tr>
	</table>	
    </div>            
  </div> <!-- container 끝 --><!-- 공지사항 end -->
 
```
#### 4.3.2 장바구니 DB 저장
#### 1) shopCartServlet.java

- 제품 상세페이지에서 <img src="https://user-images.githubusercontent.com/78891624/133028529-f1e79f03-78bc-43c1-924d-9cc2fd39c254.PNG" width="110" height="40"/>를 누르면 cartProcess.jsp를 거쳐 cart_.do(Controller)로 이동하게 된다.
- switch문의 case "/cart_in.do": 가 실행된다.
- cartProcess.jsp에서 넘어온 제품정보 파라미터값을 받아와 BasketVO 객체에 담아준다.
- 이 때 USER 아이디는 user1이라는 임시값을 주었고, 총 가격(on_total)은 수량 * 가격 값을 넣어준다.
- BasketVO 객체에 담은 값들을 session에 담아 페이지가 이동해도 그대로 장바구니에 제품정보가 나타나도록 해준다.
- 새로운 제품을 장바구니에 담을 때마다 새로운 BasketVO 객체를 생성하여 ArrayList 컬렉션에 담도록 한다.
- cartlist라는 속성명의 session에 저장한다.
```
	String c = request.getRequestURI().substring(request.getContextPath().length());
		
	String str = null; 
	switch(c) {
	case "/cart_in.do": 
			
		String p_image = request.getParameter("p_image");//장바구니 담기 누른 제품들 parameter로 가져옴
		String p_name = request.getParameter("p_name");
		int price = Integer.parseInt(request.getParameter("price"));
		int cnt =  Integer.parseInt(request.getParameter("cnt"));
		String user_id = "user1";
		int one_total = cnt * price;
			
		BasketVO bvo = new BasketVO();
		bvo.setUser_id(user_id);
		bvo.setP_image(p_image);
		bvo.setP_name(p_name);
		bvo.setPrice(price);
		bvo.setCnt(cnt); 
			
		HttpSession session1 = request.getSession(); //session에 저장하기 위해
		ArrayList<BasketVO> cartlist = (ArrayList<BasketVO>)session1.getAttribute("cartlist");
```			
- 장바구니에 제품을 담을 때 아무것도 없는 상태에서 처음 담았을 경우, new ArrayList<BasketVO>();로 컬렉션 객체를 생성하고
- BasketDAO의 insert_cart를 실행시켜 데이터베이스에 제품정보가 저장되도록 한다.
```
BasketDAO bdao = null;
			
	try {
		bdao = new BasketDAO();
	} catch (ClassNotFoundException | SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
		if(cartlist == null){
			cartlist = new ArrayList<BasketVO>();
			cartlist.add(bvo);
			try {
				dao.insert_cart(user_id,p_image, p_name, price,cnt,one_total);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
```
- ArrayList<BasketVO>값 cartlist가 null이 아닐 때, 이미 장바구니에 담긴 제품명이 있을 때
- ArrayList<BasketVO>값의 제품명(getP_name())을 현재 담은 제품명과 비교하여 같은 경우(이미 담긴 경우), cart_in.jsp에서 테이블 행수를 늘리는 것이 아니라 해당 제품명의 수량만 v.setCnt(v.getCnt()+cnt)로 늘려준다.
```
}else{
	boolean find = false;
	for(BasketVO v : cartlist) {
	if(v.getP_name().equals(p_name)) { //이전에 넣었던 제품과 동일한 이름의 제품을 담았다면,
		v.setCnt(v.getCnt()+cnt); // 수량만 늘려주기.
	try {
		bdao.cntUpdate_cart(v.getCnt(),v.getCnt()*v.getPrice(),p_name);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	find = true;
		}
}
```
- 이전에 없던 제품이라면 해당 BasketVO  객체 값을 cartlist에 add해준다.
- 그리고 이 컬렉션 객체를 cartlist라는 속성명으로 session에 저장한다.
- 곧바로 cartView.do(Controller)로 이동하여 새로 바뀐 변수값들을 보낸다.
				
```			
if(find == false) {
	cartlist.add(bvo); //이전에 없던 제품이라면 cartlist에 넣어주기
	try {
		bdao.insert_cart(user_id,p_image, p_name, price,cnt,one_total);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		}
				
	}
	session1.setAttribute("cartlist", cartlist); //세션에 저장
			
	str = "cartView.do?p_image=" + p_image + "&p_name=" + p_name + "&price=" + price + "&cnt=" + cnt + "&one_total=" + one_total;
	break;
```
#### 4.3.3 장바구니 전체 비우기
#### 1) cart_in.jsp
- 장바구니 화면에서 [장바구니 비우기]를 누르면 delAllitem()가 실행된다.
```
function delAllitem(){ //장바구니 모두 비우기 
	location.href = "cartClear.do";
}
``` 
#### 2) shopCartServlet.java
- cartClear.do(Controller)로 이동하여 DB에서도 모든 장바구니 정보를 삭제하고 cartlist라는 session값이 제거된다.
```
case "/cartClear.do": //장바구니 모두 비우기
	String user_id2 = "user1";
	HttpSession session2 = request.getSession();
			
	BasketDAO bdao2 = null;
	try {
		bdao2 = new BasketDAO();
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		bdao2.deleteAll_cart(user_id2);

		session2.getAttribute("cartlist");
		session2.removeAttribute("cartlist"); 
			
		str="cart_in.jsp";
	break;
```
#### 3) BasketDAO.java
- 장바구니 정보를 전체 삭제하는 메서드 deleteAll_cart()를 생성한다.
```
public boolean deleteAll_cart(String user_id){
   String sql = "delete from ShopCart1 where user_id =?";
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user_id);
		pstmt.executeUpdate();

	}catch(SQLException e) {
		System.out.println("delete Exception");
		e.printStackTrace();
		return false;
	}
	return true;	
}
```
#### 4.3.4 장바구니에서 결제페이지 이동
- 장바구니의 [결제창이동]을 눌러 결제페이지로 이동하게 된다.
- 
#### 1)payView.jsp
```
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
	  <tr><td align="right" id="title" colspan="7">
	  상품구매금액<fmt:formatNumber value="${all_total}" pattern="#,###"/> + 무료배송 = 결제 총 금액 : <fmt:formatNumber value="${all_total}" pattern="#,###"/> 원</td></tr>
	</table>
  		
	<form name="p1" action="pay.jsp" method="post">
 		<table class="cart_tb" border="0" align="right" style="margin-top:10px; width: 50%;"><!-- 값 가져오기 -->
		<tr><td><div id="container" class="deliInfoArea">
      	<div class="deli_info" align="center">
        <h5 class="deli_title">배송 정보 입력</h5>
        <span style="font-size:20px; padding-right:50px;">이름</span><input type="text" name="name" class="deli_name" id="id_name" style="width: 300px; height: 20px;" required/>		<br>
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
```
