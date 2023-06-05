<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="UserAuthService.User"%>
<%@ page import="UserAuthService.UserDAO"%>
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
		
		String userid = "";
		if(request.getParameter("userid") != null){
			userid = request.getParameter("userid");
		}
		
		//User User = new UserDAO().getUser(bbsID);
		
		//작성자와 로그인한 사용자가 같은 사용자인지 확인하는 부분 혹은 관리자일 경우 강제탈퇴	
		if(userID.equals(userid)||admin.equals(userRole)) {
				//실제 Data 삭제를 위해 삭제 함수를 호출하는 부분
				UserDAO UserDao = new UserDAO();
				int result = UserDao.delete(userid); 
				
				if(result >= 0){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('성공적으로 회원탈퇴 하였습니다.')");
					script.println("location.href = 'index.jsp'");
					script.println("</script>");	
				} else if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('회원탈퇴를 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");	
			}
		} else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원탈퇴 권한이 없습니다.')");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");	
			}
	%>
	
</body>
</html>