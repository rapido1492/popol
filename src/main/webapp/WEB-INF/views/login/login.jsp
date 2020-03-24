<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/system.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-3119e.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-696c8.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-6df77.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-80c6b.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-bc85a.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-e0771.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function send(f) {

		m_id = f.m_id.value;

		m_pwd = f.m_pwd.value;

		alert(m_id + m_pwd);

		if (m_id == "") {
			alert("E-mail을 입력해주세요.");
			return;
		}
		if (m_pwd == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		f.action = "login.do";
		f.method = "post";
		f.submit();

	}
</script>

</head>
<body>
	<div id="t3-mainbody" class="wrap t3-mainbody">
		<div class="container">
			<div class="row">
				<!-- MAIN CONTENT -->
				<div id="t3-content" class="t3-content col-xs-12">
					<div id="system-message-container"></div>
					<div class="login-wrap">
						<div class="page-header">
							<h1>
								<strong><font color="#fff">로그인</font></strong>
							</h1>
							<c:if test="${ not empty loginerrer }">
								<br><strong><font color="red"> ${ loginerrer }</font></strong>
							</c:if>
						</div>
						<div class="login">
							<form id="loginFrm" method="post" class="form-horizontal">
								<fieldset>
									<div class="form-group">
										<div class="col-sm-12 control-label">
											<label id="username-lbl" for="m_id" class="required">아이디(이메일)<span
												class="star">&nbsp;*</span></label>
										</div>
										<div class="col-sm-12">
											<input type="text" name="m_id" id="m_id" value=""
												class="required" size="51" required="" aria-required="true"
												autofocus="">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-12 control-label">
											<label id="password-lbl" for="password" class="required">비밀번호<span
												class="star">&nbsp;*</span></label>
										</div>
										<div class="col-sm-12">
											<input type="password" name="m_pwd" id="password" value=""
												class="required" size="50" maxlength="99" required=""
												aria-required="true">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-6 btn-wrap">
											<button type="button" class="btn btn-primary"
												onclick="send(this.form);">로그인</button>
										</div>
									</div>

									<div class="other-links form-group">
										<div class="col-sm-12">
											<ul>
												<li><a href="pwd_search_form.do">비밀번호 찾기</a></li>
												<li><a href="signup_form.do">회원가입</a></li>
											</ul>
										</div>
									</div>
									<input type="hidden" name="return_url" value="">
								</fieldset>
							</form>
						</div>
					</div>
				</div>
				<!-- //MAIN CONTENT -->
			</div>
		</div>
	</div>

</body>
</html>