/**
 * 
 */

$(function() {
	
	// 여러 ajax에서 동일하게 사용되는 속성 설정
	$.ajaxSetup({
		// ajax에서 한글 깨짐 문제 해결
		ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type : "post"
	});
	
	// 아이디 중복 여부 확인
	$("#idcheck_btn").on("click", function() {
		$.ajax({
			url : "idCheck.do",
			datatype : "text",
			data : {id : $("#userId").val()},
			success : function(data) {
				$("#idcheck").html(data);
			},
			error : function() {
				alert('통신 에러 발생');
			}
		});
	});  // keyup() 함수 end
	
	// 아이디 중복 여부 확인
	$("#same").on("click", function() {
		$.ajax({
			url : "sameMember.do",
			datatype : "text",
			data : {name : $("#member_name").val()},
			success : function(data) {
				$("#order_name").html(data);
			},
			error : function() {
				alert('통신 에러 발생');
			}
		});
	});  // keyup() 함수 end
	
	
	
	
	
});