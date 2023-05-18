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
        #main_contents {
        color: white;
	    width: 1000px;
        margin-left: 300px;
	    float: center;
	    margin-top: 25px;
    }
        #main_contents h3 {
	    font-size: 22px;
	    padding-bottom: 8px;
	    border-bottom: solid 1px #cccccc;
        }
        table.table2{
                border-collapse: separate;
                border-spacing: 1px;
                text-align: left;
                line-height: 1.5;
                border-top: 1px solid #ccc;
                margin : 20px 10px;
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
        #contact{
            margin-right: 250px;
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
        <img src='img/logo.png' width='180' height='160'>
        </a>
    </div>
    <h1 id="title"><a href="Main.html">콜 오브 듀티 모던워페어 포럼</a></h1>
    <div id='top_menu'>
		<a href="login.jsp">로그인</a> | <a href=SignUp.html>회원가입</a>
    </div>
</header>
<nav id=menus>
    <ul id='main_menu'>
        <li><a href="Notice.html">공지사항</a></li>
        <li><a href="Information.html">게임 정보</a></li>
        <li><a href="Community.html">커뮤니티</a></li>
        <li><a href="Inquiry.html">문의하기</a></li>
    </ul>
</nav>
<aside>
</aside>
<body bgcolor='#020715'>
    <section>
        <nav id=sub_menus>
            <ul id='sub_main_menu'>
                <h3>게시판 바로가기</h3>
                <li><a href="Main.html">레시피 게시판</a></li>
                <li>리뷰 게시판</li>
            </ul>
        </nav>
        <div id='main_contents'>
            <h3>글 쓰기</h3>
            <form method="post" action="WritingAction.jsp" id="writing">
            <table  style="padding-top: 1px" align = left width=1000 border=0 cellpadding=2 >
                <table class = "table2">
                        <tr>
                            <td>게시판 선택</td>
                            <td>
                                <select name = 'bbstype' class="form-control">
                                    <option value="recipe">레시피게시판</option>
                                    <option value="review">리뷰게시판</option>
                                </select>
                            </td>
                            </tr>

                        <tr>
                        <td>제목</td>
                        <td><input type = "text" class="form-control" name = "bbstitle" id = "bbstitle" size=60></td>
                        </tr>
 
                        <tr>
                        <td>내용</td>
                        <td><textarea class="form-control" name = "bbscontent" cols=85 rows=15></textarea></td>
                        </tr>
 
                        <tr>
                        <td>비밀번호</td>
                        <td><input type = "password" class="form-control" name = "bbspassword" size=10 maxlength=10></td>
                        </tr>
                        <tr>
                            <td>사진 첨부</td>
                            <td><input type = file class="form-control" name = file size=10 maxlength=10></td>
                            </tr>
                        </table>
                </td>
                </tr>
        
        <center>
        	<input type="submit" class="btn btn-primary form-control" value="확인">
            </center>
            </table>
        </form>
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