package UserAuthService;
public class User {
	private String userName;
	private String userID;
	private String userPassword;
	private String userEmail;
	private String userGender;
	private String favoritefood;
	private String hobbies;
	private String role;
	private String userjoindate;
	private boolean candelposts;
	public String getUserjoindate() {
		return userjoindate;
	}
	public void setUserjoindate(String userjoindate) {
		this.userjoindate = userjoindate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
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
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getFavoritefood() {
		return favoritefood;
	}
	public void setFavoritefood(String favoritefood) {
		this.favoritefood = favoritefood;
	}
	public String getHobbies() {
		return hobbies;
	}
	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public boolean isCandelposts() {
		return candelposts;
	}
	public void setCandelposts(boolean candelposts) {
		this.candelposts = candelposts;
	}

	
}
