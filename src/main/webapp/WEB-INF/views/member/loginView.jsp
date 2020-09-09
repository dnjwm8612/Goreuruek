<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>
.form-control {
	width: 100%
}
</style>
<script>
	$(function(){
		var email = "${emailAddress.emailAddress }";
		if(email != null&&email != ""){
			document.form1.submit();
		}
		
		$("#btnOauth").click(function(){
			location.href= "https://accounts.google.com/o/oauth2/v2/auth?scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive&access_type=offline&include_granted_scopes=true&state=state_parameter_passthrough_value&redirect_uri=http%3A%2F%2Flocalhost%2Fgoreureuk%2Fmember%2FgoogleLogin&response_type=code&client_id=445169890388-51aa63k12p7nkcnhhqdk6dil5p236l5a.apps.googleusercontent.com";
		});
	});
</script>

<body onload="document.form1.MM_ID.focus();">

	<div class="container login-container">

		<div class="row">
			<div class="col-sm-8">
				<img src="${contextPath }/resources/css/singupImg.jpg" style="width: 700px;height: 550px">
			</div>
			<div class="col-sm-offset-0 col-sm-4 login-form-1">

				<h3>회원</h3>
				<form:form role="form" name="form1" modelAttribute="MemberVO"
					action="${contextPath}/member/login" method="post">
					<fieldset>
						<div class="form-group">
							<form:input type="text" class="form-control" placeholder="ID"
								path="MM_ID" name="MM_ID" value="${emailAddress.emailAddress }"/>
							<form:errors path="MM_ID" />
						</div>
						<div class="form-group">
							<form:password class="form-control" placeholder="Password"
								path="MM_PASSWORD" name="MM_PASSWORD"/>
							<form:errors path="MM_PASSWORD" value="${emailAddress.emailAddress }"/>
						</div>
						<c:if test="${not empty ERRORMSG}">
							<font color="red">
								<p>
									Your login attempt was not successful due to <br /> ${ERRORMSG }
								</p>
							</font>
						</c:if>
						<div class="checkbox">
							<label> <form:checkbox path="rememberId" />아이디 기억</label>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
							<input name="${_csrf.parameterName}" type="hidden"
								value="${_csrf.token}" />
						</div>
						<div class="form-group">
							<a class="ForgetPwd" href="#myModal4" data-toggle="modal">Forget Password?</a>
						</div>
					</fieldset>										
				</form:form>
				<div class="form-group">
					<button class="btnOauth" id="btnOauth">
						<img src="${contextPath}/resources/images/googlebtn.png" style="width: 280px">
					</button>
				</div>
				<div class="form-group">
					<button class="btnOauth" align="center">
						<img src="${contextPath}/resources/images/kakaobtn.png" style="width: 280px">
					</button>
				</div>

			<br>
			</div>
			<div class="col-sm-8">
				<img src="${contextPath }/resources/images/mainImg2.jpg" style="width:652px;height: 400px">
			</div>
			<div class="col-sm-3 login-form-2">
				<h3>비회원</h3>
				<div class="form-guest">
					<a href="${contextPath }/freeboard/freeboardList" class="guest">Guest</a>
				</div>
				<div class="form-guest">
					<a href="${contextPath}/member/signUpView" class="create">Sign Up</a>
				</div>
			</div>
		</div>
	</div>
	

</body>


</html>
<jsp:include page="/WEB-INF/views/member/forgotpassword.jsp" flush="false"/>
