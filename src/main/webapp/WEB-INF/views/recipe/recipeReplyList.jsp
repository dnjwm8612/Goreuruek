<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<html>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table	style='border-bottom: #BDBDBD; border-collapse: collapse; width: 98%'>
		<c:forEach var="reply" items="${reply}" varStatus="vs">
		<tr>
			<td style='border-bottom: #BDBDBD 1px solid'>${reply.RCR_RCMMID }
				<span class="das" id="dsa${vs.index }" onload="replydate('${reply.RCR_DATE}')"></span><br>${reply.RCR_CONTENT }
				<sec:authentication	property='principal.username' var='username' /> 
				<c:if test='${username == reply.RCR_RCMMID}'>
					<button class='replydelete${vs.index }' style='float: right'>삭제</button>
				</c:if>
			</td>
		<tr>
<script>
$(function(){
	$(".replydelete${vs.index }").click(function(){
		var RCR_CODE = "${reply.RCR_CODE }";
		if(confirm("삭제하시겠습니까?")){
			$.ajax({                
		        type: "post",
		        url: "${contextPath}/recipe/recipeReplyDelete?RCR_CODE="+RCR_CODE+"&${_csrf.parameterName}=${_csrf.token}",
		        success: function(){
		            alert("삭제성공!");
		            replyList();
		        }
		    });
		}
	});
	
	
});

//댓글 리스트
function replyList(){
	var RCR_RCCODE="${reply.RCR_RCCODE }";
	$.ajax({
		type: "post",
        url: "${contextPath}/recipe/recipeReplyList?RCR_RCCODE="+RCR_RCCODE+"&${_csrf.parameterName}=${_csrf.token}",
        success: function(data){
            $("#replyappend").html(data);
        }
    });	
}

function replydate(date3){
	console.log("dsada");
	var date4 = date3.replace("KST","");
	var d = Date.parse(new Date()) - Date.parse(date4);
	var posting_time;
    if(d < 60000) {
        posting_time = "방금";
    } else if(d >= 60000 && d < 3600000) {
        posting_time = Math.floor(d/60000)+"분 전";
    } else if(d >= 3600000 && d < 86400000) {
        posting_time = Math.floor(d/3600000)+"시간 전";
    } else if(d >= 86400000 && d < 2419200000) {
        posting_time = Math.floor(d/86400000)+"일 전";
    } else {
        posting_time = date4;
    }
    $(".das").html(posting_time);
};

</script>
		</c:forEach>
		
</table>


</body>
</html>