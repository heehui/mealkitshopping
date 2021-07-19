package home.login;

import java.sql.*;

public class LoginCheck {
	// 아이디 패스워드 비교하고 결과를 알려주는 클래스

	public static final int OK = 0;
	public static final int NOT_ID = 1;
	public static final int NOT_PW = 2;
	public static final int ERROR = -1;

	private String id;
	private String passwd;

	public LoginCheck() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {}

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int loginCheck() {
		String sql = "select passwd from jsp_member where id=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "hr";
		String pass = "hr";

		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				String dbPass = rs.getString(1);
				if (dbPass.equals(passwd)) {
					return OK;
				} else {
					return NOT_PW;
				}
			} else {
				return NOT_ID;
			}
		} catch (SQLException e) {
			return ERROR;
		}

	}

}
