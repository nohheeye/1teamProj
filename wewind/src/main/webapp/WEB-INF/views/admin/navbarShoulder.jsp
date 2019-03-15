<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="./resources/smarteditor2-master/dist/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<title>shoulder</title>
	
	<style>
	</style>
	
</head>
<body>
			<% String b_no = request.getParameter("b_no"); %>
			
			<h1 align="center" style="padding-right:10%">바람개비123</h1><br>
			
	
			<ul class="nav nav-tabs">
			  <li class="active"><a data-toggle="tab" href="/baram/<%=b_no%>">바람개비소개</a></li>
			  <li><a  href="/baram/<%= b_no%>/activity">활동내역</a></li>
			  <li><a  href="#menu1">일정</a></li>
			  <li><a  href="/baram/<%= b_no%>/knowledge">지식공유</a></li>
			</ul>
				
			<br><br>
			<!-- 여기에 내용 붙여 넣기!! 위에 내용은 지우지말아주세요!-->
</body>
</html>