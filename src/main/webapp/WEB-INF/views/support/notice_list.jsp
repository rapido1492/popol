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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/ajax-loading.js" /></script>
<link rel="stylesheet" type="text/css"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<body>

	<div id="t3-mainbody" class="wrap t3-mainbody">
		<div class="container">
			<div class="row">
				<div id="t3-content"
					class="t3-content col col-xs-12 col-sm-8 col-sm-push-4 col-md-9 col-md-push-3"
					style="padding-top: 20px; margin: 0; padding-bottom: 0">
					<div id="system-message-container"></div>
					<div id="Kunena" class="layout">
						<div class="kblock">
							<div class="kheader" style="border: none; height: 0; padding: 0;"></div>
							<div class="kcontainer">
								<div class="kbody">
									<table class="kblocktable">
										<tbody>
											<tr
												style="height: 40px; line-height: 40px; background-color: black;">
												<th class="frst">번호</th>
												<th>구분</th>
												<th>제목</th>
												<th>작성일</th>
												<th>조회</th>
											</tr>

											<c:forEach var="notice_list" items="${ notice_list }">
												<tr class="krow2" style="background-color: black;">
													<td class="kcol-first"
														style="text-align: center; width: 80px">${notice_list.notice_idx }</td>
													<td class="kcol-mid"
														style="text-align: center; width: 80px">${notice_list.notice_category }</td>
													<td class="kcol-mid" style="width: 480px"><a
														href="notice.do?notice_idx=${ notice_list.notice_idx }&page=${page}">${notice_list.notice_title }</a></td>
													<td class="kcol-mid"
														style="text-align: center; width: 120px">${notice_list.notice_date }</td>
													<td class="kcol-mid"
														style="text-align: center; width: 60px">${notice_list.notice_view }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="kblock">
							<div class="kcontainer">
								<div class="text-right">
									<form action="notice_search.do" id="jumpto" name="jumpto">
										<fieldset class="fieldset" style="background-color: black;">
										
										<c:if test="${ empty searchValue  }">
											<input id="searchValue" type="text" class="ks input" name="searchValue" size="30" value="">
										</c:if>
										
										<c:if test="${ not empty searchValue  }">
											<input id="searchValue" type="text" class="ks input" name="searchValue" size="30" value="${ searchValue }">
										</c:if>
												
											<select id="searchType" name="searchType" class="ks" style="background-color: white;">
												<option value="notice_title">제목</option>
												<option value="notice_content">내용</option>
												<option value="notice_all">제목+내용</option>
											</select> <input type="submit" class="kbutton ks" value="검색">

										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>

					<div class="text-center">
						<div style="width: 600px; margin: 0 auto">
							<nav>
								<ul class="pagination">

									<c:if test="${ pageinfo.prev eq false }">
										<li class="disabled"><a href='#'>◀</a></li>
									</c:if>
									<c:if test="${ pageinfo.prev eq true }">
										<li><a
											href='notice_list.do?page=${ pageinfo.startPage - 1}'>◀</a></li>
									</c:if>

									<c:forEach var="pageinfo" begin="${pageinfo.startPage }"
										end="${pageinfo.endPage}" step="1">

										<c:if test="${ pageinfo eq page }">
											<li class='active'><a href='#'>${pageinfo }</a></li>
										</c:if>
										<c:if test="${pageinfo ne page }">
											<li><a href="notice_list.do?page=${pageinfo }">
													${pageinfo } </a></li>
										</c:if>
									</c:forEach>

									<c:if test="${ pageinfo.next eq false }">
										<li class="disabled"><a href='#'>▶</a></li>
									</c:if>

									<c:if test="${ pageinfo.next eq true }">
										<li><a
											href='notice_list.do?page=${ pageinfo.endPage + 1}'>▶</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<jsp:include page="supportMenubar.jsp" />
			</div>
		</div>
	</div>

</body>
</html>