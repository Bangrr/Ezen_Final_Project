<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="user.UserDAO"%>
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
			int bbsID = 0;
			if (request.getParameter("bbsID") != null) {
				bbsID = Integer.parseInt(request.getParameter("bbsID"));
			}
			if (bbsID == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href = 'bbs.jsp'");
				script.println("</script>");
			}
			Bbs bbs = new BbsDAO().getBbs(bbsID);
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
					<h3>게시판</h3>
					<ul>
						<li><a href="bbs.jsp">자유게시판</a></li>
					</ul>
				</aside>
				<div id="sub-content">
					<div class="row">
						<table class="table table-striped" id="viewtb"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="3"
										style="background-color: #eeeeee; text-align: center;">자유게시판
										글 보기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="width: 20%;">글제목</td>
									<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n",
		"<br>")%></td>
								</tr>
								<tr>
									<td>작성자</td>
									<td colspan="2"><%=bbs.getUserID()%></td>
								</tr>
								<tr>
									<td>작성일자</td>
									<td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시 "
		+ bbs.getBbsDate().substring(14, 16) + "분"%></td>
								</tr>
								<tr>
									<td>내용</td>
									<td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n",
		"<br>")%></td>
								</tr>
							</tbody>
						</table>
						<a href="bbs.jsp" class="btn btn-primary">목록</a>
						<%
						if (userID != null && userID.equals(bbs.getUserID())) {
						%>
						<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-warning">수정</a>
						<a href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-danger"
							onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</a>
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