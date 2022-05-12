/**
 * admin_main js
 */

$(function() {
	
	// 여러 ajax에서 동일하게 사용되는 속성 설정
	$.ajaxSetup({
		// ajax에서 한글 깨짐 문제 해결
		ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type : "post"
	});
	
	// 제품 이미지 가져오기
	function getProducts() {
		$.ajax({
			url : "/SemiProject/admin_main_products.do",
			datatype : "xml",			// 결과 데이터 타입
			success : function(data) {
				// 테이블 태그의 첫번째 행(타이틀(제목) 태그)을 제외하고
				// 나머지 모든 행을 제거하라는 의미.
				// $("#listTable tr:gt(0)").remove();
				
				let result = "";
				alert("aaa");
				alert(data);
				
				$(data).find("product").each(function() {
				
					result += "<div>";
		            
        		    result += "<img src='/SemiProject/image_products" + $(this).find("pimg").text() + "'>";
            		
            		result += "</div>";
					
				});
				
				// 테이블의 첫번째 행의 아래에 table을 추가.
				$(".slider").after(result);
			},
			error:function(request, status, error){
				
				alert('통신 에러 발생');
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			
		});	// ajax의 end
		
	}	// getProducts() 함수 end
	
	getProducts();
	
});