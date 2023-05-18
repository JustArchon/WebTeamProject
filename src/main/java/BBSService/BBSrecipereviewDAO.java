package BBSService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BBSrecipereviewDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BBSrecipereviewDAO() {
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL = "SELECT BBSID FROM BBSRECIPEREVIEW ORDER BY BBSID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int write(String BbsrecipereviewTitle, String userID, String BBStype, String BBSrecipereviewContent, String BBSpassword) {
		String SQL = "INSERT INTO BBSRECIPEREVIEW VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, BbsrecipereviewTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, BBStype);
			pstmt.setString(5, BBSrecipereviewContent);
			pstmt.setString(6, BBSpassword);
			pstmt.setString(7, getDate());
			
			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
		
	public ArrayList<BBSrecipereview> getList(int pageNumber) {
		String SQL = "SELECT * FROM BBSRECIPEREVIEW WHERE BBSID < ? AND BBSrecipereviewAvailable = 1 ORDER BY BBSID DESC LIMIT 10";
		ArrayList<BBSrecipereview> list = new ArrayList<BBSrecipereview>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BBSrecipereview BBSrecipereview = new BBSrecipereview();
				BBSrecipereview.setBBSrecipereviewID(rs.getInt(1));
				BBSrecipereview.setBbstitle(rs.getString(2));
				BBSrecipereview.setUserID(rs.getString(3));
				BBSrecipereview.setBbspassword(rs.getString(4));
				BBSrecipereview.setBbscontent(rs.getString(5));
				BBSrecipereview.setBBSrecipereviewAvailable(rs.getInt(1));
				list.add(BBSrecipereview);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BBSRECIPEREVIEW WHERE BBSID < ? AND BBSrecipereviewAvailable = 1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public BBSrecipereview getBBSrecipereview(int BBSrecipereviewID) {
		String SQL = "SELECT * FROM BBSRECIPEREVIEW WHERE BBSID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, BBSrecipereviewID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				BBSrecipereview BBSrecipereview = new BBSrecipereview();
				BBSrecipereview.setBBSrecipereviewID(rs.getInt(1));
				BBSrecipereview.setBbstitle(rs.getString(2));
				BBSrecipereview.setUserID(rs.getString(3));
				BBSrecipereview.setBbspassword(rs.getString(4));
				BBSrecipereview.setBbscontent(rs.getString(5));
				BBSrecipereview.setBBSrecipereviewAvailable(rs.getInt(1));
				return BBSrecipereview;
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int BBSrecipereviewID, String BBSrecipereviewTitle, String BBSrecipereviewContent) {
		String SQL = "UPDATE BBSRECIPEREVIEW SET BBSrecipereviewTitle = ?, BBSrecipereviewContent = ? WHERE BBSID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, BBSrecipereviewTitle);
			pstmt.setString(2, BBSrecipereviewContent);
			pstmt.setInt(3, BBSrecipereviewID);
			
			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int delete(int BBSrecipereviewID) {
		String SQL = "UPDATE BBSrecipereview SET BBSrecipereviewAvailable = 0 WHERE BBSID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, BBSrecipereviewID);
			
			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

}
