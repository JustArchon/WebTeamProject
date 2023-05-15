<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="BBSService.InquiryDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="inquiry" class="BBSService.Inquiry" scope="page" />
<jsp:setProperty name="inquiry" property="iemail" />
<jsp:setProperty name="inquiry" property="itype" />
<jsp:setProperty name="inquiry" property="ititle" />
<jsp:setProperty name="inquiry" property="icontent" />
<jsp:setProperty name="inquiry" property="ipassword" />
<jsp:setProperty name="inquiry" property="ifile" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>