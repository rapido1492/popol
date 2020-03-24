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
</head>

<script type="text/javascript">

	function pwd_change(f) {
		
		m_email = f.m_email.value;
		m_pwd = f.m_pwd.value;
		m_pwd_re = f.m_pwd_re.value;
		
		if(m_pwd != m_pwd_re){
			
			alert("비밀번호가 같지 않습니다. 확인 부탁드립니다.");
			
			return;
			
		}
		
		f.action = "pwd_change.do";
		f.method = "post";
		f.submit();
	}

</script>

<body>
	<div id="t3-mainbody" class="wrap t3-mainbody">
		<div class="container">
			<div class="row">
				<!-- MAIN CONTENT -->
				<div id="t3-content" class="t3-content col-xs-12">
					<div id="system-message-container"></div>
					<div class="login-wrap">
						<div class="page-header">
							<h1><strong>비밀번호 찾기 - 비밀번호 재설정</strong></h1>
						</div>
						<div class="login ">
							<form class="form-horizontal" name="formReset" id="formReset">
							<input type="hidden" name="mode" id="mode" value="passwordReset" >
							<input type="hidden" name="m_email" value="${m_email }" >
							<fieldset>
								<div class="form-group">
									<div class="col-sm-12 control-label">
										<label id="username-lbl" for="m_pwd" class="required">비밀번호<span class="star">&nbsp;*</span></label>
									</div>
									<div class="col-sm-12">
										<input type="password" name="m_pwd" id="m_pwd" value="" class="required" size="51" required="" aria-required="true" autofocus="">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12 control-label">
										<label id="password-lbl" for="m_pwd_re" class="required">비밀번호 확인<span class="star">&nbsp;*</span></label>
									</div>
									<div class="col-sm-12">
										<input type="password" name="m_pwd_re" id="m_pwd_re" value="" class="required" size="51" maxlength="99" required="" aria-required="true">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-6 btn-wrap">
										<button type="button" class="btn btn-primary" onclick="pwd_change(this.form);">확 인</button>
									</div>
								</div>
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