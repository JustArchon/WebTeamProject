<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �� ����?</title>
</head>
<body>
<%
    // 1: ������ ���� �����͸� ��� ����
    session.invalidate();
    // 2: �α��� �������� �̵���Ŵ.
    response.sendRedirect("Main.jsp");
%>
</body>
</html>