<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main">
         <div class="col-md-5 col-md-offset-6">
                  <div class="form-group">
                  <br/>
                     <label>검색 결과</label>
                     <input type="text" class="form-control"value="${id }" placeholder="User EMAIL" required="required" readonly="readonly">
                  </div>
                  <a href="${contextPath}/member/loginView">LOGIN</a>
         </div>
      </div>
</body>
</html>