<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="BBSService.BBSrecipereview" %>
<%@ page import="BBSService.BBSrecipereviewDAO" %>
<%@ page import="BBSService.Comment" %>
<%@ page import="BBSService.CommentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="comment" class="BBSService.Comment" scope="page" />
<jsp:setProperty name="comment" property="commentText" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ������?</title>
</head>
<body>
	 <%
      String userID = null;
      if(session.getAttribute("userID")!=null){
         userID=(String)session.getAttribute("userID");
      }
      
      String userName = null;
      if(session.getAttribute("userName")!=null){
    	  userName=(String)session.getAttribute("userName");
       }
      
      if(userID==null){
         PrintWriter script=response.getWriter();
         script.println("<script>");
         script.println("alert('�α����� �̿밡���մϴ�.')");
         script.println("location.href='login.jsp'");
         script.println("</script>");
      }
          else{
             int bbsID = 0; 
             if (request.getParameter("bbsID") != null){
                bbsID = Integer.parseInt(request.getParameter("bbsID"));
             }
             
             if (bbsID == 0){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('��ȿ���� ���� ���Դϴ�.')");
                script.println("location.href = 'index.jsp'");
                script.println("</script>");
             }
             if (comment.getcommentText() == null){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ�.')");
                script.println("history.back()");
                script.println("</script>");
             } else {
                CommentDAO commentDAO = new CommentDAO();
                BBSrecipereviewDAO BBSrecipereviewDAO = new BBSrecipereviewDAO();
                int result = commentDAO.write(bbsID, userID, userName, comment.getcommentText());
                if (result == -1){
                   PrintWriter script = response.getWriter();
                   script.println("<script>");
                   script.println("alert('��� ���⿡ �����߽��ϴ�.')");
                   script.println("history.back()");
                   script.println("</script>");
                }
                else{
                   PrintWriter script = response.getWriter();
                   BBSrecipereviewDAO.updateBbsCount(commentDAO.getCommentCount(bbsID), bbsID);
                   script.println("<script>");
                   script.println("location.href=document.referrer;");
                   script.println("</script>");
                }
             }
          }
       %>
</body>
</html>