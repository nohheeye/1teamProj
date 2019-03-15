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
<title>서현 #38 바람개비 활동내역!</title>
</head>
<body>


	<div class="page-header" style="text-align: center">
		<h1>바람개비 활동내역</h1>
	</div>


	<div class="container">
		<!-- 활동년도 -->
		<div class="dropdown">
			<button class="btn btn-default dropdown-toggle" type="button"
				data-toggle="dropdown">
				년도 선택 <span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li><a href="#">2019</a></li>
				<li><a href="#">2018</a></li>
				<li><a href="#">2017</a></li>
			</ul>
		</div>
		<br>
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
					<c:forEach items="${activityList}" var="activity">
						<input type="text" value="0" />
						<tr id="activity${activity.acti_no}" class="card-link"
							data-toggle="collapse" href="#collapse${activity.acti_b_no}">
							<td>${activity.acti_no}</td>
							<td>${activity.b_name}</td>
							<td>${activity.acti_title}</td>
							<td>${activity.acti_writer}</td>
							<td>3</td>
						</tr>
						<tr id="activityinfolist${activity.acti_no}"></tr>

					</c:forEach>





				</tbody>
			</table>


		</div>

		<c:forEach items="${activityList}" var="activity">
			<script>
				$("#activity${activity.acti_no}").click(function() {
					// ajax통신 후 값을 받은 다음에 값을 넣어줘야함.
					//alert("acti_no${activity.acti_no}/acti_b_no ");
					$.ajax({
						url : "/baraminfo",
						type : "get",
						data : {
							"acti_b_no" : ${activity.acti_b_no}
						},
						success : function(data) { //성공 후에 값들을 넣어줘야함.
							//근데 acti_no에 대한 값을 넘겨줘야하는데...
							//collapse${activity.acti_b_no}
							var html="";
							html +="<tr id='collapse${activity.acti_no}' class='collapse' data-parent='#accordion'>";		
							html +="<td colspan=6 class='page-header' sylte='padding:0% 30% 0% 30%'>";
							html +="<br><h4>참여도</h4>"
							html +="<table class='table' style='text-align:center; border:1px'>";
							html +="<thead><tr><th id ='tr_style'>이름</th><th id ='tr_style'>사번</th><th id ='tr_style'>참여도</th></tr></thead>";
							html +="<tbody>";
							for(var i =0;i<data.length;i++){
								html +="<tr>"
								html +="<td>"+"이름넣기"+"</th>";
								html +="<td>"+data[i].acti_id+"</th>";
								html +="<td>"+data[i].acti_point+"</th>";
								html +="<tr>";
							} 
							html +="</tbody>";
							html +="</table>";
							html +="</td>";
							html +="</tr>";
							
							var activityinfolist = document.getElementById('activityinfolist${activity.acti_no}');
							activityinfolist.innerHTML = html;
							
				//			alert(data.length+"/${activity.acti_no}	");	
						}
					});

				});
				</script>
		</c:forEach>

		<!-- Pagination -->
		<div class="w3-center w3-padding-32">
			<div class="w3-bar">
				<a href="#" class="w3-bar-item w3-button w3-hover-theme">«</a> <a
					href="#" class="w3-bar-item w3-button w3-theme w3-hover-theme">1</a>
				<a href="#" class="w3-bar-item w3-button w3-hover-theme">2</a> <a
					href="#" class="w3-bar-item w3-button w3-hover-theme">3</a> <a
					href="#" class="w3-bar-item w3-button w3-hover-theme">4</a> <a
					href="#" class="w3-bar-item w3-button w3-hover-theme">5</a> <a
					href="#" class="w3-bar-item w3-button w3-hover-theme">»</a>
			</div>
		</div>


	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>