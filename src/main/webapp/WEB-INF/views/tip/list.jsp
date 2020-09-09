<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/aside.jsp" %>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<title>꼬르륵</title>

<script>
	$(document).on('click', '#btnWriteForm', function(e) {

		e.preventDefault();

		location.href = "${contextPath}/tip/boardWrite";
	});

	function fn_contentView(t_code) {

		var url = "${contextPath }/tip/getTipBoardContent";
		url = url + "?t_code=" + t_code;
		location.href = url;
	};

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {

		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${contextPath}/tip/getTipBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {

		var url = "${contextPath}/tip/getTipBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${contextPath}/Tip/getTipBoardList";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}
</script>

</head>
<body>
	<div id="fh5co-main">
		<div class="container">
			<div class="row">
			<div class="col-sm-3 col-sm-offset-0">
					<h2>팁 게시판</h2>
			</div>
				<div class="col-md-3">
					<form action="#" method="get">
						<div class="input-group">
							<!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
							<input class="form-control" id="system-search" name="name"
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
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성날짜</th>
								<th>좋아요</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty boardList }">
									<tr>
										<td colspan="5" align="center">데이터가 없습니다.</td>
									</tr>
								</c:when>
								<c:when test="${!empty boardList}">
									<c:forEach var="list" items="${boardList }">
										<tr>
											<td><c:out value="${list.t_code}" /></td>
											<td><a href="#"
												onClick="fn_contentView('<c:out value="${list.t_code }"/>')">
													<c:out value="${list.t_title}" /> [${list.t_cnt}] 
											</a></td>
											<td><c:out value="${list.t_mmid}" /></td>
											<td><c:out value="${list.t_date}" /></td>
											<td><c:out value="${list.t_likes}" /></td>
											<td><c:out value="${list.t_view}" /></td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>
				</div>
				<div>
					<button type="button" class="btn btn-sm btn-primary"
						id="btnWriteForm">글쓰기</button>
				</div>

				<!-- pagination{s} -->
				<div id="paginationBox">
					<ul class="pagination">
						<c:if test="${pagination.prev}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
						</c:if>


						<c:forEach begin="${pagination.startPage}"
							end="${pagination.endPage}" var="idx">
							<li
								class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
								class="page-link" href="#"
								onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
									${idx} </a></li>
						</c:forEach>

						<c:if test="${pagination.next}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!-- pagination{e} -->

			</div>
		</div>
		<div class="mainfooter">
				<div class="teamLog">
					<img src="${contextPath }/resources/images/g-icon.png" style="width: 250px; height: 200px">
				</div>
				<div class="teamPlanation">
					<ul class="list-unstyled">
						<li><p>
								<a href="#">꼬르륵</a>
							</p></li>
						<li><p>이메일</p></li>
						<li>© Copyright Goreuruek All Rights Reserved.</li>
					</ul>
				</div>
			</div>
	</div>
	
</body>
</html>