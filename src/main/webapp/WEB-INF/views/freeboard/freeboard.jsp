<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<html>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>

<style>
select {
    width: 110px; 
    padding: .0em .1em; /* 여백으로 높이 설정 */
    font-family: inherit;  /* 폰트 상속 */
    /*background: url('이미지 경로') no-repeat 95% 50%;*/ /* 네이티브 화살표를 커스텀 화살표로 대체 */
    border: 1px solid #BDBDBD;
    border-radius: 5px; /* iOS 둥근모서리 제거 */
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
}
textarea{resize: none}
</style>
<script>
	$(function(){
		$("#btnWrite").click(function(){
			var content = $("#FBC_CONTENT").val();
			var image = $("#FBC_CONTENT2").val();
			var tag = $("#FBC_TAG").val();
			var special_pattern = /[#]/;
			console.log(image);
			console.log(tag);
			if(<%=name=="anonymousUser"%>){
				if(confirm("로그인 후 이용가능합니다")==true){
					location.reload();
					return;
				}else{return;}
			}else if(content.length < 10){
				alert("내용을 10자 이상 입력하시오");				
				return $("#FBC_CONTENT").focus();
			}
			if(!image){
				alert("이미지를 첨부해주세요");
				return;
			}else{
				console.log(image);
			}
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
			
			
			document.form1.submit();
		});
		
		//$("#freeUpdate").click(function(){
			
		//	$("#myModal${vs.index}").modal("show");
		//});
		
		$("#freeDelete").click(function(){
			if(confirm("삭제하시겠습니까?")==true){
				
			}
		});
		
		$("#file-delete").click(function(e){
            e.preventDefault();
            $("#FBC_CONTENT2").replaceWith( $("#FBC_CONTENT2").clone(true) );
            $("#FBC_CONTENT2").val("");
           
            //deleteFile($("#FBC_CONTENT2").val());
        });

		
		$("input[name=keyword]").keydown(function (key) {
			 
	        if(key.keyCode == 13){
	        	var url = "${contextPath }/freeboard/freeboardList";
				url = url + "?keyword=" + $('#keyword').val();
				location.href = url;
	        }
	    });
		
		$("#posts-tab").click(function(){
			$("#textline").show();
			$("#btnWrite").show();
			$("#images").hide();
		});
		$("#images-tab").click(function(){
			$("#images").show();
			$("#btnWrite").show();
			$("#textline").hide();
		});
		
		$('html').click(function(e) { 
			if(!$(e.target).is(".nav-link active,.nav-link,.form-control,.file-delete,.custom-file-input,.btn-primary")) { 
				$("#btnWrite").hide();
				$("#textline").hide();
				$("#images").hide();
			}
		});
		
		$("select[name=selectview]").change(function(){
			var selectview = $("select[name=selectview]").val();
			var keyword = $("#keyword").val();
			location.href="${contextPath}/freeboard/freeboardList?selectview="+selectview+"&keyword="+keyword;
		})
		
		//무한스크롤
		var lastScrollTop = 0;
		$(window).scroll(function(){
			var currentScrollTop= $(window).scrollTop();
			if(currentScrollTop-lastScrollTop>0){
				if($(window).scrollTop() >= $(document).height() - 1000){
					var lastbno = $(".list-guestbook:last").attr("data-no");
					$.ajax({
						type : 'post',
						url : '${contextPath}/freeboard/freeInfiniteDown?bno='+lastbno+'&${_csrf.parameterName}=${_csrf.token}',
						success : function(data){
							console.log(data);
							if(data != ""){
								$(".productScroll:last").after(data);		
							}
							else{ 
								alert("더 불러올 데이터가 없습니다.");
							}
						}
					});
				}
			}
		});
		
});
</script>
<body style="overflow-x:hidden">
	<%@include file="/WEB-INF/views/includes/publicView/aside.jsp" %>
	<div id="fh5co-main">
		
      <div class="container-fluid gedf-wrapper">
	      <div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<h1 class="gallery-title">요리를 부탁해</h1>
		  </div>
        <div class="row">
            <div class="col-md-8">
            	<div class="scrollLocation">
	            	<!-- 검색창 -->
					<div class="form-group row justify-content-center" style="float: right;">
						<div class="w300" style="padding-left: 400px;padding-right: 20px">
							<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" style="width: 200px; height: 50px;" value="${map.keyword }"/>
						</div>
					</div>
                <!--- \\\\\\\Post-->
                <form name="form1" method="post" action="${contextPath }/freeboard/freeInsert?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
                <div class="card gedf-card" id="showhide">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">글쓰기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="images-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#images">사진</a>
                            </li>
                            <li>
                            	
                            </li>
                        </ul>
                    </div>
                    <div class="card-body"><!-- 이 태그를 폼으로 감싼다 -->
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                <div class="form-group" id="textline" style="display: none">
                                    <label class="sr-only" for="message">post</label>
                                    <textarea class="form-control" id="FBC_CONTENT" name="FBC_CONTENT" rows="3" placeholder="What are you thinking?"></textarea>
                                    <textarea class="form-control" id="FBC_TAG" name="FBC_TAG" rows="1" placeholder="#태그를 입력하세요(태그입력시 한칸 띄워주세요)"></textarea>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                <div class="form-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="FBC_CONTENT2" name="file" accept=".gif, .jpg, .jpeg, .png"><a href='#this' id='file-delete' class="file-delete">삭제</a>
                                    </div>
                                </div>
                                <div class="py-4"></div>
                                <%=request.getRealPath("/") %>
                            </div>
                        </div>
                        <div class="btn-toolbar justify-content-between">
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" id="btnWrite" onsubmit="return false;" style="display: none">올리기</button>
                            </div>
                            <div class="btn-group">
                                <button id="btnGroupDrop1" type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    <i class="fa fa-globe"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="btnGroupDrop1">
                                    <a class="dropdown-item" href="#"><i class="fa fa-globe"></i> Public</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-users"></i> Friends</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-user"></i> Just me</a>
                                </div>
                            </div>
                            <div style="position:relative ; left: 80%">
                            <label>정렬</label>
                            	<select name="selectview">
                            		<option selected="selected"></option>
                            		<option>최신순</option>
                            		<option>인기순</option>
                            		<option>댓글많은순</option>
                            	</select>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
                </div>
                <!-- Post /////-->
				
				
                <!--- \\\\\\\Post-->
                <c:forEach var="list" items="${map.list}" varStatus="vs">
                <div class ="list-guestbook" data-no="${list.bno }">
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
                <!-- Post /////-->
               </div>
        </div>
    </div>
	</div>

	<jsp:include page="/WEB-INF/views/freeboard/freeUpdate.jsp" flush="false"/>
	<jsp:include page="/WEB-INF/views/freeboard/report.jsp" flush="false"/>
	<jsp:include page="/WEB-INF/views/freeboard/freeboardView.jsp" flush="false"/>
	<jsp:include page="/WEB-INF/views/freeboard/freemessage.jsp" flush="false"/>
</body>
</html>