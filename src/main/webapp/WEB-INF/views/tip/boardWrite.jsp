<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp"%>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp"%>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp"%>
<%@include file="/WEB-INF/views/includes/publicView/aside.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<script type="text/javascript"
	src="${contextPath}/resources/ckeditor/ckeditor.js"></script>

<script>
$(function(){
	CKEDITOR.replace('tc_content',{
		filebrowserUploadUrl: "${contextPath }/tip/fileupload?${_csrf.parameterName}=${_csrf.token}"
	});
});
</script>

<script>
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();

		$("#form1").submit();
	});

	$(document).on('click', '#btnList', function() {
		location.href = "${contextPath}/tip/getTipBoardList";
	});

	$(document).ready(
			function() {
				var mode = '<c:out value="${mode}"/>';
				if (mode == 'edit') {
					$("#t_mmid").prop('readonly', true);
					$("input:hidden[name='t_code']").val(
							'<c:out value="${Content1.t_code}"/>');
					$("input:hidden[name='mode']").val(
							'<c:out value="${mode}"/>');
					$("#t_mmid").val('<c:out value="${Content1.t_mmid}"/>');
					$("#t_title").val('<c:out value="${Content1.t_title}"/>');
					$("#tc_content").val(
							'<c:out value="${Content2.tc_content}"/>');
					$("#t_likes").val('<c:out value="${Content1.t_likes}"/>');
				}
			});
</script>


<title>꼬르륵</title>
</head>
<body>

	<div id="fh5co-main">
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-sm-offset-0">
					<h2>게시글 작성</h2>
				</div>
				<div class="col-sm-3 col-sm-offset-8">
					<br />
				</div>
				<div class="col-sm-11">
					<form:form name="form1" id="form1" method="post" role="form1"
						modelAttribute="TipBoardVO"
						action="${contextPath}/tip/insertTipBoard?${_csrf.parameterName}=${_csrf.token}">
						<form:hidden path="t_code" />
						<input type="hidden" name="mode" />

						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.username" var="username" />

							<div>
								<label>제목</label>
								<form:input path="t_title" class="board_title" id="t_title"
									placeholder="제목을 입력해 주세요" />
							</div>


							<div>
								<label>작성자</label>
								<form:input path="t_mmid" class="board_writer" id="t_mmid"
									value="${username}"  placeholder="이름을 입력해 주세요" />
							</div>
							<br>
							<br>
							<div>
								<form:textarea path="tc_content" rows="5" id="tc_content"
									class="board_content" placeholder="내용을 입력해 주세요" />
							</div>

							<button type="submit" class="optionbtn" id="btnSave">등록하기</button>
							<button type="button" class="optionbtn" id="btnList">목록으로</button>
						</sec:authorize><
					</form:form>
				</div>
			</div>
		</div>
	</div>


</body>


</html>