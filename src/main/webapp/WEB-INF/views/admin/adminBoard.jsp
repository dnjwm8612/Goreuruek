<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<html>

<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	.custom-table{border-collapse:collapse;width:100%;border:solid 1px #c0c0c0;font-family:open sans;font-size:11px}
            .custom-table th,.custom-table td{text-align:left;padding:8px;border:solid 1px #c0c0c0}
            .custom-table th{color:#000080}
            .custom-table tr:nth-child(odd){background-color:#f7f7ff}
            .custom-table>thead>tr{background-color:skyblue!important}
            .tbtn{border:0;outline:0;background-color:transparent;font-size:13px;cursor:pointer}
            .toggler{display:none}
            .toggler1{display:table-row;}
            .custom-table a{color: #0033cc;}
            .custom-table a:hover{color: #f00;}
            .page-header{background-color: #eee;}
</style>
<script>
$(document).ready(function () {
    $(".tbtn").click(function () {
        $(this).parents(".custom-table").find(".toggler1").removeClass("toggler1");
        $(this).parents("tbody").find(".toggler").addClass("toggler1");
        $(this).parents(".custom-table").find(".fa-minus-circle").removeClass("fa-minus-circle");
        $(this).parents("tbody").find(".fa-plus-circle").addClass("fa-minus-circle");
    });
});
</script>
<body>
<%@include file="/WEB-INF/views/includes/publicView/Adminaside.jsp" %>
<div id="fh5co-main">

<!------ Include the above in your HEAD tag ---------->

       
<div class="container">
		<h1>게시판 관리</h1>
        <table class="custom-table">
            <thead>
                <tr>
                	<th>게시판 코드</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>작성 날짜</th>
                    <th>조회수</th>
                    <th>좋아요</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="20" class="page-header"><button type="button" class="tbtn"><i class="fa fa-plus-circle fa-minus-circle"></i>   <b>FreeBoard</b></button> </td>
                </tr>
                <c:forEach var="free" items="${free}" varStatus="vs">
                <tr class="toggler toggler1">
                    <td><a href="${contextPath }/freeboard/freeboardList?keyword=${free.FBC_CONTENT }">${free.FB_CODE }</a></td>
                    <td>-</td>
                    <td>${free.FB_MMID }</td>
                    <td>${free.FBC_CONTENT }</td>
                    <td>${free.FB_DATE }</td>
                    <td>-</td>
                    <td>${free.FB_LIKES }</td>
                </tr>
                </c:forEach>
            </tbody>
            <tbody>
                <tr>
                    <td colspan="20" class="page-header"><button type="button" class="tbtn"><i class="fa fa-plus-circle"></i>    <b>Recipe</b></button></td>
                </tr>
                <c:forEach var="recipe" items="${recipe}" varStatus="vs">
                <tr class="toggler">
                    <td><a href="${contextPath }/recipe/recipeView?RC_CODE=${recipe.RC_CODE}">${recipe.RC_CODE }</a></td>
                    <td>${recipe.RC_TITLE }</td>
                    <td>${recipe.RC_MMID }</td>
                    <td>${recipe.RC_INFORMATION }</td>
                    <td>${recipe.RC_DATE }</td>
                    <td>${recipe.RC_VIEWCNT }</td>
                    <td>${recipe.RC_LIKES }</td>
                </tr>     
                </c:forEach>          
            </tbody>
            <tbody>
                <tr>
                    <td colspan="20" class="page-header"><button type="button" class="tbtn"><i class="fa fa-plus-circle"></i>   <b>Tip</b></button></td>
                </tr>
                <c:forEach var="tip" items="${tip}" varStatus="vs">
                <tr class="toggler">
                    <td><a href="${contextPath }/tip/getTipBoardContent?t_code=${tip.t_code }">${tip.t_code }</a></td>
                    <td>${tip.t_title }</td>
                    <td>${tip.t_mmid }</td>
                    <td>--</td>
                    <td>${tip.t_date }</td>
                    <td>${tip.t_view }</td>
                    <td>${tip.t_likes }</td>                    
                </tr>  
                </c:forEach>            
            </tbody>
            <tbody>
                <tr>
                    <td colspan="20" class="page-header"><button type="button" class="tbtn"><i class="fa fa-plus-circle"></i>   <b>qna</b></button></td>
                </tr>
                <c:forEach var="qna" items="${qna}" varStatus="vs">
               <tr class="toggler">
                    <td><a href="${contextPath }/qna/qnaBoardView?qna_code=${qna.qna_code}">${qna.qna_code }</a></td>
                    <td>${qna.qna_title }</td>
                    <td>${qna.qna_mmid }</td>
                    <td>${qna.qna_content }</td>
                    <td>${qna.qna_date }</td>
                    <td>-</td>
                    <td>-</td>    
                </tr>
                </c:forEach>                
            </tbody>
        </table>
</div>
</div>
</body>
</html>