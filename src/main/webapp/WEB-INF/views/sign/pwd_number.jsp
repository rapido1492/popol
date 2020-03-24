<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty number_check }">

	<script>
	
	alert("인증번호가 잘못 되었습니다. 다시 확인 부탁드립니다.");
	
	</script>

</c:if>
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
	
	<script type="text/javascript">
	
	function mailing(form) {
		m_email = form.m_email.value;
		id_res = form.id_res.value;
		
		alert(m_email + id_res);
		
		form.action = "pwd_change_number_issue.do";
		form.method = "post";
		form.submit();
	}
	
	function pwd_change(form){
		var m_email = form.m_email.value;
		var id_res = form.id_res.value;
		var number_issue = form.number_issue.value;
		var num_check = form.num_check.value;
		
		if(number_issue == ""){
			alert("인증번호를 받아주시기 바랍니다.");
			return;
		}
		
		if(num_check == ""){
			alert("인증 번호를 입력 부탁드립니다.");
			return;
		}
		
		if(number_issue != num_check){
			
			alert("인증번호를 잘못 입력하였습니다. 다시 입력 부탁드립니다.");
			return;
		}
		
		form.action = "pwd_change_form.do";
		form.method = "post";
		form.submit();
		
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
							<h1><strong>비밀번호 찾기 - 인증번호 받기</strong></h1>
						</div>
						<div class="login ">
							<form class="form-horizontal" name="formAuth" id="formAuth" >
<!-- 							<input type="hidden" name="mode" id="mode" value="authEmail" >
							<input type="hidden" name="authType" value="authEmail" > -->
							<input type="hidden" name="m_email" id="m_email" value="${ m_email }" >
							<input type="hidden" name="id_res" id="id_res" value="${id_res }" >
							<input type="hidden" name="number_issue" id="number_issue" value="${num}">
							<fieldset>
								<div class="form-group">
									<div class="col-sm-12 control-label">
										<label id="username-lbl" for="auth_code" class="required">인증번호<span class="star">&nbsp;*</span></label>
									</div>
									<div class="col-sm-8">
										<input type="text" name="num_check" id="num_check" class="required" size="30" required="" aria-required="true" autofocus="">
									</div>
									<div class="col-sm-4">
										<button type="button" class="btn btn-default" id="btn_auth" onclick="mailing(this.form);">인증번호 받기</button>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12 btn-wrap">
										<button type="button" class="btn btn-primary btn-lg btn-block" id="btn_auth_confirm" onclick="pwd_change(this.form);">확인</button>
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