<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="UserAuthService.User" %>
<%@ page import="UserAuthService.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="UserAuthService.User" scope="page" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지?</title>
</head>
<body>
	<%
	String Finduserid = (String)session.getAttribute("passwordFindID");
	UserDAO userDAO = new UserDAO();
	if (userDAO.checkPassword(user.getUserPassword()) == false){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('8자 이상의 영어,숫자,특수문자를 포함한 비밀번호를 입력하십시오.')");
	    script.println("history.back()");
		script.println("</script>");
	}else{
	
	int result = userDAO.PasswordChange(user.getUserPassword(), Finduserid);
	if (result == 1) {
		session.removeAttribute("passwordFindID");
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('성공적으로 비밀번호를 변경하였습니다.');");
	    script.println("location.href = 'login.jsp'");
	    script.println("</script>");
	    
	} else {
		// 회원 정보 업데이트 실패
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('오류가 발생하였습니다.')");
	    script.println("history.back()");
	    script.println("</script>");
	}
}
	%>
</body>
</html>