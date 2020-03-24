<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<head>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		
		<!-- Bootstrap core CSS -->
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="robots" content="NOINDEX, NOFOLLOW, NOARCHIVE, NOSNIPPET" />
		<meta name="description" content="" />
		<meta name="generator" content="" />
		<title>장바구니</title>
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/css-9bc8a.css"
			type="text/css" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/css-80c6b.css"
			type="text/css" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/css-6df77.css"
			type="text/css" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/css-8b9e3.css"
			type="text/css" />
		<link rel="stylesheet" type="text/css"
			href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
		<link rel="stylesheet"
			href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/resources/css/style1.css">
		
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/jquery-1.10.1.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/ajax-loading.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/jquery.number.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/jquery.cookie.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<!-- META FOR IOS & HANDHELD -->
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="HandheldFriendly" content="true" />
		<meta name="apple-mobile-web-app-capable" content="YES" />
		<!-- //META FOR IOS & HANDHELD -->
		
		<script type="text/javascript">
			function b_check(form) {
				var ck = document.getElementById('cart_check');
				if(ck.checked) {
					form.action="cart_buy.do";
					form.method = "post";
					form.submit();
				}
				else{
					alert("상품을 선택해주세요");
				}
			}
			function d_check(form) {
				var ck = document.getElementById('cart_check');
				if(ck.checked) {
					form.action="cart_del.do";
					form.method = "post";
					form.submit();
				}
				else{
					alert("상품을 선택해주세요");
				}
			}
		</script>
	</head>
	
	<body>
	<div class="t3-wrapper">
		<!-- HEADER -->
		<header id="t3-header" class="t3-header ">
			<div class="container">
				<div class="row">
					<!-- LOGO -->
					<div class="col-sm-2 logo" style="padding-top: 0;">
						<div class="logo-image" style="margin-top: 0">
							<a href="/main/main.html" title="다이렉트 게임즈"> <img
								class="logo-img" src="${pageContext.request.contextPath}/resources/images/common/dg_logo_new.png"
								alt="다이렉트 게임즈"> <span>다이렉트 게임즈</span>
							</a> <small class="site-slogan"></small>
						</div>
					</div>
					<!-- //LOGO -->
					

					<div class="col-sm-7 search" id="game_search"
						style="padding-top: 0px;">
						<form class="search_form" id="header-search" method="get"
							action="/game/game_search.html">
							<div class="form-group">
								<div class="input-group">
									<input type="text" id="searchValue" name="searchValue"
										class="form-control input-lg ui-autocomplete-input"
										placeholder="" autocomplete="off" required>
									<div class="input-group-btn">
										<button class="btn btn-lg btn-search"
											style="border-top: 1px solid rgba(255, 255, 255, 0.1); border-right: 1px solid rgba(255, 255, 255, 0.1); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>

					<div class="head-right col-sm-3" style="padding-top: 10px;">
						<div class="head-cart">
							<a href="/order/v2/cart.html" class="btn btn-cart" type="button"
								id="head-cart-dropdown" style="color: #ffffff"> <i
								class="fa fa-shopping-cart"></i>
							</a>
						</div>

						<div class="head-login">
							<a class="btn btn-default btn-sm" href="/member/logout.html">
								<i class="fa fa-unlock"></i> 로그아웃
							</a> <a class="btn btn-default btn-sm"
								href="/mypage/mypage_main.html"><i class="fa fa-user"></i>
								마이페이지</a>
						</div>
					</div>
				</div>
			</div>
		</header>
			<nav id="t3-mainnav" class="wrap navbar navbar-default t3-mainnav">
			<div class="container">
				<div class="t3-navbar navbar-collapse collapse">
					<div class="t3-megamenu animate elastic" data-duration="400"
						data-responsive="true">
						<ul itemscope="name"
							itemtype="http://www.schema.org/SiteNavigationElement"
							class="nav navbar-nav">
							<li itemprop="name" class="current active" data-id="101"
								data-level="1"><a itemprop="url" class=""
								href="product_list.do" data-target="#">홈 </a></li>
							<li itemprop="name" data-id="151" data-level="1"><a
								itemprop="url" class="" href="product_introduce.do"
								data-target="#">서비스소개</a></li>
							<li itemprop="name" class="mega" data-id="152" data-level="1"><a
								itemprop="url" class="" href="/game/game_thumb.html">게임</a></li>
							<li class="dropdown mega" data-id="156"><a
								class=" dropdown-toggle" href="/customer/notice.html"
								data-target="#" data-toggle="dropdown">고객지원<em class="caret"></em></a>
								<div class="nav-child dropdown-menu mega-dropdown-menu">
									<div class="mega-dropdown-inner">
										<div class="row">
											<div class="col-xs-12 mega-col-nav" data-width="12">
												<div class="mega-inner">
													<ul class="mega-nav level1">
														<li itemprop="name" data-id="202" data-level="1"><a
															itemprop="url" class="" href="/customer/notice.html"
															data-target="#">공지사항 </a></li>
														<li itemprop="name" data-id="204" data-level="1"><a
															itemprop="url" class="" href="/customer/faq.html"
															data-target="#">자주묻는질문 </a></li>
														<li data-id="205"><a class=""
															href="/customer/qna.html" data-target="#">문의하기 </a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div></li>
							<li itemprop="name" class="mega" data-id="301" data-level="1"><a
								itemprop="url" href="/event/event.html">이벤트</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li style="border: none; box-shadow: none"><button
									type="button" class="btn btn-default btn_facebook_link"
									style="background: #4e69a2; color: #ffffff; border: none; margin-top: 15px; margin-right: 15px">
									<i class="fa fa-facebook"
										style="background: #4e69a2; color: #ffffff"></i> 페이스북
								</button></li>
							<li style="border: none; box-shadow: none">
							<button
									type="button" class="btn btn-default btn_youtube_link"
									style="background: #ff0000; color: #ffffff; border: none; margin-top: 15px">
									<i class="fa fa-youtube-play"
										style="background: #ff0000; color: #ffffff"></i> 유튜브
							</button></li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
	<div class="container">
        <table class="table table-bordered table-condensed" id="user-table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">check</th>
				<th scope="col">이미지</th>
				<th scope="col">상품명</th>
				<th scope="col">상품 가격</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${!empty cart_list}">
		<form>
			<c:forEach var="cart" items="${cart_list}">
				<tr>
					<td>
						<input type="checkbox" id="cart_check" name="cart_check" value="${cart.c_idx}"/>
					</td>
					<td>
						<span class="cart-images">
							<img src="${cart.file_name}" width="144" height="81" style="width:144px;">
						</span>
					</td>
					<td>${cart.pro_name }</td>
					<td>${cart.pro_price}</td>
				</tr>
			</c:forEach>
				<input type="button" value="구매" name="buy" onclick="b_check(this.form);" />
				<input type="button" value="삭제" name="del" onclick="d_check(this.form);" />
			</form>
			<tr>
				<td colspan="2" ></td>
				<td>총계</td>
				<td>${total}원</td>
			</tr>
			<tr>
				<td colspan="2" ></td>
				<td>유저캐시</td>
				<td>${user_cash}원</td>
			</tr>
		</c:if>
			<!-- 데이터가 없는 경우 -->
			<c:if test="${empty cart_list}">
			<tr>
				<td align="center" colspan="11" width="100%" height="50">
					장바구니가 비었습니다
				</td>
			</tr>
			</c:if>
		</tbody>
	</table>
	${pageMenu}
	
	</div>
</body>
</html>