<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="UserAuthService.User" %>
<%@ page import="UserAuthService.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="UserAuthService.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지?</title>
</head>
<body>
	<%
	UserDAO userDAO = new UserDAO();
	if (userDAO.isEmail(user.getUserEmail()) == false){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정확한 이메일을 입력해주세요!')");
	    script.println("history.back()");
		script.println("</script>");
	}else{
	
	if (user.getUserName() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이름을 입력하십시오.')");
	    script.println("history.back()");
		script.println("</script>");
	}else{
		
		if (user.getUserID() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디를 입력하십시오.')");
		    script.println("history.back()");
			script.println("</script>");
		}else{
	
	User getuser = userDAO.getUser(user.getUserName(), user.getUserEmail(), user.getUserID());
	if (getuser == null) {
		// 회원 정보 업데이트 실패
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('입력한 정보에 맞는 회원정보를 찾는데 실패했습니다.')");
	    script.println("history.back()");
	    script.println("</script>");
	    
	} else {
	    // 회원 정보 업데이트 성공
	    PrintWriter script = response.getWriter();
	    session.setAttribute("passwordFindID", getuser.getUserID());
	    script.println("<script>");
	    script.println("location.href = 'PasswdReset.jsp'");
	    script.println("</script>");
	}
	}
	}
}
	%>
</body>
</html>