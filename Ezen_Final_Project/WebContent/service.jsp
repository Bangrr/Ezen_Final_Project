<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
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
							<li><a href="notice.jsp">게시판</a></li>
							<li><a href="live.jsp">중계보기</a></li>
							<li class="active"><a href="service.jsp">고객센터</a></li>
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
		<section id="notice">
			<div class="wrapping">service.jsp test</div>
		</section>
		<!--  // container -->
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