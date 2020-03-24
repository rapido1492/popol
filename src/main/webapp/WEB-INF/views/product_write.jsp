'<%@page import="org.apache.taglibs.standard.tag.common.xml.ForEachTag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin: 0 auto;
}
</style>
<!-- jQeury문 최신본 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	function send_check(form) {
		if (form.pro_name.value.trim() == '') {
			alert("상품 이름을 입력해야 합니다.");
			form.pro_name.focus();
			return;
		}

		if (form.p_content.value.trim() == '') {
			alert("내용을 입력해야 합니다.");
			form.p_content.focus();
			return;
		}
		
/* 		var items = [];
		$('input:checkbox[type=checkbox]:checked').each(function () {
		    items.push($(this).val());
		});
		$.ajax({
				dataType:'json',
				url: "/product_insert.do",
			}).done(function(data) {

				var rawJsonData = JSON.parse(data);

				console.log(rawJsonData);

			}); */
		form.submit();
	}
</script>
</head>
<body>
	<form name="form" method="post" action="product_insert.do"
		enctype="multipart/form-data">
		<div class="container">
			<div class="form-group">
				<label for="pro_name">상품 이름</label> <input type="text"
					class="form-control" name="pro_name" placeholder="상품 이름을 입력하세요.">
			</div>
			<div class="form-group">
				<label for="pro_youtube">상품 소개 main영상</label> <input type="text"
					class="form-control" name="pro_youtube1"
					placeholder="상품 youtube 주소를 입력하세요">
			</div>
			<div class="form-group">
				<label for="pro_youtube">상품 소개 영상1</label> <input type="text"
					class="form-control" name="pro_youtube2"
					placeholder="상품 youtube 주소를 입력하세요">
			</div>
			<div class="form-group">
				<label for="pro_youtube">상품 소개 영상2</label> <input type="text"
					class="form-control" name="pro_youtube3"
					placeholder="상품 youtube 주소를 입력하세요">
			</div>
			<div class="form-group">
				<label for="pro_publisher_name">퍼블리셔</label> <select
					name="pro_publisher_name" id="pro_publisher_name"
					class="form-control">
					<option value="">::: 퍼블리셔 선택 :::</option>
					<c:forEach var="pub_list" items="${pub_list}">
						<option>${pub_list.pro_publisher_name}</option>
					</c:forEach>
				</select>
				<hr />
			</div>
			<div class="form-group">
				<label for="pro_category">장르</label> <select name="pro_category"
					id="pro_category" class="form-control">
					<option value="">::: 장르 선택 :::</option>
					<option value="Action">액션</option>
					<option value="Adventure">어드벤쳐</option>
					<option value="RacingAndSprots">레이싱/스포츠</option>
					<option value="RPG">롤플레잉</option>
					<option value="Shooting">슈팅/FPS</option>
					<option value="Puzzle">퍼즐</option>
					<option value="Simulation">시뮬레이션</option>
					<option value="Other">기타</option>
					<option value="Strategy">전략</option>
					<option value="ActionANDRpg">액션/RPG</option>
					<option value="ActionANDAdventure">액션/어드벤쳐</option>
					<option value="Sports">스포츠</option>
					<option value="ShootingANDActionANDRpg">슈팅/액션/RPG</option>
					<option value="ActionANDSimulation">액션/시뮬레이션</option>
					<option value="StrategyANDSimulation">전략/시뮬레이션</option>
				</select>
			</div>
			<div class="form-group">
				<label for="pro_category">플랫폼</label> 
				<select name="platform" id="platform" class="form-control">
					<option value="">::: 플랫폼 선택 :::</option>
					<option value="steam">steam</option>
					<option value="uplay">uplay</option>
					<option value="epicgames">epicgames</option>
				</select>
				<hr />
			</div>
			<div class="form-group">
				<label for="pro_category">개발사</label> 
				<input type="text" name="developer" id="developer" />
			</div>
			<div class="form-group">
				<label for="language">지원 언어</label>
    				<input type="checkbox" name="language" value="kor">
    				<input type="checkbox" name="language" value="eng">
   		 			<input type="checkbox" name="language" value="other">
				<hr />
			</div>
			<div class="form-group">
				<label for="p_content">내용</label>
				<textarea class="form-control" name="p_content" id="p_content"
					rows="3"></textarea>
			</div>
			<div class="form-group">
				<label for="pro_price">가격</label>
				<textarea class="form-control" name="pro_price" id="pro_price"
					rows="3"></textarea>
				<div class="form-group">
					<input id="product_photo" type="file" name="product_photo" />
				</div>		
			</div>
			<button type="button" class="btn btn-primary"
				onclick="send_check(this.form);">작성</button>
			<button type="button" class="btn btn-danger"
				onclick="location.href='product_list.do'">취소</button>
		</div>
	</form>
</body>
</html>