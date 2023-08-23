package store;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	
	public static Connection getoracleConnection() throws ClassNotFoundException, SQLException {
		String driver="oracle.jdbc.driver.OracleDriver";
		Class.forName(driver);
		
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="venkat";
		String pass="ramana";
		
		Connection connection = DriverManager.getConnection(url, user, pass);
		return connection;
	}
}
