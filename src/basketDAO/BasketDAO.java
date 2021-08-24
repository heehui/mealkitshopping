package basketDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import basketDBConn.BasketDBConn;
import basketVO.BasketVO;



public class BasketDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public BasketDAO() throws ClassNotFoundException, SQLException {
		con = new BasketDBConn().getConnection();
	}

	public void pstmtClose() throws SQLException {
		if(pstmt != null) {
			pstmt.close();
		}
	}

	public void getAllInfoClose() throws SQLException {
		if(rs != null) {
			rs.close();
		}
		if(pstmt != null) {
			pstmt.close();
		}
		if(con != null) {
			con.close();
		}
	}					
	//장바구니에 담은 후에 장바구니 화면에 보일 제품 목록들
	public ArrayList<BasketVO> getAllCart(String user_id1) throws SQLException{
		ArrayList<BasketVO> ciarray = new ArrayList<>();
		String sql = "SELECT * FROM ShopCart1 where user_id = ?";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user_id1);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int cart_id = rs.getInt("cart_id");
			String user_id = rs.getString("user_id");
			String p_image = rs.getString("p_image");
			String p_name = rs.getString("p_name");
			int price = rs.getInt("price");
			int cnt = rs.getInt("cnt");
			int one_total = rs.getInt("one_total");

			BasketVO cv = new BasketVO(cart_id, user_id,p_image, p_name, price,cnt,one_total);

			ciarray.add(cv);
		}

		return ciarray;

	}			
	//String user_id//로그인한 user_id로 주문한 제품의 이미지, 제품명, 가격, 수량 DB에 insert
	/*public boolean insert_cart(String user_id,String p_image, String p_name,int price,int cnt) throws SQLException {
		String sql = "INSERT into ShopCart1 values(?,?,?,?,?)";
	try {											//(?,?,?,?,?)
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user_id);
		pstmt.setString(2, p_image);
		pstmt.setString(3, p_name);
		pstmt.setInt(4, price);
		pstmt.setInt(5, cnt);
		//amount = cvo.getPrice() * cvo.getCnt();
		//pstmt.setInt(6, amount);

		pstmt.executeUpdate();
	}catch(SQLException e) {
		System.out.println("insert Exception");
		e.printStackTrace();
		return false;
	}
		return true;
}//insert-end
	 */								//int cart_id,
	public boolean insert_cart(String user_id,String p_image, String p_name,int price,int cnt,int one_total) throws SQLException {
		String sql = "INSERT into ShopCart1 values(aaa.nextval,?,?,?,?,?,?)";
		try {										//cart_id에 시퀀스를 줘서 장바구니에 담은 상품 종류별로 다른 번호를 부여.
			pstmt = con.prepareStatement(sql);
			//pstmt.setInt(1, cart_id);
			pstmt.setString(1, user_id);
			pstmt.setString(2, p_image);
			pstmt.setString(3, p_name);
			pstmt.setInt(4, price);
			pstmt.setInt(5, cnt);
			pstmt.setInt(6, one_total);

			pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("insert Exception");
			e.printStackTrace();
			return false;
		}
		return true;
	}//insert-end
	
	
	public boolean totalPrice_cart(String user_id,int all_total) throws SQLException {
		String sql = "INSERT into totalPrice values(?,?)";
		try {										//cart_id에 시퀀스를 줘서 장바구니에 담은 상품 종류별로 다른 번호를 부여.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, all_total);

			pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("insert2 Exception");
			e.printStackTrace();
			return false;
		}
		return true;
	}//insert-end


	//로그인한 user_id로 주문한 제품의 수량, 한개의 품목에 대한 합계 수정.
	public boolean update_cart(int cnt, int price, int one_total,String user_id, String  p_name) throws SQLException {

		String sql ="update ShopCart1 set cnt =?, price = ?,one_total = ? where user_id = ? and p_name= ?";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, cnt);
		pstmt.setInt(2, price);
		pstmt.setInt(3, one_total);
		pstmt.setString(4, user_id);
		pstmt.setString(5, p_name);
		pstmt.executeUpdate();

		return true;
	}
	//로그인한 user_id로 주문한 제품에 대한 장바구니 전체 삭제.
	public boolean deleteAll_cart(String user_id){
		String sql = "delete from ShopCart1 where user_id =?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.executeUpdate();/////////////

		}catch(SQLException e) {
			System.out.println("delete Exception");
			e.printStackTrace();
			return false;
		}
		return true;
	}//delete-end

						//cart_id로 장바구니 개별 삭제.
	public boolean one_delete_cart(String p_name){
		String sql = "delete from ShopCart1 where p_name =?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_name);
			pstmt.executeUpdate();/////////////

		}catch(SQLException e) {
			System.out.println("one_delete Exception");
			e.printStackTrace();
			return false;
		}
		return true;
	}//delete-end
	//같은 이름의 제품을 또 insert할 경우, 수량과 각제품의 합계만 update되도록
	public boolean cntUpdate_cart(int cnt,int one_total,String p_name) throws SQLException {
		String sql ="update ShopCart1 set cnt =?, one_total = ? where p_name= ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, cnt);
		pstmt.setInt(2, one_total);
		pstmt.setString(3, p_name);
		pstmt.executeUpdate();

		return true;
	}

}

