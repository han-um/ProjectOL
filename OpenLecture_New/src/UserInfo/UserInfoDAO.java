package UserInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.User;

public class UserInfoDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserInfoDAO() {
		try {
			String dbURL = "jdbc:mysql://openlecture.cea7vfme2wkn.ap-northeast-2.rds.amazonaws.com:3306/openlecture?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
			String dbID = "openlecture";
			String dbPassword = "SWTeam03";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * ȸ�� ���� �������� �޼ҵ�
	 * @param in_Username - ������ ������ ���� ID
	 * @return String[] result - �迭�� 0~4������ ���� ����,�亯,������,��ū(����)�� ��ȯ�� 
	 */	
	
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
	
	/**
	 * ȸ�� ���� ���� �޼ҵ�.
	 * @param in_Username - �α��� �� ȸ�� ���̵�, userinfo - ������ ���� ����
	 * @return int result - ����� �Ӽ� ��
	 */
	
	public int changeuserinfo(UserInfo userinfo, String in_Username) {
		int result=0;
		String SQL = "UPDATE User SET Password = ?, Question = ?, Answer = ? where Username = ?";
		try {
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1, userinfo.getPassword());
			pstmt.setString(2, userinfo.getQuestion());
			pstmt.setString(3, userinfo.getAnswer());
			pstmt.setString(4, in_Username);
			result=pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		return result;
	}
	

} //end of UserInfoDAO


