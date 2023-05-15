<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>콜 오브 듀티 모던워페어 포럼</title>
    <style>
        .white{
            color: white;
        }
        a { color: #333; text-decoration: none }
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
        input {
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    background-color: white;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 0px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}
.inner_login {
    position: absolute;
    float: center;
    left: 50%;
    top: 50%;
    margin: -185px 0 0 -50px;
}
.screen_out {
    position: absolute;
    width: 0;
    height: 0;
    overflow: hidden;
    line-height: 0;
    text-indent: -9999px;    
}
.login{
        position: relative;
        width: 320px;
        margin: 0 auto;
    }
.screen_out {
    position: absolute;
    width: 0;
    height: 0;
    overflow: hidden;
    line-height: 0;
    text-indent: -9999px;    
}
body, button, input, select, td, textarea, th {
    font-size: 13px;
    line-height: 1.5;
}    
fieldset, img {
    border: 0;
}
.login .box_login {
    margin: 35px 0 0;
    border: 1px solid #ddd;
    border-radius: 3px;
    background-color: #fff;
    box-sizing: border-box;
}
.login .inp_text {
    position: relative;
    width: 100%;
    margin: 0;
    padding: 18px 19px 19px;
    box-sizing: border-box;
}
.login .inp_text+.inp_text {
    border-top: 1px solid #ddd;
}
.inp_text input {
    display: block;
    width: 100%;
    height: 100%;
    font-size: 13px;
    color: #000;
    border: none;
    outline: 0;
    background-color: transparent;
}
.btn_login {
    margin: 20px 0 0;
    width: 100%;
    height: 48px;
    border-radius: 3px;
    font-size: 16px;
    color: #fff;
    background-color: #000;
}
.login_append {
    overflow: hidden;
    padding: 15px 0 0;
}
.inp_chk {
    display: inline-block;
    position: relative;
    margin-bottom: -1px;
}
.login_append .inp_chk {
    float: left;
}
.inp_chk .inp_radio {
    position: absolute;
    z-index: -1;
    top: 0;
    left: 0;
    width: 18px;
    height: 18px;
    border: 0;
}
.inp_chk .lab_g {
    display: inline-block;
    margin-right: 19px;
    color: #909090;
    font-size: 13px;
    line-height: 19px;
    vertical-align: top;
}
.inp_chk .ico_check {
    display: inline-block;
    width: 18px;
    height: 18px;
    margin: 1px 4px 0 0;
    background-position: -60px 0;
    color: #333;
}
.inp_chk .txt_lab {
    vertical-align: top;
}
.login_append .txt_find {
    float: right;
    color: #777;
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
        #logo {
	    float: left;
        margin-left: 10px;
        }
        #main_contents {
        color: white;
	    width: 1150px;
        margin-left: 300px;
	    float: center;
    }
    footer {
        position: absolute;
        bottom:0; 
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
        <a href="Main.jsp">
        <img src='img/logo.png' width='200' height='120'>
        </a>
    </div>
    <h1 id="title">콜 오브 듀티 모던워페어 포럼</h1>
</header>
<aside>
</aside>
<body bgcolor='#020715'>
    <section>
        <div id='main_contents'>
        <div class="inner_login">
            <div class="login">
            <form method="post" action="loginAction.jsp" id="login">
                    <fieldset>
                    <legend class="screen_out">로그인 정보 입력폼</legend>
                    <div class="box_login">
                        <div class="inp_text">
                        <label for="loginId" class="screen_out">아이디</label>
                        <input type="text" id="loginId" name="userID" placeholder="ID" >
                        </div>
                        <div class="inp_text">
                        <label for="loginPw" class="screen_out">비밀번호</label>
                        <input type="password" id="loginPw" name="userPassword" placeholder="Password" >
                        </div>
                    </div>
                    <input type="submit" class="btn_login form-control">로그인
                    <div class="login_append">
                        <div class="inp_chk">
                        <input type="checkbox" id="keepLogin" class="inp_radio"  name="keepLogin">
                        <label for="keepLogin" class="lab_g">
                <span class="img_top ico_check"></span>
                <span class="txt_lab">로그인 상태 유지</span>
                </label>
                        </div>
                        <span class="txt_find">
                        <a href="#" class="link_find">아이디</a>
                            / 
                        <a href="#" class="link_find">비밀번호 찾기</a>
                        </span>
                    </div>
                    
                    </fieldset>
                </form>
                
            </div>
        </div>
    </div>
    </section>
</body>
<footer>
    <div id='footer_box'>
    <ul id='address'>
            <li>대전시 대덕구 법2동 1234 우:123-1234</li>
            <li>TEL:042-123-1234 문의사항 : email@naver.com</li>
            <li>COPYLEFT (C) Kang Gyu Jin ALL LEFTS RESERVED</li>
        </ul>
    </div>
</footer>
</html>