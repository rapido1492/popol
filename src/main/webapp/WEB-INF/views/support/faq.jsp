<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.t3-content {
	padding-top: 20px;
}

table.kblocktable tr th {
	background: rgba(255, 255, 255, 0.05);
	border-color: rgba(255, 255, 255, 0.1);
	padding: 10px 8px;
	border: solid rgba(255, 255, 255, 0.1) 1px;
	text-align: center;
	font-weight: bold;
}

#Kunena div.kblock .kcontainer .kblocktable tr td {
	padding-top: 10px;
	padding-bottom: 10px;
}

#Kunena div.kblock .kcontainer .kblocktable tr td a {
	color: rgba(255, 255, 255, 0.5);
}
</style>
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
	href="${pageContext.request.contextPath}/resources/css/css-bc85a.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/css-e0771.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css">


<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" /></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/ajax-loading.js" /></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
</head>
<body>

	<div id="t3-mainbody" class="wrap t3-mainbody">
		<div class="container">
			<div class="row">
				<!-- MAIN CONTENT -->
				<div id="t3-content"
					class="t3-content col col-xs-12 col-sm-8 col-sm-push-4 col-md-9 col-md-push-3"
					style="padding-top: 20px; margin: 0; padding-bottom: 0">
					<div id="system-message-container"></div>
					<div id="Kunena" class="layout">
						<div id="ktop">
							<div id="ktopmenu">
								<div id="ktab">
									<ul class="menu">
										<c:if test="${ item_cd eq 0 }">
											<li class="item141 active"><a href=""><span>전체</span></a></li>
											<li class="item142 "><a href="faq.do?item_cd=1"><span>웹사이트
														및 계정</span></a></li>
											<li class="item143 "><a href="faq.do?item_cd=2"><span>결제가격
														및 프로모션</span></a></li>
										</c:if>
										<c:if test="${ item_cd eq 1 }">
											<li class="item141 "><a href="faq.do?item_cd=0"><span>전체</span></a></li>
											<li class="item142 active"><a href=""><span>웹사이트
														및 계정</span></a></li>
											<li class="item143 "><a href="faq.do?item_cd=2"><span>결제가격
														및 프로모션</span></a></li>
										</c:if>
										<c:if test="${ item_cd eq 2 }">
											<li class="item141 "><a href="faq.do?item_cd=0"><span>전체</span></a></li>
											<li class="item142 "><a href="faq.do?item_cd=1"><span>웹사이트
														및 계정</span></a></li>
											<li class="item143 active"><a href=""><span>결제가격
														및 프로모션</span></a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>

						<c:forEach var="vo" items="${ vo }">

							<div style="margin-bottom: 10px; background-color: black;">
								<div style="background: none;">
									<a style="color: #ffffff;"><strong
										class="gubun text-warning" style="color: #f0ad4e">Q.
											<c:if test="${vo.faq_category eq 1 }">
											[웹 사이트 및 계정]
											</c:if>
											<c:if test="${vo.faq_category eq 2 }">
											[결제 가격 및 프로모션]  
											</c:if>
											</strong> ${vo.faq_title}</a>
								</div>
								<div
									style="border-left: 1px solid rgba(255, 255, 255, 0.1); border-right: 1px solid rgba(255, 255, 255, 0.1); border-bottom: 1px solid rgba(255, 255, 255, 0.1)">
									<div>
										<div style="padding: 20px">
											<div>
												<p>${ vo.faq_content }</p>
											</div>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>
				<jsp:include page="supportMenubar.jsp" />
			</div>
		</div>
	</div>


</body>
</html>