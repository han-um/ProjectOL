package lecture;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class LectureDAO {

	private Connection conn;
	private ResultSet rs;
	
	public LectureDAO() {
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
	 * 강의id에 해당하는 강의정보를 불러오는 메소드.
	 * @param lectureid - 정보를 불러올 강의id
	 * @return Lecture lect - 강의id에 해당하는 강의정보
	 */
	public Lecture getData(String lectureid) {
		String SQL = "SELECT l.*, u.userName FROM Lecture l, User u WHERE l.lectureid = ? AND l.userid = u.Id";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, lectureid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Lecture lect = new Lecture();
				lect.setLectureId(rs.getInt("lectureid"));
				lect.setLectureName(rs.getString("lecturename"));
				lect.setUserId(rs.getInt("userid"));
				lect.setTopic(rs.getString("topic"));
				lect.setIntro(rs.getString("intro"));
				lect.setPrice(rs.getInt("price"));
				lect.setContentNum(rs.getInt("contentnum"));
				lect.setCommentNum(rs.getInt("commentnum"));
				lect.setBackgroundURL(rs.getString("backgroundURL"));
				lect.setView(rs.getInt("view"));
				lect.setUserName(rs.getString("u.userName"));
				return lect;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; //데이터베이스 오류
	}
	
	/**
	 * 강의id에 해당하는 강의 목록을 불러오는 메소드.
	 * @param lectureid - 현재 페이지의 강의id
	 * @return ArrayList<Contents> list - 강의id에 해당하는 Contents list
	 */
	public ArrayList<Contents> getContentList(String lectureid) {
		String SQL = "SELECT contentnum, contentname, length, videoURL FROM Contents WHERE lectureid = ? ORDER BY contentnum ASC";
		ArrayList<Contents> list = new ArrayList<Contents>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, lectureid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			Contents contents = new Contents();
			contents.setContentnum(rs.getInt("contentnum"));
			contents.setContentname(rs.getString("contentname"));
			contents.setLength(rs.getInt("length"));
			contents.setVideoURL(rs.getString("videoURL"));
			list.add(contents);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; //데이터베이스 오류
	}
	
	public ArrayList<Comment> getCommentList(String lectureid) {
		String SQL = "SELECT u.Username username, c.title, c.contents, c.timestamp, c.expectedprice price FROM Comment c, User u WHERE c.lectureid = ? AND c.userid = u.Id ORDER BY c.timestamp DESC";
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, lectureid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			Comment comm = new Comment();
			comm.setUsername(rs.getString("username"));
			comm.setTitle(rs.getString("title"));
			comm.setContents(rs.getString("contents"));
			comm.setDatetime(rs.getDate("timestamp"));
			comm.setPrice(rs.getInt("price"));
			list.add(comm);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; //데이터베이스 오류
	}
	
	
}
