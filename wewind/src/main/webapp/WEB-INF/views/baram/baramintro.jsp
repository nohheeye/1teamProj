<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<title>Insert title here</title>
	
	<style>
	#detail_table {
	border-collapse: collapse;
	width: 100%;
}

#detail_table td {
	border: 1px solid #ddd;
	padding: 15px;
	
	height:300px;
}
	</style>
	
</head>
<body>
	<!-- top -->
	<jsp:include page="../navbarTop.jsp" flush="false" /> <br><br><br><br>

	<div class="row">
		<!-- side -->
		<div class="col-md-2">
			<jsp:include page="../sideBar.jsp" flush="false" />
		</div>
		
		<div class="col-md-10">
			<div class="container-fluid">
				<jsp:include page="../navbarShoulder.jsp?b_no=${b_no}&name='intro'" flush="false" />
	
			<!-- 여기에 내용 붙여 넣기!! 위에 내용은 지우지말아주세요!-->
		
			

	<!-- 게시판 -->
	<div class="container" >
		<div class="row">
			<table id="detail_table">
				<tbody>
					<tr>
						<td style="min-height: 500px; text-align: left;" valign = "top";>
						
						<span style="font-size: 1.2em; font-weight: bold" size=30>소개
									</span><br>
						<br><br> ${baram.b_introduce}
						</td>

					</tr>
				</tbody>
			</table>
		</div>
	</div>
			
		</div>
		</div>
	</div>
	
		
</body>
</html>