<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="BBSService.BBSrecipereview"%>
<%@ page import="BBSService.BBSrecipereviewDAO"%>
<%@ page import="java.util.ArrayList"%>
<%
 
    request.setCharacterEncoding("EUC-KR");
 
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>���� ������?</title>
    <style>
      body {
        height: 100vh;
        margin: 0;
      }
      img {
        width: 100%;
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
        font-size: 26px;
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
        color: black;
        width: 1000px;
        float: center;
        margin-top: 25px;
      }
      #main_contents h3 {
        font-size: 30px;
        padding-bottom: 8px;
        text-align: center;
      }
      #main_contents p {
        margin-top: 30px;
        line-height: 180%;
      }
      #main_contents #figure {
        margin-top: 10px;
        text-align: left;
      }
      #logo {
        float: left;
        margin: 0px 10px;
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
	  font-size: 35px;
	  font-weight: 500;
	}
      #top_menu {
        padding: 15px;
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
      .grid_container {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr 1fr;
        gap: 30px;
      }
      .main {
        margin: 10px 100px;
      }
      .grid-item img {
        width: 100%;
        height: 350px;
        object-fit: cover;
      }
      .item-img {
        position: relative;
        box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
      }
      .item-img:not(:hover) > .item-title {
        transition: background-color 0.5s ease-in-out;
        background-color: #6f6f6f7c;
      }
      .item-title {
        position: absolute;
        bottom: 0px;
        background-color: #cccccc7c;
        width: 100%;
        color: white;
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-direction: column;
        height: 40%;
        box-sizing: border-box;
        padding-top: 50px;
        font-size: larger;
      }

      p {
        margin: 0;
      }
      .item_etc {
        height: 30px;
        font-size: 15px;
        width: 100%;
        display: flex;
        flex-direction: row;
      }

      .item-footer {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: space-between;
        box-sizing: border-box;
        padding: 5px;
      }
      .header {
        display: flex;
      }
      .main__header {
        margin-right: 50px;
        border-bottom: 2px solid white;
        transition: border-bottom 0.2s;
      }
      .main__header:hover {
        border-bottom: 2px solid #959595;
      }
      #textwrite {
      margin-right: 100px;
        float: right;
        }
      #NextPage {
      margin-left: 100px;
        float: left;
        }
      #FormerPage {
      margin-left: 50px;
        float: left;
        }
      .button_style {
        margin-top: 10px;
        background-color: black;
        color: white;
        border-radius: 5px;
        padding: 5px 15px;
	}
    </style>
  </head>
  <header>
    <div id="top_menu">
<%
	String userid = (String)session.getAttribute("userID");
    String username = (String)session.getAttribute("userName");
    
    if(userid != null && userid.equals("admin")){
    %>
    <a href="/ManagePage/Managepage.jsp">Ȩ������ ����</a> |
    <%
    }
    %>
    <%
    if(userid != null){
    %>
    <a href="/Mypage/mypage.jsp">����������</a> | <a href="SignOut.jsp">�α׾ƿ�</a>
    <%
    }
    %>
    <%
    if(userid == null){
    %>
    <a href="login.jsp">�α���</a> | <a href="SignUp.jsp">ȸ������</a>
    <%
    }
    %>
    </div>
    <div class="title_container">
      <div id="logo">
        <a href="index.jsp">
          <img src="img/logotodayfood.png" width="180" height="160" />
        </a>
      </div>
      <h1 id="title"><a href="index.jsp">���� �� ����?</a></h1>
    </div>
  </header>
  <body>
    <section class="main">
      <div class="header">
        <a href="Mainpage/TodayFood.jsp"><h3 class="main__header">&#x1F44D������ �޴�</h3></a>
        <a href="Mainpage/Recentlyposts.jsp"><h3 class="main__header">&#x1F550 �ֽ� ��</h3></a>
        <a href="Mainpage/RecipeBBS.jsp"><h3 class="main__header">&#x1F4D6 ������ �Խ���</h3></a>
        <a href="Search.jsp"><h3 class="main__header">&#x1F50E�˻��ϱ�</h3></a>
    
			
      </div>
      <div style= "margin-bottom: 10px">
      <form method="post" name="search" action="SearchResult.jsp">
      <td>���� �з�</td>
      <td>
      <select name="foodtype">
      <option value="%%">���ļ���</option>
      <option value="koreanfood">�ѽ�</option>
      <option value="westernfood">���</option>
      <option value="chinafood">�߽�</option>
      <option value="simplefood">���ܽ�</option>
      <option value="dietfood">���̾�Ʈ��</option>
      <option value="dessert">����Ʈ</option>
      <option value="%%">��ü</option>
      </select>
      </td>
				<table class="pull-right"  style= "margin:auto; float:center;">
					<tr>
						<td><select class="form-control" name="searchField">
								<option value="bbsTitle">����</option>
								<option value="userName">�ۼ���</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success button_style">�˻�</button></td>
					</tr>

				</table>
			</form>
      </div>
      
      <div class="grid_container">
		<%
      int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		String foodtype = "%%";
		if (request.getParameter("foodtype") != null) {
			foodtype = request.getParameter("foodtype");
		}
      	BBSrecipereviewDAO BBSrecipereviewDAO = new BBSrecipereviewDAO();
		ArrayList<BBSrecipereview> list = BBSrecipereviewDAO.getList(pageNumber, foodtype);
      for(int i = 0; i < list.size(); i++){
      %>
        <div class="grid-item">
          <a href="view.jsp?bbsID=<%= list.get(i).getBBSrecipereviewID() %>">
            <div class="item-img">
              <img
                src=../bbsUpload/<%=list.get(i).getBBSrecipereviewID()%><%=list.get(i).getUserID()%><%=list.get(i).getBbstitle().replaceAll(" ", "")%>�Խñ��ǻ���.jpg
                alt=""
              />
              <div class="item-title">
                <strong><%= list.get(i).getBbstitle() %></strong>
                <div class="item_etc">
                  <p><span><%= list.get(i).getBbsdate().substring(0,4) %></span>�� <span><%= list.get(i).getBbsdate().substring(5,7) %></span>��<span> <%= list.get(i).getBbsdate().substring(8,10) %></span>��</p>
                   �� ��� <span> <%= list.get(i).getBBSComentcount() %></span>�� �� ��ȸ��: <span> <%= list.get(i).getBbscount() %></span>
                </div>
              </div>
            </div>
            <div class="item-footer">
              <strong>�ۼ���: <%= list.get(i).getUserName() %></strong>
              <p>�� <span><%= list.get(i).getBbslikeamount() %></span></p>
            </div>
          </a>
        </div>
            <%
      		}
            %>
      </div>
    </section>
    	<%
		if (pageNumber != 1) {
		%>
		<input type="button" id="FormerPage" class="button_style" onclick="location.href='Search.jsp?pageNumber=<%=pageNumber - 1%>&foodtype=<%=foodtype%>'" name="btn1" value="����">
		<%
		}
    	if (BBSrecipereviewDAO.nextPage(pageNumber + 1, foodtype)) {
		%>
		<input type="button" id="NextPage" class="button_style" onclick="location.href='Search.jsp?pageNumber=<%=pageNumber + 1%>&foodtype=<%=foodtype%>' " name="btn1" value="����">
		<%
		}
		%>
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