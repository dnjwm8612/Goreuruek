<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<%@include file="/WEB-INF/views/includes/publicView/mainContext.jsp" %>
<html>
<%@include file="/WEB-INF/views/includes/publicView/header.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<body>
<%@include file="/WEB-INF/views/includes/publicView/Adminaside.jsp" %>
<div id="fh5co-main">
<!-- 신고화면 -->

<!------ Include the above in your HEAD tag ---------->

       
        <div id="fullscreen_bg" class="fullscreen_bg"/>
 <form class="form-signin">
<div class="container">
    <div class="row">
        <div class="col-md-7 col-md-offset-2">
        
        <div class="panel panel-default">
        
        <div class="panel panel-primary">
        
            
            <div class="text-center">
                <h3 style="color:#2C3E50" >신고 관리</h3>
                <h4> <label for="Choose Report"  style="color:#E74C3C">Choose Report</label></h4>         
                
                                
                                <div class="customer" >
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                        <input type="date" class="form-control" placeholder="Date" />
                                    </div>
                                </div>
                </br><button type="button" class="btn btn-primary btn-lg btn3d"><span class="glyphicon glyphicon-search"></span> View</button> 
            </div>                 
        <div class="panel-body">    
 
  <table class="table table-striped table-condensed">
                  <thead>
                  <tr>
                      <th class="text-center" width="115px">신고유저</th>
                      <th class="text-center" width="115px">내용</th>
                      <th class="text-center" width="115px">신고한 유저</th>
                      <th class="text-center" width="115px">신고 날짜</th>
                      <th class="text-center" width="115px">처리 결과</th>
                  </tr>
              </thead>   
              <tbody>
              <c:forEach var="report" items="${report}" varStatus="vs">
              <script>
					$(function(){
						$("#btntr${vs.index }").click(function(){
							var banid = "${report.BL_MMID }";
							if(confirm("정지 하시겠습니까?")==true){
								$.ajax({                
					                type: "post",
					                url: "${contextPath}/admin/adminReportReuslt?MM_ID="+banid+"&${_csrf.parameterName}=${_csrf.token}",
					                success: function(){
					                    alert("처리 완료.");
					                    $("#banresult${vs.index }").html("정지");
					                }
					            });
							}
						});
					});
				</script>
                <tr id="btntr${vs.index }" style="cursor: pointer;">
                    <td class="text-center" width="150px">${report.BL_MMID }</td>
                    <td class="text-center" width="150px">${report.BL_REASON }</td>
                    <td class="text-center" width="150px">${report.BL_REPORTER }</td>
                    <td class="text-center" width="150px">${report.BL_DATE }</td>
                    <td class="text-center" width="150px" id="banresult${vs.index }">-</td>
                </tr>
              </c:forEach>
              </table>    
  </div>
       </div>
        </div>
   </div></div></div>

</form>
</div>
</body>
</html>