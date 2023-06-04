package BBSService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class InquiryDAO {
	private Connection conn;
	private ResultSet rs;
	
	public InquiryDAO() {
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
	
	public int getPresent() {
		String SQL = "SELECT InquiryID FROM Inquiry ORDER BY InquiryID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int write(Inquiry to) {
		String SQL = "INSERT INTO Inquiry VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, to.getIemail());
			pstmt.setString(3, to.getItitle());
			pstmt.setString(4, to.getUserID());
			pstmt.setString(5, to.getUserName());
			pstmt.setString(6, to.getItype());
			pstmt.setString(7, to.getIcontent());
			pstmt.setString(8, getDate());
			pstmt.setInt(9, 1);
			pstmt.setString(10, to.getInquiryFile());
			
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
				Inquiry.setIemail(rs.getString(2));
				Inquiry.setItitle(rs.getString(3));
				Inquiry.setUserID(rs.getString(4));
				Inquiry.setUserName(rs.getString(5));
				Inquiry.setItype(rs.getString(6));
				Inquiry.setIcontent(rs.getString(7));
				Inquiry.setInquiryDate(rs.getString(8));
				Inquiry.setInquiryAvailable(rs.getInt(9));
				Inquiry.setInquiryFile(rs.getString(10));
				list.add(Inquiry);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Inquiry> getMyList(int pageNumber, String UserID) {
		String SQL = "SELECT * FROM Inquiry WHERE InquiryID < ? AND InquiryAvailable = 1 AND UserID = ? ORDER BY InquiryID DESC LIMIT 10";
		ArrayList<Inquiry> list = new ArrayList<Inquiry>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			pstmt.setString(2, UserID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Inquiry Inquiry = new Inquiry();
				Inquiry.setInquiryID(rs.getInt(1));
				Inquiry.setIemail(rs.getString(2));
				Inquiry.setItitle(rs.getString(3));
				Inquiry.setUserID(rs.getString(4));
				Inquiry.setUserName(rs.getString(5));
				Inquiry.setItype(rs.getString(6));
				Inquiry.setIcontent(rs.getString(7));
				Inquiry.setInquiryDate(rs.getString(8));
				Inquiry.setInquiryAvailable(rs.getInt(9));
				Inquiry.setInquiryFile(rs.getString(10));
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
				Inquiry.setIemail(rs.getString(2));
				Inquiry.setItitle(rs.getString(3));
				Inquiry.setUserID(rs.getString(4));
				Inquiry.setUserName(rs.getString(5));
				Inquiry.setItype(rs.getString(6));
				Inquiry.setIcontent(rs.getString(7));
				Inquiry.setInquiryDate(rs.getString(8));
				Inquiry.setInquiryAvailable(rs.getInt(9));
				Inquiry.setInquiryFile(rs.getString(10));
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
