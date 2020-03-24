<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty id_res }">

	<script>
	
	alert("아이디가 없습니다. 아이디를 정확하게 입력 부탁드립니다.");
	
	</script>

</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Insert title here</title>
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
							<h1><strong>비밀번호 찾기 - 본인확인</strong></h1>
						</div>
						<div class="login ">
							<form class="form-horizontal" name="findFrm" id="findFrm" method="post" action="pwdsearch_nickcheck.do">
							<fieldset>
								<div class="form-group">
									<div class="col-sm-12 control-label">
										<label id="username-lbl" for="m_email" class="required">이메일<span class="star">&nbsp;*</span></label>
									</div>
									<div class="col-sm-12">
										<input type="text" name="m_email" id="m_email" value="" class="required" size="51" required="" aria-required="true" autofocus="">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12 btn-wrap">
										<button type="submit" class="btn btn-primary btn-lg btn-block">확인</button>
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