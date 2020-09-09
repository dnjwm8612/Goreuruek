<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">

<title>꼬르륵</title>
</head>
<body>
<%@include file="/WEB-INF/views/includes/publicView/aside.jsp" %>

	<div id="fh5co-main">
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-sm-offset-0"></div>
				<div class="col-sm-3 col-sm-offset-8">
					<br/>
					<br/>
					<br/>
					<br/>
				</div>
		
				<div class="col-sm-11">	
					<form name="form1" method="post">
						<table class="table table-hover">
							
							<thead>
								<tr>
									<th class="board_title">제목 ${qna.qna_title}</th>
									<td class="board_date">날짜 <fmt:formatDate value="${qna.qna_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								</tr>
							</thead>
							<tbody>
								<tr> 
									<td colspan="2" class="board_writer">작성자 ${qna.qna_mmid}</td>
								</tr>
								<tr>
									<td class="board_content" colspan="2">${qna.qna_content}</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td class="board_menu" colspan="2">
										<input type="hidden" name="qna_code" value="${qna.qna_code }">
										<input type="hidden" name="qna_bdcode" value="${qna.qna_bdcode }">
										<input type="hidden" name="qna_mmcode" value="${qna.qna_mmcode }">
										<input type="hidden" name="qna_mmid" value="${qna.qna_mmid }">
										
										<button type="button" class="optionbtn" id="btnEdit">수정</button>
										<button type="button" class="optionbtn" id="btnDelete">삭제</button>
										<button type="button" class="optionbtn" id="btnList">목록</button>
									</td>
								</tr>
							</tfoot>
						</table>
					</form>
				</div>
			</div>
		</div>
		
	</div>
	

</body>
</html>

