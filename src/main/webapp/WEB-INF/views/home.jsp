<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<html>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<body>
<%@include file="/WEB-INF/views/includes/publicView/aside.jsp" %>
<div id="fh5co-main">
<!-- CustomUserDetails클래스에 저장되있는 세션값 가져옴 -->
//<h5><%=name %>님, 반갑습니다.</h5>
<h5><%=level %>님, 반갑습니다.</h5>
<br/>

<form action="${contextPath}/member/logout" method="POST">
	<input type="submit" value="LOGOUT"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

	<sec:authorize access="isAuthenticated()">
		<a href="${contextPath}/member/loginView">로그인1</a>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<a href="${contextPath}/member/loginView">로그인2</a>
	</sec:authorize>
	
<p><sec:authentication property="authorities" var="auth"/>${auth}님, 반갑습니다.</p>
<sec:authorize access="isAuthenticated()">
</sec:authorize>
</div>
</body>
</html>