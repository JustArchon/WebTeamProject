<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="BBSService.Likey" %>
<%@ page import="BBSService.LikeyDAO" %>
<%@ page import="BBSService.BBSrecipereview" %>
<%@ page import="BBSService.BBSrecipereviewDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지?</title>
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
         script.println("alert('로그인 후 이용가능합니다.')");
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
                script.println("alert('유효하지 않은 글입니다.')");
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
                    script.println("alert('오류가 발생했습니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                 }else{
               	BBSrecipereviewDAO BBSrecipereviewDAO = new BBSrecipereviewDAO();
                BBSrecipereviewDAO.updatelikeCount(LikeyDAO.getLikeCount(bbsID), bbsID);
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('좋아요가 해제되었습니다.')");
                script.println("location.href=document.referrer;");
                script.println("</script>");
                 }
             }else{
                int result = LikeyDAO.like(userID, bbsID);
                if (result == -1){
                   PrintWriter script = response.getWriter();
                   script.println("<script>");
                   script.println("alert('오류가 발생했습니다.')");
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
                 script.println("alert('오류가 발생했습니다.')");
                 script.println("history.back()");
                 script.println("</script>");
              }
              else{
                 PrintWriter script = response.getWriter();
                 BBSrecipereviewDAO BBSrecipereviewDAO = new BBSrecipereviewDAO();
                 BBSrecipereviewDAO.updatelikeCount(LikeyDAO.getLikeCount(bbsID), bbsID);
                 script.println("<script>");
                 script.println("alert('게시글을 좋아요 하였습니다.')");
                 script.println("location.href=document.referrer;");
                 script.println("</script>");
          }
         }
          }
       %>
</body>
</html>