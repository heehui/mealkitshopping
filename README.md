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
<img src="https://user-images.githubusercontent.com/78891624/129853983-2454ae3d-b5ef-4a8b-b9cc-a586aa10deab.gif" width="850" height="500"/>
</p>

## 4. 프로젝트 설명

### [4.1 DB 쿼리문](#41-db-테이블-쿼리문)
- 장바구니 테이블 

### [4.2 환경설정 ](#42-환경설정)
- DB 연동 
- Servlet Controller 설정

### [4.3 장바구니 기능 ](#43-장바구니-기능)
- 제품 상세페이지 -> 장바구니 이동
- 장바구니에 담은 제품정보 DB에 저장
- 장바구니 -> 결제페이지 이동




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
			
          ... (생략)		
          
			break;
      
          ... (생략)		
          
			
		}
```
###### -  request.getRequestDispatcher();를 이용하여 페이지의 방향을 바꾸면서 인자도 해당 페이지에 함께 가져갈 수 있도록 한다.
```
RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response); //"cartlist"를 가져가면서 페이지 방향 바꿈
	}

}
```

#

### 4.3 장바구니 기능

- 다음과 같은 흐름으로 웹페이지가 실행된다.

![장바구니 이동1](https://user-images.githubusercontent.com/78891624/132983578-8d8e9e8c-49ad-4318-ac41-a0da345cf859.PNG)


- BasketVO.java
###### - SHOPCART1 DB테이블의 칼럼명과 동일하게 cart 번호, USER 아이디, 제품이미지, 제품명, 제품 가격, 제품 수량, 제품 총 가격 변수를 생성한다.
```
public class BasketVO implements Serializable{
	private int cart_id;
	private String user_id;
	private String p_image;//제품 이미지
	private String p_name;//제품명
	private int price;//가격
	private int cnt;//수량
	private int one_total;
	
  
  .... 생성자, getter, setter 생성

}

```

#### 4.3.1 - 제품 상세페이지 -> 장바구니 이동

- 회원의 경우, 메인페이지에서 [개발언어]를 누르면 전체게시판 및 각 개발언어 카테고리별 게시판이 나타난다.
- 회원은 공지사항을 제외한 모든 게시물을 작성할 권한을 가지고 있다.
- 게시판 화면에서 오른쪽에 <img src="https://user-images.githubusercontent.com/78891624/130184068-8751dc3e-5d3b-4466-b01a-99f77cea28cc.PNG" width="30" height="30"/> 을 눌러 게시물을 작성할 수 있다.


|게시물 작성 및 등록|
|:-:|
|![게시물 작성 및 등록](https://user-images.githubusercontent.com/78891624/129854031-a2dbccee-ff8a-4c0c-b77f-e937ebcac96b.gif?h=750&w=1260)|	

#### 1)  write.jsp
- 게시판 카테고리명, 제목, 이미지, 내용, USER 번호, USER 아이디를 <form>의 post방식으로 BoardController1의 writerAfter 로 보낸다.
- <form> 태그로 파일이나 이미지를 서버로 전송하기 위해 enctype="multipart/form-data" 를 작성한다.
- 게시판 카테고리명(lang)을 select(콤보박스)를 이용하여 개발언어 게시판(java, javascript, spring, html) 중  하나를 선택할 수 있게 했다.

```	    
<form action="writeAfter" method = "post" enctype="multipart/form-data">
       	<div class="form-group">
		<select name="lang">
		 <option value="java">java</option>
		 <option value="javascript">javascript</option>
		 <option value="spring">spring</option>
		 <option value="html">html</option>
		</select>
	</div>
	<div class="form-group">
		 <label for="usr">제목:</label>
		 <input type="text" class="form-control" id="title" name = "title">
	</div>
	<div class="form-group">
		<input type="file" class="form-control-file border" id="img" name="file" multiple="multiple"><br>
	</div>
	<div class="form-group">
		<label for="comment">내용:</label>
		 <textarea class="caption" required="required" name="contents" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
	</div>
		<input type="hidden" name="user_id" value="${principal.user.username}"> //시큐리티 회원 username(=회원 아이디)
		<input type="hidden" name="user_num" value="${principal.user.id}">  //시큐리티 회원 id(=회원 번호)
		   <button type="submit" class="btn btn-info">발행</button>
</form>
```
- USER 아이디와 USER 번호는 아래의 코드와 같이 header.jsp 상단에 작성한 시큐리티 태그라이브러리를 이용하여 불러와 hidden으로 값을 Controller로 넘긴다.

```
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize> <!-- 시큐리티 태그라이브러리 -->
```

#### 2) BoardDAO.java
- 게시물을 등록하는 매퍼 인터페이스를 만들어준다.
```
@Mapper 
public interface BoardDAO { 
	
	public boolean addBoard(BoardVO bvo);
```	

#### 3) BoardService1.java
- @Autowired annotation을 이용하여 매퍼 인터페이스를 객체 형태로 값을 받는다.
- Service에서는 MyBatis의 addBoard를 실행시킨다.
```
@Service
public class BoardService1 {
	
	@Autowired 
	private BoardDAO bdao; //DAO객체를 한번에 받아서
	
	
	public boolean addBoard(BoardVO bvo) {
		return bdao.addBoard(bvo);
	}
```

#### 4) mybatismapper.xml
- num(글번호)는 boardTable2 쿼리문에서 자동 수 증가(AUTO_INCREMENT)를 해줬기 때문에 useGeneratedKeys="true" keyProperty="num" 을 작성해준 후 insert할 칼럼에서 생략한다.
- Service에 의해 해당 쿼리가 실행된다.
```
 <insert id="addBoard" useGeneratedKeys="true" keyProperty="num">
		INSERT INTO 
	    	boardTable2
	   			(
	   				user_id,
	   				lang,
					title,
					contents,
					image,
					user_num
				)
	    	VALUES
	   			(
	   				#{user_id},
	   				#{lang},
	   				#{title},
	   				#{contents},
	   				#{image},
	   				#{user_num}
				)
    </insert>
```

#### 5) BoardController1.java
- 게시판 화면에서 <img src="https://user-images.githubusercontent.com/78891624/130184068-8751dc3e-5d3b-4466-b01a-99f77cea28cc.PNG" width="30" height="30"/>을 클릭하면, 해당Controller의 write로 와서 write.jsp(글쓰기 페이지)로 이동한다.
- @Controller annotation을 이용하여 Controller임을 나타낸다.
- @Autowired annotation을 이용하여 Service를 객체 형태로 값을 받는다.

```
@Controller
public class BoardController1 {
	
	@Autowired
	private BoardService1 bs;
	
	@GetMapping("/write")
	public String write() {
		return "write"; 
	}
```

- 글쓰기 페이지에서 java, javascript, spring, html 중 원하는 개발언어 게시판 카테고리를 콤보박스로 선택한다.
- 제목, 이미지 첨부, 내용을 입력한 후 [발행]을 누르면 BoardController1의 writeAfter 로 이동한다.
- 입력한 값들을 @RequestParam annotation을 통해 파라미터로 가져오고, user_id(USER 아이디)는 session에 저장되도록 한다.
- 첨부한 이미지는 이미지가 저장될 외부 경로인 path를 지정한 후 이미지파일의 이름이 DB에 저장되도록 한다.
- 게시물의 내용은 개행도 적용될 수 있도록 replace를 이용하여 enter(즉, \r\n)를 br 태그로 DB에 저장되도록 한다.
- Service에서 생성한 addBoard를 불러와 각 파라미터값들이 insert 되도록 한다.
- 게시물을 등록하면 mainBoard.jsp(전체 게시판 화면)으로 이동할 수 있도록 return 해준다.
 
```
@PostMapping("/writeAfter")
public String writeAction(
			HttpServletRequest req,
			HttpSession session,
			@RequestParam("file") MultipartFile file, //첨부 이미지
			@RequestParam("lang") String lang, //게시판 카테고리명
			@RequestParam("title")String title, //글 제목
			@RequestParam("user_num")int user_num, //USER 번호
			Model model1) throws IllegalStateException, IOException {

		String contents = req.getParameter("contents"); //게시물 내용
		contents = contents.replace("\r\n", "<br>"); //db에 저장할 때, 개행부분을 br 태그로 변경해준 후 저장

		String user_id=req.getParameter("user_id"); //USER 아이디
		session.setAttribute("user_id", user_id);
	
		String path = "C:/workspace/springbootwork/upload/"; //이미지가 저장될 외부 경로 지정
		
		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(path + file.getOriginalFilename()));
		}
		
		bs.addBoard(new BoardVO(user_id,user_num,0,lang, title, contents, file.getOriginalFilename())); //게시물이 등록됨
		return "board/mainBoard"; //전체 게시판으로 이동
}
```	

#### 4.3.2 게시물 조회
- 메인페이지에서 [개발언어]를 누르면 전체게시판 및 각 개발언어 게시판이 나타난다.
- 등록된 게시물은 섬네일 형태로 이미지, 작성일, 조회수가 표시된다.
- 각 게시물을 클릭하면 그에 맞는 상세페이지(detailView.jsp)로 이동한다.
- 게시물 작성자의 USER 아이디와 로그인한 USER 아이디가 같다면, 게시물을 [수정] 및 [삭제]할 수 있는 권한이 주어진다.
- 그렇지않다면, [수정], [삭제] 버튼이 나타나지 않는다.


|게시물 조회|
|:-:|
|![게시물 조회](https://user-images.githubusercontent.com/78891624/129853983-2454ae3d-b5ef-4a8b-b9cc-a586aa10deab.gif?h=850&w=1260)|	

#### 4.3.2.1 전체 게시판 조회

#### 1) board/mainBoard.jsp
- ajax를 통해 BoardController1에 boardList 로 요청을 보내면 BoardController1 -> BoardService1 -> mapper 인터페이스 -> mapper.xml에서 쿼리를 실행해 
  이 값을 현재 mainBoard.jsp의 result에 데이터 값을 가지고 오게 된다.
- forEach문과 grid CSS를 적용하여 html을 생성해 <tbody> 부분에 섬네일 형식으로 append 시켜준다. (섬네일에 나타나는 것: 이미지, 작성일, 조회수) 
- 각 섬네일을 클릭하면, 그에 맞는 게시물 정보를 BoardController1의 detailView 로 보내 상세페이지인 detailView.jsp가 실행되도록 한다.
```
<script>

$(document).ready(function() {
    $.ajax({
    	
    	url: "boardList", 
    	success: function(result){  // result    
        var html = "<div id='grid' >";
       
       result.forEach(function(item){
    
    	   html+= "<div class='image1'><a href = 'detailView?contents=" + item.contents + 
        				'&image=' + item.image + 
        				'&title=' + item.title +
        				'&user_id=${principal.user.username}' +
        				'&writer=' + item.user_id +
        				'&user_num=' + item.user_num +
        				'&num=' + item.num +
        				'&reply_cnt=' + item.reply_cnt +
        				'&hit=' + item.hit +
        				'&date1=' + item.date1 +
        				'&lang=' + item.lang + "'>" + "<img id='hov1' src='/upload/" + item.image + "' width='200'  height='200'></a>
						<h6 id='date1'>작성일: " + item.date1 + '<br><img src="../images/click.png">' + item.hit + "</h6></div>";
    	  								 						/* ' 댓글수:' + item.reply_cnt */
       })    
       $("#listArea").append(html);
     }});
} ); 

</script>
</head>
<body>		
	<tbody id="listArea" style="width: 50%">
	</tbody>
```

#### 2) BoardDAO.java
- 게시물 전체 조회에 대한 mapper 메소드를 생성한다.
```
public List<BoardVO> getAllBoard();
```

#### 3) BoardService1.java
- Service에서는 MyBatis의 getAllBoard로 실행시킨 데이터를 List에 담아서 BoardController1로 보낸다.
```	
public List<BoardVO> getAllBoard(){
	return bdao.getAllBoard();
}
```


