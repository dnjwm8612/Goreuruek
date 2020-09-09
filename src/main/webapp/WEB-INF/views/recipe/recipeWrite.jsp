<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<html>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<style>
	textarea{resize: none}
	.RCC_STEP{border: none}
</style>
<script>
$(function(){
	$("#btnsub").click(function(){
		var RC_TITLE = $("#RC_TITLE").val();
		var RC_INFORMATION = $("#RC_INFORMATION").val();
		var RC_INGREDIENT = $("#RC_INGREDIENT").val();
		var RCC_STEPINFO = $("#RCC_STEPINFO").val();
		var recipeContent = $(".recipeContent").val();
		var image = $("input[name=file]").val();
		console.log(recipeContent);
		
		if(<%=name=="anonymousUser"%>){
			if(confirm("로그인 후 이용가능합니다")==true){
				location.reload();
				return;
			}else{return;}
		}else if(RC_TITLE.length<3){
			alert("제목을 3	자 이상 입력하시오");
			return $("#RC_TITLE").focus();
			
		}else if(RC_INFORMATION==""){
			alert("설명을 입력하시오");			
			return $("#RC_INFORMATION").focus();
		}else if(RC_INGREDIENT==""){
			alert("재료란을 입력하시오");			
			return $("#RC_INGREDIENT").focus();
		}else if(RCC_STEPINFO==""){
			alert("조리 설명을 입력하시오");			
			return $("#RCC_STEPINFO").focus();
		}else if(!image){
			alert("이미지를 첨부해주세요");
			return;
		}
		document.form1.submit();
		
	});
});
</script>
<body>
<%@include file="/WEB-INF/views/includes/publicView/aside.jsp" %>

		<div id="fh5co-main">
			<div class="container">
				<div class="row" id="recipeMain">
					<div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h1 class="gallery-title">먹스타그램</h1>
					</div>

					<div>
						<form name="form1" action="${contextPath }/recipe/recipeInsert?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
							<table class="table table-bordered">
								<thead>
									<tr>
										<td colspan="4">
											<div class="recipeMainImg">
												<img src="http://fakeimg.pl/500x300/">

												<div class="recipeTitle">
													<label>제목</label> <span><input type="text" id="RC_TITLE" name="RC_TITLE"></span>
												</div>
												<div class="recipeInforamtion">												
													<label>설명</label> <span><textarea class="form-control" id="RC_INFORMATION" name="RC_INFORMATION" rows="10" cols="1000"></textarea></span>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="4"><label>작성자</label> <input type="text"
											readonly="readonly" name="RC_MMID" value="${recipe }"></td>
									</tr>
									<tr>
										<td><label>종류</label> <select name="RC_KINDS">
												<option>반찬</option>
												<option>국/탕/찌개</option>
												<option>면/만두</option>
												<option>밥/떡/죽</option>
												<option>양식</option>
												<option>퓨전</option>
												<option>음료/술</option>
												<option>디저트</option>
										</select></td>
										<td><label>상황</label> <select name="RC_SITUATION">
												<option>일상</option>
												<option>초스피드</option>
												<option>손님접대</option>
												<option>다이어트/영양식</option>
												<option>간식/야식</option>
												<option>명절</option>
												<option>술안주/해장</option>
										</select></td>
										<td><label>재료</label> <select name="RC_MATERIAL">
												<option>소고기</option>
												<option>돼지고기</option>
												<option>닭고기</option>
												<option>해물류</option>
												<option>달걀</option>
												<option>곡류</option>
												<option>과일류</option>
												<option>기타</option>
										</select></td>
										<td><label>방법</label> <select name="RC_WAYS">
												<option>볶음</option>
												<option>끓이기</option>
												<option>부침</option>
												<option>조림</option>
												<option>무침</option>
												<option>비빔</option>
												<option>튀김</option>
												<option>삶기</option>
												<option>굽기</option>
												<option>회</option>
												<option>기타</option>
										</select></td>
									</tr>
									<tr>
										<td colspan="4"><label>재료</label>
										<textarea class="recipeIngredoent" id="RC_INGREDIENT" name="RC_INGREDIENT"></textarea></td>
									</tr>
								</thead>
							</table>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}">
							<table class="table table-bordered">
								<tbody id="stock_tbody">
									<tr>
										<th colspan="4" class="contentTitle">조리순서</th>
									</tr>
									<tr class="trset">
										<th><input type="text" class="RCC_STEP" name="RCC_STEP" readonly="readonly" value="STEP 1"></th>
										<td colspan="2"><textarea class="recipeContent" name="RCC_STEPINFO"
												placeholder="설명 입력"></textarea></td>
										<td><div>
												<input type="file" name="file" id="imagefile" accept=".gif, .jpg, .jpeg, .png">
												<button type="button" id="stepadd" class="stepbtn">순서추가</button>
												<button type="button" id="stepdel" class="stepbtn">순서제거</button>
											</div></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td class="board_menu" colspan="4">
											<button  type="button" class="optionbtn" id="btnsub" name="btnsub">작성</button>
											<button type="reset" class="optionbtn">취소</button>
										</td>
									</tr>
								</tfoot>
							</table>
						</form>
					</div>
				</div>
			</div>
			<div class="mainfooter">
				<div class="teamLog">
					<img src="http://fakeimg.pl/250x200/">
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