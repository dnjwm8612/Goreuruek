<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<html>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
	$(function(){
		$("button[name=deletebtn]").click(function(){
			if(confirm("정말로  탈퇴하시겠습니까?")==true){
				location.href="${contextPath}/mypage/DeleteUser";
			}
		});
	});
</script>
<body>
<%@include file="/WEB-INF/views/includes/publicView/aside.jsp" %>
<div id="fh5co-main">
<p><h1 align="center">마이페이지</h1></p>
<div class="container">
    <div class="row">
        <ul class="thumbnails">
            <div class="col-md-4">
                <div class="thumbnail">
                    <div class="caption">
                         <h3>프로필</h3>
                        <h5>아이디: ${myinfo.MM_ID }</h5>
                        <h5>닉네임: ${myinfo.MM_NAME }</h5>
                        <h5>이메일: ${myinfo.MM_EMAIL }</h5>
                        <h5>가입일: ${myinfo.MM_REGDATE }</h5>
                        <p align="center"><a href="${contextPath}/mypage/editMemberView" class="btn btn-primary btn-block">회원 수정</a>
                        <a href="${contextPath}/mypage/editPwView" class="btn btn-primary btn-block">비밀번호 변경</a>                        
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail">
                    <div class="caption">
                         <h3>내가 쓴 게시물</h3><br/><br/>
                        <div><b>요리를 부탁해</b><div style="overflow:auto;height: 60px"><!-- a태그 이용하기 -->
                        <c:forEach var="myfree" items="${myfree}" varStatus="vs"><span>(작성글): ${myfree.FBC_CONTENT } (작성날짜): ${myfree.FB_DATE }</span><input type="hidden" name="FB_CODE" value="${myfree.FB_CODE }"><br/></c:forEach>
                        </div></div>
                        <div><b>먹스타그램</b><div style="overflow:auto;height: 60px"><!-- a태그 이용하기 -->
                        <c:forEach var="myrecipe" items="${myrecipe}" varStatus="vs"><span>(제목): ${myrecipe.RC_TITLE } (작성날짜): ${myrecipe.RC_DATE }</span><input type="hidden" name="RC_CODE" value="${myrecipe.RC_CODE }"><br/></c:forEach>
                        </div></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail">
                    <div class="caption">
                         <h3>내가 쓴 댓글</h3><br/><br/>
                        <div><b>요리를 부탁해</b><div style="overflow:auto;height: 60px"><!-- a태그 이용하기 -->
                        <c:forEach var="myfreereply" items="${myfreereply}" varStatus="vs"><span>(작성글): ${myfreereply.FBR_CONTENT } (작성날짜): ${myfreereply.FBR_DATE }</span><input type="hidden" name="FBR_FBCODE" value="${myfreereply.FBR_FBCODE }"><br/></c:forEach>
                        </div></div>
                        <div><b>먹스타그램</b><div style="overflow:auto;height: 60px"><!-- a태그 이용하기 -->
                        <c:forEach var="myrecipereply" items="${myrecipereply}" varStatus="vs"><span>(제목): ${myrecipereply.RCR_CONTENT } (작성날짜): ${myrecipereply.RCR_DATE }</span><input type="hidden" name="RCR_RCCODE" value="${myrecipereply.RCR_RCCODE }"><br/></c:forEach>
                        </div></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail">
                    <div class="caption">
                         <h3>좋아요 한 게시물</h3><br/><br/>
                        <div><b>요리를 부탁해</b><div style="overflow:auto;height: 60px"><!-- a태그 이용하기 -->
                        <c:forEach var="myfreelike" items="${myfreelike}" varStatus="vs"><span>(작성글): ${myfreelike.FBC_CONTENT } (작성날짜): ${myfreelike.FB_DATE }</span><input type="hidden" name="FB_CODE" value="${myfreelike.FB_CODE }"><br/></c:forEach>
                        </div></div>
                        <div><b>먹스타그램</b><div style="overflow:auto;height: 60px"><!-- a태그 이용하기 -->
                        <c:forEach var="myrecipelike" items="${myrecipelike}" varStatus="vs"><span>(제목): ${myrecipelike.RC_TITLE } (작성날짜): ${myrecipelike.RC_DATE }</span><input type="hidden" name="RC_CODE" value="${myrecipelike.RC_CODE }"><br/></c:forEach>
                        </div></div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="thumbnail">
                    <div class="caption">
                         <h3>회원 탈퇴</h3><br/><br/><br/><br/><br/><br/><br/><br/>
                        <button class="btn btn-primary btn-block" name="deletebtn">회원 탈퇴</button>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="thumbnail">
                    <div class="caption">
                         <h3>받은 쪽지</h3><br/>
                        <div style="overflow:auto;height: 180px"><!-- a태그 이용하기 -->
                        <c:forEach var="mymessage" items="${mymessage}" varStatus="vs"><span>
                        <a data-toggle="modal" href="#myModal${vs.index }"><b>${mymessage.SENDER_MMID } </b></a>:
                        ${mymessage.MS_CONTENT }<br/> (받은날짜): ${mymessage.senddate }</span><input type="hidden" name="MS_CODE" value="${mymessage.MS_CODE }"><br/>
                        </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="thumbnail">
                    <div class="caption">
                         <h3>문의 내역</h3><br/>
                        <div style="overflow:auto;height: 158px"><!-- a태그 이용하기 -->
                        <c:forEach var="myqna" items="${myqna}" varStatus="vs">
                         	건의: ${myqna.MS_CONTENT }    /  답변: ${myqna.MSR_CONTENT }
                        </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            
        </ul>
    </div>
</div>
</div>
<jsp:include page="/WEB-INF/views/mypage/message.jsp" flush="false"/>
</body>
</html>