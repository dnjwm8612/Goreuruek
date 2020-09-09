<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:forEach var="mymessage" items="${mymessage}" varStatus="vs">
<!DOCTYPE html>
<script>
$(function(){
	$("#modalMessage${vs.index }").click(function(){
		var reason = $("#MS_CONTENT${vs.index }").val();
		
		if(reason==""){
			alert("내용을 추가해주세요");
			return;
		}
		$("#form${vs.index }").submit();
		
	});
});
</script>
<div class="modal fade" id="myModal${vs.index }" role="dialog">

    <div class="modal-dialog">
 	
        <!-- Modal content-->
        <form id="form${vs.index }" method="post" action="${contextPath }/mypage/message?${_csrf.parameterName}=${_csrf.token}">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 id="modal-title${vs.index }" class="modal-title" style="color: black">쪽지보내기</h4>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tr>
                        <td>받는아이디</td>
                        <td>
                        	<input class="form-control" id="userName3${vs.index }" type="text" readonly="readonly" name="TARGET_MMID" value="${mymessage.SENDER_MMID }" style="width: 100%"/>
                        </td>
                    </tr>
       
                    <tr>
                        <td>내용</td>
                        <td><textarea class="form-control" id="MS_CONTENT${vs.index }" name="MS_CONTENT" rows="5" style="width: 100%"></textarea></td>
                    </tr>                  
                </table>
            </div>
            <div class="modal-footer">
                <button id="modalMessage${vs.index }"  type="button" class="btn btn-success" style="background-color: red">쪽지보내기</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
        </div>
        </form>
    </div>
</div>
</c:forEach>
</html>