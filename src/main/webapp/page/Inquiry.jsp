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
        .sub_news,.sub_news th,.sub_news td{border:0}
        .sub_news a{color:white;;text-decoration:none}
        .sub_news{width:1250px; border-bottom:1px solid #999; color:#666; font-size:12px;table-layout:fixed; margin-left:250px;}
        .sub_news caption{display:none}
        .sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
        .sub_news td{padding:8px 0 9px; border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
        .sub_news .date,.sub_news .hit{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
        .sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
        .sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
        .sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
        .sub_news tr.reply .title a{padding-left:16px;background:url(img/ic_reply.png) 0 1px no-repeat}
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
        width: 295px;
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
	    font-family: '��������';
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
	    font-family: '��������';
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
        #textwrite {
        float: right;
        }
        #order{
            color: white;
            text-align: center;
        }
       #main_contents {
        color: white;
	    width: 1150px;
        margin-left: 300px;
	    float: center;
    }
        footer {
        position: absolute;
        bottom: 0; 
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
		<a href="login.html">�α���</a> | <a href=SignUp.html>ȸ������</a>
    </div>
</header>
<nav id=menus>
    <ul id='main_menu'>
        <li><a href="Notice.html">��������</a></li>
        <li><a href="Information.html">���� ����</a></li>
        <li><a href="Community.html">Ŀ�´�Ƽ</a></li>
        <li><a href="Inquiry.html">�����ϱ�</a></li>
    </ul>
</nav>
<nav id=sub_menus>
    <ul id='sub_main_menu'>
        <h3>FAQ</h3>
        <li><a href="Inquiry.jsp">FAQ</a></li>
        <li><a href="InquiryContact.jsp">�����ϱ�</a></li>
    </ul>
</nav>
<aside>
</aside>
<body bgcolor='#020715'>
    <table class="sub_news" border="1" cellspacing="0" summary="�Խ����� ������ ����Ʈ">
        <caption>�Խ��� ����Ʈ</caption>
        <colgroup>
        <col>
        <col width="110">
        <col width="100">
        <col width="80">
        </colgroup>
        <thead>
        <tr>
        <th scope="col">����</th>
        <th scope="col">�۾���</th>
        <th scope="col">��¥</th>
        <th scope="col">��ȸ��</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td class="title">
        <a href="#">Ȩ������ �α����� �ȵɶ�</a>
        <a class="comment" href="#"></a>
        </td>
        <td class="name">������</td>
        <td class="date">2021/01/30</td>
        <td class="hit">1</td>
        </tr>
        <tr>
            <td class="title">
            <a href="#">��й�ȣ�� �ؾ���Ⱦ��</a>
            <a class="comment" href="#"></a>
            </td>
            <td class="name">������</td>
            <td class="date">2021/01/30</td>
            <td class="hit">1</td>
            </tr>
        </tbody>
        </table>
        <div id='main_contents'>
            <p id="order" ><a href="Inquiry.jsp"><b>1</b></a> &nbsp; <a href="Inquiry-2.html">2</a> &nbsp;  3 &nbsp; 4 &nbsp; 5</p>
        </div>
    <section>
        
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