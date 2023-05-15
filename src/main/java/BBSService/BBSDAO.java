package BBSService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BBSDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BBSDAO() {
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
		String SQL = "SELECT InquiryID FROM Inquiry ORDER BY InquiryID DESC";
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
	
	public int write(String InquiryTitle, String userID, String InquiryContent) {
		String SQL = "INSERT INTO Inquiry VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, InquiryTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, InquiryContent);
			pstmt.setInt(6, 1);
			
			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
		
	public ArrayList<Inquiry> getList(int pageNumber) {
		String SQL = "SELECT * FROM Inquiry WHERE InquiryID < ? AND InquiryAvailable = 1 ORDER BY InquiryID DESC LIMIT 10";
		ArrayList<Inquiry> list = new ArrayList<Inquiry>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Inquiry Inquiry = new Inquiry();
				Inquiry.setInquiryID(rs.getInt(1));
				Inquiry.setItitle(rs.getString(2));
				Inquiry.setUserID(rs.getString(3));
				Inquiry.setInquiryDate(rs.getString(4));
				Inquiry.setIcontent(rs.getString(5));
				Inquiry.setInquiryAvailable(rs.getInt(1));
				list.add(Inquiry);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM Inquiry WHERE InquiryID < ? AND InquiryAvailable = 1";
		
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
	
	public Inquiry getInquiry(int InquiryID) {
		String SQL = "SELECT * FROM Inquiry WHERE InquiryID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, InquiryID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Inquiry Inquiry = new Inquiry();
				Inquiry.setInquiryID(rs.getInt(1));
				Inquiry.setItitle(rs.getString(2));
				Inquiry.setUserID(rs.getString(3));
				Inquiry.setInquiryDate(rs.getString(4));
				Inquiry.setIcontent(rs.getString(5));
				Inquiry.setInquiryAvailable(rs.getInt(1));
				return Inquiry;
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int InquiryID, String InquiryTitle, String InquiryContent) {
		String SQL = "UPDATE Inquiry SET InquiryTitle = ?, InquiryContent = ? WHERE InquiryID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, InquiryTitle);
			pstmt.setString(2, InquiryContent);
			pstmt.setInt(3, InquiryID);
			
			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int delete(int InquiryID) {
		String SQL = "UPDATE Inquiry SET InquiryAvailable = 0 WHERE InquiryID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, InquiryID);
			
			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

}
