<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="UserAuthService.User"%>
<%@ page import="UserAuthService.UserDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">
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
    form input{
	margin-bottom: 20px;
	width: 100%;
	box-sizing: border-box;
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
    
	if(userid == null){	
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 이후 이용가능한 서비스 입니다.')");
		script.println("location.href = '../login.jsp'");
		script.println("</script>");	
	}
    
    if(userid != null && userid.equals("admin")){
    %>
    <a href="../ManagePage/Managepage.jsp">홈페이지 관리</a> |
    <%
    }
    %>
    <%
    if(userid != null){
    %>
    <a href="mypage.jsp">마이페이지</a> | <a href="../SignOut.jsp">로그아웃</a>
    <%
    }
    %>
    <%
    if(userid == null){
    %>
    <a href="../login.jsp">로그인</a> | <a href="../SignUp.jsp">회원가입</a>
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
      <h1 id="title"><a href="../index.jsp">오늘 뭐 먹지?</a></h1>
    </div>
  </header>
  <body>
    <section class="main">
      <div class="header">
        <a href="mypage.jsp"><h3 class="main__header">&#x1F4CC내 게시글</h3></a>
        <a href="userUpdate.jsp"><h3 class="main__header">회원 정보 수정</h3></a>
        <a href="Inquirylist.jsp"><h3 class="main__header">내 문의목록</h3></a>
        <a href="Inquiry.jsp"><h3 class="main__header">문의 하기</h3></a>
      </div>
          <%
      User user = new UserDAO().getUser(userid);
      %>
      <h1>회원정보 수정</h1>
	<form method="post" action="userUpdateAction.jsp" id="userEdit">
		<hr>
		<div>
			<label for="inputName">이 름: </label>
			<input id="inputName" type="text" required name="userName" value="<%=user.getUserName()%>">
		</div>
		<hr>
		<div>
			<label for="inputId">아이디: <%= userid%></label>
		</div>
		<hr>
		<div>
			<label for="inputPW">비밀번호: </label>
			<input id="inputPW" type="password" required name="userPassword" >
		</div>
		<div>
		<hr>
			<label for="inputEmail">이메일: </label>
			<input id="inputEmail" type="email" required name="userEmail" value="<%=user.getUserEmail()%>">
		</div>
		<hr>
		<div>
			<label for="inputFavoriteFood">좋아하는 음식: </label>
			<input id="inputFavoriteFood" type="text" required name="favoritefood" value="<%=user.getFavoritefood()%>">
		</div>
		<hr>
		<div>
			<label for="inputHobby">취 미: </label>
			<input id="inputHobby" type="text" required name="hobbies" value="<%=user.getHobbies()%>">
		</div>
		<hr>
		<div>
			<label for="inputUserGender">성 별: </label><br/>
			<hr>
			남 성: <input type="radio" id="inputUserGender" name="userGender" value="남성" checked>
			여 성: <input type="radio" id="inputUserGender" name="userGender" value="여성">
		</div>
		
		<hr>
		<input type="submit" class="button_style" value="저 장">
	</form>
	<input type="button" id="textwrite" class="button_style" onclick="location.href='Main.html'" name="btn1" value="메인 화면 >">
    </section>
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
