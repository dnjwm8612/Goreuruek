<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<html>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<script>
	$(function(){
		$("button[name=btnid]").click(function(){
			var MM_EMAIL = $("#idfind").val();
			$.ajax({                
                type: "post",
                url: "${contextPath}/member/findid2?MM_EMAIL="+MM_EMAIL+"&${_csrf.parameterName}=${_csrf.token}",
                success: function(result){
                	$(".resultid").html(result);
                }
            });
		});
	});
</script>
<body>
	<div class="sidenav">
         <div class="login-main-text">
            <h2>Goreuruek<br> Forgotpassword Page</h2>
            <p>Reset your password by email</p>	
         </div>
     </div>
      <div class="main">
         <div class="col-md-5 col-md-offset-6">
            <div class="login-form">
                  <div class="form-group">
                     <label>아이디 찾기</label>
                     <input type="text" class="form-control" id="idfind" placeholder="이메일 입력" required="required">
                  </div>
                  <button type="button" class="btn btn-black" name="btnid">검색하기</button>
                  <button type="button" class="btn btn-default">취소</button>
            </div>
         </div>
      </div>
     <div class="resultid"></div>
</body>
</html>