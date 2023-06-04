<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="BBSService.Inquiry" %>
<%@ page import="BBSService.InquiryDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ������?</title>
</head>
<body>
<%
  	String userID = null;
	String userName = null;
  	if (session.getAttribute("userID") != null) {
  		userID = (String) session.getAttribute("userID");
  	}
  	if (session.getAttribute("userName") != null) {
  		userName = (String) session.getAttribute("userName");
  	}
  	
  	
  	String realFolder="";
  	String saveFolder = "inquiryUpload";
  	//String uploadPath = "C:\\Users\\User\\eclipse-workspace\\TeamProject\\src\\main\\webapp\\upload";
	int maxFileSize = 1024 * 1024 * 20;
	ServletContext context = this.getServletContext();		//�����θ� ��´�
	realFolder = context.getRealPath(saveFolder);			//saveFolder�� �����θ� ����
	String encType = "utf-8";
	MultipartRequest multi = new MultipartRequest( request, realFolder, maxFileSize, encType, new DefaultFileRenamePolicy() );
	String filename = multi.getFilesystemName( "upload" );
	String ititle = multi.getParameter( "ititle" );
  	String itype = multi.getParameter( "itype" );
  	String icontent = multi.getParameter( "icontent" );
  	String iemail = multi.getParameter( "iemail" );
	
	Inquiry Inquiry = new Inquiry();
	InquiryDAO InquiryDAO = new InquiryDAO();
	Inquiry.setItitle(ititle);
	Inquiry.setIemail(iemail);
	Inquiry.setItype(itype);
	Inquiry.setUserID(userID);
	Inquiry.setUserName(userName);
	Inquiry.setItitle(ititle);
	Inquiry.setIcontent(icontent);
	Inquiry.setInquiryFile(filename);
	
  	if (userID == null) {
  		PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("alert('�α��� �� �̿� �����մϴ�.')");
  		script.println("location.href = 'login.jsp'");
  		script.println("history.back()");
  		script.println("</script>");
  	} else {
  		if (Inquiry.getItitle() == null || Inquiry.getIcontent() == null || Inquiry.getIemail() == null) {
  				PrintWriter script = response.getWriter();
  				script.println("<script>");
  				script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ�.')");
  				script.println("history.back()");
  				script.println("</script>");
  			} else {
  				int result = InquiryDAO.write(Inquiry);
  				if (result == -1) {
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("alert('�۾��⿡ ���� �߽��ϴ�.')");
  					script.println("history.back()");
  					script.println("</script>");
  				} else {
  					if(filename != null){
  						File oldFile = new File(realFolder+"\\"+filename);
  						File newFile = new File(realFolder+"\\"+(InquiryDAO.getPresent())+(Inquiry.getUserID())+(Inquiry.getItitle()).replaceAll(" ", "")+"���Ǳ��ǻ���.jpg");
  						oldFile.renameTo(newFile);
  					}
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("location.href = 'Inquirylist.jsp'");
  					script.println("</script>");
  				}
  			}
  	}		
  %>
</body>
</html>