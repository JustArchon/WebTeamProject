package BBSService;

public class Inquiry {
	private int InquiryID;
	private String ititle;
	private String iemail;
	private String userID;
	private String InquiryDate;
	private String icontent;
	private String ipassword;
	private String InquiryFile;
	private int InquiryAvailable;
	public int getInquiryID() {
		return InquiryID;
	}
	public void setInquiryID(int inquiryID) {
		InquiryID = inquiryID;
	}
	public String getItitle() {
		return ititle;
	}
	public void setItitle(String ititle) {
		this.ititle = ititle;
	}
	public String getIemail() {
		return iemail;
	}
	public void setIemail(String iemail) {
		this.iemail = iemail;
	}
	public String getInquiryDate() {
		return InquiryDate;
	}
	public void setInquiryDate(String inquiryDate) {
		InquiryDate = inquiryDate;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getIpassword() {
		return ipassword;
	}
	public void setIpassword(String ipassword) {
		this.ipassword = ipassword;
	}
	public String getIcontent() {
		return icontent;
	}
	public void setIcontent(String icontent) {
		this.icontent = icontent;
	}
	public String getInquiryFile() {
		return InquiryFile;
	}
	public void setInquiryFile(String inquiryFile) {
		InquiryFile = inquiryFile;
	}
	public int getInquiryAvailable() {
		return InquiryAvailable;
	}
	public void setInquiryAvailable(int inquiryAvailable) {
		InquiryAvailable = inquiryAvailable;
	}
	
}
