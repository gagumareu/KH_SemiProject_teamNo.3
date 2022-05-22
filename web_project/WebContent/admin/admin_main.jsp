<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<jsp:include page="../include/admin_top.jsp" />
<head>


<style type="text/css">
      .slider img {
        width: 250px;
        height: 250px;
      }
      
      .slider a:active{
         border: 4px dashed #bcbcbc; !important;
      }
      
      .slider img:active{
         border: none !important;
      }
      .slider {
        width: 100%;
        margin-left: 30px;
      }
      .slider .slick-slide {
        margin: 5px;
      }
      .slick-prev:before, .slick-next:before {
        color: #444444;
      }
</style>

<script type="text/javascript">
$(document).ready(function() {
    $('.slider').slick( {
      autoplay: true,
      autoplaySpeed: 1500,
      slidesToShow: 4,
      slidesToScroll: 1,
    });
  });
</script>
</head>
<body>
		<input type="hidden" id="path" value="<%=request.getContextPath() %>">


		<div class="col-sm-9 col-sm-offset-2">
			<div class="page-header">
				<span style="font-size:20px;">A.P.C Products</span>
				<a href="<%=request.getContextPath() %>/admin_products_list.do" style="float:right; font-size:16px; color:black;">
					<img src="<%=request.getContextPath() %>/img/plus.png">&nbsp;more
				</a>
			</div>
		    
			<div class="slider">
				<c:set var="list" value="${productList }"/>
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<div>
						<a href="<%=request.getContextPath() %>/admin_products_update.do?no=${dto.getPno() }">
							<img src="<%=request.getContextPath() %>/upload${dto.getPimage() }">
						</a>
						</div>
					</c:forEach>
				</c:if>

			</div>
		</div>
	<br>

	<div class="row">
		<div class="col-sm-5 col-sm-offset-2">
          <div class="page-header" style="margin-left:30px;">
			&nbsp;&nbsp;<span style="font-size:18px;">공지사항</span>
			<a href="<%=request.getContextPath() %>/admin_notice.do" style="float:right; font-size:16px; color:black;">
				<img src="<%=request.getContextPath() %>/img/plus.png">&nbsp;more
			</a>
		  </div>

		  <div style="margin-left:30px;">
		  <c:set var="list2" value="${noticeList }"/>
				<c:if test="${!empty list2 }">
				<table class="table table-bordered" align="cneter">
					<colgroup>
						<col width="80%">
						<col width="20%">
					</colgroup>
					<c:forEach items="${list2 }" var="dto2">
						<tr>
							<td>
								<a href="<%=request.getContextPath() %>/admin_notice_content.do?no=${dto2.getNotice_no() }&page=1">
									${dto2.getNotice_title() }
								</a>
							</td>
							
							<td style="text-align:center;">
								${dto2.getNotice_date().substring(0,10) }
							</td>
						</tr>
						
					</c:forEach>
				</table>
			</c:if>
			</div>	
        </div>
      
        <div class="col-sm-4" style="margin-left:30px;">
          <div class="page-header">
			&nbsp;<span style="font-size:18px;">고객 Q&A</span>
			<a href="<%=request.getContextPath() %>/admin_qa.do" style="float:right; font-size:16px; color:black;">
				<img src="<%=request.getContextPath() %>/img/plus.png">&nbsp;more
			</a>
		  </div>
		  
		  
		  <div>
		  <c:set var="list3" value="${qaList }"/>
				<c:if test="${!empty list3 }">
				<table class="table table-bordered" align="cneter">
					<colgroup>
						<col width="80%">
						<col width="30%">
					</colgroup>
					<c:forEach items="${list3 }" var="dto3">
						<tr>
							<td>
							
								<a href="<%=request.getContextPath() %>/admin_qa_content.do?no=${dto3.getQa_no() }&page=1">
							
							 
									${dto3.getQa_title() }
								</a>
							</td>
							
							<td style="text-align:center;">
								${dto3.getQa_date().substring(0,10) }
							</td>
						</tr>
						
					</c:forEach>
				</table>
			</c:if>
			</div>	
			
        </div>      
      </div>
    

    
  </body>
</html>