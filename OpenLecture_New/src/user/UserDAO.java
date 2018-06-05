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

	/**
	 * 회원 로그인 메소드.
	 * @param in_Username - 로그인할 회원 아이디,
	 * @param in_Password - 로그인할 회원 비밀번호
	 * @return 1- 로그인 성공시, 0-비밀번호가 틀렸을 경우, -1-아이디가 존재하지 않을 경우
	 */
	
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
	

	/**
	 * 회원 정보 가져오기 메소드 by 유저이름
	 * @param in_Username - 정보를 가져올 계정 ID
	 * @return String[] result - 배열의 0~4번지에 각각 질문,답변,가입일,토큰(코인)이 반환됨 
	 */	
	
	public String[] getuserinfo(String in_Username) {
		String SQL = "SELECT * from User where Username = ?"; 
		String[] result =  new String[5];
		try {
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1,  in_Username);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				result[0] = rs.getString("Question");
				result[1] = rs.getString("Answer");
				result[2] = rs.getString("Date");
				result[3] = rs.getString("Token");
				result[4] = rs.getString("Id");
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String[] result2 =  new String[5];
		return result2;
	}
	
	/**
	 * 회원 정보 가져오기 메소드 by 유저아이디
	 * @param userid - 정보를 가져올  유저ID
	 * @return String[] result - 배열의 0~4번지에 각각 질문,답변,가입일,토큰(코인)이 반환됨 
	 */	
	
	public String[] getUserinfoById(int userid) {
		String SQL = "SELECT * from User where Id = ?"; 
		String[] result =  new String[6];
		try {
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1,  userid);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				result[0] = rs.getString("Username");
				result[1] = rs.getString("Question");
				result[2] = rs.getString("Answer");
				result[3] = rs.getString("Date");
				result[4] = rs.getString("Token");
				result[5] = rs.getString("ProfileImg");
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String[] result2 =  new String[6];
		return result2;
	}
	
	
	/**
	 * 회원 가입 메소드
	 * @param User user -회원 가입 창에 입력한 아이디/비밀번호/질문/답변을 모두 가지고 있는 User 클래스
	 * @return 회원가입의 성공 여부
	 */		

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
	
	/**
	 * 토큰(코인) 추가 메소드
	 * @param in_Username - 토큰을 추가할 계정ID
	 * @param token - 추가할 토큰의 개수
	 * @return 1- 토큰 추가 성공시, -2- 토큰 추가 실패시 
	 */		

	
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
	
	/**
	 * 토큰(코인) 사용 메소드
	 * @param in_Username - 토큰을 사용할 계정ID
	 * @param token - 사용할 토큰의 개수
	 * @return 1- 토큰 사용 성공시, -2- 토큰 사용 실패시 
	 */		

	public int useToken(String in_Username, int token) {
		String SQL = "UPDATE User set Token = Token - ? where Username = ? "; 
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

