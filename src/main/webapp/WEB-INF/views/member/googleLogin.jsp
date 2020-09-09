<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="/goreureuk/resources/js/jquery.form.min.js"></script>
</head>
	<body>
		<form action="https://www.googleapis.com/oauth2/v4/token" method="post"
		enctype="application/x-www-form-urlencoded">
		
			<div style="display: none;">
			code : <input type="text" name="code" value ="<%=request.getParameter("code")%>"><br>
			client_id : <input type="text" name="client_id" value ="445169890388-51aa63k12p7nkcnhhqdk6dil5p236l5a.apps.googleusercontent.com"><br>
			client_secret : <input type="text" name="client_secret" value ="61bVZ-xBwoaumv6etWyfKb8p"><br>
			redirect_uri : <input type="text" name="redirect_uri" value ="http://localhost/goreureuk/member/googleLogin"><br>
			grant_type : <input type="text" name="grant_type" value ="authorization_code"><br>
			</div>
		<input type="submit"  value="로그인">
		</form>
	</body> 
	<script type="text/javascript">
	$(function(){
		
	$("input[type=submit]").click(function(e){
			e.preventDefault();
			var json = new Object();
			json.code =  "<%=request.getParameter("code")%>";
			json.client_id = "445169890388-51aa63k12p7nkcnhhqdk6dil5p236l5a.apps.googleusercontent.com";
			json.client_secret = "61bVZ-xBwoaumv6etWyfKb8p";
			json.redirect_uri = "http://localhost/goreureuk/member/googleLogin";
			json.grant_type =  "authorization_code";
			$.ajax({

			    url: "https://www.googleapis.com/oauth2/v4/token",
			    type: "POST",
			    enctype: "application/x-www-form-urlencoded",
			    data: json,
			    success: function(data){
			    	console.log(data.access_token);
			    	$.ajax({
			    		url:"https://www.googleapis.com/drive/v3/about",
			    		type:"GET",
			    		data:{"access_token":data.access_token,
			    			"scope":"https://www.googleapis.com/auth/drive,https://www.googleapis.com/auth/drive",
			    			"fields":"user"},
			    			success:function(user){
			    				reqListener(user);
			    			},
			    			error:function(){
			    				alert("실패함 ;ㅅ;");
			    			}
			    	})
			    },

			    error: function (request, status, error){        
					alert(error);
			    }

			  });
		});
	});
		function reqListener (user) {
				//var response = JSON.parse(this.responseText);
			  console.log(user);
			 
			  var displayName = user.user.displayName;
			  var emailAddress = user.user.emailAddress;
			  console.log(displayName);
			  console.log(emailAddress);
			  location.href="${contextPath}/member/comparewithDB?displayName="+displayName+"&emailAddress="+emailAddress;
			  
			}

			
		
	
	</script>
</html>