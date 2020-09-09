<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<html>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
	.form-control{width: 100%}
	.main{position: relative; bottom: 100px}
</style>
<body>

	<div class="sidenav">
         <div class="login-main-text">
            <h2>Goreuruek<br> Login Page</h2>
            <p>register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-4 col-md-offset-6">
            <div class="login-form">
               <form:form role="form" modelAttribute="signUpVO" action="${contextPath}/member/signCheck" method="post">
                  <div class="form-group">
                     <label>ID</label>
                     <form:input type="text" class="form-control" placeholder="ID" path="MM_ID"/>
                   	 <form:errors path="MM_ID"/>
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <form:password class="form-control" placeholder="Password" path="MM_PASSWORD"/>
                     <form:errors path="MM_PASSWORD"/>
                  </div>
                  <div class="form-group">
                     <label>Password Check</label>
                     <form:password class="form-control" placeholder="Password Check" path="checkPw"/>
                     <form:errors path="checkPw"/>
                  </div>
                  <div class="form-group">
                     <label>User Name</label>
                     <form:input type="text" class="form-control" placeholder="Name" path="MM_NAME"/>
                     <form:errors path="MM_NAME"/>
                  </div>
                  <div class="form-group">
                     <label>Email</label>
                     <form:input type="email" class="form-control" placeholder="Email" path="MM_EMAIL"/> 
                     <form:errors path="MM_EMAIL"/>
                  </div>
                  <button type="submit" class="btn btn-black">가입하기</button>
                  <button type="reset" class="btn btn-secondary">취소하기</button>
               </form:form>
               	<div>
               		<a href="#"><button type="button" class="btnOauth"><img src="${contextPath}/resources/images/googlebtn.png"></button></a>
               	</div>
               	<div>
               		<a href="#"><button type="button" class="btnOauth"><img src="${contextPath}/resources/images/kakaobtn.png"></button></a>
               		<a href="https://accounts.google.com/o/oauth2/v2/auth?scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive&access_type=offline&include_granted_scopes=true&state=state_parameter_passthrough_value&redirect_uri=http%3A%2F%2Flocalhost%2Fgoreureuk%2Fmember%2FreceiveCode&response_type=code&client_id=445169890388-51aa63k12p7nkcnhhqdk6dil5p236l5a.apps.googleusercontent.com">구글 회원가입</a>
               	</div>
            </div>
         </div>
      </div>
</body>
</html>