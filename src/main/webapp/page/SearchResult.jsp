<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="BBSService.BBSrecipereview"%>
<%@ page import="BBSService.BBSrecipereviewDAO"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList"%>
<%
 
    request.setCharacterEncoding("UTF-8");
 
%>
<jsp:useBean id="search" class="BBSService.Search" scope="page" />
<jsp:setProperty name="search" property="foodtype" />
<jsp:setProperty name="search" property="searchField" />
<jsp:setProperty name="search" property="searchText" />
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
      #textwrite {
      margin-right: 100px;
        float: right;
        }
      #NextPage {
      margin-left: 100px;
        float: left;
        }
      #FormerPage {
      margin-left: 50px;
        float: left;
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
    
    if(userid != null && userid.equals("admin")){
    %>
    <a href="ManagePage/Managepage.jsp">홈페이지 관리</a> |
    <%
    }
    %>
    <%
    if(userid != null){
    %>
    <a href="Mypage/mypage.jsp">마이페이지</a> | <a href="SignOut.jsp">로그아웃</a>
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
        <a href="index.jsp">
          <img src="img/logotodayfood.png" width="180" height="160" />
        </a>
      </div>
      <h1 id="title"><a href="index.jsp">오늘 뭐 먹지?</a></h1>
    </div>
  </header>
  <body>
  <%
	String SearchText = "";
	if (search.getSearchText() != null){
		SearchText = search.getSearchText();
   }
	if (request.getParameter("SearchText") != null) {
		SearchText = request.getParameter("SearchText");
	}
	String SearchType = "";
	if (search.getSearchField() != null){
		SearchType = search.getSearchField();
   }
	if (request.getParameter("SearchType") != null) {
		SearchType = request.getParameter("SearchType");
	}
	
	String foodtype = "%%";
	if (search.getFoodtype() != null){
		foodtype = search.getFoodtype();
   }
	if (request.getParameter("foodtype") != null) {
		foodtype = request.getParameter("foodtype");
	}
  %>
    <section class="main">
      <div class="header">
        <a href="Mainpage/TodayFood.jsp"><h3 class="main__header">&#x1F44D오늘의 메뉴</h3></a>
        <a href="Mainpage/Recentlyposts.jsp"><h3 class="main__header">&#x1F550 최신 글</h3></a>
        <a href="Mainpage/RecipeBBS.jsp"><h3 class="main__header">&#x1F4D6 레시피 게시판</h3></a>
        <a href="Search.jsp"><h3 class="main__header">&#x1F50E검색하기</h3></a>
      </div>
      <div style= "margin-bottom: 10px">
      <form method="post" name="search" action="SearchResult.jsp">
      <td>음식 분류</td>
      <td>
      <select name="foodtype">
      <option value="%%">음식선택</option>
      <option value="koreanfood">한식</option>
      <option value="westernfood">양식</option>
      <option value="chinafood">중식</option>
      <option value="japanfood">일식</option>
      <option value="simplefood">간단식</option>
      <option value="dietfood">다이어트식</option>
      <option value="dessert">디저트</option>
      <option value="%%">전체</option>
      </select>
      </td>
				<table class="pull-right"  style= "margin:auto; float:center;">
					<tr>
						<td><select class="form-control" name="searchField">
								<option value="bbsTitle">제목</option>
								<option value="userName">작성자</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="" name="searchText" maxlength="100" value="<%=SearchText %>"></td>
						<td><button type="submit" class="btn btn-success button_style">검색</button></td>
					</tr>

				</table>
			</form>
      </div>
      <div class="grid_container">
		<%
      int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
      	BBSrecipereviewDAO BBSrecipereviewDAO = new BBSrecipereviewDAO();
		ArrayList<BBSrecipereview> list = BBSrecipereviewDAO.getSearchList(pageNumber, foodtype, SearchType, SearchText);
      for(int i = 0; i < list.size(); i++){
      %>
        <div class="grid-item">
          <a href="view.jsp?bbsID=<%= list.get(i).getBBSrecipereviewID() %>">
            <div class="item-img">
              <img
                src=../bbsUpload/<%=list.get(i).getBBSrecipereviewID()%><%=list.get(i).getUserID()%><%=list.get(i).getBbstitle().replaceAll(" ", "")%>게시글의사진.jpg
                alt=""
              />
              <div class="item-title">
                <strong><%= list.get(i).getBbstitle() %></strong>
                <div class="item_etc">
                  <p><span><%= list.get(i).getBbsdate().substring(0,4) %></span>년 <span><%= list.get(i).getBbsdate().substring(5,7) %></span>월<span> <%= list.get(i).getBbsdate().substring(8,10) %></span>일</p>
                   · 댓글 <span> <%= list.get(i).getBBSComentcount() %></span>개 · 조회수: <span> <%= list.get(i).getBbscount() %></span>
                </div>
              </div>
            </div>
            <div class="item-footer">
              <strong>작성자: <%= list.get(i).getUserName() %></strong>
              <p>♥ <span><%= list.get(i).getBbslikeamount() %></span></p>
            </div>
          </a>
        </div>
            <%
      		}
            %>
      </div>
    </section>
    	<%
		if (pageNumber != 1) {
		%>
		<input type="button" id="FormerPage" class="button_style" onclick="location.href='SearchResult.jsp?pageNumber=<%=pageNumber - 1%>&foodtype=<%=foodtype%>&SearchText=<%=SearchText%>&SearchType=<%=SearchType%>'" name="btn1" value="이전">
		<%
		}
    	if (BBSrecipereviewDAO.nextPage(pageNumber + 1, search.getFoodtype())) {
		%>
		<input type="button" id="NextPage" class="button_style" onclick="location.href='SearchResult.jsp?pageNumber=<%=pageNumber + 1%>&foodtype=<%=foodtype%>&SearchText=<%=SearchText%>&SearchType=<%=SearchType%>' " name="btn1" value="다음">
		<%
		}
		%>
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
