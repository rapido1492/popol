<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="//cdn.ckeditor.com/4.13.1/full/ckeditor.js"></script> -->
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	function send(form) {

		var notice_title = form.notice_title.value;
		var notice_category = form.notice_category.value;
		var notice_content = CKEDITOR.instances.notice_content.getData();

		alert(notice_title + notice_category);

		if (notice_content = "") {

			alert("텍스트가 작성되지 않았습니다.")

			return;

		}

		form.action = "notice_insert.do";
		form.method = "post";
		form.submit();

	}
</script>

<title>Insert title here</title>

</head>
<body>
	<!-- https://dlgkstjq623.tistory.com/288 스마트 에디터 사용법-->

	<form>
		<div style="width: 800px;">
			제목 :
			<textarea rows="1" cols="20" id="notice_title" name="notice_title"
				placeholder="제목을 입력해주세요."></textarea>
		</div>
		<div>
			<select name="notice_category" id="notice_category"
				class="form-control" style="background: none;">
				<option value="" style="background: #ffffff">:::선택:::</option>
				<option value="1" style="background: #ffffff">공지사항</option>
				<option value="2" style="background: #ffffff">긴급 공지사항</option>
			</select>
		</div>
		<div>
			<textarea id="notice_content" name="notice_content" rows="10"
				cols="40" placeholder="내용을 입력해주세요."></textarea>
		</div>
		<div>
			<button type="button" onclick="send(this.form)">등록</button>
			<button type="button" onclick="location.href='notice_page?page=1'">돌아가기</button>
		</div>
	</form>


	<script>
		// Replace the <textarea id="editor1"> with a CKEditor
		// instance, using default configuration.
		CKEDITOR.replace('notice_content', {
			filebrowserUploadUrl : 'imageupload.do'
		});
	</script>
</body>
</html>