<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="UserAuthService.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="UserAuthService.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="role" />
<jsp:setProperty name="user" property="cadeposts" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지?</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.update(user);
	if (result == -1) {
		// 회원 정보 업데이트 실패
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('회원 정보 업데이트에 실패했습니다.')");
	    script.println("history.back()");
	    script.println("</script>");
	    
	} else {
	    // 회원 정보 업데이트 성공
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('회원 정보가 업데이트되었습니다.')");
	    script.println("location.href = 'index.jsp'");
	    script.println("</script>");
	}
	%>
</body>
</html>