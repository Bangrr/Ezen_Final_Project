<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html style="height: 100%">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Base to Base</title>
</head>
<body>
	<!--  wrap -->
	<div id="wrap">
		<!--  header -->
		<header>
			<%
			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			int pageNumber = 1; // 기본 1페이지
			if (request.getParameter("pageNumber") != null) {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
			%>
			<div class="navbar navbar-default">
				<div class="wrapping">
					<div class="logo">
						<a href="main.jsp"><img src="images/main_logo.png" width="94"
							height="32"></a>
					</div>
					<nav class="">
						<ul class="nav navbar-nav">
							<li><a href="main.jsp">메인</a></li>
							<li><a href="club.jsp">구단</a></li>
							<li class="active"><a href="bbs.jsp">게시판</a></li>
							<li><a href="live.jsp">중계보기</a></li>
							<li><a href="notice.jsp">고객센터</a></li>
						</ul>
						<%
						if (userID == null) {
						%>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
						<%
						} else {
						%>
						<ul class="nav navbar-nav navbar-right">
							<li><a>닉네임 혹은 정보수정</a></li>
							<li><a href="logoutAction.jsp">로그아웃</a></li>
						</ul>
						<%
						}
						%>
					</nav>
				</div>
			</div>
		</header>
		<!--  // header -->
		<!--  container -->
		<section id="contents">
			<div class="wrapping">
				<aside>
					<h3>게시판</h3>
					<ul>
						<li><a href="bbs.jsp">자유게시판</a></li>
					</ul>
				</aside>
				<div id="sub-content">
					<h2>자유게시판</h2>
					<div class="row">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th style="background-color: #eeeeee; text-align: center;">번호</th>
									<th
										style="background-color: #eeeeee; text-align: center; white-space: pre-wrap;">제목</th>
									<th style="background-color: #eeeeee; text-align: center;">작성자</th>
									<th style="background-color: #eeeeee; text-align: center;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<%
								BbsDAO bbsDAO = new BbsDAO();
								ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
								for (int i = 0; i < list.size(); i++) {
								%>
								<tr>
									<td><%=list.get(i).getBbsID()%></td>
									<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
		.replaceAll("\n", "<br>")%></a></td>
									<td><%=list.get(i).getUserID()%></td>
									<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시 "
		+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
						<%
						if (pageNumber != 1) {
						%>
						<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
							class="btn btn-success">이전</a>
						<%
						}
						if (bbsDAO.nextPage(pageNumber + 1)) {
						%>
						<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
							class="btn btn-success">다음</a>
						<%
						}
						%>
						<%
						if (userID != null) {
						%>
						<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</section>
		<!--  // container -->
		<hr>
		<!--  footer -->
		<div class="footer">
			<div class="wrapping">bottom test</div>
		</div>
		<!--  // footer -->
	</div>
	<!--  // wrap -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>