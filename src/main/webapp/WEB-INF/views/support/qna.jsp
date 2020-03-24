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
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js" /></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" /></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/ajax-loading.js" /></script>
<script type="text/javascript">

function send(f) {
	
	var qna_category = f.qna_category.value;
	var qna_title = f.qna_title.value;
	var qna_content = f.qna_content.value;
	var photo1 = f.photo1.value;
	var photo2 = f.photo2.value;
	var photo3 = f.photo3.value;
	
	alert(qna_category + "/" +  qna_title  + "/" + qna_content  + "/" + photo1  + "/" + photo2  + "/" + photo3);
	
	f.action = "qna_insert.do";
	f.submit();
	
}

</script>


</head>
<body>

	<div id="t3-mainbody" class="wrap t3-mainbody">
		<div class="container">
			<div class="row">
				<!-- MAIN CONTENT -->
				<div id="t3-content"
					class="t3-content col col-xs-12 col-sm-8 col-sm-push-4 col-md-9 col-md-push-3"
					style="padding-top: 0px; margin: 0; padding-bottom: 0">
					<div id="system-message-container"></div>
					<div class="docs-section">
						<div class="page-header">
							<h1>
								<strong>문의하기</strong>
							</h1>
						</div>

						<div class="row">
							<form enctype="multipart/form-data" class="form-horizontal" method="post">
								<fieldset>

									<div class="form-group">
										<label for="gubun" class="col-md-2 control-label">구분</label>
										<div class="col-md-5">
											<select name="qna_category" id="qna_category" class="form-control" required
												style="background: none;">
												<option value="" style="background: #ffffff">:::선택:::</option>
												<option value="1" style="background: #ffffff">상품문의</option>
												<option value="2" style="background: #ffffff">주문 및
													결제문의</option>
												<option value="4" style="background: #ffffff">주문취소
													및 환불</option>
												<option value="3" style="background: #ffffff">기타문의</option>
											</select>
										</div>
									</div>

									<div class="form-group">
										<label for="subject" class="col-md-2 control-label">제목</label>
										<div class="col-md-9">
											<input type="text" class="form-control" id="qna_title"
												name="qna_title" style="width: 600px"
												data-validation-required-message="제목을 입력하세요." required>
											<p class="help-block"></p>
										</div>
									</div>
									<div class="form-group">
										<label for="content" class="col-md-2 control-label">내용</label>
										<div class="col-md-9">
											<textarea rows="10" cols="100" class="form-control"
												id="qna_content" name="qna_content" required
												data-validation-required-message="내용을 입력하세요."
												maxlength="999" style="resize: none" required></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="upload_file" class="col-md-2 control-label">첨부파일1</label>
										<div class="col-md-9">
											<input type="file" class="form-control" id="photo1"
												name="photo1">
											<p class="help-block">첨부파일은 최대 2MB입니다. (사용가능 파일 형식 - jpg
												/ gif / png )</p>
										</div>
									</div>
									<div class="form-group">
										<label for="upload_file" class="col-md-2 control-label">첨부파일2</label>
										<div class="col-md-9">
											<input type="file" class="form-control" id="photo2"
												name="photo2">
											<p class="help-block">첨부파일은 최대 2MB입니다. (사용가능 파일 형식 - jpg
												/ gif / png )</p>
										</div>
									</div>
									<div class="form-group">
										<label for="upload_file" class="col-md-2 control-label">첨부파일3</label>
										<div class="col-md-9">
											<input type="file" class="form-control" id="photo3"
												name="photo3">
											<p class="help-block">첨부파일은 최대 2MB입니다. (사용가능 파일 형식 - jpg
												/ gif / png )</p>
										</div>
									</div>

									<div class="form-group">
										<div class="col-md-offset-1">
											<strong class="text-danger">※ 문의 답변은 마이페이지 > 문의내역에서
												확인할 수 있습니다.</strong>
										</div>
									</div>

									<div class="form-group">
										<div class="text-center">
											<button type="button" class="btn btn-primary "
												id="btn_register" onclick="send(this.form);">확 인</button>
											<button type="button" class="btn btn-default "
												id="btn_cancel">취 소</button>
										</div>
									</div>
								</fieldset>
							</form>
						</div>

					</div>
				</div>
			<jsp:include page="supportMenubar.jsp"/>
			</div>
		</div>
	</div>

</body>
</html>