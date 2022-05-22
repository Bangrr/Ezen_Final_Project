<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<li><a href="notice.jsp">고객센터</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="login.jsp">로그인</a></li>
							<li class="active"><a href="join.jsp">회원가입</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<!--  // header -->
		<!--  container -->
		<div class="container">
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top: 20px;">
					<form method="post" action="joinAction.jsp">
						<h3 style="text-align: center;">회원가입 화면</h3>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="아이디"
								name="userID" maxlength="20">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="비밀번호"
								name="userPassword" maxlength="20">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="이름"
								name="userName" maxlength="20">
						</div>
						<div class="form-group" style="text-align: center;">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary active"> <input
									type="radio" name="userGender" autocomplete="off" value="남자"
									checked>남자
								</label> <label class="btn btn-primary"> <input type="radio"
									name="userGender" autocomplete="off" value="여자" checked>여자
								</label>
							</div>
						</div>
						<div class="form-group">
							<input type="email" class="form-control" placeholder="이메일"
								name="userEmail" maxlength="50">
						</div>
						<input type="submit" class="btn btn-primary form-control"
							value="회원가입">
					</form>
				</div>
			</div>
		</div>
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
