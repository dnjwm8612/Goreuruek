<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
<a href="${contextPath }/home">비회원으로 시작하기</a><br/>
<a href="${contextPath }/member/loginView">회원으로 시작하기</a>
<a href="${contextPath }/freeboard/uploadForm">업로드</a>
</body>
</html>