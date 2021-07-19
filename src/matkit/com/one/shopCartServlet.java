package matkit.com.one;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basketDAO.BasketDAO;
import basketVO.BasketVO;

/**
 * Servlet implementation class shopCartServlet
 */
//@WebServlet("/shopCartServlet")
@WebServlet("*.do")
public class shopCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shopCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {  
        super.init(config);
        //Your code  
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String c = request.getRequestURI().substring(request.getContextPath().length());
		
		String str = null; 
		switch(c) {
		case "/cart_in.do": 
			
			String p_image = request.getParameter("p_image");//장바구니 담기 누른 제품들 parameter로 가져옴
			String p_name = request.getParameter("p_name");
			int price = Integer.parseInt(request.getParameter("price"));
			//int price = 5000;
			int cnt =  Integer.parseInt(request.getParameter("cnt"));
			String user_id ="user1";
			//int cart_id=1;
			//int cnt = 1;
			int one_total = cnt * price;
 			//int one_total = Integer.parseInt(request.getParameter("totalPrice"));
			
			BasketVO bvo = new BasketVO();
			//cvo.setCart_id(cart_id);
			bvo.setUser_id(user_id);
			bvo.setP_image(p_image);
			bvo.setP_name(p_name);
			bvo.setPrice(price);
			bvo.setCnt(cnt); ///
			//bvo.setOne_total(one_total);
				
			HttpSession session1 = request.getSession(); //session에 저장하기 위해
			ArrayList<BasketVO> cartlist = (ArrayList<BasketVO>)session1.getAttribute("cartlist");
			
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
						bdao.insert_cart(user_id,p_image, p_name, price,cnt,one_total);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
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
			
			
		case "/cartView.do":
			
			String user_id1 = "user1";
			BasketDAO bdao1 = null;
			
			try {
				bdao1 = new BasketDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			ArrayList<BasketVO> alist1 = null;
			try {
				alist1 = bdao1.getAllCart(user_id1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			request.setAttribute("cart", alist1);
			str = "cart_in.jsp";
			break;
			
			
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
			//String user_id = request.getParameter("user_id");
			bdao2.deleteAll_cart(user_id2);
			
			session2.getAttribute("cartlist");
			session2.removeAttribute("cartlist"); 
			
			str="cart_in.jsp";
			break;
			
			
		case "/oneUpdate.do": //수량 변경시 수량과 가격을 가져와 update 메소드 실행 /////실행x
			int cnt2 = Integer.parseInt(request.getParameter("cnt"));
			int price2 = Integer.parseInt(request.getParameter("price"));
			String user_id3 = "user1";
			int one_total2 = cnt2 * price2;
			
			break;
			
			
		case "/oneDelete.do": //장바구니 각 제품 행마다 있는 삭제 버튼을 누르면 실행 /////실행x
			int cart_id=Integer.parseInt("cart_id");
	
			HttpSession session3 = request.getSession();
			
			BasketDAO bdao3 = null;
			try {
				bdao2 = new BasketDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//String user_id = request.getParameter("user_id");
			bdao3.one_delete_cart(cart_id);
			session3.getAttribute("cartlist");
			session3.removeAttribute("cartlist");
			
			str="cart_in.jsp";
			break;
			
		case "/totalPrice.do": //결제하기 버튼 누르면 user_id별 총 결제 금액이 넘어가도록
			int all_total1 = Integer.parseInt(request.getParameter("all_total"));
			String user_id4 = "user1"; //임시 아이디 값
			
			BasketDAO bdao4 = null;
			
			try {
				bdao4 = new BasketDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			try {
				bdao4.totalPrice_cart(user_id4, all_total1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			str= "sangpumlist.jsp";
			//str= "결체페이지.jsp";
			break;
			
		}
	
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response); //"cartlist"를 가져가면서 페이지 방향 바꿈
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
