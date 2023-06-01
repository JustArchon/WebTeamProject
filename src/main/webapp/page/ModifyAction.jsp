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
  	
	int bbsID=0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
  	
  	
  	String realFolder="";
  	String saveFolder = "bbsUpload";
  	//String uploadPath = "C:\\Users\\User\\eclipse-workspace\\TeamProject\\src\\main\\webapp\\upload";
	int maxFileSize = 1024 * 1024 * 20;
	ServletContext context = this.getServletContext();		//�����θ� ��´�
	realFolder = context.getRealPath(saveFolder);			//saveFolder�� �����θ� ����
	String encType = "utf-8";
	MultipartRequest multi = new MultipartRequest( request, realFolder, maxFileSize, encType, new DefaultFileRenamePolicy() );
	String filename = multi.getFilesystemName( "upload" );
	String bbstitle = multi.getParameter( "bbstitle" );
  	String bbstype = multi.getParameter( "bbstype" );
  	String bbscontent = multi.getParameter( "bbscontent" );
	
	BBSrecipereview BBS = new BBSrecipereview();
	BBSrecipereviewDAO BBSDAO = new BBSrecipereviewDAO();
	BBS.setBbstitle(bbstitle);
	BBS.setBbstype(bbstype);
	BBS.setBbstitle(bbstitle);
	BBS.setBbscontent(bbscontent);
	out.print(filename);
	if(filename != null){
		BBS.setFilename(filename);
	}
	
	
  	if (userID == null) {
  		PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("alert('�α��� �� �̿� �����մϴ�.')");
  		script.println("location.href = 'login.jsp'");
  		script.println("history.back()");
  		script.println("</script>");
  	} else {
  		if (BBS.getBbstitle() == null || BBS.getBbscontent() == null) {
  				PrintWriter script = response.getWriter();
  				script.println("<script>");
  				script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ�.')");
  				script.println("history.back()");
  				script.println("</script>");
  			} else {
  				BBSrecipereviewDAO bbsDAO = new BBSrecipereviewDAO();
  				if (BBS.getFilename() == null){
  				int result = bbsDAO.updateNoImage(bbsID ,BBS);
  				if (result == -1) {
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("alert('�۾��⿡ ���� �߽��ϴ�.')");
  					script.println("history.back()");
  					script.println("</script>");
  				} else {
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("location.href = 'Mainpage/RecipeBBS.jsp'");
  					script.println("</script>");
  				}
  				}else{
  				int result = bbsDAO.update(bbsID ,BBS);
  				if (result == -1) {
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("alert('�۾��⿡ ���� �߽��ϴ�.')");
  					script.println("history.back()");
  					script.println("</script>");
  				} else {
  					if(filename != null){
  						File delFile = new File(realFolder+"\\"+(BBS.getBBSrecipereviewID())+(BBS.getUserID())+(BBS.getBbstitle()).replaceAll(" ", "")+"�Խñ��ǻ���.jpg");
  						delFile.delete();
  						File oldFile = new File(realFolder+"\\"+filename);
  						File newFile = new File(realFolder+"\\"+(BBSDAO.getPresent())+(userID)+(BBS.getBbstitle()).replaceAll(" ", "")+"�Խñ��ǻ���.jpg");
  						oldFile.renameTo(newFile);
  					}
  					PrintWriter script = response.getWriter();
  					script.println("<script>");
  					script.println("location.href = 'Mainpage/RecipeBBS.jsp'");
  					script.println("</script>");
  				}
  			}
  		}
  	}		
  %>
</body>
</html>