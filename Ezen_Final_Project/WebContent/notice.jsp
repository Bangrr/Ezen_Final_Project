<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="notice.NoticeDAO"%>
<%@ page import="notice.Notice"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
			UserDAO user = new UserDAO();
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
							<li><a href="club_location.jsp">구단</a></li>
							<li><a href="bbs.jsp">게시판</a></li>
							<li><a href="live.jsp">중계보기</a></li>
							<li class="active"><a href="notice.jsp">고객센터</a></li>
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
							<li><a href=""><%=user.getName(userID)%></a></li>
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
					<h3>고객센터</h3>
					<ul>
						<li><a href="notice.jsp">공지사항</a></li>
					</ul>
				</aside>
				<div id="sub-content">
					<h2>공지사항</h2>
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
								NoticeDAO noticeDAO = new NoticeDAO();
								ArrayList<Notice> list = noticeDAO.getList(pageNumber);
								for (int i = 0; i < list.size(); i++) {
								%>
								<tr>
									<td><%=list.get(i).getNoticeID()%></td>
									<td><a
										href="n_view.jsp?noticeID=<%=list.get(i).getNoticeID()%>"><%=list.get(i).getNoticeTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
		.replaceAll("\n", "<br>")%></a></td>
									<td><%=list.get(i).getUserID()%></td>
									<td><%=list.get(i).getNoticeDate().substring(0, 11) + list.get(i).getNoticeDate().substring(11, 13) + "시 "
		+ list.get(i).getNoticeDate().substring(14, 16) + "분"%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
						<%
						if (pageNumber != 1) {
						%>
						<a href="notice.jsp?pageNumber=<%=pageNumber - 1%>"
							class="btn btn-success">이전</a>
						<%
						}
						if (noticeDAO.nextPage(pageNumber + 1)) {
						%>
						<a href="notice.jsp?pageNumber=<%=pageNumber + 1%>"
							class="btn btn-success">다음</a>
						<%
						}
						%>
						<%
						if (userID != null && userID.equals("admin")) {
						%>
						<a href="n_write.jsp" class="btn btn-primary pull-right">글쓰기</a>
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
		<footer>
			<div class="wrapping">
				<div>
					<h1>
						<img src="images/b_logo.png" width="42" height="58">
					</h1>
					<div>
						<ul>
							<li>베이토스 Batose</li>
							<li>경기 남양주시 별내0로 00번길 00-00</li>
							<li>TEL. (031) 012 - 6789</li>
						</ul>
					</div>
				</div>
				<div id="copyright">Copyright&copy; 2022 Batose. All rights
					Reserved.</div>
			</div>
		</footer>
		<!--  // footer -->
	</div>
	<!--  // wrap -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>