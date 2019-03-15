<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
	<title>header</title>
	<style>
		.top-img{height:28px;}
		.w3-top a:hover{
			text-decoration:none;
			border-bottom: 1px solid #88d8b0;
		}
		.w3-top a:active {
			text-decoration:none;
		}
		.w3-top a:focus {
			text-decoration:none;
		}	
		.w3-dropdown-content { padding: 12px 16px;}
	</style>
</head>
<body>
	<div class="w3-top">
  		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
    		<a href="#home" class="w3-bar-item w3-button w3-hover-none"><b>We:</b>wind</a>
   			<!-- Float links to the right. Hide them on small screens -->
  	        <div class="w3-right">
      			<a href="#logout" class="w3-bar-item w3-hover-none w3-button">Logout</a>
     			<a href="#logout" class="active w3-bar-item w3-hover-none w3-button"><img class="top-img img-circle" src="./resources/img/w_img.png" />&nbsp;이서현님</a>
      		 	<div class="w3-dropdown-hover" style="padding-top:1%;">
				   <button class="w3-bar-item w3-hover-none w3-button"><i class="fas fa-bars"></i></button>
				   <div class="w3-dropdown-content w3-bar-block w3-border" style="right:0;top:30%;left:auto">
				      <a href="#" class="w3-bar-item w3-button"><i class="far fa-folder-open"></i><b>카테고리</b></a>
				       <hr style="margin:0;padding:0;"/>
				      <a href="#" class="w3-bar-item w3-button">마이페이지</a>
				      <a href="#" class="w3-bar-item w3-button">지식공유</a>
				      <a href="#" class="w3-bar-item w3-button">공모전</a>
				    </div>
				 </div>
      		   
    		</div>
    	</div>
    	
		<div class="container-fluid" style="background-color:#96ceb4;"><h1></h1></div>
	</div>
</body>
</html>