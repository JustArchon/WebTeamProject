<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
        margin: 0px 30px;
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
    <main>
      <section>
        <div id="main_contents">
          <h3>����ġ �佺Ʈ</h3>
          <div class="main_contents_etc">
            <!-- �ۼ���, ��¥ -->
            <span>�ۼ���</span> �� <span>2023�� 4�� 29��</span>
          </div>
          <div id="figure">
            <img
              src="https://images.unsplash.com/photo-1605291535065-e1d52d2b264a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
              style="width: 700px"
            />
          </div>
          <p>�߰������� ������ 20�� ���� �㰡 �Ӵϴ�.</p>
          <p>
            ����ä��, �����, ���ߵ� �Բ� ���� ä�ҵ��� �帣�� ���� �����ϰ�
            ���� �� �Ա� ���� ũ��� �� ������ �㰡�ݴϴ�.
          </p>
          <p>
            �з��� �巹�� ��� ������, �ŽǾ�, ������, ����, ���� ����,
            �ø����, ���⸧, �ø�����, ���� ����� �־� ��� ���� �ݴϴ�.
            (�巹���� ���� ���� ������ �� ���� ��ø� ���� �����ϴ�.)
          </p>
          <p>
            ���� ���� �װ� �ణ�� ������ �߰������� �ְ� ��Ƽ� ��� ����
            �Ա� ���� ũ��� ���� �ݴϴ�.
          </p>
          <p>
            ������ �㰡 ���Ҵ� ä�Ҵ� ü�� ���� ���⸦ ������ �� ���ÿ� ���
            �ְ� ���� ���� �߰����쵵 ��� �ݴϴ�. �׸��� �巹���� ��� �ѷ�����
            �߰���������� �ϼ��Դϴ�.
          </p>
          <div id="like"><span>���ƿ�</span><span>��</span></div>
        </div>
      </section>
      <!-- ��� -->
      <section class="comment_container">
        <div class="comment_number"><span>3</span><span>���� ���</span></div>
        <form action="" method="post">
          <input
            type="text"
            placeholder="����� �Է��ϼ���."
            class="comment__form_input"
          />
          <div>
            <button type="submit" class="button_style">��� ���</button>
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
