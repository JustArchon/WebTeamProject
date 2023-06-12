<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta charset="UTF-8">
<title>오늘 뭐 먹지?</title>
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
  	
	//로그인 안 한 사용자 체크하는 부분
	if(userID == null){	
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 이후 이용가능한 서비스 입니다.')");
		script.println("location.href = '../login.jsp'");
		script.println("</script>");	
	}
  	
  	String realFolder="";
  	String saveFolder = "inquiryUpload";
  	//String uploadPath = "C:\\Users\\User\\eclipse-workspace\\TeamProject\\src\\main\\webapp\\upload";
	int maxFileSize = 1024 * 1024 * 20;
	ServletContext context = this.getServletContext();		//절대경로를 얻는다
	realFolder = context.getRealPath(saveFolder);			//saveFolder의 절대경로를 얻음
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
  		script.println("alert('로그인 후 이용 가능합니다.')");
  		script.println("location.href = 'login.jsp'");
  		script.println("history.back()");
  		script.println("</script>");
  	} else {
  		if (Inquiry.getItitle() == null || Inquiry.getIcontent() == null || Inquiry.getIemail() == null) {
  				PrintWriter script = response.getWriter();
  				script.println("<script>");
  				script.println("alert('입력이 안된 사항이 있습니다.')");
  				script.println("history.back()");
  				script.println("</script>");
  			} else {
  				int result = InquiryDAO.write(Inquiry);
  				if (result == -1) {
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("alert('글쓰기에 실패 했습니다.')");
  					script.println("history.back()");
  					script.println("</script>");
  				} else {
  					if(filename != null){
  						File oldFile = new File(realFolder+"\\"+filename);
  						File newFile = new File(realFolder+"\\"+(InquiryDAO.getPresent())+(Inquiry.getUserID())+(Inquiry.getItitle()).replaceAll(" ", "")+"문의글의사진.jpg");
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