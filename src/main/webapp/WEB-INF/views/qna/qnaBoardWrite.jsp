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
</head>
<body>
<%@include file="/WEB-INF/views/includes/publicView/aside.jsp" %>

	<div id="fh5co-main">
		<div class="container">
         <div class="row">
            <h2>글 작성</h2>
            <form name="form1"  method="post" action="${contextPath}/qna/qnaBoardInsert?${_csrf.parameterName}=${_csrf.token}">
            
               <div>
                  <input class="form-control" id="qna_title" name="qna_title"
                     placeholder="제목을 입력해 주세요" />
               </div>               

               <div>      
                  <input class="form-control" id="qna_mmid" name="qna_mmid"
                     value="k1" placeholder="이름을 입력해 주세요" >
                  <input type="hidden" id="qna_mmcode" name="qna_mmcode" value="m0008">
               </div>
               
               <div>
                  <textarea class="form-control" id="qna_content" name="qna_content"  rows="5" cols="50"
                     placeholder="내용을 입력해 주세요"></textarea>
 
               </div>
               <button type="button" class="optionbtn" id="btnSave">등록하기</button>
			   <button type="button" class="optionbtn" id="btnList">목록으로</button>
            </form>
         </div>
      </div>
	</div>
</body>
</html>

