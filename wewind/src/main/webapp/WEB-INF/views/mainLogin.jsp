<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %><!-- add session!! -->
<!DOCTYPE html>
<html>
<title>Main2</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<title>header</title>
	<style>
        @import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);
		body { 
		font-family: 'Nanum Square'; 
		}
		.btn-color{
			color:#fff; background-color:#8b9dc3;
		}

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
	
		.search_window {
			display: inline-block;
			width: 366px; height: 34px;
			border: 3px solid #3b5998;
			background: white;
		}
		.input_text {
			width: 348px; height: 21px;
			margin: 6px 0 0 9px;
			border: 0;
			line-height: 21px;
			font-weight: bold;
			font-size: 16px;
			outline: none;
		}
		.sch_smit {
			width: 54px; height: 33px;
			margin: 0; border: 0;
			vertical-align: top;
			background: #3b5998;
			color: white;
			font-weight: bold;
			border-radius: 1px;
			cursor: pointer;
		}
		.sch_smit:hover {
			background: #3b5998;
		}
		.w3-container w3-padding-16{
			position: relative;
		}
		.w3-button w3-right{
			position: absolute;
			top:100px;
			left: 100px;ss
		}

	</style>
</head>
<script type="text/javascript">
	$(function() {
		;
		
	});
</script>
<body>

<%-- 	<div class="w3-top">
  		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
    		<a href="/" class="w3-bar-item w3-button w3-hover-none"><b>We:</b>wind</a>
   			<!-- Float links to the right. Hide them on small screens -->
  	        <div class="w3-right">
  	        	<c:choose>
  	        		<c:when test="${not empty sessionScope.user_id}">
  	        			<a id="logout" href="member/logout" class="w3-bar-item w3-hover-none w3-button">Logout</a>
	  	        	</c:when>
	  	        	<c:otherwise>
	  	        		<a id="login" href="member/login" class="w3-bar-item w3-hover-none w3-button">Login</a>
	  	        	</c:otherwise>
  	        	</c:choose>
      			<a href="member/join" class="w3-bar-item w3-hover-none w3-button">Join</a>
     			<a href="#" class="active w3-bar-item w3-hover-none w3-button"><img class="top-img img-circle" src="./resources/img/w_img.png" />&nbsp;${sessionScope.user_name}</a>
      		 	<div class="w3-dropdown-hover" style="padding-top:1%;">
				   <button class="w3-bar-item w3-hover-none w3-button"><i class="fas fa-bars"></i></button>
				   <div class="w3-dropdown-content w3-bar-block w3-border" style="right:0;top:30%;left:auto">
				      <a href="#" class="w3-bar-item w3-button"><i class="far fa-folder-open"></i><b>카테고리</b></a>
				       <hr style="margin:0;padding:0;"/>
				      <a href="member/mypage" class="w3-bar-item w3-button">마이페이지</a>
				      <a href="knowList" class="w3-bar-item w3-button">지식공유</a>
				      <a href="calMain" class="w3-bar-item w3-button">공모전</a>
				    </div>
				 </div>
      		   
    		</div>
    	</div>
    	
		<div class="container-fluid" style="background-color:#96ceb4;"><h1></h1></div>
	</div> --%>
<jsp:include page="./navbarTop.jsp" flush="false" />

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="./img/main.jpg" alt="main" style="width: 1500px; height: 600px;">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding" style="background-color:#3b5998;"><b>We:</b></span> <span class="w3-hide-small w3-text-white "><b>Wind</b></span></h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">
   
   <div class="w3-center w3-margin-top">
	<span class='search_window'>
		<input type='text' class='input_text' />
	</span>
	<button type='submit' class='sch_smit'><i class="fa fa-search"></i></button>
   </div>
  
  <!-- Project Section -->
  
  <div class="w3-container w3-padding-16" id="projects"> 
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16"><b>바람개비보기</b></h3>
  <button class='w3-button w3-right w3-padding-small w3-medium' onclick='location="createNew"'>바람개비<b>+</b></button>
  </div>

	<div class="w3-container">
	  <div class="w3-center">
	  <div class="w3-bar" style="background-color:white">
	    <button class="w3-bar-item w3-button tablink w3-light-grey" onclick="openWind(event,'All')">전체보기</button>
	    <button class="w3-bar-item w3-button tablink" onclick="openWind(event,'Recomm')">추천</button>
	    <button class="w3-bar-item w3-button tablink" onclick="openWind(event,'Java')">JAVA</button>
	    <button class="w3-bar-item w3-button tablink" onclick="openWind(event,'Python')">Python</button>
	    <button class="w3-bar-item w3-button tablink" onclick="openWind(event,'Ops')">오픈소스</button>
	    <button class="w3-bar-item w3-button tablink" onclick="openWind(event,'Db')">데이터베이스</button>
	    <button class="w3-bar-item w3-button tablink" onclick="openWind(event,'Etc')">기타</button>
	  </div>
	  </div>
	  
	  <div id="All" class="w3-container windclass">
	  <br>
	    <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="/img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="/img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="/img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="/img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    </div>
	    
	  <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="/img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="/img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="/img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    </div>	  	    	       
	  <div class="w3-center">
	    <div class="w3-bar">
		  <a href="#" class="w3-button">&laquo;</a>
		  <a href="#" class="w3-button">1</a>
		  <a href="#" class="w3-button">2</a>
		  <a href="#" class="w3-button">3</a>
		  <a href="#" class="w3-button">4</a>
		  <a href="#" class="w3-button">5</a>
		  <a href="#" class="w3-button">&raquo;</a>
		</div>
		</div>	
	  </div>
	
	  <div id="Recomm" class="w3-container windclass" style="display:none">
	   <br>
	    <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    </div>
	    
	  <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    </div>
	    <div class="w3-center">
	    <div class="w3-bar">
		  <a href="#" class="w3-button">&laquo;</a>
		  <a href="#" class="w3-button">1</a>
		  <a href="#" class="w3-button">2</a>
		  <a href="#" class="w3-button">3</a>
		  <a href="#" class="w3-button">4</a>
		  <a href="#" class="w3-button">5</a>
		  <a href="#" class="w3-button">&raquo;</a>
		</div>
		</div>	    	    
	  </div>
	
	  <div id="Java" class="w3-container windclass" style="display:none">
	   <br>
	    <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    </div>
	    
	  <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    </div>
	    <div class="w3-center">
	    <div class="w3-bar">
		  <a href="#" class="w3-button">&laquo;</a>
		  <a href="#" class="w3-button">1</a>
		  <a href="#" class="w3-button">2</a>
		  <a href="#" class="w3-button">3</a>
		  <a href="#" class="w3-button">4</a>
		  <a href="#" class="w3-button">5</a>
		  <a href="#" class="w3-button">&raquo;</a>
		</div>
		</div>	    	    
	  </div>	  
	
	<div id="Python" class="w3-container windclass" style="display:none">
	   <br>
	    <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    </div>
	    
	  <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    </div>
	    <div class="w3-center">
	    <div class="w3-bar">
		  <a href="#" class="w3-button">&laquo;</a>
		  <a href="#" class="w3-button">1</a>
		  <a href="#" class="w3-button">2</a>
		  <a href="#" class="w3-button">3</a>
		  <a href="#" class="w3-button">4</a>
		  <a href="#" class="w3-button">5</a>
		  <a href="#" class="w3-button">&raquo;</a>
		</div>
		</div>	    	    
	  </div>

	<div id="Ops" class="w3-container windclass" style="display:none">
	   <br>
	    <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    </div>
	    
	  <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    </div>
	    <div class="w3-center">
	    <div class="w3-bar">
		  <a href="#" class="w3-button">&laquo;</a>
		  <a href="#" class="w3-button">1</a>
		  <a href="#" class="w3-button">2</a>
		  <a href="#" class="w3-button">3</a>
		  <a href="#" class="w3-button">4</a>
		  <a href="#" class="w3-button">5</a>
		  <a href="#" class="w3-button">&raquo;</a>
		</div>
		</div>	    	    
	  </div>	

	<div id="Db" class="w3-container windclass" style="display:none">
	   <br>
	    <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    </div>
	    
	  <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    </div>
	    <div class="w3-center">
	    <div class="w3-bar">
		  <a href="#" class="w3-button">&laquo;</a>
		  <a href="#" class="w3-button">1</a>
		  <a href="#" class="w3-button">2</a>
		  <a href="#" class="w3-button">3</a>
		  <a href="#" class="w3-button">4</a>
		  <a href="#" class="w3-button">5</a>
		  <a href="#" class="w3-button">&raquo;</a>
		</div>
		</div>	    	    
	  </div>	

	<div id="Etc" class="w3-container windclass" style="display:none">
	  <br>
	    <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	      <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image.JPG" alt="wind1" style="width:100%; height: 158px;" >	          	      
	    </div>
	    </div>
	    </div>
	    
	  <div class="w3-row-padding">
	    <div class="w3-col l3 m6 w3-margin-bottom" >
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    
	    <div class="w3-col l3 m6 w3-margin-bottom">
	    <div class="w3-display-container">
	      <button class="w3-button w3-display-topleft" style="background-color:#dfe3ee;" onclick="location='baramIntro'"><b>바람개비명</b></button>
	      <img src="./img/image2.JPG" alt="wind1" style="width:100%; height: 158px;" >	         	      
	    </div>
	    </div>
	    </div>
	    <div class="w3-center">
	    <div class="w3-bar">
		  <a href="#" class="w3-button">&laquo;</a>
		  <a href="#" class="w3-button">1</a>
		  <a href="#" class="w3-button">2</a>
		  <a href="#" class="w3-button">3</a>
		  <a href="#" class="w3-button">4</a>
		  <a href="#" class="w3-button">5</a>
		  <a href="#" class="w3-button">&raquo;</a>
		</div>
		</div>	    	    
	  </div>		
	</div>



  <!-- About Section -->
  <div class="w3-container w3-padding-32" id="about">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16"><b>수상내역</b></h3>
    <p><i class='fas fa-trophy'></i>축하합니다 </p>
  </div>


 <div class="w3-content w3-display-container ">
 <div class="w3-display-container mySlides"> 
  <div class="w3-row-padding">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./img/prize.jpg" alt="prize1" style="width:100%">
      <h4>안드로이드 개발 대회 대상</h4>
      <p>Android 파고파고</p>
    </div>

    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./img/prize.jpg"" alt="Prize2" style="width:100%">
      <h4>ICT융합프로젝트 공모전 금상</h4>
      <p>JAVA심화과정</p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./img/prize.jpg" alt="Prize3" style="width:100%">
      <h4>ICT융합프로젝트 공모전 은상</h4>
      <p>SQL뿌시기</p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./img/prize.jpg" alt="Prize4" style="width:100%">
      <h4>ICT융합프로젝트 공모전 동상</h4>
      <p>Python뿌시기</p>
    </div>
  </div>
</div>

<div class="w3-display-container mySlides"> 
  <div class="w3-row-padding">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./img/prize.jpg" alt="prize1" style="width:100%">
      <h4>안드로이드 개발 대회 금상</h4>
      <p>Android 파고파고</p>
    </div>

    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./img/prize.jpg"" alt="Prize2" style="width:100%">
      <h4>ICT융합프로젝트 공모전 금상</h4>
      <p>JAVA심화과정</p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./img/prize.jpg" alt="Prize3" style="width:100%">
      <h4>ICT융합프로젝트 공모전 금상</h4>
      <p>SQL뿌시기</p>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./img/prize.jpg" alt="Prize4" style="width:100%">
      <h4>ICT융합프로젝트 공모전 금상</h4>
      <p>Python뿌시기</p>
    </div>
  </div>
</div>

<button class="w3-button w3-display-left w3-color" onclick="plusDivs(-1)">&#10094;</button>
<button class="w3-button w3-display-right w3-color" onclick="plusDivs(1)">&#10095;</button>

</div>

  <!-- About Section -->
  <div class="w3-container w3-padding-24" id="about">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16"><b>공모전</b></h3>
    <button class="w3-button w3-white w3-padding-small w3-right" onclick="location='calMain'">더보기</button>
  </div>

  <div class="w3-row-padding">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./img/ICT.jpg" alt=contest1" style="width: 100%; height: 350px;">
      <div class="w3-center"><h5>ICT융합프로젝트 공모전</h5>
      <p>마감 : 2019. 03. 22</p>
    </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./img/5G.jpg" alt="contest2" style="width: 100%; height: 350px;">
      <div class="w3-center"><h5>5G서비스 아이디어 공모전</h5>
      <p>마감 : 2019. 03. 22</p>
    </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./img/HACKTHON.JPG" alt="contest3" style="width: 100%; height: 350px;">
      <div class="w3-center"><h5>블록체인 해커톤</h5>
      <p>마감 : 2019. 03. 22</p>
    </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <img src="./img/HACKTHON2.jpg" alt="contest4" style="width: 100%; height: 350px;">
      <div class="w3-center"><h5>공유경제 해커톤</h5>
      <p>마감 : 2019. 03. 22</p>
    </div>
    </div>
  </div>
 </div> 

<!-- End page content -->
</div>


<!-- Footer -->
<footer class="w3-center w3-padding-16" style=background-color:#3b5998;">
  <div class="w3-text-white">ktds <b>We:</b> wind</div>
</footer>

<script>
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
}

function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}
</script>

<script>
function openWind(evt, windName) {
	  var i, x, tablinks;
	  x = document.getElementsByClassName("windclass");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablink");
	  for (i = 0; i < x.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace("w3-light-grey", "");
	  }
	  document.getElementById(windName).style.display = "block";
	  evt.currentTarget.className += " w3-light-grey" ;
	}
</script>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>
</body>
</html>