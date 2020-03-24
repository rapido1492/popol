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
		  src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>

<script type="text/javascript">
	function send(form) {
		id_chk = form.id_chk.value;
		nickname_chk = form.nickname_chk.value;
		m_privateApprovalFl = form.m_privateApprovalFl.checked;
		m_agreementInfoFl = form.m_agreementInfoFl.checked;
		m_email = form.m_id.value + "@" + form.email2.value;
		m_pwd = form.m_pwd.value;
		m_pwd_re = form.m_pwd_re.value;
		m_nick = form.m_nick.value;
		m_mailling = form.m_mailling.checked;

		alert(id_chk + nickname_chk);
		
		form.action = "signup_insert.do";
		form.submit();
	}
	function emailcheck() {
		var m_id = document.getElementById("m_id").value;
		var email2 = document.getElementById("email2").value;
/* 		if (m_email == "") {
			alert("E-mail이 입력되지 않았습니다. 입력 부탁드립니다.");
			return;
		}
		if (test_email.test(m_email) == false) {
			alert("E-mail이 비 정상적으로 입력 되었습니다.");
			return;
		} */
		var url = "email_search.do";
		var param = "m_email=" + m_id + "@" + email2;
		sendRequest(url, param, resultFn, "get");
	}//emailcheck
	
	function nickcheck() {
		var m_nick = document.getElementById("m_nick").value;
/*  		if (m_nick == "") {
			alert("E-mail이 입력되지 않았습니다. 입력 부탁드립니다.");
			return;
		}
		if (test_email.test(m_email) == false) {
			alert("E-mail이 비 정상적으로 입력 되었습니다.");
			return;
		}  */
		var url = "nick_search.do";
		var param = "m_nick=" + m_nick;
		sendRequest(url, param, resultFn2, "get");
	}//emailcheck
	
	function resultFn(){
 		if( xhr.readyState == 4 && xhr.status == 200 ){
			var data = xhr.responseText;
			if( data == "yes"){
				alert("해당 e-mail이 있습니다. 다른 e-mail을 사용 부탁드립니다.");
				return;
			}
			alert("해당 email은 사용 가능 합니다.");
			document.getElementById("id_chk").value = document.getElementById("m_id").value + document.getElementById("email2").value; 
		}
	}//resultFn()
	
		function resultFn2(){
 		if( xhr.readyState == 4 && xhr.status == 200 ){
	 		var data = xhr.responseText;
			if( data == "yes"){
				alert("해당 닉네임이 있습니다. 다른 닉네임을 사용 부탁드립니다.");
				return;
			}
			alert("해당 닉네임은 사용 가능 합니다.");
			document.getElementById("nickname_chk").value = document.getElementById("m_nick").value;
		}
	}//resultFn()
</script>

</head>
<body>
	<div id="t3-mainbody" class="wrap t3-mainbody">
		<div class="container">
			<div class="row">
				<!-- MAIN CONTENT -->
				<div id="t3-content" class="t3-content col-xs-12"
					style="padding-top: 0">
					<form class="form-horizontal" name="joinFrm" id="joinFrm">
						<!-- 서버에서 id(e_mail)체크를 했는지 확인하는 히든 항목 -->
						<input type="hidden" id="id_chk" name="id_chk" value="">
						<!-- 서버에서 닉네임체크를 했는지 확인하는 히든 항목 -->
						<input type="hidden" id="nickname_chk" name="nickname_chk"
							value="">
						<div id="system-message-container"></div>

						<h1 style="font-size: 30px">회원가입</h1>

						<div class="docs-section">
							<div class="page-header">
								<h1>개인정보 수집 및 이용 (필수)</h1>
							</div>
							<div class="well">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th class="text-center">목적</th>
											<th class="text-center">항목</th>
											<th class="text-center">보유기간</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>이용자 식별, 서비스 이용 및 문의상담</td>
											<td>아이디(이메일), 비밀번호, 닉네임, 성명, 생년월일</td>
											<td>회원탈퇴 후 5일까지</td>
										</tr>
									</tbody>
								</table>
								<div class="checkbox">
									<label for="privateApprovalFl" class="control-label"><input
										type="checkbox" value="Y" id="m_privateApprovalFl"
										name="m_privateApprovalFl" required="반드시 입력해주세요.">개인정보
										수집 및 이용에 동의합니다.</label>
								</div>
							</div>
							<p class="text-danger">
								<strong>※ 서비스 제공을 위해서 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스를
									이용하실 수 있습니다.</strong>
							</p>
						</div>

						<div class="docs-section">
							<div class="well">
								<textarea id="agreement" class="form-control" rows="15"
									readonly="readonly">제1조(목적)

								약관 란
								</textarea>

								<div class="checkbox">
									<label for="agreementInfoFl" class="control-label"><input
										type="checkbox" value="Y" id="m_agreementInfoFl"
										name="m_agreementInfoFl" required="반드시 입력해주세요.">이용약관에
										동의합니다.</label>
								</div>
							</div>
						</div>

						<div class="registration" style="width: 100%">
							<fieldset>
								<legend>
									<span>회원가입</span>
								</legend>
								<div class="form-inline form-group">
									<label for="m_id" class="col-sm-2 control-label">아이디</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="m_id" name="m_id"
											placeholder="아이디를 입력하세요" required="" style="width: 170px;">

										<span style="color: #A4A4A4">@</span> <input type="text"
											class="form-control" id="email2" name="email2"
											required="반드시 입력해주세요." style="width: 150px;">

										<!-- 									<select name="email3" id="email3" class="form-control inputbox" style="">
										<option value="" selected="">선택</option>
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="empal.com">empal.com</option>
										<option value="korea.com">korea.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="direct">직접입력</option>
									</select> -->
										<button type="button" class="btn btn-default" id="btn_id_chk"
											onclick="emailcheck();">중복확인</button>
									</div>
								</div>

								<div class="form-group">
									<label for="m_pwd" class="col-sm-2 control-label">비밀번호</label>
									<div class="col-sm-4">
										<input type="password" class="form-control" id="m_pwd"
											name="m_pwd" placeholder="비밀번호를 입력하세요"
											aria-describedby="passwordHelpBlock" required="반드시 입력해주세요.">
									</div>
									<span id="passwordHelpBlock" class="text-muted text-left">영문소문자,
										숫자, 특수문자를 포함하여 8자이상 16이하로 사용이 가능합니다.<br />(@는 포함하실수 없습니다.)
									</span>
								</div>

								<div class="form-group">
									<label for="m_pwd_re" class="col-sm-2 control-label">비밀번호확인</label>
									<div class="col-sm-4 ">
										<input type="password" class="form-control" id="m_pwd_re"
											name="m_pwd_re" placeholder="비밀번호확인을 입력하세요"
											aria-describedby="passwordReHelpBlock" required="반드시 입력해주세요.">
									</div>
									<span id="passwordReHelpBlock" class="help-block text-left"></span>
								</div>

								<div class="form-inline form-group">
									<label for="nickname" class="col-sm-2 control-label">닉네임</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="m_nick"
											name="m_nick" placeholder="닉네임을 입력하세요"
											aria-describedby="nicknameReHelpBlock" maxlength="10"
											required="반드시 입력해주세요." style="width: 200px;">
										<button type="button" class="btn btn-default"
											id="btn_nickname_chk" onclick="nickcheck();">중복확인</button>

									</div>
									<span id="passwordReHelpBlock" class="text-muted text-left">닉네임은
										최대 10자까지 가능합니다.</span>
								</div>

								<div class="form-group">
									<label for="mailling" class="col-sm-2 control-label">이메일
										수신</label>
									<div class="col-sm-10">
										<div class="checkbox">
											<label for="mailling" class="control-label"><input
												type="checkbox" value="Y" id="m_mailling" name="m_mailling">정보/이벤트
												메일 수신에 동의합니다</label>
										</div>
										<div style="letter-spacing: -1;" class="text-danger">
											※ <span>주문 관련 정보, 주요 공지사항 및 이벤트 당첨 안내 등은 수신 동의 여부에
												관계없이 자동 발송됩니다.</span>
										</div>
									</div>
								</div>
							</fieldset>
							<div class="form-group form-actions">
								<div class="col-sm-12 text-center">
									<button type="button" class="btn btn-primary validate"
										onclick="send(this.form);">회원가입</button>
									<a class="btn btn-default cancel" href="https://directg.net/"
										title="Cancel">취소하기</a>
								</div>
							</div>

						</div>
					</form>
				</div>
				<!-- //MAIN CONTENT -->
			</div>
		</div>
	</div>

</body>
</html>