import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class test {
public static void main(String[] args) {
	Connection conn = null;
	try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	
		conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=webbansach;user=sa1;password=12345");
	}
	catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println(conn);
}
}
