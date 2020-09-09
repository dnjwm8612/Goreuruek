<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!DOCTYPE html>


<head>
<meta charset="utf-8">
<script src="https://cdn.tiny.cloud/1/suxhdq52n4o616vzpokcxztm1r5xikdtw2da3urfi0p7bikh/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<script>
	tinymce.init({
		selector: '#qna_content'
	});
</script>
<title>꼬르륵</title>
</head>
<body>
	<%@include file="/WEB-INF/views/includes/publicView/aside.jsp" %>

	<div id="fh5co-main">
		<div class="container">
         <div class="row">
            <h2>글 수정</h2>
            <form name="form1" method="post" action="${contextPath}/qna/qnaBoardUpdate?${_csrf.parameterName}=${_csrf.token}">
             
               <div>
                  <input class="form-control" id="qna_title" name="qna_title" 
                     value="${qna.qna_title}" placeholder="제목을 입력해 주세요" />
               </div>               

               <div>      
                  <input type="hidden" id="qna_mmid" name="qna_mmid" value="${qna.qna_mmid}" />
                  <input type="hidden" id="qna_mmcode" name="qna_mmcode" value="m0008"/>
               </div>

               <div >
               	  <textarea class="form-control" id="qna_content" name="qna_content" rows="5" cols="50"
                    placeholder="내용을 입력해 주세요">${qna.qna_content}</textarea>
               </div>
               <input type="hidden" id="qna_code" name="qna_code" value="${qna.qna_code }">
				<input type="hidden" id="qna_bdcode" name="qna_bdcode" value="${qna.qna_bdcode }">
               <button type="button" class="optionbtn" id="btnUpdate">수정하기</button>
            </form>
            
         </div>
         
      </div>
	</div>

</body>
</html>

