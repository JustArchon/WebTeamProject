<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="BBSService.BBSrecipereview" %>
<%@ page import="BBSService.BBSrecipereviewDAO" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>오늘 뭐 먹지?</title>
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
      .title_container {
        margin-left: 50px;
        margin-bottom: 100px;
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
#main_menu {
height: 50px;
	    margin-top: 20px;
        text-align: center;
	    font-family: '맑은고딕';
	    font-size: 20px;
	    color: white;
        }
        #main_menu li {
	    display: inline;
        line-height: 50px;
	    margin-left: 190px;
        padding: 3px;
        border-bottom: solid 2px;
        }
        #sub_main_menu {
	    margin-top: 20px;
        text-align: left;
	    font-family: '맑은고딕';
	    font-size: 20px;
	    color: white;
        margin-right: 30px;
        }
        #sub_main_menu h3 {
	    font-size: 18px;
        text-align: center;
	    color: white;
	    padding: 12px;
        border: solid 1px;
        }
        #sub_main_menu li {
        font-size: 18px;
        padding: 10px;
        border-bottom: dotted 1px #cccccc;
        color: white;
        list-style: none;
        }
        #main_img{
            width: 100%;
            height: 281px;
            background-repeat: no-repeat;
            background-position: top center;
            margin-top: 20px;
        }
         table.table2{
                border-collapse: separate;
                border-spacing: 1px;
                text-align: left;
                line-height: 1.5;
                border-top: 1px solid #ccc;
                margin : 20px 10px;
                margin-left:auto;margin-right:auto;
        }
        table.table2 tr {
                 width: 50px;
                 padding: 10px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid #ccc;
        }
        table.table2 td {
                 width: 100px;
                 padding: 10px;
                 vertical-align: top;
                 border-bottom: 1px solid #ccc;
        }
    </style>
  </head>
  <header>
    <div id="top_menu">
    <%
	String userid = (String)session.getAttribute("userID");
	if(userid != null){
	%>
		<a href="#.html">마이페이지</a> | <a href="SignOut.jsp">로그아웃</a>
	<%
	}else{
	%>
		<a href="login.jsp">로그인</a> | <a href="SignUp.jsp">회원가입</a>
	<%
	}
	%>
	<%
	int bbsID=0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		
		//유효한 글인지 체크하는 부분
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");	
		}
		BBSrecipereview BBS = new BBSrecipereviewDAO().getBBSrecipereview(bbsID);
		
		BBSrecipereviewDAO BBSrecipereviewDAO = new BBSrecipereviewDAO();
		BBSrecipereview BBSrecipereview = new BBSrecipereview();
		BBSrecipereview = BBSrecipereviewDAO.getBBSrecipereview(bbsID);
		
		if(!userid.equals(BBSrecipereview.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정가능한 권한이 없습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");	
		}
	%>
    </div>
    <div class="title_container">
      <div id="logo">
        <a href="index.jsp">
          <img src="img/logotodayfood.png" width="140" height="120" />
        </a>
      </div>
      <h1 id="title"><a href="index.jsp">오늘 뭐 먹지?</a></h1>
    </div>
  </header>
  
  <body bgcolor="#ffffff">
    <main>
      <section>
        <div id="main_contents">
           <h3>게시글 수정</h3>
            <form method="post" encType = "multipart/form-data" action="ModifyAction.jsp?bbsID=<%=bbsID%>" id="writing" accept-charset="UTF-8">
            <table  style="padding-top: 1px" align = left width=1000 border=0 cellpadding=2 >
                <table class = "table2">
                        <tr>
                            <td>음식 분류</td>
                            <td>
                                <select name = 'bbstype' class="form-control">
      								<option value="koreanfood">한식</option>
      								<option value="westernfood">양식</option>
      								<option value="chinafood">중식</option>
      								<option value="simplefood">간단식</option>
      								<option value="dietfood">다이어트식</option>
      								<option value="dessert">디저트</option>
                                </select>
                            </td>
                            </tr>

                        <tr>
                        <td>제목</td>
                        <td><input type = "text" class="form-control" name = "bbstitle" id = "bbstitle" size=60 value="<%= BBS.getBbstitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %>"></td>
                        </tr>
 
                        <tr>
                        <td>내용</td>
                        <td><textarea class="form-control" name = "bbscontent" cols=85 rows=15><%= BBS.getBbscontent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "") %></textarea></td>
                        </tr>

                        <tr>
                            <td>사진 첨부</td>
                            <td><input type = file class="form-control" name = "upload" size=10 maxlength=10 ></td>
                            </tr>
                        </table>
                </td>
                </tr>
        
        <center>
        	<input type="submit" class="button_style form-control" value="확인">
            </center>
            </table>
        </form>
      </section>
    </main>
  </body>
  <footer>
    <div id="footer_box">
      <ul id="address">
        <li>대전시 대덕구 법2동 1234 우:123-1234</li>
        <li>TEL:042-123-1234 문의사항 : email@naver.com</li>
        <li>COPYLEFT (C) Kang Gyu Jin ALL LEFTS RESERVED</li>
      </ul>
    </div>
  </footer>
</html>
