package home.member;

import java.sql.*;

public class MemberDAO {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String user = "hr";
	String password = "hr";
	
	Connection con;
	Statement stmt;
	ResultSet rs;
	
	public MemberDAO() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public int insertMember(MemberDTO user) {
		
		String sql = "insert into jsp_member values(jsp_member_no.nextval,'%s','%s','%s','%s','%s','%s','%s')";
		sql = String.format(sql, user.getId(), user.getPasswd(), user.getName(), user.getBirthday(), user.getEmail(), user.getAddress(), user.getHp());
		
		try {
			stmt = con.createStatement();
			int row = stmt.executeUpdate(sql); 
			
			return row;
			
		} catch(SQLException e){
			System.out.println(e.getMessage());
		}
		
		finally {
			close();
		}
		
		return 0;
	}

	public MemberDTO selectJsp_memberOne(MemberDTO user) {
		String sql = "select * from jsp_member where ID='%s' and passwd='%s'";
		sql = String.format(sql, user.getId(), user.getPasswd());

		try {

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			rs.next();

			MemberDTO dto = new MemberDTO();

			dto.setAddress(rs.getString("address"));
			dto.setBirthday(rs.getString("birthday"));
			dto.setEmail(rs.getString("email"));
			dto.setHp(rs.getString("hp"));
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setNo(rs.getInt("no"));
			dto.setPasswd(rs.getString("passwd"));

			return dto;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		} finally {
			close();
		}
		
		return null;
	}

	private void close() {
		try {
			if(rs != null)
				rs.close();
			if(stmt != null)
				stmt.close();
			if(con != null)
				con.close();
			
		}catch (Exception e) {
			
		}
		
	}

}
