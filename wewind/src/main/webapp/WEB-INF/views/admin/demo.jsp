<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	</style>
	
</head>
<body>
	<!-- top -->
	<jsp:include page="navbar-top.jsp" flush="false" /> <br><br><br><br>
	
	<div class="row">
		<!-- side -->
		<div class="col-md-2">
			<jsp:include page="side-bar.jsp" flush="false" />
		</div>
		
		<div class="col-md-10">
			<div class="container-fluid">
			<h1 align="center" style="padding-right:10%">�ٶ�����123</h1><br>
			
			<ul class="nav nav-tabs">
			  <li class="active"><a data-toggle="tab" href="#home">�ٶ�����Ұ�</a></li>
			  <li><a data-toggle="tab" href="#menu1">Ȱ������</a></li>
			  <li><a data-toggle="tab" href="#menu1">����</a></li>
			  <li><a data-toggle="tab" href="#menu2">���İ���</a></li>
			</ul>
				
			<br><br>
			<!-- ���⿡ ���� �ٿ� �ֱ�!! ���� ������ �����������ּ���!-->
			
		</div>
		</div>
	</div>
	
		
</body>
</html>