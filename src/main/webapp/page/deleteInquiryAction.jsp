<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="BBSService.Inquiry" %>
<%@ page import="BBSService.InquiryDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지?</title>
</head>
<body>
<%
		String userID = null;
		String userRole = null;
		String admin = "Admin";
		if(session.getAttribute("userID") != null){	
			userID = (String) session.getAttribute("userID");
		}
		
		if(session.getAttribute("userRole") != null){	
			userRole = (String) session.getAttribute("userRole");
		}
		
		//로그인 안 한 사용자 체크하는 부분
		if(userID == null){	
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 이후 이용가능한 서비스 입니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");	
		}
		
		int InquiryID=0;
		if(request.getParameter("InquiryID") != null){
			InquiryID = Integer.parseInt(request.getParameter("InquiryID"));
		}
		
		//유효한 글인지 체크하는 부분
		if(InquiryID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");	
		}		
		
		Inquiry Inquiry = new InquiryDAO().getInquiry(InquiryID);
	  	String realFolder="";
	  	String saveFolder = "inquiryUpload";
		ServletContext context = this.getServletContext();		//절대경로를 얻는다
		realFolder = context.getRealPath(saveFolder);	
		
		//작성자와 로그인한 사용자가 같은 사용자인지 확인하는 부분 혹은 관리자일 경우 강제삭제	
		if(userID.equals(Inquiry.getUserID())||admin.equals(userRole)) {
				//실제 Data 삭제를 위해 삭제 함수를 호출하는 부분
				InquiryDAO InquiryDao = new InquiryDAO();
				int result = InquiryDao.delete(InquiryID); 
				
				if(result >= 0){
					File delFile = new File(realFolder+"\\"+(Inquiry.getInquiryID())+(Inquiry.getUserID())+(Inquiry.getItitle()).replaceAll(" ", "")+"문의글의사진.jpg");
					delFile.delete();
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('성공적으로 문의글을 삭제하였습니다.')");
					script.println("location.href = 'index.jsp'");
					script.println("</script>");	
				} else if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");	
			}
		} else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제가능한 권한이 없습니다.')");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");	
			}

	%>
</body>
</html>