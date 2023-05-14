package UserAuthService;
public class User {
	private String userName;
	private String userID;
	private String userPassword;
	private String userEmail;
	private int userGender;
	private String Favoritefood;
	private String Hobbies;
	private Boolean cadeposts;
	private String role;
	
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserGender() {
		return userGender;
	}
	public void setUserGender(int userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Boolean getCadeposts() {
		return cadeposts;
	}
	public void setCadeposts(Boolean cadeposts) {
		this.cadeposts = cadeposts;
	}
	public String getHobbies() {
		return Hobbies;
	}
	public void setHobbies(String hobbies) {
		Hobbies = hobbies;
	}
	public String getFavoritefood() {
		return Favoritefood;
	}
	public void setFavoritefood(String favoritefood) {
		Favoritefood = favoritefood;
	}
}
