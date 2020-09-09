<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<head>
<meta charset="utf-8">

<title>꼬르륵</title>
</head>
<body>
	<%@include file="/WEB-INF/views/includes/publicView/aside.jsp" %>

	<div id="fh5co-main">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<form name="form1" method="post" action="${contextPath}/main">
						<div class="input-group">
							<!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
						
							<input class="form-control" id="system-search" name="keyword" value="${mmap.keyword }"
								placeholder="Search for" required> <span
								class="input-group-btn">
								<button type="submit" class="btn btn-default">Search</button>
							</span>
						</div>
					</form>
				</div>
				<div class="col-md-9">
					<table class="table table-list-search">
						<thead>
							<tr>
								<th>메세지코드</th>
								<th>유저코드</th>
								<th>유저아이디</th>
								<th>송신날짜</th>
							</tr>
						</thead>
							<c:forEach items="${mmap.list}" var="ms">
								<tr>
									<td>${ms.ms_code}</td>
									<td>${ms.ms_mmcode}</td>
									<td>
										<a href="${contextPath}/message/msView?ms_code=${ms.ms_code}&curPage=${mmap.msPager.curPage}&searchOption=${mmap.searchOption}&keyword=${mmap.keyword}">${ms.ms_mmid}
											<c:if test="${ms.recnt > 0}">
												<span style="color: orange;">(${ms.recnt})</span>
											</c:if>
										</a>
									</td>
									<td><fmt:formatDate value="${ms.ms_date}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5">
									<c:if test="${mmap.msPager.curBlock > 1}">
										<a href="javascript:mlist('1')">[처음]</a>
									</c:if>
									<c:if test="${mmap.msPager.curBlock > 1}">
										<a href="javascript:mlist('${mmap.msPager.prevPage}')">[이전]</a>
									</c:if>
									<c:forEach var="num" begin="${mmap.msPager.blockBegin}" end="${mmap.msPager.blockEnd}">
										<c:choose>
											<c:when test="${num == mmap.msPager.curPage}">
												<span style="color: blue">${num}</span>&nbsp;
											</c:when>
											<c:otherwise>
												<a href="javascript:mlist('${num}')">${num}</a>&nbsp;
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:if test="${mmap.msPager.curBlock <= mmap.msPager.totBlock}">
										<a href="javascript:mlist('${mmap.msPager.nextPage}')">[다음]</a>
									</c:if>
									<c:if test="${mmap.msPager.curPage <= mmap.msPager.totPage}">
										<a href="javascript:mlist('${mmap.msPager.totPage}')">[끝]</a>
									</c:if> 
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<button type="button" class="optionbtn" id="btnQna">공지사항</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

