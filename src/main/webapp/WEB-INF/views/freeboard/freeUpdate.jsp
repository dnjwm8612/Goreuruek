<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:forEach var="list" items="${map.list}" varStatus="vs">
<!DOCTYPE html>

<script>
$(function(){
	$("#file-delete2${vs.index}").click(function(e){
		console.log("111");
        e.preventDefault();
        $("#FBC_CONTENT2${vs.index}").replaceWith( $("#FBC_CONTENT2${vs.index}").clone(true) );
        $("#FBC_CONTENT2${vs.index}").val("");
    });
	
	$("#modalSubmit2${vs.index}").click(function(){
		if(confirm("삭제하시겠습니까?")){
			location.href="${contextPath}/freeboard/freeDelete?FB_CODE=${list.FB_CODE}&FBC_FBCODE=${list.FBC_FBCODE}&FBL_FBCODE=${list.FBL_FBCODE}";
		}
	});
	
	$("#modalSubmit${vs.index}").click(function(){
		var tag = $("#FBC_TAG${vs.index}").val();
		var special_pattern = /[#]/;
		
		if(tag==""){
			alert("태그를 두개이상 추가해주세요");
			return;
		}else if(tag.search(/\s/)==-1){
			alert("태그사이 공백을 추가해주세요");
			return;
		}else if(special_pattern.test(tag)==false){
			alert("태그에 #을 추가해주세요");
			return;
		}
		if(confirm("수정하시겠습니까?")){
			$("#form2${vs.index}").submit();
		}
	});
	
});
</script>


<div class="modal fade" id="myModal${vs.index}" role="dialog">

    <div class="modal-dialog">
 	
        <!-- Modal content-->
        <form name="form2" id="form2${vs.index}" method="post" action="${contextPath }/freeboard/freeUpdate?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 id="modal-title" class="modal-title">수정하기</h4>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tr>
                        <td>사용자명</td>
                        <td>
                        	<input class="form-control" id="userName${vs.index}" type="text" readonly="readonly" value="${list.FB_MMID }" style="width: 100%"/>
                        	<input type="hidden" id="FB_CODE${vs.index}" name="FB_CODE" value="${list.FB_CODE }"/>
                        </td>
                    </tr>
                    <tr>
                    	<td>이미지</td>
                    	<td><input type="file" class="custom-file-input" id="FBC_CONTENT2${vs.index}" name="file"/><a href='#this' id='file-delete2${vs.index}'>삭제</a></td> 	
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td><textarea class="form-control" id="FBC_CONTENT${vs.index}" name="FBC_CONTENT" rows="10" style="width: 100%">${list.FBC_CONTENT }</textarea></td>
                    </tr>    
                    <tr>
                    	<td>태그</td>
                    	<td><textarea class="form-control" id="FBC_TAG${vs.index}" name="FBC_TAG" rows="1" placeholder="#태그 수정" style="width: 100%">${list.FBC_TAG }</textarea></td>
                    </tr>                
                </table>
            </div>
            <div class="modal-footer">
                <button id="modalSubmit${vs.index}"  type="button" class="btn btn-success">수정</button>
                <button  id="modalSubmit2${vs.index}" type="button" class="btn btn-success">삭제</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
        </div>
        </form>
    </div>
</div>
</c:forEach>


</html>