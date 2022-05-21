<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
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
			%>
			<div class="navbar navbar-default">
				<div class="wrapping">
					<div class="logo">
						<a href="main.jsp"><img src="images/main_logo.png" width="94"
							height="32"></a>
					</div>
					<nav class="">
						<ul class="nav navbar-nav">
							<li class="active"><a href="main.jsp">메인</a></li>
							<li><a href="club.jsp">구단</a></li>
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
		<section id="image-slide">
			<div class="wrapping">
				<div class="container" style="width: 100%">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img src="images/1.jpg">
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
		<hr>
		<section class="bbs_preview">
			<div class="wrapping">
				<div class="pre-box">
					<h3>게시판</h3>
					<div>
						<ul>
							<%
							int size;
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getList(1);
							size = list.size() < 5 ? list.size() : 5;
							for (int i = 0; i < size; i++) {
							%>
							<li id="pre-left"><a
								href="http://localhost:8181/Ezen_Final_Project/view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
									<%=list.get(i).getBbsTitle()%></a></li>
							<li id="pre-right"><%=list.get(i).getBbsDate().substring(0, 11)%></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
				<div class="pre-box">
					<h3>공지사항</h3>
					<div>
						<ul>
							<%
							NoticeDAO notice = new NoticeDAO();
							ArrayList<Notice> nlist = notice.getList(1);
							size = nlist.size() < 5 ? nlist.size() : 5;
							for (int i = 0; i < size; i++) {
							%>
							<li id="pre-left"><a
								href="http://localhost:8181/Ezen_Final_Project/n_view.jsp?noticeID=<%=nlist.get(i).getNoticeID()%>">
									<%=nlist.get(i).getNoticeTitle()%></a></li>
							<li id="pre-right"><%=nlist.get(i).getNoticeDate().substring(0, 11)%></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section class="link_wrap">
			<div class="wrapping">
				<div class="kbo-club">
					<ul class="club-list">
						<li><a
							href="http://www.ktwiz.co.kr/sports/site/baseball/main.do"
							target="_blank"><img src="images/KT.png" alt="kt wiz"></a></li>
						<li><a href="http://www.doosanbears.com/" target="_blank"><img
								src="images/DS.png" alt="두산 베어스"></a></li>
						<li><a href="http://www.samsunglions.com/" target="_blank"><img
								src="images/SS.png" alt="삼성 라이온즈"></a></li>
						<li><a href="http://www.lgtwins.com/" target="_blank"><img
								src="images/LG.png" alt="LG 트윈스"></a></li>
						<li><a href="http://www.heroesbaseball.co.kr/index.do"
							target="_blank"><img src="images/KW.png" alt="키움 히어로즈"></a>
						</li>
					</ul>
				</div>
				<div class="kbo-club">
					<ul class="club-list">
						<li><a href="http://www.ssglanders.com/" target="_blank"><img
								src="images/SSG.png" alt="SSG 랜더스"></a></li>
						<li><a href="http://www.ncdinos.com/" target="_blank"><img
								src="images/NC.png" alt="NC 다이노스"></a></li>
						<li><a href="http://www.giantsclub.com/html/" target="_blank"><img
								src="images/LT.png" alt="롯데 자이언츠"></a></li>
						<li><a href="http://www.tigers.co.kr/" target="_blank"><img
								src="images/KIA.png" alt="KIA 타이거즈"></a></li>
						<li><a href="http://www.hanwhaeagles.co.kr/" target="_blank"><img
								src="images/HH.png" alt="한화 이글스"></a></li>
					</ul>
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