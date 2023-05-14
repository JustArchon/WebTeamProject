<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>���� �� ����?</title>
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
        tr, td{
            color: white;
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
        #logo {
	    float: left;
        margin-left: 10px;
        }
        #main_contents {
        color: white;
	    width: 700px;
        margin-left: 500px;
	    float: center;
	    margin-top: 25px;
    }
    #main_contents h3 {
	    font-size: 22px;
	    padding-bottom: 8px;
	    border-bottom: solid 1px #cccccc;
        }
        #main_contents p {
	    margin-top: 30px;
	    line-height: 180%;
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
    <h1 id="title">���� �� ����?</h1>
</header>
<aside>
</aside>
<body bgcolor='#020715'>
    <section>
        <div id='main_contents'>
            <h3>ȸ������</h3>
        <left>
            <form method="post" action="SignUpAction.jsp" id="signup">
                <table width="800">
                </table>    
                <table width="700" height="600" cellpadding="0" style="border-collapse:collapse; font-size:9pt;">
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">ȸ�� ID</td>
                        <td>
                        <input type="text" class="form-control" name="userID" />&nbsp;<input type="button" name="IDcheck" value="ID �ߺ�Ȯ��" /></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">��й�ȣ</td>
                        <td><input type="password" class="form-control" name="userPassword" id="pw" onchange="isSame()" /></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">�� ��</td>
                        <td><input type="text" class="form-control" name="userName" /></td>
                        </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">�����ϴ� ����</td>
                        <td><input type="text" class="form-control" name="Favoritefood" /></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">���</td>
                        <td><input type="text" class="form-control" name="Hobbies" /></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">�� ��</td>
                        <td>
                            �� ��<input type="radio" class="form-control" name="userGender" value="1" checked />&nbsp;�� ��<input type="radio" name="wUserGender" value="2"/>
                        </td>
                    </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">�̸���</td>
                        <td><input class="form-control" type="email" name="userEmail" /></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3"><hr /></td>
                    </tr>
         
                </table>
                <br />
                <table>
                    <tr height="40">
                        <td><input type="submit" class="btn btn-primary form-control" value="ȸ������">&nbsp;<input type="button" id="textwrite" onclick="location.href='Main.html' " name="btn1" value="���"></td>
                    </tr>
                </table>
            </form>
        </left>
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