<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<html>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<style>
	div::-webkit-scrollbar {display: none;}
	div {-ms-overflow-style: none;}
</style>
<script>
$(function(){
	replyList();
	
    var heartval = ${view.get(0).boardlike};

    if(heartval>0) {
        $("#heart").prop("src", "${contextPath}/resources/heart/heart1.png");
        $("#heart2").prop('name',heartval)
    }
    else {
        $("#heart").prop("src", "${contextPath}/resources/heart/heart2.png");
        $("#heart2").prop('name',heartval)
    }

    $("#heart2").on("click", function () {

        var that = $("#heart2");

        var sendData = {'RC_CODE' : '${view.get(0).RC_CODE}','heart' : that.prop('name')};
        $.ajax({
            url :'${contextPath}/recipe/heart?RCL_RCCODE=${view.get(0).RCL_RCCODE}&${_csrf.parameterName}=${_csrf.token}',
            type :'POST',
            data : sendData,
            success : function(data){
                that.prop('name',data);
                if(data==1) {
                    $('#heart').prop("src","${contextPath}/resources/heart/heart1.png");
                }
                else{
                    $('#heart').prop("src","${contextPath}/resources/heart/heart2.png");
                }
            }
        });
    });
    
    $(".btn-reply").click(function(){
		var RCR_CONTENT=$("textarea[name=RCR_CONTENT]").val();
        var RCR_RCCODE="${view.get(0).RC_CODE}";
        if(RCR_CONTENT==""){
        	alert("내용을 입력하세요");
        	return;
        }
        $.ajax({                
            type: "post",
            url: "${contextPath}/recipe/recipeReply?RCR_RCCODE="+RCR_RCCODE+"&RCR_CONTENT="+RCR_CONTENT+"&${_csrf.parameterName}=${_csrf.token}",
            success: function(){
                alert("댓글이 등록되었습니다.");
                $("textarea[name=RCR_CONTENT]").val("");
               	replyList();
            }
        });
	});
    
    $(".recipeup").on("click", function () {
    	var RC_CODE="${view.get(0).RC_CODE}";
    	if(confirm("수정하시겠습니까?")==true){
    	location.href="${contextPath}/recipe/recipeupdateView?RC_CODE="+RC_CODE;
    	}
    });
    
    $(".recipedel").on("click", function () {
    	var RC_CODE="${view.get(0).RC_CODE}";
    	if(confirm("삭제하시겠습니까?")==true){
	    	$.ajax({                
	            type: "post",
	            url: "${contextPath}/recipe/recipedel?RC_CODE="+RC_CODE+"&${_csrf.parameterName}=${_csrf.token}",
	            success: function(){
	                alert("삭제되었습니다.");
	            	location.href="${contextPath}/recipe/recipeList";
	            }
	        });
    	}
    });
    
    
});

//댓글 리스트
function replyList(){
	var RCR_RCCODE="${view.get(0).RC_CODE}";
	$.ajax({
		type: "post",
        url: "${contextPath}/recipe/recipeReplyList?RCR_RCCODE="+RCR_RCCODE+"&${_csrf.parameterName}=${_csrf.token}",
        success: function(data){
            $("#replyappend").html(data);
        }
    });	
}


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
						<table class="table table-bordered">
							<thead>
								<tr>
									<td colspan="4">
										<div class="recipeMainImg">
											<img src="..${view.get(0).RCC_SOURCE}" style="width: 500px;height: 300px">

											<div class="recipeTitle">
												<span>${view.get(0).RC_TITLE }</span>
											</div>
											<div class="recipeInforamtion">
												<span>${view.get(0).RC_INFORMATION }</span>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3">작성자: ${view.get(0).RC_MMID } <a data-toggle="modal" href="#myModal" style="cursor: pointer; float:right " id="report">신고</a></td>
									<td align="right">
										<sec:authorize access="isAuthenticated()">
                        				<sec:authentication property="principal.username" var="username"/>
										<button class="recipeup" style="border: none; cursor: pointer;">수정 </button>
										<button class="recipedel" style="border: none; cursor: pointer;">삭제</button>
										<a id="heart2"><img id="heart" src="" style="width: 25px"></a>
										</sec:authorize>
										<span>${view.get(0).RC_LIKES }</span>
										<span><img src="${contextPath }/resources/images/view-icon.png" style="width: 50px">${view.get(0).RC_VIEWCNT }</span>										
									</td>
								</tr>
								<tr>
									<td>종류: ${view.get(0).RC_KINDS }</td>
									<td>상황: ${view.get(0).RC_SITUATION }</td>
									<td>재료: ${view.get(0).RC_MATERIAL }</td>
									<td>방법: ${view.get(0).RC_WAYS }</td>
								</tr>
								<tr>
									<td colspan="4">[재료]<br/>${view.get(0).RC_INGREDIENT }</td>
								</tr>
							</thead>
						</table>
						
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th colspan="4">조리순서</th>
								</tr>
								<c:forEach var="view" items="${view}" varStatus="vs">
								<tr align="center">
									<td colspan="3"><b style="font-size: 50px; background-color:#00cc86; color: white; border-radius: 10px; padding: 0px 10px">${view.RCC_STEP }</b><br/><br/>
										<img src="..${view.RCC_SOURCE}" class="img-responsive" style="width: 754px; height: 502px;"><br/><br/>
										<p style="font-size: 40px; white-space:pre;">${view.RCC_STEPINFO }<p>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>

						<table class="table">
							<tfoot>
								<tr>
									<td colspan="4">
										<div>											
											<textarea class="recipeReply" name="RCR_CONTENT" placeholder="내용을 작성해주세요."></textarea>
											<div class="replyDiv">
												<input type="text" class="replyId" readonly="readonly"
													value="<%=name %>" style="border: none; font-weight: bold; font-size: xx-large;">
												<button class="btn-reply">전송</button>
											</div>
										</div>
									</td>
								</tr>
							</tfoot>
						</table>
						
						
						<div id="replyappend" class="commentList" style="overflow:auto;height: 750px">
						
						</div>
					</div>
				</div>
			</div>
			<div class="mainfooter">
				<div class="teamLog">
					<img src="${contextPath }/resources/images/g-icon.png" style="width: 250px; height: 200px">
				</div>
				<div class="teamPlanation">
				<ul class="list-unstyled">
					<li><p><a href="#">꼬르륵</a></p></li>
					<li><p>이메일</p></li>
					<li>© Copyright Goreuruek All Rights Reserved.</li>
				</ul> </div>
			</div>
		</div>
<jsp:include page="/WEB-INF/views/recipe/report.jsp" flush="false"/>
</body>
</html>