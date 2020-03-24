
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="${pageContext.request.contextPath}/resources/css/css-696c8.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-bc85a.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-80c6b.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-6df77.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-3119e.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-e0771.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" /></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/ajax-loading.js" /></script>


</head>
<body>

	<div id="t3-mainbody" class="wrap t3-mainbody">
		<div class="container">
			<div class="row">
				<!-- MAIN CONTENT -->
				<div id="t3-content"
					class="t3-content col col-xs-12 col-sm-8 col-sm-push-4 col-md-9 col-md-push-3"
					style="padding-top: 20px">
					<div id="system-message-container"></div>
					<!--[if lte IE 7]>
					<link rel="stylesheet" href="/components/com_kunena/template/ja_playstore/css/kunena.forum.ie7.css" type="text/css" />
					<![endif]-->
					<div class="blog-featured" itemscope
						itemtype="http://schema.org/Blog">
						<div class="items-leading">
							<div class="leading leading-0" itemprop="blogPost" itemscope
								itemtype="http://schema.org/BlogPosting">
								<!-- Article -->
								<article class="default">
									<div class="item-content">
										<header class="article-header clearfix">
											<h2 class="article-title" itemprop="headline">${noticeVO.notice_title }</h2>
										</header>

										<!-- Aside -->
										<aside class="article-aside clearfix">
											<dl class="article-info  muted">
												<dd class="createdby hasTooltip" itemprop="author" title=""
													data-original-title="Written by ">
													<i class="fa fa-user"></i> <span itemprop="name">작성자 : ${noticeVO.m_nick }</span>
													</span>
												</dd>
												<dd class="category-name hasTooltip" title=""
													data-original-title=" ${noticeVO.notice_title } ">
													<i class="fa fa-folder-open"></i> <span itemprop="genre">
														<c:if test="${noticeVO.notice_category eq 1 }">
													공지사항
													</c:if> <c:if test="${noticeVO.notice_category eq 2 }">
													긴급 공지사항
													</c:if>
													</span>
												</dd>
												<dd class="published hasTooltip" title=""
													data-original-title="Published: ">
													<i class="fa fa-calendar"></i>
													<time datetime="${noticeVO.notice_date }"
														itemprop="datePublished">작성일 :
														${noticeVO.notice_date } </time>
												</dd>
												<dd class="hits">
													<i class="fa fa-eye"></i>
													<meta itemprop="interactionCount"
														content="UserPageVisits:624">
													조회수 : ${noticeVO.notice_view }
												</dd>
											</dl>
										</aside>
										<!-- //Aside -->

										<section class="article-intro clearfix" itemprop="articleBody">
											<div style="clear: both">${noticeVO.notice_content }</div>
										</section>

										<section class="readmore text-right">
											<a class="btn btn-primary" href="notice_list.do?page=${page}"><span>목록</span></a>
										</section>
									</div>
								</article>
								<!-- //Article -->
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="supportMenubar.jsp" />
			</div>
		</div>
	</div>
</body>
</html>