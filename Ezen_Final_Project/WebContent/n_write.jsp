<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
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
					<div class="row">
						<form method="post" action="n_writeAction.jsp">
							<table class="table table-striped"
								style="text-align: center; border: 1px solid #dddddd">
								<thead>
									<tr>
										<th colspan="2"
											style="background-color: #eeeeee; text-align: center;">공지사항
											글쓰기 양식</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" class="form-control"
											placeholder="글 제목" name="noticeTitle" maxlength="50"></td>
									</tr>
									<tr>
										<td><textarea class="form-control" placeholder="글 내용"
												name="noticeContent" maxlength="2048" style="height: 350px;"></textarea></td>
									</tr>
								</tbody>
							</table>
							<input type="submit" class="btn btn-primary pull-right"
								value="글쓰기">
						</form>
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