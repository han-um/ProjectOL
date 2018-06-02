package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://openlecture.cea7vfme2wkn.ap-northeast-2.rds.amazonaws.com:3306/openlecture?serverTimezone=UTC";
			String dbID = "openlecture";
			String dbPassword = "SWTeam03";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int signin(String in_Username, String in_Password) {
		String SQL = "SELECT Password from User where Username = ?"; 
		try {
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1,  in_Username);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				if(rs.getString("Password").equals(in_Password)) {
					return 1;
				}
				else
					return 0; 
			}
			return -1; 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; 
	}
	
	public String[] getuserinfo(String in_Username) {
		String SQL = "SELECT * from User where Username = ?"; 
		String[] result =  new String[4];
		try {
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1,  in_Username);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				result[0] = rs.getString("Question");
				result[1] = rs.getString("Answer");
				result[2] = rs.getString("Date");
				result[3] = rs.getString("Token");
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String[] result2 =  new String[4];
		return result2;
	}
	
	public int signup(User user) {
		String SQL = "insert into User values ( ?, ?, ?, ?, ?, NOW(), 0, null)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getUsername());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getQuestion());
			pstmt.setString(5, user.getAnswer());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int addToken(String in_Username, int token) {
		String SQL = "UPDATE User set Token = Token + ? where Username = ? "; 
		try {
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1,  token);
			pstmt.setString(2,  in_Username);
			pstmt.executeUpdate(); 
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; 
	}
}
