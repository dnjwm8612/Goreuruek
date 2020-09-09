<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<html>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<script>
</script>
<title>Insert title here</title>
</head>
<body>
<c:forEach var="list" items="${list}" varStatus="vs">
						<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter views" id="listview${vs.index}" onclick="">
							<a href="${contextPath }/recipe/recipeView?RC_CODE=${list.RC_CODE}"><img src="..${list.RCC_SOURCE}" class="img-responsive" style="width:353px; height: 210px "></a>
						</div>
</c:forEach>
<c:forEach var="list2" items="${list2}" varStatus="vs">
						<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter popular" id="listview${vs.index}" onclick="">
							<a href="${contextPath }/recipe/recipeView?RC_CODE=${list2.RC_CODE}"><img src="..${list2.RCC_SOURCE}" class="img-responsive" style="width:353px; height: 210px "></a>
						</div>
</c:forEach>
<c:forEach var="list3" items="${list3}" varStatus="vs">
						<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter comments" id="listview${vs.index}" onclick="">
							<a href="${contextPath }/recipe/recipeView?RC_CODE=${list3.RC_CODE}"><img src="..${list3.RCC_SOURCE}" class="img-responsive" style="width:353px; height: 210px "></a>
						</div>
</c:forEach>
<c:forEach var="list4" items="${list4}" varStatus="vs">
						<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter releasedate" id="listview${vs.index}" onclick="">
							<a href="${contextPath }/recipe/recipeView?RC_CODE=${list4.RC_CODE}"><img src="..${list4.RCC_SOURCE}" class="img-responsive" style="width:353px; height: 210px "></a>
						</div>
</c:forEach>
<div id="pager">
					<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
	                <c:if test="${boardPager.curBlock > 1}">
	                    <a href="javascript:list('1')">[처음]</a>
	                </c:if>
	                
	                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
	                <c:if test="${boardPager.curBlock > 1}">
	                    <a href="javascript:list('${boardPager.prevPage}')">[이전]</a>
	                </c:if>
	                
	                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
	                <c:forEach var="num" begin="${boardPager.blockBegin}" end="${boardPager.blockEnd}">
	                    <!-- **현재페이지이면 하이퍼링크 제거 -->
	                    <c:choose>
	                        <c:when test="${num == boardPager.curPage}">
	                            <span style="color: red">${num}</span>&nbsp;
	                        </c:when>
	                        <c:otherwise>
	                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                
	                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
	                <c:if test="${boardPager.curBlock <= boardPager.totBlock}">
	                    <a href="javascript:list('${boardPager.nextPage}')">[다음]</a>
	                </c:if>
	                
	                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
	                <c:if test="${boardPager.curPage <= boardPager.totPage}">
	                    <a href="javascript:list('${boardPager.totPage}')">[끝]</a>
	                </c:if>
	                </div>
</body>
</html>