package basketDBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

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
