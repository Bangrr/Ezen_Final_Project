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
							<li class="active"><a href="club_location.jsp">구단</a></li>
							<li><a href="bbs.jsp">게시판</a></li>
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
					<h3>구단</h3>
					<ul>
						<li><a href="club_location.jsp">구단위치</a></li>
					</ul>
				</aside>
				<div id="sub-content">
					<h2>구단위치</h2>
					<div id="map"></div>
					<div id="btn-box">
						<button type="button" class="btn btn-light" onclick="goMap()">크게보기</button>
						<button type="button" class="btn btn-light" onclick="goTo()">길찾기</button>
					</div>
					<div id="club-icon">
						<ul>
							<li><a onclick="KeySearch('수원kt위즈파크')"><img
									src="images/KT.png" alt="kt wiz"></a></li>
							<li><a onclick="KeySearch('잠실야구장')"><img
									src="images/DS.png" alt="두산 베어스"></a></li>
							<li><a onclick="KeySearch('대구삼성라이온즈파크')"><img
									src="images/SS.png" alt="삼성 라이온즈"></a></li>
							<li><a onclick="KeySearch('잠실야구장')"><img
									src="images/LG.png" alt="LG 트윈스"></a></li>
							<li><a onclick="KeySearch('고척스카이돔')"><img
									src="images/KW.png" alt="키움 히어로즈"></a></li>
							<li><a onclick="KeySearch('인천ssg랜더스필드')"><img
									src="images/SSG.png" alt="SSG 랜더스"></a></li>
							<li><a onclick="KeySearch('창원nc파크')"><img
									src="images/NC.png" alt="NC 다이노스"></a></li>
							<li><a onclick="KeySearch('사직야구장')"><img
									src="images/LT.png" alt="롯데 자이언츠"></a></li>
							<li><a onclick="KeySearch('광주기아챔피언스필드')"><img
									src="images/KIA.png" alt="KIA 타이거즈"></a></li>
							<li><a onclick="KeySearch('한화생명이글스파크')"><img
									src="images/HH.png" alt="한화 이글스"></a></li>
						</ul>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fc556d2a73630da767b48bbd729053e0&libraries=services"></script>
	<script type="text/javascript" src="js/search.js"></script>
</body>
</html>