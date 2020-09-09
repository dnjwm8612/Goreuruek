<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/aside.jsp" %>
<%@ include file="/WEB-INF/views/tip/script/reply.jsp"%>
<%@ include file="/WEB-INF/views/tip/script/like.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>

<head>
<meta charset="utf-8">


<script>
	$(document).on('click', '#btnList', function() {

		location.href = "${contextPath}/tip/getTipBoardList";

	});

	$(document).on('click', '#btnUpdate', function() {

		var url = "${contextPath}/tip/updateForm";
		url = url + "?t_code=" + "${Content1.t_code}";
		url = url + "&mode=edit";

		location.href = url;

	});

	$(document).on('click', '#btnDelete', function() {

		var url = "${contextPath}/tip/deleteTipBoard";
		url = url + "?t_code=" + "${Content1.t_code}";

		location.href = url;

	});
</script>

<title>꼬르륵</title>
</head>

<body>
	<div id="fh5co-main">
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-sm-offset-0">
					<h2>제목</h2>
				</div>

				<div class="col-sm-11">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="board_title"><label>제목: </label>
									${Content1.t_title}</th>
								<th class="board_date"><label>작성날짜:
										${Content1.t_date}</label></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="board_writer"><label>작성자: </label>
									${Content1.t_mmid}</th>
								<th class="board_likes">
									<label>좋아요 </label><a class="btn btn-outline-dark heart"><img class ="heart" id="heart" src=""></a> 
								</th>
							</tr>						
														
							<tr>
								<th class="board_content" colspan="2">${Content2.tc_content}</th>
							</tr>
							
							<tr>
								<td class="board_menu" colspan="2">
									<button type="button" class="optionbtn" id="btnUpdate">수정</button>
									<button type="button" class="optionbtn" id="btnDelete">삭제</button>
									<button type="button" class="optionbtn" id="btnList">목록</button>
								</td>
							</tr>
						</tbody>												
					</table>
					<table class="table table-hover">
						<tfoot>
							<tr>
								<th colspan="4">댓글</th>
							</tr>
							<tr>
								<td colspan="4">
									<div>
										<form name="replyForm" onsubmit="return false">
											<div>
												<input type="hidden" name="tr_tcode"
													value="${Content1.t_code}" />
												<textarea class="form-control" id="tr_content"
													name="tr_content" placeholder="내용을 입력하세요."></textarea>
												<span>
													<button class="btn-reply" type="button"
														name="commentInsertBtn" id="btnSend">등록</button>
												</span>
											</div>
										</form>
									</div>
									
									<div class="container">
										<div class="commentList"></div>
									</div>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>