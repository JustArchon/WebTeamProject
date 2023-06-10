<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="UserAuthService.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="user" class="UserAuthService.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="favoritefood" />
<jsp:setProperty name="user" property="hobbies" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>오늘 뭐 먹지?</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("history.back()");
			script.println("</script>");
		}
	
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null 
			|| user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			if (user.getUserID().length() < 5 || user.getUserID().length() > 12){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디는 5자 이상 12자 이하로 작성해주세요!')");
			    script.println("history.back()");
				script.println("</script>");
			}else{
			UserDAO userDAO = new UserDAO();
			if (userDAO.isEmail(user.getUserEmail()) == false){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('정확한 이메일을 입력해주세요!')");
			    script.println("history.back()");
				script.println("</script>");
			}else{
			if (userDAO.checkPassword(user.getUserPassword()) == false){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('8자 이상의 영어,숫자,특수문자를 포함한 비밀번호를 입력하십시오.')");
			    script.println("history.back()");
				script.println("</script>");
			}else{
			int result = userDAO.join(user);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'login.jsp'");
				script.println("</script>");
				}
			}
		}
	}
}
	%>
</body>
</html>