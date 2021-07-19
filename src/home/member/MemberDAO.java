package home.member;

import java.sql.*;

public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, user, pass;
	
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {}
		url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		user = "hr";
		pass = "hr";
	}
	
	public int insertMember(MemberDTO dto) throws SQLException {
		String sql = "insert into jsp_member values(jsp_member_no.nextval,?,?,?,?,?,?,?)";
		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			ps.setString(1,dto.getId());
			ps.setString(2,dto.getPasswd());
			ps.setString(3,dto.getName());
			ps.setString(4,dto.getBirthday());
			ps.setString(5,dto.getEmail());
			ps.setString(6,dto.getAddress());
			ps.setString(7,dto.getHp());
			
			int res = ps.executeUpdate();
			return res;
		}finally {
			if(ps !=null)ps.close();
			if(con !=null)con.close();
		}
	}
}
