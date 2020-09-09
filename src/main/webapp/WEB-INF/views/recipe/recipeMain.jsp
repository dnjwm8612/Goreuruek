<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<html>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<style>
	.btn_write{background-color: #FA5858; color:white; border-radius: 9px}
	select {
    width: 200px; /* 원하는 너비설정 */
    padding: .8em .5em; /* 여백으로 높이 설정 */
    font-family: inherit;  /* 폰트 상속 */
    background: url('${contextPath }/resources/images/select_arrow.png') no-repeat 95% 50%; /* 네이티브 화살표를 커스텀 화살표로 대체 */
    border: 1px solid #999;
    border-radius: 0px; /* iOS 둥근모서리 제거 */
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
	}
	@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);
figure.snip1283 {
  font-family: 'Raleway', Arial, sans-serif;
  color: #fff;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 230px;
  max-width: 315px;
  max-height: 220px;
  width: 100%;
  color: #ffffff;
  text-align: left;
  background-color: #07090c;
  font-size: 16px;
  -webkit-perspective: 50em;
  perspective: 50em;
}
figure.snip1283 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.6s ease;
  transition: all 0.6s ease;
}
figure.snip1283 img {
  opacity: 1;
  width: 100%;
  -webkit-transform-origin: 50% 0%;
  -ms-transform-origin: 50% 0%;
  transform-origin: 50% 0%;
}
figure.snip1283 figcaption {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  width: 100%;
  -webkit-transform: rotateX(90deg);
  transform: rotateX(90deg);
  -webkit-transform-origin: 50% 100%;
  -ms-transform-origin: 50% 100%;
  transform-origin: 50% 100%;
  z-index: 1;
  opacity: 0;
  padding: 20px 30px;
}
figure.snip1283 h3,
figure.snip1283 p {
  line-height: 1.5em;
}
figure.snip1283 h3 {
  margin: 0;
  font-weight: 800;
  text-transform: uppercase;
}
figure.snip1283 p {
  font-size: 0.8em;
  font-weight: 500;
  margin: 0 0 15px;
}
figure.snip1283 .read-more {
  border: 2px solid #ffffff;
  padding: 0.5em 1em;
  font-size: 0.8em;
  text-decoration: none;
  color: #ffffff;
  display: inline-block;
}
figure.snip1283 .read-more:hover {
  background-color: #ffffff;
  color: #000000;
}
figure.snip1283:hover img,
figure.snip1283.hover img {
  -webkit-transform: rotateX(-90deg);
  transform: rotateX(-90deg);
  opacity: 0;
}
figure.snip1283:hover figcaption,
figure.snip1283.hover figcaption {
  -webkit-transform: rotateX(0deg);
  transform: rotateX(0deg);
  opacity: 1;
  -webkit-transition-delay: 0.2s;
  transition-delay: 0.2s;
}

</style>
<script>
$(function(){
	$(".btn_write").click(function(){
		if(<%=name=="anonymousUser"%>){
			if(confirm("로그인 후 이용가능합니다")==true){
				location.reload();
				return;
			}else{return;}
		}
		location.href="${contextPath}/recipe/recipeWrite";
	});
	
	$("#category").click(function(){
		$("#categorytab").toggleClass("show");
	});
	$("#tabhide").click(function(){
		$("#categorytab").toggleClass("show");
	});
	
	$("input[name=keyword]").keydown(function (key) {	 
        if(key.keyCode == 13){
        	var url = "${contextPath }/recipe/recipeList";
			url = url + "?keyword=" + $('#keyword').val();
			location.href = url;
        }
    });
	$("input[name=keyword2]").keydown(function (key) {	 
        if(key.keyCode == 13){
        	var url = "${contextPath }/recipe/recipeList";
			url = url + "?keyword=" + $('#keyword2').val()+"&RC_KINDS="+$('select[name=RC_KINDS]').val()+"&RC_SITUATION="+$('select[name=RC_SITUATION]').val()+"&RC_MATERIAL="+$('select[name=RC_MATERIAL]').val()+"&RC_WAYS="+$('select[name=RC_WAYS]').val();
			location.href = url;
        }
    });
	$("#views").click(function(){$("div").remove("#pager");});
	$("#releasedate").click(function(){$("div").remove("#pager");});
	$("#popular").click(function(){$("div").remove("#pager");});
	$("#comments").click(function(){$("div").remove("#pager");});
});

function list(num){
	var RC_KINDS = document.getElementsByName('RC_KINDS').value;
	var RC_SITUATION = document.getElementsByName('RC_SITUATION').value;
	var RC_MATERIAL = document.getElementsByName('RC_MATERIAL').value;
	var RC_WAYS = document.getElementsByName('RC_WAYS').value;
	var keyword = document.getElementById('keyword').value;
	var keyword2 = document.getElementById('keyword2').value;
	var releasedate = "${map.rs.releasedate}";
	var views = "${map.rs.views}";
	var popular = "${map.rs.popular}";
	var comments = "${map.rs.comments}";
	if(releasedate != "" && releasedate != null){
		location.href="${contextPath }/recipe/recipeList?curPage="+num+"&keyword="+keyword+"&RC_KINDS="+RC_KINDS+"&RC_SITUATION="+RC_SITUATION+"&RC_MATERIAL="+RC_MATERIAL+"&releasedate="+releasedate;	
	}else if(views != ""&& views != null){
		location.href="${contextPath }/recipe/recipeList?curPage="+num+"&keyword="+keyword+"&RC_KINDS="+RC_KINDS+"&RC_SITUATION="+RC_SITUATION+"&RC_MATERIAL="+RC_MATERIAL+"&views="+views;	
	}else if(popular != ""&& popular != null){
		location.href="${contextPath }/recipe/recipeList?curPage="+num+"&keyword="+keyword+"&RC_KINDS="+RC_KINDS+"&RC_SITUATION="+RC_SITUATION+"&RC_MATERIAL="+RC_MATERIAL+"&popular="+popular;	
	}else if(comments != ""&& comments != null){
		location.href="${contextPath }/recipe/recipeList?curPage="+num+"&keyword="+keyword+"&RC_KINDS="+RC_KINDS+"&RC_SITUATION="+RC_SITUATION+"&RC_MATERIAL="+RC_MATERIAL+"&comments="+comments;	
	}else{
		location.href="${contextPath }/recipe/recipeList?curPage="+num+"&keyword="+keyword+"&RC_KINDS="+RC_KINDS+"&RC_SITUATION="+RC_SITUATION+"&RC_MATERIAL="+RC_MATERIAL;
	}
	
}
</script>
<body>
<%@include file="/WEB-INF/views/includes/publicView/aside.jsp" %>

		<div id="fh5co-main">
			<div class="container">
				<div class="row" id="recipeMain">
					<div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h1 class="gallery-title">먹스타그램</h1>
					</div>
					<img id="category" src="${contextPath }/resources/images/plusse.png" style="width: 1.5%;position:absolute;right:12%;top:44px;cursor: pointer;">
					<div class="form-group row justify-content-center" style="position:absolute;left: 55%; ">
							<div class="w300" style="padding-left: 400px;padding-right: 20px">
								<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" style="width: 200px; height: 40px;" value="${map.rs.keyword }"/>
							</div>
					</div>
					<div align="center">
						<button class="btn btn-default filter-button" id="releasedate" data-filter="releasedate" value="최신순">최신순</button>
						<button class="btn btn-default filter-button" id="views" data-filter="views" value="조회순">조회순</button>
						<button class="btn btn-default filter-button" id="popular" data-filter="popular" value="인기순">인기순</button>
						<button class="btn btn-default filter-button" id="comments" data-filter="comments" value="댓글순">댓글순</button>						
					</div>
					<div style="display: none;" id="categorytab">
					<table class="table table-bordered">
					<caption style="color: #ff727b;">[카테고리 검색]</caption>
					<tr>
						<td><label>종류:</label> 
											<select name="RC_KINDS">
												<option selected="${map.rs.RC_KINDS }"></option>
												<option>반찬</option>
												<option>국/탕/찌개</option>
												<option>면/만두</option>
												<option>밥/떡/죽</option>
												<option>양식</option>
												<option>퓨전</option>
												<option>음료/술</option>
												<option>디저트</option>
											</select></td>
						<td><label>상황:</label> 
											<select name="RC_SITUATION">
												<option selected="${map.rs.RC_SITUATION }"></option>
												<option>일상</option>
												<option>초스피드</option>
												<option>손님접대</option>
												<option>다이어트/영양식</option>
												<option>간식/야식</option>
												<option>명절</option>
												<option>술안주/해장</option>
											</select></td>
						<td><label>재료:</label> 
											<select name="RC_MATERIAL">
												<option selected="${map.rs.RC_MATERIAL }"></option>
												<option>소고기</option>
												<option>돼지고기</option>
												<option>닭고기</option>
												<option>해물류</option>
												<option>달걀</option>
												<option>곡류</option>
												<option>과일류</option>
												<option>기타</option>
											</select></td>
						<td><label>방법:</label> 
											<select name="RC_WAYS">
												<option selected="${map.rs.RC_WAYS }"></option>
												<option>볶음</option>
												<option>끓이기</option>
												<option>부침</option>
												<option>조림</option>
												<option>무침</option>
												<option>비빔</option>
												<option>튀김</option>
												<option>삶기</option>
												<option>굽기</option>
												<option>회</option>
												<option>기타</option>
											</select></td>
					</tr>		
					<tr>
					<td colspan="4" align="center">SEARCH<input type="text" class="form-control form-control-sm" name="keyword2" id="keyword2" style="width: 200px; height: 40px;" value="${map.rs.keyword }"/>
						<b id="tabhide" style="color: #ff727b;float: right;cursor: pointer;">[닫기]</b>	
					</td>
					</tr>				
					</table>
					</div>
					
					<br />
					<div id="adddiv"></div>
					<c:forEach var="list" items="${map.list}" varStatus="vs">
						<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter releasedate" id="listview${vs.index}">
							<figure class="snip1283">
							  <img src="..${list.RCC_SOURCE}" class="img-responsive" style="width:353px; height: 210px ">
							  <figcaption>
							    <h3 style="color: white">${list.RC_MMID }</h3>
							    <p>${list.RC_TITLE }</p>
							    <p>조회수: ${list.RC_VIEWCNT }  좋아요: ${list.boardlike }</p>
							    <a href="${contextPath }/recipe/recipeView?RC_CODE=${list.RC_CODE}" class="read-more">자세히 보기</a>
							  </figcaption>							  
							</figure>
						</div>
						
					<script>
					$(function(){
						$(".hover").mouseleave(
					    	    function () {
					    	      $(this).removeClass("hover");
					    	    }
					    );
						
						$("#views").click(function(){
							var views = $("#views").val();
							var keyword = $("#keyword").val();	
							location.href= '${contextPath}/recipe/recipeList?views='+views+'&keyword='+keyword;
						});
						$("#releasedate").click(function(){
							var releasedate = $("#releasedate").val();
							var keyword = $("#keyword").val();
							location.href='${contextPath}/recipe/recipeList?releasedate='+releasedate+'&keyword='+keyword;
	
						})
						$("#popular").click(function(){
							var popular = $("#popular").val();
							var keyword = $("#keyword").val();	
							location.href='${contextPath}/recipe/recipeList?popular='+popular+'&keyword='+keyword;
						})
						//댓글 작성후 하기
						$("#comments").click(function(){
							var comments = $("#comments").val();
							var keyword = $("#keyword").val();	
							location.href='${contextPath}/recipe/recipeList?comments='+comments+'&keyword='+keyword;
						})
					});
					</script>
					</c:forEach>
					<div style="float: right;"><button class="btn_write" id="btn_write">게시물 작성하기</button></div>
					
					<div id="pager" align="center">
					<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
	                <c:if test="${map.boardPager.curBlock > 1}">
	                    <a href="javascript:list('1')">[처음]</a>
	                </c:if>
	                
	                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
	                <c:if test="${map.boardPager.curBlock > 1}">
	                    <a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
	                </c:if>
	                
	                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
	                <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
	                    <!-- **현재페이지이면 하이퍼링크 제거 -->
	                    <c:choose>
	                        <c:when test="${num == map.boardPager.curPage}">
	                            <span style="color: red">${num}</span>&nbsp;
	                        </c:when>
	                        <c:otherwise>
	                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                
	                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
	                <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
	                    <a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
	                </c:if>
	                
	                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
	                <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
	                    <a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
	                </c:if>
	                </div>
	                
				</div>
			</div>
			<div class="mainfooter">
				<div class="teamLog">
					<img src="${contextPath }/resources/images/g-icon.png" style="width: 250px; height: 200px">
				</div>
				<div class="teamPlanation">
					<ul class="list-unstyled">
						<li><p>
								<a href="#">꼬르륵</a>
							</p></li>
						<li><p>이메일</p></li>
						<li>© Copyright Goreuruek All Rights Reserved.</li>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>