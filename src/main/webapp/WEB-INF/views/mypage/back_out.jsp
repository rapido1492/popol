<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty m_pwd_errer }">

	<script>
	
	alert("비밀번호가 잘못 되었습니다. 다시 확인 부탁드립니다.");
	
	</script>

</c:if>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	href="${pageContext.request.contextPath}/resources/css/css-e0771.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-fe7f1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/system.css">

<script type="text/javascript">
	function recheck(f) {
		var reason = f.reason.value;
		var m_pwd = f.m_pwd.value;
		f.action = "back_out.do";
		f.method = "post";
		f.submit();
	}
	
</script>

</head>
<body>

				<div id="t3-content" class="t3-content col-xs-12" style="padding-top:0px;">
					<div id="system-message-container"></div>
					<h1 style="font-size:30px">마이페이지</h1>
					<div id="Kunena" class="layout container-fluid">
						<div class="kblock" style="margin-top:20px">
							<div class="kcontainer">
								<div class="kbody">
									<div class="alert  alert-danger">
										<p>- 회원탈퇴시 해당 아이디로는 재가입을 하실 수 없습니다.</p>
										<p>- 또한 보유하고 계신 적립금이 모두 삭제되어 복구가 불가능하여, 탈퇴 후 재가입하셔도 적립금이 재발급 되지 않습니다.</p>
										<p>- 캐시를 보유하신 회원은 직접탈퇴가 불가능합니다. 고객센터를 통해서 캐시환불진행 후 탈퇴가 완료됩니다.</p>
									</div>
									<div class="login-wrap" style="width:100%">
										<div class="login ">
											<form class="form-horizontal" name="joinFrm" id="joinFrm">
												<input type="hidden" id="mode" name="mode"  value="leave">
												<fieldset style="border:0">
													<div class="form-group">
														<label for="m_id" class="col-sm-2 control-label"> <font color="black;">아이디</font></label>
														<div class="col-sm-10" id="m_email" name="m_email"> <font color="black;"> ${ vo.m_email } </font> </div>
													</div>

													<div class="form-group">
														<label for="m_pwd" class="col-sm-2 control-label"> <font color="black;">비밀번호</font></label>
														<div class="col-sm-6">
															<input type="password" class="form-control" id="m_pwd" name="m_pwd" required="required" style="background-color: black;">
														</div>
				
													</div>

													<div class="form-group">
														<label for="reason" class="col-sm-2 control-label"> <font color="black;">탈퇴사유</font></label>
														<div class="col-sm-6">
															<select name="reason" class="form-control" required>
																<option value="">:::탈퇴사유를 선택해 주세요:::</option>
																<option value="1">고객서비스 불만</option>
																<option value="2">교환/환불 불만</option>
																<option value="3">방문 빈도가 낮음</option>
																<option value="4">상품가격 불만</option>
																<option value="5">개인 정보유출 우려</option>
																<option value="6">쇼핑몰의 신뢰도 불만</option>
																<option value="7">쇼핑 기능 불만</option>
															</select>
														</div>
													</div>
													<div class="form-group form-actions" style="background:none">
														<div class="col-sm-12 text-center" >
															<button type="button" class="btn btn-danger" onclick="recheck(this.form);">회원탈퇴</button>
															<button type="button" class="btn btn-primary">취소하기</button>
														</div>
													</div>
												</fieldset>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

</body>
</html>