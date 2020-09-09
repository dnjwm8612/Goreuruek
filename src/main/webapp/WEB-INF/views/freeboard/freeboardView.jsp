<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<c:forEach var="list" items="${map.list}" varStatus="vs">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	div::-webkit-scrollbar {display: none;}
	div {-ms-overflow-style: none;}
	.footermenu{float: right;}
</style>
<script>
	$(function(){
		
		
		//댓글버튼 눌렀을시
		$("#replyinsert${vs.index}").click(function(){
			$("#menubar${vs.index}").toggle();
			$("#footermenu${vs.index}").toggle();	
			$("#hrid${vs.index}").toggle();			
    		$("#replyform2${vs.index}").toggle();
    	});
		//댓글버튼 다시 눌렀을시
		$("#replyinsert2${vs.index}").click(function(){
			$("#menubar${vs.index}").toggle();
			$("#footermenu${vs.index}").toggle();	
			$("#hrid${vs.index}").toggle();			
    		$("#replyform2${vs.index}").toggle();
    	});
		
		//댓글입력 엔터 누를시
		$("#FBR_CONTENT2${vs.index}").keydown(function (key) {
	        if(key.keyCode == 13){
	        	var FBR_CONTENT=$("#FBR_CONTENT2${vs.index}").val();
	            var FBR_FBCODE="${list.FB_CODE}";
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
	                    $("#FBR_CONTENT2${vs.index}").val("");
	                   // replyList(FBR_FBCODE);
	                    replyList(FBR_FBCODE);
	                }
	            });
	        }
	    });		
		
		var heartval = ${list.boardlike};

        if(heartval>0) {
            $("#heart3${vs.index}").prop("src", "${contextPath}/resources/heart/heart1.png");
            $("#heart4${vs.index}").prop('name',heartval)
        }
        else {
            $("#heart3${vs.index}").prop("src", "${contextPath}/resources/heart/heart2.png");
            $("#heart4${vs.index}").prop('name',heartval)
        }

        $("#heart4${vs.index}").on("click", function () {

            var that = $("#heart4${vs.index}");

            var sendData = {'FB_CODE' : '${list.FB_CODE}','heart' : that.prop('name')};
            $.ajax({
                url :'${contextPath}/freeboard/heart?FBL_FBCODE=${list.FBL_FBCODE}&${_csrf.parameterName}=${_csrf.token}',
                type :'POST',
                data : sendData,
                success : function(data){
                    that.prop('name',data);
                    if(data==1) {
                        $('#heart3${vs.index}').prop("src","${contextPath}/resources/heart/heart1.png");
                    }
                    else{
                        $('#heart3${vs.index}').prop("src","${contextPath}/resources/heart/heart2.png");
                    }


                }
            });
        });
		
		
	});
	
	//댓글 리스트
	function replyList(FBR_FBCODE){
		//댓글입력시 dataType:"text"로 해줬기때문에 다시 줄때도 dataType:"text"로 줘야 값이 나옴
		$.ajax({
			type: "POST",
            url: "${contextPath}/freeboard/freeboardReplyList?${_csrf.parameterName}=${_csrf.token}",
            headers: {
                "Content-Type" : "application/json"
            },
            dataType:"text",
            data:JSON.stringify({
            	FBR_FBCODE : FBR_FBCODE
            }),
            success: function(data){
            	//컨트롤러에서 곧바로 리스트로 받을경우 받은 데이터를 JSON.parse해준다 
                $(".modal-body2").html(data);
            }
        });	
	}
	
	function passing_time(datetime) {
		var d = Date.parse(new Date()) - Date.parse(datetime);
		//console.log(Date.parse(new Date()));
		//console.log(Date.parse(datetime));
		//console.log(new Date());
		var posting_time;
	    if(d < 60000) {
	        posting_time = "방금";
	    } else if(d >= 60000 && d < 3600000) {
	        posting_time = Math.floor(d/60000)+"분 전";
	    } else if(d >= 3600000 && d < 86400000) {
	        posting_time = Math.floor(d/3600000)+"시간 전";
	    } else if(d >= 86400000 && d < 2419200000) {
	        posting_time = Math.floor(d/86400000)+"일 전";
	    } else {
	        posting_time = datetime;
	    }
	    return posting_time;
	}
</script>
</head>
<body>
<div class="modal fade" id="myModal3${vs.index}" role="dialog">

    <div class="modal-dialog" >
 	<table style="border-bottom:medium; "></table>
        <!-- Modal content-->
        <div class="modal-content" style="width: 1100px;height: 550px;">
        	<div class="img-area" style="width: 700px;height: 100%;position:absolute;display: inline-block;">
        	<img src="..${list.FBC_CONTENT2}" style="width:70%; height: auto; margin-top:10%;"/>
        	</div>
        	<div style="display: inline-block;width: 390px;float: right">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h5 id="modal-title${vs.index}" class="modal-title">@${list.FB_MMID}</h5>
                <div id="modalcontent${vs.index}" class="modal-title" style="border: none;height: 100px;width:100%;overflow:auto;">${list.FBC_CONTENT}</div>
            </div>
            <div class="modal-body2" id="replybody${vs.index}" style="height: 300px;overflow:auto;"></div>
            <hr style="margin: 0%;"/>
            <div id="menubar${vs.index}" style="height: 60px"><a href="#this" class="card-link" id="replyinsert${vs.index}">댓글</a>
            <span style="position:relative; right:-10px"><a id="heart4${vs.index}"><img id="heart3${vs.index}" src="" style="width: 25px"></a>${list.FB_LIKES }</span>
            <span style="position:relative; right:-175px"><fmt:formatDate value="${list.FB_DATE}" pattern="MM.DD hh:mm"/></span>
            </div>
            <span id="replyform2${vs.index}" style="display: none;width: 370px;">
            <a href="#this" class="card-link" id="replyinsert2${vs.index}">댓글</a>
            <textarea style="width: 370px;height: 80px" rows="5" cols="80" id="FBR_CONTENT2${vs.index}" name="FBR_CONTENT2" placeholder="댓글을 작성해주세요"></textarea>
            </span>
            <hr id="hrid${vs.index}" style="margin: 0%;"/>
            <sec:authentication	property='principal.username' var='username' />
            <c:choose>
			    <c:when test='${username == reply.FBR_FBMMID}'>	
			    	<div class="footermenu"><a href="${contextPath}/member/loginView">로그인</a></div>	        			        
			    </c:when>
			    <c:otherwise>
			    	<div class="footermenu">
				        <form action="${contextPath}/member/logout" method="POST">
							<input type="submit" value="LOGOUT" style="border: none;cursor: pointer; color: red"/>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</div>			 
			    </c:otherwise>
			</c:choose> 
            </div>
           </div>
    </div>
</div>
  
 </c:forEach>
 </body>
 
 </html>