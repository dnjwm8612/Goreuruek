<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<html>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<body>
<%@include file="/WEB-INF/views/includes/publicView/Adminaside.jsp" %>
<div id="fh5co-main">
	

<!------ Include the above in your HEAD tag ---------->

<div class="container" style="float: left;" align="center">
    <div class="row col-md-6 col-md-offset-2 custyle" style="width: 1000px;">
    <h3 style="color:#2C3E50" >유저 관리</h3>
    <table class="table table-striped custab" style="width: 1000px;">
    <thead>
    <a href="${contextPath}/member/signUpView" class="btn btn-primary btn-xs pull-right"><b>+</b> 회원추가</a>
        <tr>
            <th>코드</th>
            <th>아이디</th>
            <th>닉네임</th>
            <th>이메일</th>
            <th>생성 날짜</th>
            <th>권한</th>
            <th>상태</th>
            <th class="text-center">Action</th>
        </tr>
    </thead>
    		<c:forEach var="user" items="${user}" varStatus="vs">		
            <tr>
                <td>${user.MM_CODE }</td>
                <td>${user.MM_ID }</td>
                <td>${user.MM_NAME }</td>
                <td>${user.MM_EMAIL }</td>
                <td>${user.MM_REGDATE }</td>
                <td>${user.MM_AUTH }</td>
                <td>${user.MM_ENABLED }</td>
                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a>
                 <div id="btndel${vs.index}" class="btn btn-danger btn-xs" style="cursor: pointer;"><span class="glyphicon glyphicon-remove"></span> Del</div></td>
            	<script>
	    		$(function(){
	    			var code = "${user.MM_CODE }";
	    			$("#btndel${vs.index}").click(function(){
	    				if(confirm("회원을 삭제하시겠습니까?")==true){
	    					location.href="${contextPath}/admin/adminDelUser?MM_CODE="+code;
	    				}
	    			});
	    		});
    			</script> 
            </tr>
            </c:forEach>
    </table>
    </div>
</div>
	
</div>
</body>
</html>