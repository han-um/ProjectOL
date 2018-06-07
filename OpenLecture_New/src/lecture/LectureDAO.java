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
			String dbURL = "jdbc:mysql://openlecture.cea7vfme2wkn.ap-northeast-2.rds.amazonaws.com:3306/openlecture?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
			String dbID = "openlecture";
			String dbPassword = "SWTeam03";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	PreparedStatement pstmt;
	
	/**
	 * 강의id에 해당하는 강의정보를 불러오는 메소드.
	 * @param lectureid - 정보를 불러올 강의id
	 * @return Lecture lect - 강의id에 해당하는 강의정보
	 */
	public Lecture getData(String lectureid) {
		String SQL = "SELECT l.*, u.userName FROM Lecture l, User u WHERE l.lectureid = ? AND l.userid = u.Id";
		try {
			pstmt = conn.prepareStatement(SQL);
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
			pstmt = conn.prepareStatement(SQL);
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
			pstmt = conn.prepareStatement(SQL);
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
	

	/**
	 * 강의 구매 메소드
	 * @param in_userid  구매하는 유저id
	 * @param in_lectureid  구매할 강의id
	 * @return 성공시 성공여부 반환
	 */		

	public int joinLecture(int in_userid, int in_lectureid) {
		String SQL = "INSERT INTO `openlecture`.`Join` (`lectureid`, `userid`, `date`) VALUES (?, ?, NOW());";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, in_lectureid);
			pstmt.setInt(2, in_userid);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	/**
	 * 강의 등록여부 찾기 메소드
	 * @param input 찾을 유저ID 혹은 강의ID.
	 * @param type 1:강의ID를 기준으로 구매한 유저를 찾는다. 2: 유저ID를 기준으로 포함된 강의를 찾는다.
	 * @return 해당되는 Join(고유ID,유저ID,강의ID,구매일) 리스트 반환
	 */			
	
	public ArrayList<Join> getJoin(int input, int type) {
		String SQL = "SELECT * FROM `openlecture`.`Join` where";
			if(type == 1) { // 정렬타입이 1이면, View를 기준으로 내림차순 정렬된 정보를 반환한다.
				SQL = SQL + " lectureid = " + Integer.toString(input);
			}else if(type == 2) {
				SQL = SQL + " userid = " + Integer.toString(input);
			}
		ArrayList<Join> list = new ArrayList<Join>();
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			Join join_arr = new Join();
			join_arr.setDate(rs.getString("date"));
			join_arr.setId(rs.getInt("id"));
			join_arr.setLectureid(rs.getInt("lectureid"));
			join_arr.setUserid(rs.getInt("userid"));
			list.add(join_arr);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 조회수 누적 메소드
	 * @param in_lectureid 조회수를 누적시킬 강의id
	 * @return 1:누적 성공시 -2:누적 실패시
	 */			
	
	public int addView(int in_lectureid) {
		String SQL = "UPDATE Lecture set view = view + 1 where lectureid = ? "; 
		try {
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1,  in_lectureid);
			pstmt.executeUpdate(); 
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; 
	}
	

	public int uploadLecture() {
		
		return 0; //데이터 삽입 오류
	}
	
	/**
	 * Lecture 테이블에 강의정보를 저장하는 메소드.
	 * @param String title :  강의제목
	 * @param int userid : 강사 id
	 * @param String topic : 강의 주제
	 * @param String intro : 강의 인트로
	 * @param int contentNum : 총 강의 갯수
	 * @return : db에 입력된 row 갯수
	 * 		-1 : 데이터베이스 오류
	 */
	public int uploadLecture(String title, int userid, String topic, String intro, int contentNum) {
		String SQL = "INSERT INTO openlecture.Lecture (lecturename, userid, topic, intro, contentnum) VALUES (?, ?, ?, ?, ?);";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);	//lecturename
			pstmt.setInt(2, userid);	//userid
			pstmt.setString(3, topic);	//topic
			pstmt.setString(4, intro);	//intro
			pstmt.setInt(5, contentNum);	//contentnum
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int uploadContent(String title, int userid, String[] urls, String[] contents) {
		String selectSQL = "select lectureid from Lecture l where lecturename = ? and userid = ?";
		String insertSQL = "INSERT INTO openlecture.Contents (lectureid, contentnum, videoURL, contentname) VALUES (?, ?, ?, ?);";
		int lectureid;
		try {
			//lectureid 구하기
			PreparedStatement pstmt = conn.prepareStatement(selectSQL);
			pstmt.setString(1, title);
			pstmt.setInt(2, userid);
			rs = pstmt.executeQuery();
			if(rs.next())
				lectureid = rs.getInt("lectureid");
			else
				return -4;	//lectureid 없음????
			
			pstmt = conn.prepareStatement(insertSQL);
			//content 정보 삽입하기
			for(int i=0; i<contents.length; i++) {
				pstmt.setInt(1, lectureid);		//lectureid
				pstmt.setInt(2, i+1);				//contentnum
				pstmt.setString(3, urls[i]);	//videoURL
				pstmt.setString(4, contents[i]);	//contentname
				pstmt.addBatch();
				pstmt.clearParameters();
			}
			int result[] = pstmt.executeBatch();
			for(int r:result) {
				if (r == -3)
					return r; //배치 실행 중 오류
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}

	public int addComment(int lectureid, int userid, String title, String contents, int price) {
		String SQL = "INSERT INTO openlecture.Comment (commentid, lectureid, userid, title, contents, timestamp, expectedprice) VALUES (?, ?, ?, ?, ?, NOW(), ?);";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, lectureid);
			pstmt.setInt(3, userid);
			pstmt.setString(4, title);
			pstmt.setString(5, contents);
			pstmt.setInt(6, price);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	
	public String[] searchContent(int in_lectureid, int in_contentnum) {
		String SQL = "SELECT * FROM `openlecture`.`Contents` where lectureid = ? AND contentnum = ?";
		String[] result =  new String[2];
		try {
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1,  in_lectureid);
			pstmt.setInt(2,  in_contentnum);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				result[0] = rs.getString("contentname");
				result[1] = rs.getString("videoURL");
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String[] result2 =  new String[2];
		return result2;
	}
	
	public int setPrice(int set_price, int now_price, int buy_num, int lectureid) {
		String SQL = "UPDATE `openlecture`.`Lecture` SET price = ? where lectureid = ? "; 
		try {
			pstmt = conn.prepareStatement(SQL); 
			set_price = (now_price + set_price) / (buy_num+1);
			pstmt.setInt(1,  set_price);
			pstmt.setInt(2,  lectureid);
			pstmt.executeUpdate(); 
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; 
}

}

