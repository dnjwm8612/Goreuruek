<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:forEach var="list" items="${list}" varStatus="vs">
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<body>
<!--- \\\\\\\Post-->
                
                <div class ="list-guestbook" data-no="${list.bno}">
                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0">@<a data-toggle="modal" href="#myModal5${vs.index}" style="cursor: pointer;">${list.FB_MMID}</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2" id="maindate${vs.index}"> <i class="fa fa-clock-o"></i><fmt:formatDate value="${list.FB_DATE}" pattern="yyyy.MM.DD hh:mm"/></div>
                        <a class="card-link" href="#myModal3${vs.index}" id="freeboardVieww${vs.index}"data-toggle="modal">
                            <img src="..${list.FBC_CONTENT2}" style="width:500px; height: auto"/>
                        </a>
                        <p class="card-text">
                            ${list.FBC_CONTENT}
                        </p>
                        <div id="tag${vs.index}"></div>
                    </div>
                    <div class="card-footer">
                        <a id="heart2${vs.index}"><img id="heart${vs.index}" src="" style="width: 25px"></a>
                        <span>좋아요 개수:${list.FB_LIKES }</span>
                        <a href="#this" class="card-link" id="replyWhite${vs.index}"><i class="fa fa-comment"></i> 댓글작성</a>
                        <sec:authorize access="isAuthenticated()">
                        <sec:authentication property="principal.username" var="username"/>
                        <c:if test="${username == list.FB_MMID}">                   
                        <a data-toggle="modal" href="#myModal${vs.index}" style="cursor: pointer;" class="card-link" id="freeUpdate" ><i class="fa fa-mail-forward"></i> (수정/삭제)</a>                                                    
                        <p style="display: none">${list.FB_CODE }</p><p style="display: none">${list.FBC_FBCODE }</p>
                        <p style="display: none">${list.FBL_FBCODE }</p>                        
                        </c:if>
                        <a data-toggle="modal" href="#myModal2${vs.index}" style="cursor: pointer;" class="card-link" id="report" ><i class="fa fa-mail-forward"></i> 신고</a>
                        <br/><span id="replyform${vs.index}" style="display: none"><textarea rows="5" cols="80" id="FBR_CONTENT${vs.index}" name="FBR_CONTENT" placeholder="댓글을 작성해주세요"></textarea>
                        		  <br/><button id="btnReply${vs.index}" style="position:relative ; left: 725px">작성하기</button>
                        	</span>
                        </sec:authorize>
                        <hr/>
                    </div>
                </div>
                </div>

                <div class="productScroll"></div>

                <script type="text/javascript">
                $("#tag${vs.index}").ready(function(){
       			 var tag = '${list.FBC_TAG}';	
                	var splitedArray  = tag.split(' ');
                	var linkedContent = '';
                	for(var word in splitedArray)
                	{
                	  word = splitedArray[word];
                	   if(word.indexOf("#") == 0)
                	   {	
                		   var word2 = encodeURIComponent(word);
                		   word = '<a class="badge badge-primary${vs.index}" style="text-decoration: underline;" href="${contextPath}/freeboard/freeTag?FBC_TAG='+word2+'">'+word+'</a>';
                	   		//#문제
                	   }
                	   linkedContent += word+' ';
                	}
                	document.getElementById('tag${vs.index}').innerHTML = linkedContent;                	
       			 });
                          
                $(function(){
                	$("#replyWhite${vs.index}").click(function(){
                		$("#replyform${vs.index}").toggleClass("show");
                	});
                	
                	$("#btnReply${vs.index}").click(function(){
                		var FBR_CONTENT=$("#FBR_CONTENT${vs.index}").val();
        	            var FBR_FBCODE="${list.FB_CODE}"
        	            if(FBR_CONTENT==""){
        	            	alert("내용을 입력하세요");
        	            	return;
        	            }
        	            $.ajax({                
        	                type: "post",
        	                url: "${contextPath}/freeboard/freeReplyInsert?${_csrf.parameterName}=${_csrf.token}",
        	                headers: {
        	                    "Content-Type" : "application/json"
        	                },
        	                dataType:"text",
        	                data:JSON.stringify({
        	                	FBR_CONTENT : FBR_CONTENT,
        	                	FBR_FBCODE : FBR_FBCODE
        	                }),
        	                success: function(){
        	                    alert("댓글이 등록되었습니다.");
        	                    $("#FBR_CONTENT${vs.index}").val("");
        	                }
        	            });
                	});
                	$("#freeboardVieww${vs.index}").click(function(){
                		//클릭될때 모달 실행되고 리플 리스트 실행되게하기
                		var FBR_FBCODE = "${list.FB_CODE}";
                		console.log(FBR_FBCODE)
                		replyList(FBR_FBCODE);
                	});
	
                });
                
		     $(function(){

        	        var heartval = ${list.boardlike};

        	        if(heartval>0) {
        	            $("#heart${vs.index}").prop("src", "${contextPath}/resources/heart/heart1.png");
        	            $("#heart2${vs.index}").prop('name',heartval)
        	        }
        	        else {
        	            $("#heart${vs.index}").prop("src", "${contextPath}/resources/heart/heart2.png");
        	            $("#heart2${vs.index}").prop('name',heartval)
        	        }

        	        $("#heart2${vs.index}").on("click", function () {

        	            var that = $("#heart2${vs.index}");

        	            var sendData = {'FB_CODE' : '${list.FB_CODE}','heart' : that.prop('name')};
        	            $.ajax({
        	                url :'${contextPath}/freeboard/heart?FBL_FBCODE=${list.FBL_FBCODE}&${_csrf.parameterName}=${_csrf.token}',
        	                type :'POST',
        	                data : sendData,
        	                success : function(data){
        	                    that.prop('name',data);
        	                    if(data==1) {
        	                        $('#heart${vs.index}').prop("src","${contextPath}/resources/heart/heart1.png");
        	                    }
        	                    else{
        	                        $('#heart${vs.index}').prop("src","${contextPath}/resources/heart/heart2.png");
        	                    }
        	                }
        	            });
        	        });           	    
        	    });
                </script>
                </c:forEach>
</body>

</html>