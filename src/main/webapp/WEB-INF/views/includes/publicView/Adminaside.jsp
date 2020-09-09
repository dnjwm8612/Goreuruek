<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 사용자 정보 불러오기 위한 태그 -->
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="fh5co-page">
		<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
		<aside id="fh5co-aside" role="complementary" class="border js-fullheight">

			<h1 id="fh5co-logo"><a href="index.html"><img src="${contextPath }/resources/images/logo.png" alt="Free HTML5 Bootstrap Website Template"></a></h1>
			<nav id="fh5co-main-menu" role="navigation">
				<div id="fh5co-main-login">관리자</div>
				<ul>
					<li><a href="${contextPath }/admin/adminView">신고관리</a></li>
					<li><a href="${contextPath }/admin/adminUser">유저관리</a></li>
					<li><a href="${contextPath }/admin/adminBoard">게시판 관리</a></li>
					<li><a href="${contextPath }/qna/qnaMain">문의관리</a></li>
				</ul>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<ul>
					<sec:authorize access="isAuthenticated()">
						<li><h3><form action="${contextPath}/member/logout" method="POST">
									<input type="submit" value="[로그아웃]" style="border: none; color: red; font-size: large;"/>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								</form></h3></li>				
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li><h3><a href="${contextPath }/member/loginView" style="color: red">[로그인]</a></h3></li>
					</sec:authorize>
					
				</ul>
			</nav>

			<div class="fh5co-footer">
				Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
				<ul>
					<li><a href="#"><i class="icon-facebook"></i></a></li>
					<li><a href="#"><i class="icon-twitter"></i></a></li>
					<li><a href="#"><i class="icon-instagram"></i></a></li>
					<li><a href="#"><i class="icon-linkedin"></i></a></li>
				</ul>
			</div>

		</aside>
	</div>