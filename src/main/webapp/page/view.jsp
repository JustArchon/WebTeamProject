<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="BBSService.BBSrecipereview"%>
<%@ page import="BBSService.BBSrecipereviewDAO"%>
<%@ page import="BBSService.CommentDAO"%>
<%@ page import="BBSService.Comment"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>���� �� ����?</title>
    <style>
      body {
        margin: 0;
      }
      main {
        margin: 0px 300px;
      }
      .border_bottom {
        border-bottom: solid 1px #cccccc;
      }

      .white {
        color: black;
      }
      a {
        text-decoration: none;
      }
      a:link {
        text-decoration: none;
        color: black;
      }
      a:visited {
        text-decoration: none;
        color: black;
      }
      a:active {
        text-decoration: none;
        color: black;
      }
      a:hover {
        text-decoration: none;
        color: black;
      }
      aside {
        width: 50px;
        float: right;
        margin-right: 300px;
      }
      section {
        margin-top: 10px;
      }
      img {
        display: block;
        margin: auto;
      }
      #title {
        color: black;
        text-align: center;
        font-family: "D2Coding";
        font-size: 36px;
      }
      #sub_menus {
        float: left;
      }
      #top_menu {
        text-align: right;
        color: black;
        margin-bottom: 40px;
      }
      #main_img {
        width: 100%;
        height: 281px;
        background-repeat: no-repeat;
        background-position: top center;
        margin-top: 20px;
      }
      #main_contents {
      display: flex;
      flex-direction: column;
        color: black;
        width: 100%;
        float: center;
        margin-top: 25px;
      }
      #main_contents h3 {
            display: flex;
      flex-direction: column;
        font-size: 30px;
        padding-bottom: 8px;
        text-align: center;
      }
      #main_contents p {
            display: flex;
      flex-direction: column;
        margin-top: 30px;
        line-height: 180%;
      }
      #main_contents #figure {
            display: flex;
      flex-direction: column;
        margin-top: 10px;
        text-align: left;
      }
      #logo {
        float: left;
        margin: 0px 30px;
      }
      footer {
        width: 100%;
        height: 150px;
        margin-top: 30px;
        background: rgb(255, 255, 255);
      }
      .title_container {
  		display: flex;
  		flex-direction: column;
  		align-items: center;
  		justify-content: center;
  		font-size: 30px;
  		font-weight: 400;
		}
      #top_menu {
        padding: 15px;
      }
      .main_contents_etc {
        border-bottom: solid 1px #cccccc;
        width: 100%;
        padding-bottom: 15px;
        margin-bottom: 60px;
      }
      #like {
        border-bottom: solid 1px #cccccc;
        width: 100%;
        padding-bottom: 15px;
        margin: 60px 0px;
        text-align: end;
      }
      .comment_container {
      	width: 100%;
        display: flex;
        justify-content: center;
        flex-direction: column;
        margin-left: 70px;
      }
      .comment_container form div {
        display: flex;
        justify-content: end;
      }
      .comment__form_input {
        width: 100%;
        height: 100px;
      }
      .comment_number {
        margin-bottom: 5px;
      }
      footer {
        display: flex;
        height: 200px;
        align-items: end;
        background-color: #cccccc;
        margin-top: 150px;
      }
      #address {
        margin-right: 50px;
      }
      .button_style {
        margin-top: 10px;
        background-color: black;
        color: white;
        border-radius: 5px;
        padding: 5px 15px;
      }
      
      .B1 {
 		margin-right: 4px;
 		float: right;
		}
		.table {
  width: 100%;
  max-width: 100%;
  margin-bottom: 20px;
}
    </style>
  </head>
  <header>
    <div id="top_menu">
    <%
	String userid = (String)session.getAttribute("userID");
	if(userid != null){
	%>
		<a href="#.html">����������</a> | <a href="SignOut.jsp">�α׾ƿ�</a>
	<%
	}else{
	%>
		<a href="login.jsp">�α���</a> | <a href="SignUp.jsp">ȸ������</a>
	<%
	}
	%>
    </div>
    <div class="title_container">
      <div id="logo">
        <a href="index.jsp">
          <img src="img/logotodayfood.png" width="140" height="120" />
        </a>
      </div>
      <h1 id="title"><a href="index.jsp">���� �� ����?</a></h1>
    </div>
  </header>
  <body bgcolor="#ffffff">
  <%
  	String userID = null;
  	if (session.getAttribute("userID") != null) {
  		userID = (String) session.getAttribute("userID");
  	}
  	int bbsID = 0;
  	if (request.getParameter("bbsID") != null) {
  		bbsID = Integer.parseInt(request.getParameter("bbsID"));
  	}
  	if (bbsID == 0) {
  		PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("alert('��ȿ���� �ʴ� ���Դϴ�.')");
  		script.println("location.href = 'index.jsp'");
  		script.println("history.back()");
  		script.println("</script>");
  	}
  	BBSrecipereview BBS = new BBSrecipereviewDAO().getBBSrecipereview(bbsID);
	
  	//String real = "C:\\Users\\User\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\TeamProject\\bbsUpload";
  	//File viewFile = new File(real+"\\"+BBS.getUserID()+BBS.getBbstitle().replaceAll(" ", "")+"�Խñ��ǻ���.jpg");
  %>
    <main>
      <section>
        <div id="main_contents">
          <h3><%= BBS.getBbstitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></h3>
          <div class="main_contents_etc">
            <!-- �ۼ���, ��¥ -->
            <span>�ۼ���:</span> <%= BBS.getUserName() %> | <span><%= BBS.getBbsdate().substring(0,4) %></span>�� <span><%= BBS.getBbsdate().substring(5,7) %></span>��<span> <%= BBS.getBbsdate().substring(8,10) %></span>�� <span><%= BBS.getBbsdate().substring(11, 13) + "��" + BBS.getBbsdate().substring(14, 16) + "�� " %></span><span> | ��ȸ��:</span> <%= BBS.getBbscount() %><button type="submit" class="B1">�� ����</button><button type="submit" class="B1">�� ����</button>
          </div>
          <div id="figure">
            <img
              src="../bbsUpload/<%=bbsID %><%=BBS.getUserID() %><%=BBS.getBbstitle().replaceAll(" ", "") %>�Խñ��ǻ���.jpg"
              style="width: 700px"
            />
          </div>
          <p><%= BBS.getBbscontent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %>
          </p>
          <div id="like"><span>���ƿ� </span><span>��</span></div>
        </div>

      </section>
      <!-- ��� -->
      <section class="comment_container">
        <div class="comment_number"><span><%=BBS.getBBSComentcount() %></span><span>���� ���</span></div>
    <div id="comment">
    	<table class="table table-striped" style="text-align: center;">
					<tbody>
								<%
									CommentDAO commentDAO = new CommentDAO();
									ArrayList<BBSService.Comment> list = commentDAO.getList(bbsID);
									for (int i = 0; i < list.size(); i++) {
								%>
										<table class="table table-striped"
											style="text-align: center;">
											<tbody>
												<tr>
													<td align="left"><%=list.get(i).getUserName()%></td>

													<td align="right"><%=list.get(i).getCommentDate().substring(0, 11) + list.get(i).getCommentDate().substring(11, 13)
						+ "��" + list.get(i).getCommentDate().substring(14, 16) + "��"%></td>
												</tr>

												<tr>
													<td align="left"><%=list.get(i).getcommentText()%></td>
													<td align="right"><a
														href="commentUpdate.jsp?bbsID=<%=bbsID%>&commentID="
														class="btn btn-warning">����</a> <a
														onclick="return confirm('������ �����Ͻðڽ��ϱ�?')"
														href="commentDeleteAction.jsp?bbsID=<%=bbsID%>&commentID="
														class="btn btn-danger">����</a></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<%
									}
								%>
							</tr>
					</table>
        <form method="post" action="CommentAction.jsp?bbsID=<%= bbsID %>" id="comment">
          <input
            type="text"
            placeholder="����� �Է��ϼ���."
            class="comment__form_input form-control"
            name="commentText"
          />
          <div>
            <button type="submit" class="button_style form-control" value="��� ���">��� ���</button>
          </div>
        </form>
      </section>
    </main>
  </body>
  <footer>
    <div id="footer_box">
      <ul id="address">
        <li>������ ����� ��2�� 1234 ��:123-1234</li>
        <li>TEL:042-123-1234 ���ǻ��� : email@naver.com</li>
        <li>COPYLEFT (C) Kang Gyu Jin ALL LEFTS RESERVED</li>
      </ul>
    </div>
  </footer>
</html>
