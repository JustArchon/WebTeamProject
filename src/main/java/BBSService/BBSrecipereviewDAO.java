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
	
	public int write(BBSrecipereview to) {
		String SQL = "INSERT INTO BBSRECIPEREVIEW VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, to.getBbstitle());
			pstmt.setString(3, to.getUserID());
			pstmt.setString(4, to.getUserName());
			pstmt.setString(5, to.getBbstype());
			pstmt.setString(6, to.getBbscontent());
			pstmt.setString(7, getDate());
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 1);
			pstmt.setString(11, to.getFilename());
			pstmt.setInt(12, 0);
			
			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
		
	public ArrayList<BBSrecipereview> getList(int pageNumber) {
		String SQL = "SELECT * FROM BBSRECIPEREVIEW WHERE BBSID < ? ORDER BY BBSID DESC LIMIT 10";
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
				BBSrecipereview.setUserName(rs.getString(4));
				BBSrecipereview.setBbstype(rs.getString(5));
				BBSrecipereview.setBbscontent(rs.getString(6));
				BBSrecipereview.setBbsdate(rs.getString(7));
				BBSrecipereview.setBbscount(rs.getInt(8));
				BBSrecipereview.setBbslikeamount(rs.getInt(9));
				BBSrecipereview.setBBSrecipereviewAvailable(rs.getInt(10));
				BBSrecipereview.setFilename(rs.getString(11));
				BBSrecipereview.setBBSComentcount(rs.getInt(12));
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
				BBSrecipereview.setUserName(rs.getString(4));
				BBSrecipereview.setBbstype(rs.getString(5));
				BBSrecipereview.setBbscontent(rs.getString(6));
				BBSrecipereview.setBbsdate(rs.getString(7));
				BBSrecipereview.setBbscount(rs.getInt(8));
				BBSrecipereview.setBbslikeamount(rs.getInt(9));
				BBSrecipereview.setBBSrecipereviewAvailable(rs.getInt(10));
				BBSrecipereview.setFilename(rs.getString(11));
				BBSrecipereview.setBBSComentcount(rs.getInt(12));
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
