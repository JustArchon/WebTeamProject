<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="BBSService.Comment" %>
<%@ page import="BBSService.CommentDAO" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="EUC-KR">
<title>���� ������?</title>
<script type="text/javascript">
	window.name='commentUpdate';
</script>
</head>
<body>
<%
		String userID = null;
		if (session.getAttribute("userID") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
			userID = (String) session.getAttribute("userID");//�������̵� �ش� ���ǰ��� �־��ش�.
		}
		int commentID = 0;
		if (request.getParameter("commentID") != null){
			commentID = Integer.parseInt(request.getParameter("commentID"));
		}
		String commentText = null;
		if (request.getParameter("commentText")!=null){
			commentText = request.getParameter("commentText");
		}
		
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� �ϼ���.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		//���� ��ȿ���� �Ǻ�
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('��ȿ���� ���� �� �Դϴ�.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		Comment comment = new CommentDAO().getComment(commentID);

		if (!userID.equals(comment.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('������ �����ϴ�.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");				
		} else {
	 		if (comment.getcommentText().equals("")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ�')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				CommentDAO commentDAO = new CommentDAO();
				int result = commentDAO.update(commentID, commentText);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('���ۼ����� �����߽��ϴ�')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href= \'view.jsp?bbsID="+bbsID+"\'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>