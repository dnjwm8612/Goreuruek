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
<script>
$(function(){
		$('button[name=btn1]').click(function(){
		   if($('#pw').val() != $('#pwcheck').val()){
		    	if($('#pwcheck').val()!=''){
			    alert("비밀번호가 일치하지 않습니다.");
		    	    $('#pwcheck').val('');
		          $('#pwcheck').focus();
		          return;
		       }
		    }
		   if($('#pw').val()==''){
			   alert("빈칸에 입력해주세요.");
			   $('#pw').focus();
			   return;
		   }
		   if($('#pwcheck').val()==''){
			   alert("빈칸에 입력해주세요.");
			   $('#pwcheck').focus();
			   return;
		   }
		   
		   
		   document.form1.submit();
		})  	   
	});
</script>
<body>

	<div class="sidenav">
         <div class="login-main-text">
            <h2>Goreuruek<br> Edit PW Page</h2>
            <p>register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-4 col-md-offset-6">
            <div class="login-form">
               <form:form role="form" name="form1" modelAttribute="signupvo" action="${contextPath}/mypage/editPw" method="post">
                  
                  <div class="form-group">
                     <label>Password</label>
                     <form:password class="form-control" placeholder="Password" path="MM_PASSWORD" id="pw"/>
                     <form:errors path="MM_PASSWORD"/>
                     <input type="hidden" name="MM_CODE" value="${member.MM_CODE }">
                  </div>
                  <div class="form-group">
                     <label>Password Check</label>
                     <form:password class="form-control" placeholder="Password Check" path="checkPw" id="pwcheck"/>
                     <form:errors path="checkPw"/>
                  </div>
                  
                  <button type="button" class="btn btn-black" name="btn1">변경하기</button>
                  <button type="reset" class="btn btn-secondary">취소하기</button>
               </form:form>
               
            </div>
         </div>
      </div>
</body>
</html>