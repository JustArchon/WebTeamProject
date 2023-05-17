<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>¿À´Ã ¹¹ ¸ÔÁö?</title>
    <style>
        .white{
            color: black;
        }
        a { text-decoration: none }
        a:link {text-decoration: none; color: black}
        a:visited {text-decoration: none; color: black;}
        a:active {text-decoration: none; color: black}
        a:hover {text-decoration: none; color: black;}
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
            color:black;
            text-align: center;
            font-family: 'D2Coding';
//            text-shadow: 4px 4px 4px rgba(66, 74, 94, 1);
        }
        #menus {
	    float: center;
        }
        #sub_menus {
        float: left;
        }
        #top_menu {
	    text-align: right;
        color:black;
        margin-bottom: 40px;
        }
        #main_menu {
            background: rgb(255, 255, 255);

        height: 50px;
	    margin-top: 20px;
        text-align: center;
	    font-family: '¸¼Àº°íµñ';
	    font-size: 20px;
	    color: black;
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
	    font-family: '¸¼Àº°íµñ';
	    font-size: 20px;
	    color: black;
        }
        #sub_main_menu h3 {
	    font-size: 18px;
        text-align: center;
	    color: black;
	    padding: 12px;
        border: solid 1px;
        }
        #sub_main_menu li {
        font-size: 18px;
        padding: 10px;
        border-bottom: dotted 1px #cccccc;
        color: black;
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
            color: black;
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
	    background: rgb(255, 255, 255);
        }
        #footer_box {
	    width: 1140px;
	    margin: 0 auto;
        }
        #address {
	float: right;
	margin: 50px 30px 0 0;
	color: black;
}
        
    </style>
</head>
<header>
    <div id='logo'>
        <a href="Main.jsp">
        <img src='img/logo.png' width='180' height='160'>
        </a>
    </div>
    <h1 id="title"><a href="Main.html">¿À´Ã ¹¹ ¸ÔÁö?</a></h1>
    <div id='top_menu'>
    	<%
	String userid = (String)session.getAttribute("userID");
	if(userid != null){
	%>
		<a href="SignOut.jsp">·Î±×¾Æ¿ô</a> | <a href=#>¸¶ÀÌ ÆäÀÌÁö</a>
	<%
	}else{
	%>
	<a href="login.jsp">·Î±×ÀÎ</a> | <a href=SignUp.jsp>È¸¿ø°¡ÀÔ</a>
	<%
	}
	%>
    </div>
</header>
<nav id=menus>
    <ul id='main_menu'>
        <li><a href="Notice.html">°øÁö»çÇ×</a></li>
        <li><a href="Information.html">°ÔÀÓ Á¤º¸</a></li>
        <li><a href="Community.html">Ä¿¹Â´ÏÆ¼</a></li>
        <li><a href="Inquiry.jsp">¹®ÀÇÇÏ±â</a></li>
    </ul>
</nav>
<aside>
</aside>
<body bgcolor='#ffffff'>
    <section>
        <h3 id='maintext'>½ÃÁð6</h3>
        <video id="mainvedio" src="video/Trailer.mp4" width="800"  controls autoplay></video>
    </section>
</body>
<footer>
    <div id='footer_box'>
    <ul id='address'>
            <li>´ëÀü½Ã ´ë´ö±¸ ¹ý2µ¿ 1234 ¿ì:123-1234</li>
            <li>TEL:042-123-1234 ¹®ÀÇ»çÇ× : email@naver.com</li>
            <li>COPYLEFT (C) Kang Gyu Jin ALL LEFTS RESERVED</li>
        </ul>
    </div>
</footer>
</html>