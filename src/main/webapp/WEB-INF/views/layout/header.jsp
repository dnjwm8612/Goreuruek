<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>꼬르륵</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
   content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
   content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />



<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
   href='https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic,700'
   rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
   rel='stylesheet' type='text/css'>

<!-- Animate.css -->
<link rel="stylesheet" href="${contextPath}/resources/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${contextPath}/resources/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="${contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/owl.theme.default.min.css">
<!-- Theme style  -->
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">

<!-- Modernizr JS -->
<script src="${contextPath}/resources/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->

</head>
<body>
<!-- jQuery -->
   <script src="${contextPath}/resources/js/jquery.min.js"></script>
   <!-- jQuery Easing -->
   <script src="${contextPath}/resources/js/jquery.easing.1.3.js"></script>
   <!-- Bootstrap -->
   <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
   <!-- Carousel -->
   <script src="${contextPath}/resources/js/owl.carousel.min.js"></script>
   <!-- Stellar -->
   <script src="${contextPath}/resources/js/jquery.stellar.min.js"></script>
   <!-- Waypoints -->
   <script src="${contextPath}/resources/js/jquery.waypoints.min.js"></script>
   <!-- Counters -->
   <script src="${contextPath}/resources/js/jquery.countTo.js"></script>
   <!-- board -->
   <script src="${contextPath }/resources/js/board.js"></script>


   <!-- MAIN JS -->
   <script src="${contextPath}/resources/js/main.js"></script>
   
   <!-- 1:1문의  -->
   <script>
   		$(document).ready(function(){
   			$("#mswrite").click(function(){
   				location.href="${contextPath}/message/msWrite";
   			});
   			
   			$("#btnSend").click(function(){
				var ms_content = $("#ms_content").val();
				var ms_mmid = $("#ms_mmid").val();
				var ms_mmcode = $("#ms_mmcode").val();
				if (ms_content == "") {
					alert("내용을 입력하세요");
					document.form1.ms_content.focus();
					return;
				}
				alert("1:1문의가 완료되었습니다.");
				
				
   			});
   			$("#btnQna").click(function(){
   				location.href="${contextPath}/qna/qnaMain";
   			});
   		});
   </script>
   <!-- qna/qnaMain -->
   <script>
	   $(document).ready(function(){
			$("#qnaWrite").click(function(){
				location.href="${contextPath}/qna/qnaBoardWrite";
			});
			$("#msMain").click(function(){
				location.href="${contextPath}/message/msMain";
			});
		});
	   function qlist(page){
		   location.href="${contextPath}/qna/qnaMain?curPage="+page+"&searchOption-${qmap.searchOption}"+"&keyword=${qmap.keyword}";
	   }
	   function mlist(page){
		   location.href="${contextPath}/message/msMain?curPage="+page+"&searchOption-${mmap.searchOption}"+"&keyword=${mmap.keyword}";
	   }
   </script>
   <!-- qna/write -->
	<script>
		$(document).ready(function() {
			$("#btnSave").click(function() {
				tinyMCE.triggerSave();
				var qna_title = $("#qna_title").val();
				var qna_content = $("#qna_content").val();
				var qna_mmid = $("#qna_mmid").val();
				var qna_mmcode = $("#qna_mmcode").val();
				if (qna_title == "") {
					alert("제목을 입력하세요");
					document.form1.qna_title.focus();
					return;
				}
				if (qna_content == "") {
					alert("내용을 입력하세요");
					document.form1.qna_content.focus();
					return;
				}
				alert("게시글 작성이 완료되었습니다.");
				
				document.form1.submit();
			});
			$("#btnList").click(function(){
				location.href="${contextPath}/qna/qnaMain?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
			});
		});
	</script>
	
	<!-- qna/view -->
	<script>
		$(document).ready(function(){
			$("#btnDelete").click(function(){
				if(confirm("삭제하시겠습니까?")){
					document.form1.action = "${contextPath}/qna/qnaBoardDelete?${_csrf.parameterName}=${_csrf.token}";
					document.form1.submit();
				}
			});
			$("#btnUpdate").click(function(){
				tinyMCE.triggerSave();
				var qna_title = $("#qna_title").val();
				var qna_content = $("#qna_content").val();
				var qna_mmid = $("#qna_mmid").val();
				var qna_mmcode = $("#qna_mmcode").val();
				
				if(qna_title == ""){
					alert("제목을 입력하세요");
					document.form1.qna_title.focus();
					return;
				}
				if(qna_content == ""){
					alert("내용을 입력하세요");
					document.form1.qna_content.focus();
					return;
				}
				document.form1.action="${contextPath}/qna/qnaBoardUpdate?${_csrf.parameterName}=${_csrf.token}";
				document.form1.submit();
			});
			$("#btnEdit").click(function(){
				location.href="${contextPath}/qna/qnaBoardEdit?qna_code=${qna.qna_code}&curPage=${qmap.qnaPager.curPage}&searchOption=${qmap.searchOption}&keyword=${qmap.keyword}";
			});
			$("#btnList").click(function(){
				location.href="${contextPath}/qna/qnaMain?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
			});
		});
	</script>
	<!-- message/msView -->

	<script>
		$(document).ready(function(){
			
			msrlist("1");
			//msrlist2();
			
			/*$("#btnReply").click(function(){
				var msr_content=$("#msr_content").val();
				var msr_msmmid=$("#msr_msmmid").val();
				var msr_msmmcode=$("#msr_msmmcode").val();
				var msr_mscode="${ms.ms_code}"
				var param="msr_content="+msr_content+"&msr_mscode="+msr_mscode+"msr_msmmid="+msr_msmmid+"msr_msmmcode="+msr_msmmcode;
				$ajax({
					type: "POST",
					url: "${contextPath}/message/msrinsert",
					data: param,
					success: function(response){
						alert("답변이 등록되었습니다.");
						msrlist();
						
					}
				});
				document.form1.submit();
			});*/
			$("#btnReply").click(function(){
				
				replyJson();
				
			});
		});
		function replyJson(){
			var msr_content=$("#msr_content").val();
			var msr_msmmid=$("#msr_msmmid").val();
			var msr_msmmcode=$("#msr_msmmcode").val();
			var msr_mscode="${ms.ms_code}"
			$.ajax({
				type: "post",
				url: "${contextPath}/message/insertRest?${_csrf.parameterName}=${_csrf.token}",
				headers:{
					"Content-Type" : "application/json"
				},
				dateType: "text",
				data: JSON.stringify({
					msr_mscode : msr_mscode,
					msr_content : msr_content,
					msr_msmmcode : msr_msmmcode,
					msr_msmmid : msr_msmmid
				}),
				success: function(){
					alert("답변이 등록되었습니다.");
					msrlist("1");
				}
			});
		}
		function msrlist(){
			$.ajax({
				type: "get",
				url: "${contextPath}/message/msrlist?msr_mscode=${ms.ms_code}",
				success: function(result){
					$("#msrlist").html(result);
				}
			});
		}
		function msrlist2(){
			$.ajax({
				type: "get",
				url: "${contextPath}/message/msrlistJson?msr_mscode=${ms.ms_code}",
				succese: function(result){
					console.log(result);
					var output = "<table>";
					for(var i in result){
						output += "<tr>";
						output += "<td>"+result[i].msr_msmmid;
						output += "("+changeDate(result[i].msr_date)+")<br>";
						output += result[i].msr_content+"</td>";
						output += "<tr>";
					}
					output += "</table>";
					$("#msrlist").html(output);
				}
			});
		}
		function changeDate(date){
			date = new Date(parseInt(date));
			year = date.getFullYear();
			month = date.getMonth();
			day = date.getDate();
			hour = date.getHours();
			minute = date.getMinutes();
			second = date.getSeconds();
			strDate = year+"-"+month+"-"+day+" "+horu+":"+minute+":"+second;
			return strDate;
		}
	</script>
</body>
</html>