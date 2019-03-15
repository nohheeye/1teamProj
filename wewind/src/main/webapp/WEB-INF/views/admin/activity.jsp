<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link seohyun_list.jspbtn btn-dangerrel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
	
</script>



<style>
#tr_style {
	background-color: #eeeeee;
	text-align: center;
}
</style>
<title>서현 #38 바람개비 활동내역!!!</title>
</head>

<body>


	<div class="page-header" style="text-align: center">
		<h1>바람개비 활동내역입니다.</h1>
	</div>


	<div class="container">
		<!-- 활동년도 -->
	<!-- 	<form>
			<div class="form-group">
				<label for="sel1">Select list (select one):</label> <select
					class="form-control" id="sel1">
					<option value="2019">2019</option>
					<option value="2019">2018</option>
					<option value="2017">2017</option>
				</select>
			</div>
		</form>
 -->
		<div class="form-group">
			<select id="year"> 
				<option value="">년도 선택</option>
				<option value="2019">2019</option>
				
				
				<option value="2018">2018</option>
				<option value="2017">2017</option>
			</select>
		</div>
		<br>
		
		<!-- 연도 선택 후  -->
		<script>
		
			$('#year').change(function(){
				location.href="<a href=/admin/activity?year='"+$('#year').val()+"'";
				
				
			});
		
		</script>
		<!-- 목록 -->
		<div class="row">

			<table class="table" id="accordion"
				style="text-align: center; border: 1px;">

				<thead>
					<tr>
						<th id="tr_style">No</th>
						<th id="tr_style">바람개비명</th>
						<th id="tr_style">대분류</th>
						<th id="tr_style">소분류</th>
						<th id="tr_style">활동지수</th>
					</tr>
				</thead>

				<tbody>
					<!--  아코디언 생성 -->
					<c:forEach items="${baramList}" var="baram">
						<input type="text" value="1" id="baramclickvalue${baram.b_no}"
							style="display: none">
						<tr id="baram${baram.b_no}" class="card-link"
							data-toggle="collapse" href="#collapse${baram.b_no}">

							<td>${baram.b_no}</td>
							<td>${baram.b_name}</td>
							<td>${baram.b_classify}</td>
							<td>${baram.b_cate}</td>
							<td>${baram.b_activity_count}</td>
						</tr>

						<tr id="collapse${baram.b_no}" class="collapse"
							data-parent="#accordion">

							<td id="baraminfoinfolist${baram.b_no}" colspan=6
								class="page-header" style="padding: 0% 30% 0% 30%"></td>
						</tr>

						<!--  -->

					</c:forEach>





				</tbody>
			</table>


			</script>
		</div>

		<c:forEach items="${baramList}" var="baram">
			<script>
				$("#baram${baram.b_no}")
						.click(
								function() {
									// ajax통신 후 값을 받은 다음에 값을 넣어줘야함.
									//이 값이 홀수면 하고 아님녀 하
									var check_val = $("#baramclickvalue${baram.b_no}").val(); //클릭 체크하는 버튼값가져옴

									if (check_val % 2 == 1) {//통신하고
										$
												.ajax({
													url : "/baraminfo",
													type : "get",
													data : {
														"info_b_no" : "${baram.b_no}"
													},
													success : function(data) { //성공 후에 값들을 넣어줘야함.
														//근데 acti_no에 대한 값을 넘겨줘야하는데...
														//collapse${activity.acti_info_b_no}

														var html = "";
														html += "<td colspan=6 class='page-header' sylte='padding:0% 30% 0% 30%'>";
														html += "<br><h4>참여도</h4>"
														html += "<table class='table' style='text-align:center; border:1px'>";
														html += "<thead><tr><th id ='tr_style'>이름</th><th id ='tr_style'>사번</th><th id ='tr_style'>참여도</th></tr></thead>";
														html += "<tbody>";

														for (var i = 0; i < data.length; i++) {
															//			console.log(data);
															html += "<tr>"
															html += "<td>"
																	+ data[i].acti_name
																	+ "</th>";
															html += "<td>"
																	+ data[i].info_id
																	+ "</th>";
															html += "<td>"
																	+ data[i].info_point
																	+ "</th>";
															html += "<tr>";
														}

														html += "</tbody>";
														html += "</table>";
														html += "</td>";
														var activityinfolist = document
																.getElementById('baraminfoinfolist${baram.b_no}');
														activityinfolist.innerHTML = html;
													}
												});
									} else {
										//						alert("지우기!");
										$("#baraminfoinfolist${baram.b_no}")
												.val("");
									}
									$("#baramclickvalue${baram.b_no}").val(
											Number(check_val) + 1);
								});
			</script>
		</c:forEach>

		<!-- Pagination -->
		<div class="box-footer">
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a href="/admin/activity?page=${pageMaker.startPage-1}">&laquo;</a>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li
							<c:out value="${pageMaker.criteria.page==idx?'class=active' : ''}"/>>
							<a href="/admin/activity?page=${idx}">${idx}</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage>0}">
						<li><a href="/admin/activity?page=${pageMaker.endPage+1}">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>