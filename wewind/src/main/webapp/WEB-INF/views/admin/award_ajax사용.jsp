<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
#table_style {
	background-color: #eeeeee;
	text-align: center;
}
</style>
<title>서현 #39 바람개비 수상내역</title>
</head>
<body>

	<h1 align="center">
		<b id ="be">바람개비 수상내역</b>
	</h1>
<script>

$("#be").click(function(){
	alert("${awardList}");
});
</script>
	<div class="container-fluid">

		<div class='col-md-2' align="center">

			<table class="table"
				style="text-align: center; border: 1px; width: 80%; padding: 50px">
				<tr>
					<th id="table_style">관리자탭</th>
				<tbody>
					<tr>
						<td><a href="38_activity_admin.jsp"> 활동 내역 </a></td>
					</tr>
					<tr>
						<td><a href="39_award_admin.jsp">수상 내역</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="container">
		<div class="row">

			<a class="btn btn-warning pull-right" type="button"
				data-toggle="modal" data-target="#regist">등록</a> <br> <br>
			<table class="table" style="text-align: center; border: 1px">
				<thead>
					<tr>
						<th id="table_style" style="width: 10%">No</th>
						<th id="table_style" style="width: 20%">바람개비명</th>
						<th id="table_style" style="width: 45%">수상내역</th>
						<th id="table_style" style="width: 15%"></th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${awardList}" var="award">
						<tr>
							<td>${award.a_no}</td>
							<td>${award.b_name}</td>
							<td>${award.b_content}</td>
							<td><button class="btn btn-primary" type="button"
									data-toggle="modal" data-target="#edit${award.a_no}">수정</button>
								<button class="btn btn-danger" type="button" data-toggle="modal"
									data-target="#delete">삭제</button></td>
						</tr>

					</c:forEach>


				</tbody>

			</table>

		</div>
	</div>
	<!-- Pagination -->
	<nav aria-label="Page navigation" style="text-align: center">
		<ul class="pagination">
			<li><a href="#" aria-label="Previous"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>



	<!-- 등록 Modal -->
	<div class="modal fade" id="regist" role="dialog">
		<div class="modal-dialog">

			<!-- modal content -->

			<div class="modal-content">
				<div class="modal-header">
					<h4 style="text-align: center">수상내역 등록</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="title">바람개비명 </label> <input type="text"
								class="form-control" id="b_name">
						</div>
						<div class="form-group">
							<label for="context">수상내역 </label> <input type="text"
								class="form-control" id="b_content">
						</div>

						<label for="picture">사진 등록</label><br>
						<div class="glyphicon glyphicon-picture"></div>
						<br>
					</form>
				</div>

				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group"
						aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-warning" data-action="save_award"
								role="button">등록</button>
						</div>

						<div class="btn-group" role="group">
							<button type="button" id="saveImage" class="btn btn-default"
								data-dismiss="modal" role="button">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 등록 모달 끝 -->
<script>
$('[data-action="save_award"]').click(function(){
	var b_name = $("#b_name").val();
	var b_content = $("#b_content").val();
	
	var awardVO = {
			b_name : b_name,
			b_content : b_content
	};
	
	var sendData = JSON.stringify(
				awardVO
			); 

	$.ajax({
	       async : true,
	       type : 'GET',
	       data : sendData,
	       cache : false,
	       url : '/admin/award',
	       dataType : 'json',
	       contentType : 'application/json; charset=UTF-8',
	       success : function(data) {
	    		alert("hihihi");
	       },
	       error : function(e) {
	          alert('아이디를 입력하세요!');
	       }
	    })
});
	

</script>




	<c:forEach items="${awardList}" var="award">

		<!-- 수정 Modal -->
		<div class="modal fade" id="edit${award.a_no}" role="dialog">
			<div class="modal-dialog">

				<!-- modal content -->

				<div class="modal-content">
					<div class="modal-header">
						<h4 style="text-align: center">수상내역 수정</h4>
					</div>
					<div class="modal-body">
						<form>
							<input id="update_a_no" type="text" value="${award.a_no}" style="display : none">
							<div class="form-group">
								<label for="title">바람개비명 </label> <input type="text"
									class="form-control" id="update_b_name" value="${award.b_name}">
							</div>
							<div class="form-group">
								<label for="context">수상내역 </label> <input type="text"
									class="form-control" id="update_b_content" value="${award.b_content}">
							</div>

							<label for="picture">사진 수정 </label><br>
							<div class="glyphicon glyphicon-picture"></div>
							<br>
						</form>
					</div>

					<div class="modal-footer">
						<div class="btn-group btn-group-justified" role="group"
							aria-label="group button">
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-warning" data-action="update_award${award.a_no}"
									role="button">수정</button>
							</div>

							<div class="btn-group" role="group">
								<button type="button" id="saveImage" class="btn btn-default"
									data-dismiss="modal" role="button">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 수정 모달 끝 -->

		<!-- 삭제 Modal -->
		<div class="modal fade" id="delete" role="dialog">
			<div class="modal-dialog modal-sm">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<h4 style="text-align: center">삭제하시겠습니까?</h4>

					</div>
					<div class="modal-footer">
						<div class="btn-group btn-group-justified" role="group"
							aria-label="group button">
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-warning" data-action="delete_award${award.a_no}"
									role="button">네</button>
							</div>

							<div class="btn-group" role="group">
								<button type="button" id="saveImage"
									class="btn btn-default btn-hover-green" data-dismiss="modal"
									role="button">아니오</button>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>

		
		<script>
		
	

	//form을 만든후 전송한다.
	$('[data-action="delete_award${award.a_no}"]').click(function(){
		 var $form = $('<form></form>');
	     $form.attr('action', '/admin/award/${award.a_no}');
	     $form.attr('method', 'post');
	     $form.appendTo('body');

	     var a_no =  "${award.a_no}";
	 
	     var form_a_no =  $('<input type="hidden" value="${award.a_no}" name="a_no">');
	     var form_delete = $('<input type="hidden" value="delete" name="_method">');
	 
	     $form.append(form_a_no).append(form_delete);
	     $form.submit();
	});
		
		
		//form을 만든후 전송한다.
		$('[data-action="update_award${award.a_no}"]').click(function(){
		
			 var $form = $('<form></form>');
		     $form.attr('action', '/admin/award/${award.a_no}');
		     $form.attr('method', 'post');
		     $form.appendTo('body');

		     var a_no =  "${award.a_no}";
		     var b_name = $("#update_b_name").val();
		     var b_content = $("#update_b_content").val();
		 
		     var form_a_no =  $('<input type="hidden" value="${award.a_no}" name="a_no">');
		     var form_b_name = $('<input type="hidden" value="'+b_name+'" name="b_name">');
		     var form_b_content = $('<input type="hidden" value="'+b_content+'" name="b_content">');
		 
		     $form.append(form_a_no).append(form_b_name).append(form_b_content);
		     $form.submit();

			/*
			var update_b_name = $("#update_b_name").val();
			var update_b_content = $("#update_b_content").val();
			var update_a_no = ${award.a_no}
			
			var awardVO = {
					a_no : update_a_no,
					b_name : update_b_name,
					b_content : update_b_content
			};
			
			var sendData = JSON.stringify(
						awardVO
					); 

			$.ajax({
			       async : true,
			       type : 'POST',
			       data : sendData,
			       cache : false,
			       url : '/admin/award/${award.a_no}',
			       dataType : 'json',
			       contentType : 'application/json; charset=UTF-8',
			       success : function(data) {
			    		alert("바뀜");
			       },
			       error : function(e) {
			          alert('통신x!');
			       }
			    })*/
		});
		
		</script>
	</c:forEach>



	</div>
</body>
</html>