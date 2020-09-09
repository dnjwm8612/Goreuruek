<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<!DOCTYPE html>
<html>
<div class="modal fade" id="myModal4" role="dialog">

    <div class="modal-dialog">
 	
        <!-- Modal content-->
        <form name="form4" id="form4" method="post" action="${contextPath }/member/findpw?${_csrf.parameterName}=${_csrf.token}">
        <div class="modal-content">
            <div class="modal-header">
            	<h2>Goreuruek<br> Forgotpassword Page</h2>
            	<p>Reset your password by email</p>	
            </div>
            <div class="modal-body">
            	<label>ID</label> <a href="${contextPath}/member/findid" class="ForgetPwd" style="float: right;">Forget ID?</a>
                <input type="text" class="form-control" placeholder="User ID" name="MM_ID">
                <label>Email</label>
                <input type="text" class="form-control" placeholder="User Email" name="MM_EMAIL">
            </div>
            <div class="modal-footer">
               <button type="submit" class="btn btn-black">비밀번호 찾기</button>
			   <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
        </div>
        </form>
    </div>
</div>
</html>