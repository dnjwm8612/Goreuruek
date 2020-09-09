<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
$(document).ready(function() {	

	var heartval = ${heart};

	if(heartval > 0) {
		console.log(heartval);
		$("#heart").prop("src", "${contextPath }/resources/images/like2.png");
		$(".heart").prop('name', heartval);
	} else {
		console.log(heartval);
		$("#heart").prop("src", "${contextPath }/resources/images/like1.png");
		$(".heart").prop('name', heartval);
	}			

	$("#heart").on("click", function() {

		var that = $(".heart");

		var sendData = {'tl_tcode' : '${Content1.t_code}', 'heart': that.prop('name')};
		$.ajax({
			url : "${contextPath}/tip/heart?${_csrf.parameterName}=${_csrf.token}",
			type : "POST",
			data : sendData,
			success : function(data) {
				if(data == 1) {
					$('#heart').prop("src", "${contextPath }/resources/images/like2.png");
				} else {
					$('#heart').prop("src", "${contextPath }/resources/images/like1.png");
				}
			}
		});
	});	
});

</script>
</body>
</html>