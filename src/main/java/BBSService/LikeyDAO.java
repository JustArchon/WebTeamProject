package BBSService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeyDAO {
	private Connection conn;	//db에 접근하는 객체
	private ResultSet rs;
	
	public LikeyDAO() {
		try {
			String dbURL = "jdbc:h2:tcp://localhost/~/Todayfood";
			String dbID = "Todayfood";
			String dbPassword = "123456789";
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int like(String userID, int bbsID) {
		String SQL = "INSERT INTO LIKEY(USERID, BBSID, USERLIKE) VALUES (?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, bbsID);
			pstmt.setInt(3, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public int unlike(String userID, int bbsID) {
		String SQL = "DELETE FROM LIKEY WHERE USERID = ? AND BBSID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public Likey getlike(String userID, int bbsID) {
		String SQL = "SELECT * FROM LIKEY WHERE USERID = ? AND BBSID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Likey Likey = new Likey();
				Likey.setUserID(rs.getString(2));
				Likey.setBbsID(rs.getInt(3));
				Likey.setUserLIKE(rs.getInt(4));
				return Likey;
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int getLikeCount(int bbsID) {
		String SQL = "SELECT COUNT(USERLIKE) FROM LIKEY WHERE BBSID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int like(String bbsID) {
		PreparedStatement pstmt = null;
	        try {
			String SQL = "UPDATE userwritetest SET userLikeAmount = userLikeAmount + 1 WHERE userWriteTitle = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
}