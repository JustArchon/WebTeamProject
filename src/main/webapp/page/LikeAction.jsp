<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="BBSService.Likey" %>
<%@ page import="BBSService.LikeyDAO" %>
<%@ page import="BBSService.BBSrecipereview" %>
<%@ page import="BBSService.BBSrecipereviewDAO" %>
<%@ page import="java.io.PrintWriter" %>
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
         script.println("alert('�α��� �� �̿밡���մϴ�.')");
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
             LikeyDAO LikeyDAO = new LikeyDAO();
             Likey likey = new LikeyDAO().getlike(userID,bbsID);
             if(likey != null){
             if (likey.getUserLIKE() == 1){
            	int result = LikeyDAO.unlike(userID, bbsID);
            	if (result == -1){
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('������ �߻��߽��ϴ�.')");
                    script.println("history.back()");
                    script.println("</script>");
                 }else{
               	BBSrecipereviewDAO BBSrecipereviewDAO = new BBSrecipereviewDAO();
                BBSrecipereviewDAO.updatelikeCount(LikeyDAO.getLikeCount(bbsID), bbsID);
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('���ƿ䰡 �����Ǿ����ϴ�.')");
                script.println("location.href=document.referrer;");
                script.println("</script>");
                 }
             }else{
                int result = LikeyDAO.like(userID, bbsID);
                if (result == -1){
                   PrintWriter script = response.getWriter();
                   script.println("<script>");
                   script.println("alert('������ �߻��߽��ϴ�.')");
                   script.println("history.back()");
                   script.println("</script>");
                }
                else{
                   PrintWriter script = response.getWriter();
                   BBSrecipereviewDAO BBSrecipereviewDAO = new BBSrecipereviewDAO();
                   BBSrecipereviewDAO.updatelikeCount(LikeyDAO.getLikeCount(bbsID), bbsID);
                   script.println("<script>");
                   script.println("location.href=document.referrer;");
                   script.println("</script>");
                }
             }
          }else{
        	  int result = LikeyDAO.like(userID, bbsID);
              if (result == -1){
                 PrintWriter script = response.getWriter();
                 script.println("<script>");
                 script.println("alert('������ �߻��߽��ϴ�.')");
                 script.println("history.back()");
                 script.println("</script>");
              }
              else{
                 PrintWriter script = response.getWriter();
                 BBSrecipereviewDAO BBSrecipereviewDAO = new BBSrecipereviewDAO();
                 BBSrecipereviewDAO.updatelikeCount(LikeyDAO.getLikeCount(bbsID), bbsID);
                 script.println("<script>");
                 script.println("alert('�Խñ��� ���ƿ� �Ͽ����ϴ�.')");
                 script.println("location.href=document.referrer;");
                 script.println("</script>");
          }
         }
          }
       %>
</body>
</html>