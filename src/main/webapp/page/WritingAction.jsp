<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="BBSService.BBSrecipereview" %>
<%@ page import="BBSService.BBSrecipereviewDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
  	String userID = null;
  	if (session.getAttribute("userID") != null) {
  		userID = (String) session.getAttribute("userID");
  	}
  	
  	
  	String realFolder="";
  	String saveFolder = "bbsUpload";
  	//String uploadPath = "C:\\Users\\User\\eclipse-workspace\\TeamProject\\src\\main\\webapp\\upload";
	int maxFileSize = 1024 * 1024 * 20;
	ServletContext context = this.getServletContext();		//절대경로를 얻는다
	realFolder = context.getRealPath(saveFolder);			//saveFolder의 절대경로를 얻음
	String encType = "utf-8";
	MultipartRequest multi = new MultipartRequest( request, realFolder, maxFileSize, encType, new DefaultFileRenamePolicy() );
	String filename = multi.getFilesystemName( "upload" );
	String bbstitle = multi.getParameter( "bbstitle" );
  	String bbstype = multi.getParameter( "bbstype" );
  	String bbscontent = multi.getParameter( "bbscontent" );
	
	BBSrecipereview BBS = new BBSrecipereview();
	BBS.setBbstitle(bbstitle);
	BBS.setBbstype(bbstype);
	BBS.setUserID(userID);
	BBS.setBbstitle(bbstitle);
	BBS.setBbscontent(bbscontent);
	BBS.setFilename(filename);
	
  	if (userID == null) {
  		PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("alert('로그인 후 이용 가능합니다.')");
  		script.println("location.href = 'login.jsp'");
  		script.println("history.back()");
  		script.println("</script>");
  	} else {
  		if (BBS.getBbstitle() == null || BBS.getBbscontent() == null) {
  				PrintWriter script = response.getWriter();
  				script.println("<script>");
  				script.println("alert('입력이 안된 사항이 있습니다.')");
  				script.println("history.back()");
  				script.println("</script>");
  			} else {
  				BBSrecipereviewDAO bbsDAO = new BBSrecipereviewDAO();
  				int result = bbsDAO.write(BBS);
  				if (result == -1) {
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("alert('글쓰기에 실패 했습니다.')");
  					script.println("history.back()");
  					script.println("</script>");
  				} else {
  					if(filename != null){
  						File oldFile = new File(realFolder+"\\"+filename);
  						File newFile = new File(realFolder+"\\"+(BBS.getUserID())+(BBS.getBbstitle()).replaceAll(" ", "")+"게시글의사진.jpg");
  						oldFile.renameTo(newFile);
  					}
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("location.href = 'index.jsp'");
  					script.println("</script>");
  				}
  			}
  	}		
  %>
</body>
</html>