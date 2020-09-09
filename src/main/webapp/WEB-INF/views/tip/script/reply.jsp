<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<script>

var t_code = '${Content1.t_code}';  //게시글 번호

$(document).ready(function() {

	commentList(); //페이지 로딩 시 댓글 목록 출력
	
	$('#btnSend').click(function(){  //댓글 등록 버튼 클릭시 함수 호출
		console.log("댓글등록");
		var insertData = $('[name=replyForm]').serialize();    //replyForm의 내용을 가져옴
		console.log(insertData);
	    commentInsert(insertData);  //Insert 함수 호출	
	});
});

//댓글 등록
function commentInsert(insertData) {
	$.ajax({
		url  : "${contextPath}/tip/insertReply?${_csrf.parameterName}=${_csrf.token}",
		type : "POST",
		data : insertData,
		success : function(data) {
			if(data == 1) {
				commentList();   //댓글 작성 후 댓글이 있으면 함수 호출
				$('[name=tr_content]').val('');
			}
		}
	});	
}

//댓글 목록
function commentList() {
	$.ajax({
		url : "${contextPath}/tip/selectReply?${_csrf.parameterName}=${_csrf.token}",
		type : "GET",
		data : {'tr_tcode' : t_code},
		success : function(data) {
			var a = '';
			$.each(data, function(key, value) {
				a += '<div style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
				a += '<div class="commentInfo'+value.tr_code+'">'+'댓글번호 : '+value.tr_code+' / 작성자 : '+value.tr_tmmid;
                //a += '<a onclick="commentUpdate('+value.tr_code+',\''+value.tr_content+'\');"> 수정 </a>';
                a += '<a style="cursor:hand"; onclick="commentDelete(\''+value.tr_code+'\');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.tr_code+'"> <p> 내용 : '+value.tr_content +'</p>';
                a += '</div></div>';
			});
			
			$(".commentList").html(a);
		}		
	});
	
}


//댓글 수정  - 댓글 내용 출력을 input 폼으로 변경

/* 	function commentUpdate(tr_code, tr_content) {
		var a = '';

		a += '<div class="input-group">';
		a += '<input type="text" class="form-control" name="content_'+tr_code+'" value="'+tr_content+'"/>';
		a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('
				+ tr_code + ');">수정</button> </span>';
		a += '</div>';

		$('.commentContent' + tr_code).html(a);
	}

	//댓글 수정
	function commentUpdateProc(tr_code) {

		var updateContent = $('[name=tr_content_' + tr_code + ']').val();

		$.ajax({
			url : '${contextPath}/tip/updateReply',
			type : 'POST',
			data : {
				'tr_content' : updateContent,
				'tr_code' : tr_code
			},
			success : function(data) {
				if (data == 1)
					commentList(tr_code); //댓글 수정 후 목록 출력
			}
		});
	} */

	//댓글 삭제
	function commentDelete(tr_code) {
		console.log(tr_code);
		$.ajax({
			url : "${contextPath}/tip/deleteReply?${_csrf.parameterName}=${_csrf.token}",
			type : "POST",
			data : {'tr_code' : tr_code},
			success : function(data) {
				if (data == 1)
					commentList(tr_code); //댓글 삭제 후 목록 출력
			}
		});
	}

	
</script>
</body>
</html>