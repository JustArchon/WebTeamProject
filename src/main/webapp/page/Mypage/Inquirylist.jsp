<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="UserAuthService.User"%>
<%@ page import="UserAuthService.UserDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
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
            .sub_news,.sub_news th,.sub_news td{border:0}
        .sub_news a{color:black;;text-decoration:none}
        .sub_news{width:1250px; border-bottom:1px solid #999; color:#666; font-size:12px;table-layout:fixed; margin-left:100px;}
        .sub_news caption{display:none}
        .sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:middle}
        .sub_news td{padding:8px 0 9px; border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
        .sub_news .date,.sub_news .hit{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
        .sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
        .sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
        .sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
        .sub_news tr.reply .title a{padding-left:16px;background:url(img/ic_reply.png) 0 1px no-repeat}
        
        .sub_news {
        	margin: 10px 0;
        	width: 100%;
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
    <a href="../ManagePage/Managepage.jsp">Ȩ������ ����</a> |
    <%
    }
    %>
    <%
    if(userid != null){
    %>
    <a href="mypage.jsp">����������</a> | <a href="../SignOut.jsp">�α׾ƿ�</a>
    <%
    }
    %>
    <%
    if(userid == null){
    %>
    <a href="../login.jsp">�α���</a> | <a href="../SignUp.jsp">ȸ������</a>
    <%
    }
    %>
    </div>
    <div class="title_container">
      <div id="logo">
        <a href="../index.jsp">
          <img src="img/logotodayfood.png" width="180" height="160" />
        </a>
      </div>
      <h1 id="title"><a href="../index.jsp">���� �� ����?</a></h1>
    </div>
  </header>
  <body>
    <section class="main">
      <div class="header">
        <a href="mypage.jsp"><h3 class="main__header">&#x1F4CC�� �Խñ�</h3></a>
        <a href="userUpdate.jsp"><h3 class="main__header">ȸ�� ���� ����</h3></a>
        <a href="Inquirylist.jsp"><h3 class="main__header">�� ���Ǹ��</h3></a>
        <a href="Inquiry.jsp"><h3 class="main__header">���� �ϱ�</h3></a>
        </div>
      <div class="row text-center">
      <table class="sub_news" border="1" cellspacing="0" summary="�Խ����� ������ ����Ʈ">
            <caption>�Խ��� ����Ʈ</caption>
            <colgroup>
            <col width="10">
            <col width="170">
            <col width="40">
            <col width="40">
            <col width="40">
            <col width="40">
            </colgroup>
            <thead>
            <tr>
            <th scope="col">���� ����</th>
            <th scope="col">����</th>
            <th scope="col">�۾���</th>
            <th scope="col">���� ��¥</th>
            <th scope="col">���� ����</th>
            <th scope="col">����</th>
            </tr>
            </thead>
            <tbody>
      <%
      int pageNumber = 1;
      	UserDAO UserDAO = new UserDAO();
		//ArrayList<User> list = UserDAO.getList();
      //for(int i = 0; i < list.size(); i++){
      %>
        <tr>
        <td class="title">
        <a>1</a>
        </td>
        <td class="id">admin</td>
        <td class="nickname">admin</td>
        <td class="date">2021/01/28</td>
        <td class="type">���ǻ���</td>
        <td class="role"><input type="button" id="textwrite" onclick="location.href='../Writing.jsp' " name="btn1" value="����"></td>
        </tr>
          	<%
      		//}
            %>
            </tbody>
        </table>
       </div>
    </section>
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