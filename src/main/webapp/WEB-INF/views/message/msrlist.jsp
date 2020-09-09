<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table style="width:700px">
		<c:forEach var="msr" items="${msrlist}">
		<tr>
			<td>
				${msr.msr_msmmid}(<fmt:formatDate value="${msr.msr_date}" pattern="yyyy-MM-dd HH:mm:ss"/>)
				<br>
				${msr.msr_content}
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>