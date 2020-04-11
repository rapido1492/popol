
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<html lang="ko" dir="ltr"
	class="com_users view-login no-touch itemid-101 j35">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="generator" content="">
<title>게임</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-80c6b.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-6df77.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-3119e.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-e0771.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-8b9e3.css"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style1.css">
<link href="https://directg.net/game/game_thumb.html" rel="canonical" />

<style type="text/css">
div.product {
	padding: 0 13px;
}

.pagination {
	display: inline-block;
}

.pagination>.disabled>span {
	background: rgba(255, 255, 255, 0.1);
}

.pagination>li>a {
	padding: 4px 8px;
}

.add_emoney_text {
	position: absolute;
	z-index: 20;
	right: 0;
	top: 0;
}

.add_emoney_text span {
	display: inline-block;
	float: left;
	overflow: hidden;
	width: 66px;
	height: 20px;
	margin: 0;
	padding: 0px;
	color: #ffffff;
	background: #d9534f;
	font-weight: bold;
	filter: alpha(opacity = 90); /* IE 5-7 */
	-moz-opacity: 0.90; /* Netscape */
	-khtml-opacity: 0.90; /* Safari 1.x */
	opacity: 0.90; /* Good browsers */

	/*빨간색:#d9534f , 노란색:#f0ad4e*/
}

.ui-widget-content {
	background: #141D29;
	color: #ffffff;
	border-color: rgba(255, 255, 255, 0.2);
	border-width: 1px;
}

.ui-widget-header {
	border: none;
	border-bottom: 1px solid rgba(255, 255, 255, 0.2);
	background: none;
	color: #ffffff;
	font-weight: bold;
	font-size: 14px;
}

.ui-button-text {
	font-weight: bold;
}

.ui-dialog .ui-dialog-buttonpane .ui-dialog-buttonset {
	float: left;
	margin-left: 50px;
}

.browse-view .row .product .spacer .vm-product-media-container {
	margin-bottom: 5px;
}

.browse-view .row .product .spacer {
	padding: 15px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ajax-loading.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>	
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="HandheldFriendly" content="true">
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
							<a href="product_list.do" title="다이렉트 게임즈"> <img
								class="logo-img"
								src="${pageContext.request.contextPath}/resources/images/common/dg_logo_new.png"
								alt="다이렉트 게임즈"> <span>다이렉트 게임즈</span>
							</a> <small class="site-slogan"></small>
						</div>
					</div>
					<!-- //LOGO -->

					<div class="col-sm-7 search" id="game_search"
						style="padding-top: 0px;">
						<form class="search_form" id="header-search" method="get"
							action="product_search.do">
							<div class="form-group">
								<div class="input-group">
									<input type="text" id="searchValue" name="searchValue"
										class="form-control input-lg ui-autocomplete-input"
										placeholder="" autocomplete="off" required>
									<div class="input-group-btn">
										<button class="btn btn-lg btn-search"
											style="border-top: 1px solid rgba(255, 255, 255, 0.1); border-right: 1px solid rgba(255, 255, 255, 0.1); border-bottom: 1px solid rgba(255, 255, 255, 0.1);" 
											onclick="location.href='product_search.do'">
											검색
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>

					<div class="head-right col-sm-3" style="padding-top: 10px;">
						<div class="head-cart">
							<a href="product_cartList.do" class="btn btn-cart" type="button"
								id="head-cart-dropdown" style="color: #ffffff"> <i
								class="fa fa-shopping-cart"></i>
							</a>
						</div>

						<div class="head-login">
							<a class="btn btn-default btn-sm"
								href="login_form.do">로그인</a> <a
								class="btn btn-default btn-sm"
								href="signup_form.do">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- //HEADER -->
		<!-- MAIN NAVIGATION -->
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
								itemprop="url" class="" href="product_list.do">게임</a></li>
							<li class="dropdown mega" data-id="156"><a
								class=" dropdown-toggle"
								data-target="#" data-toggle="dropdown">고객지원<em class="caret"></em></a>
								<div class="nav-child dropdown-menu mega-dropdown-menu">
									<div class="mega-dropdown-inner">
										<div class="row">
											<div class="col-xs-12 mega-col-nav" data-width="12">
												<div class="mega-inner">
													<ul class="mega-nav level1">
														<li itemprop="name" data-id="202" data-level="1"><a
															itemprop="url" class="" href="notice_list.do"
															data-target="#">공지사항 </a></li>
														<li itemprop="name" data-id="204" data-level="1"><a
															itemprop="url" class="" href="faq.do"
															data-target="#">자주묻는질문 </a></li>
														<li data-id="205"><a class=""
															href="qna.do" data-target="#">문의하기 </a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li itemprop="name" class="mega" data-id="301" data-level="1"><a
								itemprop="url" href="#">이벤트</a>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right"
							itemtype="http://schema.org/Organization" itemscope="">
							<li style="border: none; box-shadow: none"><button
									type="button" class="btn btn-default btn_facebook_link"
									style="background: #4e69a2; color: #ffffff; border: none; margin-top: 15px; margin-right: 15px">
									<i class="fa fa-facebook"
										style="background: #4e69a2; color: #ffffff"></i> 페이스북
								</button></li>
							<li style="border: none; box-shadow: none"><button
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
		<!-- //MAIN NAVIGATION -->
		<script type="text/javascript">
$(function(){
	$(".btn_facebook_link").bind("click",function(){
		var newWindow = window.open("about:blank");
		newWindow.location.href = 'https://www.facebook.com/h2inter/';
	});
	$(".btn_youtube_link").bind("click",function(){
		var newWindow = window.open("about:blank");
		newWindow.location.href = 'https://www.youtube.com/user/H2Interactive';
	});
});
</script>

		<div id="t3-mainbody" class="wrap t3-mainbody one-sidebar-left"
			style="margin-top: 20px;">
			<div class="container">
				<div class="row equal-height">
					<!-- MAIN CONTENT -->
					<div id="t3-content"
						class="t3-content col col-xs-12 col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
						<div id="system-message-container"></div>
						<div class="category-view">
							<div class="gridlist-view">
								<div class="gridlist">
									<a href="#" id="list" class="btn btn-default"><i
										class="fa fa-th-list"></i></a> <a href="game_thumb.html" id="grid"
										class="btn btn-primary"><i class="fa fa-th icon-white"></i></a>
								</div>
								<div class="browse-view">
									<h1 style="border-top: 1px solid rgba(255, 255, 255, 0.1);">
										<strong>&nbsp;</strong>
									</h1>
									<c:forEach var="svo" items="${product_list}">
									<div class="browse-view-inner" itemscope
										itemtype="https://schema.org/BreadcrumbList">
										<div class="row equal-height equal-height-child">
											<div class="product vm-col vm-col-3 vertical-separator col"
												child-height="370">
												<div class="spacer" style="min-height: 370px;">
												
													<div class="vm-product-media-container">
														<a href="product_view.do?product_idx=${svo.product_idx}" class="num">
															${svo.pro_name}
															<img src="${svo.file_name}" class="browseProductImage" width="255" height="119"/>
														</a>
															<c:if test="${svo.file_name ne 'no_file'}">
															<img
															src="${svo.file_name }"
															alt="${svo.pro_name}" class="browseProductImage"
															width="255" height="119" />
															</c:if>
													</div>


													<div class="vm-product-descr-container-1"
														itemprop="itemListElement" itemscope
														itemtype="https://schema.org/ListItem">
														<a href=""
															title="${svo.pro_name}" itemprop="item"
															style="color: #ffffff">
															<h2 style="font-size: 14px; height: 44px; overflow: hidden; letter-spacing: -1px;"
																itemprop="name">
																<img
																	src="http://directg.diskn.com/images/icon/steam.gif"
																	style="margin: 0; padding: 0" /> ${svo.pro_name}
																<meta itemprop="position" content="1" />
															</h2>
														</a>
														<div class="vm3pr-customfields-product">
															<div style="margin-bottom: 4px;">
																<span class="label label-light"
																	style="background: rgba(255, 255, 255, 0.1); font-size: 11px; padding-top: 4px; padding-bottom: 4px; color: #ffffff;">전략</span>
																														
																<span class="label label-default"
																	style="background: rgba(255, 255, 255, 0.1); font-size: 11px; padding-top: 2px; padding-bottom: 2px; color: #ffffff;">한국어</span>
															</div>
															<div>
																<span class="label label-light"
																	style="background: rgba(255, 255, 255, 0.1); font-size: 11px; padding-top: 2px; padding-bottom: 2px; color: #ffffff;">SEGA</span>
															</div>

														</div>
													</div>

													<div class="vm3pr-2">
														<div class="product-price salesprice" id="productPrice3"
															style="line-height: 18px;">
															<div class="PricebasePrice vm-display vm-price-value">
																<span class="vm-price-desc">정상가: </span> <span
																	class="PricebasePrice" style="font-weight: normal"><span
																	style="font-family: dotum">\</span> ${svo.pro_price }</span>
															</div>
															<span class="price-crossed"></span>
															<div class="PricesalesPrice vm-display vm-price-value">
																<span class="vm-price-desc">판매가: </span> <span
																	class="PricesalesPrice"
																	style="color: #ffffff !important"><span
																	style="font-family: dotum">\</span> ${svo.pro_price }</span>
															</div>
														</div>
														<div class="clear"></div>
													</div>

													<div class="vm3pr-0">
														<div class="addtocart-area">
															<div class="vm-customfields-wrap"></div>
															<div class="addtocart-bar">
																<div class="pull-left">
																	<div style="margin-top: 10px;">
																		<span class="label label-danger"
																			style="font-size: 14px; font-family: tahoma; vertical-align: bottom; color: #ffffff; padding-top: 8px; padding-bottom: 8px;">${svo.sale_rate }</span>
																	</div>
																</div>
																<div class="pull-right">
																<a href="product_add.do?product_idx=${svo.product_idx}" class="num">
																	<button>장바구니 담기</button>
																</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='horizontal-separator'></div>
										<div class='row equal-height equal-height-child'></div>
									</div>
									</c:forEach>
								</div>
								<div class="clear"></div>
							</div>
						</div>
						<div class="vm-pagination" style="clear: both; float: center;">
							<div style="width: 800px; height: 38px; margin: 0 auto">
								<ul class="pagination">
									
								</ul>
							</div>
						</div>
					</div>
					<!-- //MAIN CONTENT -->

					<div
						class="t3-sidebar t3-sidebar-left col col-md-3 col-md-pull-9  hidden-xs">
						<form id="searchFrm" name="searchFrm" method="get"
							action="/game/game_thumb.html">
							<input type="hidden" name="searchValue" value=""> 
							<input type="hidden" name="search_keyword" value="">
							<div class="t3-module module">
								<div class="module-inner">
									<h3 class="module-title ">
										<span>검색 옵션</span>
									</h3>
									<div class="module-ct">
										<div class="vm-order-list">
											<div class="orderlistcontainer">
												<div class="title" style="text-align: left">정렬순</div>
												<div class="" style="text-align: center">
													<select name="sort" id="sort" class="form-control"
														style="text-align: center">
														<option value="">::: 정렬순 선택 :::</option>
														<option value="opendate">출시일순</option>
														<option value="priceup">높은가격순</option>
														<option value="pricedown">낮은가격순</option>
														<!--<option value="salepercent" >할인율순</option>-->
													</select>
												</div>
											</div>

											<div class="orderlistcontainer">
												<div class="title" style="text-align: left">장르</div>
												<div class="">
													<select name="search_category" id="search_category"
														class="form-control">
														<option value="">::: 장르 선택 :::</option>
														<option value="2">액션</option>
														<option value="3">어드벤쳐</option>
														<option value="4">레이싱/스포츠</option>
														<option value="5">롤플레잉</option>
														<option value="6">슈팅/FPS</option>
														<option value="7">퍼즐</option>
														<option value="8">시뮬레이션</option>
														<option value="9">기타</option>
														<option value="10">전략</option>
														<option value="11">액션/RPG</option>
														<option value="12">액션/어드벤쳐</option>
														<option value="13">스포츠</option>
														<option value="14">슈팅/액션/RPG</option>
														<option value="15">액션/시뮬레이션</option>
														<option value="16">전략/시뮬레이션</option>
													</select>
												</div>
											</div>

											<div class="orderlistcontainer">
												<div class="title" style="text-align: left">플랫폼</div>
												<div class="">
													<select name="search_platform" id="search_platform"
														class="form-control">
														<option value="">::: 플랫폼 선택 :::</option>
														<option value="33">Bethesda</option>
														<option value="34">Epic</option>
														<option value="35">Rockstar Games Launcher</option>
														<option value="27">Rockstar Warehouse</option>
														<option value="1">Steam</option>
														<option value="30">Uplay</option>
														<option value="32">기타</option>
													</select>
												</div>
											</div>

											<div class="orderlistcontainer">
												<div class="title" style="text-align: left">퍼블리셔</div>
												<div class="">
													<select name="search_publisher" id="search_publisher"
														class="form-control">
														<option value="">::: 퍼블리셔 선택 :::</option>
														<c:forEach var="pub_list" items="${pub_list}">
															<option>${pub_list.pro_publisher_name}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="orderlistcontainer">
												<div class="title" style="text-align: left">언어</div>
												<div class="">
													<select name="search_language" id="search_language"
														class="form-control">
														<option value="">::: 언어 선택 :::</option>
														<option value="kor">한국어</option>
														<option value="eng">영어</option>
														<option value="other">기타</option>
													</select>
												</div>
											</div>

											<div class="clear"></div>

											<button class="btn btn-block btn-info">검색하기</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<footer id="t3-footer" class="wrap t3-footer"
		style="height: 120px; padding-top: 0; padding-bottom: 0;">
		<div class="container" style="padding-top: 0; padding-bottom: 0">
			<div class="navbar-footer">
				<ul class="nav nav-pills" style="margin-top: 10px;">
					<li><a href="http://h2interactive.co.kr/about/about01.php"
						target="_blank">회사소개</a></li>
					<li><a href="/service/agreement.html">이용약관</a></li>
					<li><strong><a href="/service/private.html"><strong>개인정보처리방침</strong></a></strong></li>
					<li><a
						href="https://www.ftc.go.kr/bizCommPop.do?wrkr_no=2068635756&apv_perm_no="
						target="_blank">사업자정보확인</a></li>
					<li><a href="/service/youthpolicy.html">청소년보호정책</a></li>
					<!--<li><a href="../service/guide.html">이용안내</a></li>
				<li><a href="../service/sitemap.html">사이트맵</a></li>-->
				</ul>
			</div>
			<address style="padding-top: 8px; padding-bottom: 0">
				<p style="margin-bottom: 0;">
					DIRECT GAMES <span class="bars">|</span> 소재지 : 서울시 강서구 강서로 56가길 35
					에이치투 아이앤티 빌딩 (주)에이치투 인터렉티브 <span class="bars">|</span> 대표이사 : 허준하 <span
						class="bars">|</span> 개인정보관리책임자 : 김지훈
				</p>
				<p style="margin-bottom: 0;">
					사업자등록번호 : 206-86-35756 <span class="bars">|</span> 통신판매업신고 :
					2013-서울강서-0758 <span class="bars">|</span> 고객센터 : 1544-2367 <span
						class="bars">|</span> 전자우편 : directg@h2interactive.co.kr | 호스팅 제공자
					: 카페24(주)
				</p>
			</address>
		</div>

		<section class="t3-copyright"
			style="padding-top: 0px; padding-bottom: 0; margin-top: -8px">
			<div class="container" style="padding-top: 0; padding-bottom: 0">
				<div class="row">
					<div class="col-md-12 copyright">
						<small>Copyright © DIRECT GAMES. All Rights Reserved. </small>
					</div>
				</div>
			</div>
		</section>
	</footer>
	<!-- <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-44849781-2', 'auto');
  ga('send', 'pageview');

</script>
	//FOOTER

	리포트2.0 로그분석코드 시작
	<script type="text/javascript">
var JsHost = (("https:" == document.location.protocol) ? "https://" : "http://");
var uname = escape("다이렉트게임즈");
document.write(unescape("%3Cscript id='log_script' src='" + JsHost + "h2intershop.weblog.cafe24.com/weblog.js?uid=h2intershop&uname="+uname+"' type='text/javascript'%3E%3C/script%3E"));
</script>
	리포트2.0  로그분석코드 완료
	</div>
	<div class="modal" id="cart_popup" title="장바구니">
		<p>
			<span class="ui-icon ui-icon-alert"
				style="float: left; margin: 12px 12px 20px 0;"></span>
		<div id="alert_msg"></div>
		</p>
	</div>
	<script id="vm.hover_js" type="text/javascript">//<![CDATA[ 
jQuery(document).ready(function () {
	jQuery('.orderlistcontainer').hover(
		function() { jQuery(this).find('.orderlist').stop().show()},
		function() { jQuery(this).find('.orderlist').stop().hide()}
	)
}); //]]>
</script> -->

</body>
</html>
