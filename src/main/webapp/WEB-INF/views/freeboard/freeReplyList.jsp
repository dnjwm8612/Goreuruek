<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- onload문제해결하기 -->
	<table
		style='border-bottom: #BDBDBD; border-collapse: collapse; width: 98%'>
		<c:forEach var="reply" items="${reply}" varStatus="vs">
		<tr>
			<td style='border-bottom: #BDBDBD 1px solid'>${reply.FBR_FBMMID }
				<span class="das" id="dsa${vs.index }" onload="replydate('${reply.FBR_DATE}')"></span><br>${reply.FBR_CONTENT }
				<sec:authentication	property='principal.username' var='username' /> 
				<c:if test='${username == reply.FBR_FBMMID}'>
					<button class='replydelete${vs.index }' style='float: right'>삭제</button>
				</c:if>
			</td>
		<tr>
		<script>
$(function(){
	$(".replydelete${vs.index }").click(function(){
		var FBR_CODE = "${reply.FBR_CODE }";
		if(confirm("삭제하시겠습니까?fdd")){
			$.ajax({                
		        type: "post",
		        url: "${contextPath}/freeboard/freeReplyDelete?${_csrf.parameterName}=${_csrf.token}",
		        headers: {
		            "Content-Type" : "application/json"
		        },
		        dataType:"text",
		        data:JSON.stringify({            	
		        	FBR_CODE : FBR_CODE
		        }),
		        success: function(){
		            alert("삭제성공!");
		        }
		    });
		}
	});
	
	
});

function replydate(date3){
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