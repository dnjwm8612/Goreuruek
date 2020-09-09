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
            <h2>Goreuruek<br> Edit Page</h2>
            <p>register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-4 col-md-offset-6">
            <div class="login-form">
               
               <form:form role="form" modelAttribute="signupvo" action="${contextPath}/mypage/editMember" method="post">
                  <div class="form-group">
                     <label>User Name</label>
                     <form:input type="text" class="form-control" placeholder="Name" path="MM_NAME" value="${member.MM_NAME }"/>
                     <form:errors path="MM_NAME"/>
                     <input type="hidden" name="MM_CODE" value="${member.MM_CODE }">
                  </div>
                  <button type="submit" class="btn btn-black" name="btn2">수정하기</button>
               </form:form>
               
               <form:form role="form" modelAttribute="signupvo" action="${contextPath}/mypage/editMember" method="post">
                  <div class="form-group">
                     <label>Email</label>
                     <form:input type="email" class="form-control" placeholder="Email" path="MM_EMAIL" value="${member.MM_EMAIL }"/> 
                     <form:errors path="MM_EMAIL"/>
                     <input type="hidden" name="MM_CODE" value="${member.MM_CODE }">
                  </div>
                  <button type="submit" class="btn btn-black" name="btn3">수정하기</button>
               </form:form>
            </div>
         </div>
      </div>
</body>
</html>