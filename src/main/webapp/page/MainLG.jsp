<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�� ���� ��Ƽ �������� ����</title>
    <style>
        .white{
            color: white;
        }
        a { text-decoration: none }
        a:link {text-decoration: none; color: white}
        a:visited {text-decoration: none; color: white;}
        a:active {text-decoration: none; color: white}
        a:hover {text-decoration: none; color: white;}
        aside{
            width: 50px;
            float: right;
            margin-right: 300px;
        }
        section {
	    margin-top: 10px;
        }
        img { display : block;
        margin : auto;
        }
        #title{
            color:white;
            text-align: center;
            font-family: 'D2Coding';
            text-shadow: 4px 4px 4px rgba(66, 74, 94, 1);
        }
        #menus {
	    float: center;
        }
        #sub_menus {
        float: left;
        }
        #top_menu {
	    text-align: right;
        color:white;
        margin-bottom: 40px;
        }
        #main_menu {
            background: rgb(0, 0, 0);
background: -moz-linear-gradient(22deg, rgb(0, 0, 0) 30%, rgb(12, 12, 30) 70%);
background: -webkit-linear-gradient(22deg, rgb(0, 0, 0) 30%, rgb(12, 12, 30) 70%);
background: -o-linear-gradient(22deg, rgb(0, 0, 0) 30%, rgb(12, 12, 30) 70%);
background: -ms-linear-gradient(22deg, rgb(0, 0, 0) 30%, rgb(12, 12, 30) 70%);
background: linear-gradient(112deg, rgb(0, 0, 0) 30%, rgb(12, 12, 30) 70%);

        height: 50px;
	    margin-top: 20px;
        text-align: center;
	    font-family: '�������';
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
	    font-family: '�������';
	    font-size: 20px;
	    color: white;
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
	    margin-left: 10px;
        }
        #main_img{
            width: 100%;
            height: 281px;
            background-repeat: no-repeat;
            background-position: top center;
            margin-top: 20px;
        }
        #maintext{
            color: white;
            font-size: 30px;
            text-align: center;
            display: block;
            margin: auto;
            margin-top: 30px;
            text-shadow: 4px 4px 4px rgba(66, 74, 94, 1);
        }
        #mainvedio{
            display: block;
            margin: auto;
            margin-top: 30px;
        }
        #logo {
	    float: left;
        margin-left: 10px;
        }
        footer {
	    width: 100%;
	    height: 150px;
	    margin-top: 30px;
	    background: rgb(0, 0, 0);
        background: -moz-linear-gradient(22deg, rgb(0, 0, 0) 30%, rgb(23, 23, 56) 70%);
        background: -webkit-linear-gradient(22deg, rgb(0, 0, 0) 30%, rgb(23, 23, 56) 70%);
        background: -o-linear-gradient(22deg, rgb(0, 0, 0) 30%, rgb(23, 23, 56) 70%);
        background: -ms-linear-gradient(22deg, rgb(0, 0, 0) 30%, rgb(23, 23, 56) 70%);
        background: linear-gradient(112deg, rgb(0, 0, 0) 30%, rgb(23, 23, 56) 70%);
        }
        #footer_box {
	    width: 1140px;
	    margin: 0 auto;
        }
        #address {
	float: right;
	margin: 50px 30px 0 0;
	color: white;
}
        
    </style>
</head>
<header>
    <div id='logo'>
        <a href="Main.html">
        <img src='img/logo.png' width='200' height='120'>
        </a>
    </div>
    <h1 id="title"><a href="Main.html">�� ���� ��Ƽ �������� ����</a></h1>
    <div id='top_menu'>
		<a href="SignOut.jsp">�α׾ƿ�</a> | <a href=#>ȸ����������</a>
    </div>
</header>
<nav id=menus>
    <ul id='main_menu'>
        <li><a href="Notice.html">��������</a></li>
        <li><a href="Information.html">���� ����</a></li>
        <li><a href="Community.html">Ŀ�´�Ƽ</a></li>
        <li><a href="Inquiry.jsp">�����ϱ�</a></li>
    </ul>
</nav>
<nav id=sub_menus>
    <ul id='sub_main_menu'>
        <h3>���� �ٷΰ���</h3>
        <li><a href="Main.html">�� ���� ��Ƽ ��������</a></li>
        <li>�� ���� ��Ƽ �ݵ��</li>
        <li>�� ���� ��Ƽ ����</li>
    </ul>
</nav>
<aside>
</aside>
<body bgcolor='#020715'>
    <section>
        <h3 id='maintext'>����6</h3>
        <video id="mainvedio" src="video/Trailer.mp4" width="800"  controls autoplay></video>
    </section>
</body>
<footer>
    <div id='footer_box'>
    <ul id='address'>
            <li>������ ����� ��2�� 1234 ��:123-1234</li>
            <li>TEL:042-123-1234 ���ǻ��� : email@naver.com</li>
            <li>COPYLEFT (C) Kang Gyu Jin ALL LEFTS RESERVED</li>
        </ul>
    </div>
</footer>
</html>