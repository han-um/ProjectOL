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
	 * 강의 검색 메소드
	 * @param in_search 검색할 단어 (단어가 포함된 경우도 해당)
	 * @return 검색 결과 나온 모든 Lecture의 ArrayList
	 */		
	PreparedStatement pstmt;

	public ArrayList<Lecture> searchLecture(String in_search) {
		String SQL = "SELECT * from Lecture where lecturename LIKE ?";
		ArrayList<Lecture> list = new ArrayList<Lecture>();
		try {
			pstmt = conn.prepareStatement(SQL);
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
		return null;
	}

	/**
	 * 강의 정렬 반환 메소드
	 * @param orderType 정렬할 방법. 1:조회순 2:가격순-조회순 3:조회 역순
	 * @return 정렬된 모든 Lecture의 ArrayList
	 */		
	
	public ArrayList<Lecture> orderedLecture(int orderType) {
		String SQL = "SELECT * FROM Lecture ORDER BY";
			if(orderType == 1) { // 정렬타입이 1이면, View를 기준으로 내림차순 정렬된 정보를 반환한다.
				SQL = SQL + " view DESC";
			}else if(orderType == 2) {
				SQL = SQL + " price DESC , view ASC";
			}else if(orderType == 3) {
				SQL = SQL + " view ASC";
			}
		ArrayList<Lecture> list = new ArrayList<Lecture>();
		try {
			pstmt = conn.prepareStatement(SQL);
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
		return null;
	}
}
