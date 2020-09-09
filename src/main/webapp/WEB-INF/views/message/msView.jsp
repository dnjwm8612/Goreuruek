<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">

<title>꼬르륵</title>
</head>
<body>
	<div id="fh5co-page">
		<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
		<aside id="fh5co-aside" role="complementary"
			class="border js-fullheight">

			<h1 id="fh5co-logo">
				<a href="${contextPath}/main"><img src="${contextPath}/resources/images/logo.png"
					alt="Free HTML5 Bootstrap Website Template"></a>
			</h1>
			<nav id="fh5co-main-menu" role="navigation">
				<div id="fh5co-main-login">user</div>
				<ul>
					<li><a href="${contextPath}/main">소개</a></li>
					<li><a href="portfolio.html">먹스타그램</a></li>
					<li><a href="about.html">요리를 부탁해</a></li>
					<li><a href="contact.html">팁</a></li>
					<li class="fh5co-active"><a href="${contextPath}/qna/qnaMain">공지사항</a></li>
				</ul>
			</nav>

			<div class="fh5co-footer">
				Shared by <i class="fa fa-love"></i><a
					href="https://bootstrapthemes.co">BootstrapThemes</a>
				<ul>
					<li><a href="#"><i class="icon-facebook"></i></a></li>
					<li><a href="#"><i class="icon-twitter"></i></a></li>
					<li><a href="#"><i class="icon-instagram"></i></a></li>
					<li><a href="#"><i class="icon-linkedin"></i></a></li>
				</ul>
			</div>

		</aside>
	</div>

	<div id="fh5co-main">
		
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-sm-offset-0"></div>
				<div class="col-sm-3 col-sm-offset-8">
					<br/>
					<br/>
					<br/>
					<br/>
				</div>
		
				<div class="col-sm-11">	
					<form name="form1" method="post">
						<table class="table table-hover">
							
							<thead>
								<tr>
									<th class="board_title">송신일자 : <fmt:formatDate value="${ms.ms_date}" pattern="yyyy-MM-dd HH:mm:ss"/></th>

								</tr>
							</thead>
							<tbody>
								<tr> 
									<td colspan="2" class="board_writer">유저아이디 : ${ms.ms_mmid}</td>
								</tr>
								<tr>
									<td class="board_content" colspan="2">${ms.ms_content}</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td class="board_menu" colspan="2">
										<input type="hidden" name="ms_code" value="${ms.ms_code }">
										<input type="hidden" name="ms_mmcode" value="${ms.ms_mmcode }">
										<input type="hidden" name="ms_mmid" value="${ms.ms_mmid }">
						
									</td>
								</tr>
							</tfoot>
						</table>
					</form>
					<table>
					<tfoot>
							<tr>
								<th colspan="4" class="massageTitle">1:1문의 답변</th>
							</tr>
							<tr>
								<td colspan="4">
									<form name="form1"  method="post" action="${contextPath}/message/insertRest?${_csrf.parameterName}=${_csrf.token}">
							         	<div>
							         		<input type="hidden" id="msr_msmmcode" name="msr_msmmcode" value="m0008"/>
							                <input type="hidden" id="msr_msmmid" name="msr_msmmid" value="k1"/>
							                <input type="hidden" id="msr_mscode" name="msr_mscode" value="${ms.ms_code}"/>
							                <textarea class="message" id="msr_content" name="msr_content" placeholder="내용을 입력해 주세요"></textarea>
											<button type="button" class="optionbtn-write" id="btnReply">답변하기</button>
											<button type="button" class="optionbtn-write" id="msMain">목록</button>
							        	</div>
							        </form>
								</td>
							</tr>
						</tfoot>
					</table>
					<div id="msrlist"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

