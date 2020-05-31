package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

	public static Connection getConn(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conexao = DriverManager.getConnection("jdbc:mysql://[server]/[bd]", "[user]", "[senha]");
			return conexao;
		} catch (Exception e) {
			return null;
		}
	}
}
