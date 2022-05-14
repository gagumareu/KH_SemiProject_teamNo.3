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
	
		// 회원 정보 불러와서 기입하기
	// xml로 받아오기
	// input_box.text로 this.find.text로 받아온 정보 넣어주기
	
	$("#same").on("click", function() {
		$.ajax({
			url : "/web_project/sameMember.do",
			datatype : "xml",
			data : {name : $("#member_name").val()},
			success : function(data) {
				
				$(data).find("member").each(function() {
					
					$("#order_name").val($(this).find("name").text());
					
					$("#phone1").val($(this).find("phone").text().substring(0, 3));
					$("#phone2").val($(this).find("phone").text().substring(4, 8));
					$("#phone3").val($(this).find("phone").text().substring(9, 13));
					
					 $("#order_addr").val($(this).find("addr").text());
							
				 });
				
			},
			error : function() {
				alert('통신 에러 발생');
			}
		});
	});  // keyup() 함수 end
	
	
	
	
	
});