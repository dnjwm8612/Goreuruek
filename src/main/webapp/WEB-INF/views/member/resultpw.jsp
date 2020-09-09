<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function(){
		$(".pwpw").click(function(){
			var MM_ID = "${id}";
			var MM_PASSWORD = $("input[name=MM_PASSWORD]").val();
			$.ajax({                
                type: "post",
                url: "${contextPath}/member/updatepw?MM_PASSWORD="+MM_PASSWORD+"&MM_ID="+MM_ID+"&${_csrf.parameterName}=${_csrf.token}",
                success: function(result){
                	alert("변경완료");
                	location.href="${contextPath}/member/loginView";
                }
            });
		});
	});
</script>
</head>
<body>
	<div class="main">
         <div class="col-md-5 col-md-offset-6">
                  <div class="form-group">
                  <br/>
                     <label>비밀번호 재설정</label>
                     <input type="text" class="form-control" required="required" name="MM_PASSWORD">
                  </div>
                  <button type="button" class="pwpw">변경하기</button>
         </div>
      </div>
</body>
</html>