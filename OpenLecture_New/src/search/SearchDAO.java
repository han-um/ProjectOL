package search;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import lecture.Lecture;
import lecture.Comment;
import lecture.Contents;

public class SearchDAO {

	private Connection conn;
	private ResultSet rs;
	
	public SearchDAO() {
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
	
	public ArrayList<Lecture> searchLecture(String in_search) {
		String SQL = "SELECT * from Lecture where lecturename LIKE ?";
		ArrayList<Lecture> list = new ArrayList<Lecture>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			in_search = "%"+in_search+"%";
			pstmt.setString(1, in_search);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			Lecture lecture_arr = new Lecture();
			lecture_arr.setLectureId(rs.getInt("lectureid"));
			lecture_arr.setLectureName(rs.getString("lecturename"));
			lecture_arr.setUserId(rs.getInt("userid"));
			lecture_arr.setTopic(rs.getString("topic"));
			lecture_arr.setIntro(rs.getString("intro"));
			lecture_arr.setPrice(rs.getInt("price"));
			lecture_arr.setContentNum(rs.getInt("contentnum"));
			lecture_arr.setCommentNum(rs.getInt("commentnum"));
			lecture_arr.setBackgroundURL(rs.getString("backgroundURL"));
			lecture_arr.setView(rs.getInt("view"));
			list.add(lecture_arr);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; //데이터베이스 오류
	}
	
	
}
