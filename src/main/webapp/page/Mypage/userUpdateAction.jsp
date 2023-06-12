<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="UserAuthService.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
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
<meta charset="UTF-8">
<title>오늘 뭐 먹지?</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	
	if(userID == null){	
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 이후 이용가능한 서비스 입니다.')");
		script.println("location.href = '../login.jsp'");
		script.println("</script>");	
	}
	
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
	
	int result = userDAO.Userupdate(user,userID);
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
	    script.println("location.href = '../index.jsp'");
	    script.println("</script>");
	}
	}
}
	%>
</body>
</html>