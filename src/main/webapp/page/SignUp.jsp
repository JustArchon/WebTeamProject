<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>오늘 뭐먹지?</title>
    <style>
	body {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  box-sizing: border-box;
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
        font-size: 23px;
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
        margin-left: 50px;
        margin-bottom: 100px;
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
    </style>
  </head>
  <header>
    <div id="top_menu">
    </div>
    <div class="title_container">
      <div id="logo">
        <a href="index.jsp">
          <img src="img/logotodayfood.png" width="180" height="160" />
        </a>
      </div>
      <h1 id="title"><a href="index.jsp">오늘 뭐 먹지?</a></h1>
    </div>
  </header>
  <body>
    <section class="main">
      <div class="header">
      </div>
      <h1>회원가입</h1>
	            <form method="post" action="SignUpAction.jsp" id="signup">
                <table width="800">
                </table>    
                <table width="700" height="600" cellpadding="0" style="border-collapse:collapse; font-size:9pt;">
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">회원 ID</td>
                        <td>
                        <input type="text" class="form-control" name="userID" /></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">비밀번호</td>
                        <td><input type="password" class="form-control" name="userPassword" id="pw" onchange="isSame()" /></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">이 름</td>
                        <td><input type="text" class="form-control" name="userName" /></td>
                        </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">좋아하는 음식</td>
                        <td><input type="text" class="form-control" name="favoritefood" /></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">취미</td>
                        <td><input type="text" class="form-control" name="hobbies" /></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">성 별</td>
                        <td>
                            남 성<input type="radio" class="form-control" name="userGender" value="남성" checked />&nbsp;여 성<input type="radio" class="form-control" name="userGender" value="여성"/>
                        </td>
                    </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">이메일</td>
                        <td><input class="form-control" type="email" name="userEmail" /></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
         
                </table>
                <br />
                <table>
                    <tr height="40">
                        <td><input type="submit" class="btn btn-primary form-control" value="회원가입">&nbsp;<input type="button" id="textwrite" onclick="location.href='index.jsp' " name="btn1" value="취소"></td>
                    </tr>
                </table>
            </form>
	<input type="button" id="textwrite" onclick="location.href='index.jsp'" name="btn1" value="메인 화면 >">
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
