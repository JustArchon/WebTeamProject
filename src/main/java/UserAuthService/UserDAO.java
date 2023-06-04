package UserAuthService;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import BBSService.BBSrecipereview;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT password FROM MEMBER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 비밀번호 불일치
				}
			} 
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return -2; // 데이터베이스 오류
	}
	
	public int join(User user) {
		Long datetime = System.currentTimeMillis();
		Timestamp timestamp = new Timestamp(datetime);
		String SQL = "INSERT INTO MEMBER(NAME, USERID, PASSWORD, USERMAIL, USERGENDER, INTIMESTAMP, ROLE, FAVORITE_FOOD, HOBBIES) VALUES (?, ?, ?, ?, ?, ?, ?, ? ,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserID());
			pstmt.setString(3, user.getUserPassword());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserGender());
			pstmt.setTimestamp(6, timestamp);
			pstmt.setString(7, "Member");
			pstmt.setString(8, user.getFavoritefood());
			pstmt.setString(9, user.getHobbies());
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	} 
	
	public String getName(String userID) {
		String username = null;
		String SQL = "SELECT NAME FROM MEMBER WHERE USERID LIKE ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				username = rs.getString(1);
			}
		} catch(Exception e) {
            e.printStackTrace();
        }
		return username;
	} 
	
	public String getRole(String userID) {
		String userrole = null;
		String SQL = "SELECT ROLE FROM MEMBER WHERE USERID LIKE ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				userrole = rs.getString(1);
			}
		} catch(Exception e) {
            e.printStackTrace();
        }
		return userrole;
	} 
	
	public int update(User user) {
        String SQL = "UPDATE MEMBER SET NAME=?, PASSWORD=?, USERMAIL=?, USERGENDER=?, ROLE=?, FAVORITE_FOOD=?, HOBBIES=? WHERE USERID=?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserName());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserEmail());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getRole());
            pstmt.setString(6, user.getFavoritefood());
            pstmt.setString(7, user.getHobbies());
            pstmt.setString(8, user.getUserID());
            
            return pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
	
	public int delete(String userID) {
		String SQL = "DELETE FROM MEMBER WHERE USERID =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			return pstmt.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<User> getManageList() {
		String SQL = "SELECT * FROM MEMBER ORDER BY ID ASC";
		ArrayList<User> list = new ArrayList<User>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				User User = new User();
				User.setUserID(rs.getString(3));
				User.setUserName(rs.getString(2));
				User.setUserEmail(rs.getString(5));
				User.setUserGender(rs.getString(6));
				User.setUserjoindate(rs.getString(7));
				User.setRole(rs.getString(8));
				User.setFavoritefood(rs.getString(9));
				User.setHobbies(rs.getString(10));
				list.add(User);
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

}