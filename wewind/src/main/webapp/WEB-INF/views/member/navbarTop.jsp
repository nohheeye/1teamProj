<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %><!-- add session!! -->
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
	@import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);
		.top-img{height:25px;}
		.w3-top a:hover , .w3-top i:active{
			text-decoration:none;
			background-color:#dfe3ee!important;
		}
		.w3-top a:active {
			text-decoration:none; 
		}
		.w3-top a:focus {
			text-decoration:none; 
		}
		.w3-dropdown-content { padding: 0.5% 1%;}
		.font-face {font-family: 'Nanum Square';}
	</style>
</head>

<body>

	<<div class="w3-top">
  		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
    		<a href="/" class="w3-bar-item w3-button w3-hover-none"><b>We:</b>wind</a>
   			<!-- Float links to the right. Hide them on small screens -->
  	        <div class="w3-right">
  	        	<c:choose>
  	        		<c:when test="${not empty sessionScope.UserVO}">
  	        			<a id="logout" href="member/logout" class="w3-bar-item w3-hover-none w3-button">로그아웃</a>
	  	        	</c:when>
	  	        	<c:otherwise>
	  	        		<a id="login" href="member/login" class="w3-bar-item w3-hover-none w3-button">로그인</a>
	  	        		<a href="member/join" class="w3-bar-item w3-hover-none w3-button">회원가입</a>
	  	        	</c:otherwise>
  	        	</c:choose>
      			
     			<a href="#user" class="active w3-bar-item w3-hover-none w3-button"><img class="top-img img-circle" src="./img/w_img.png" />&nbsp;${sessionScope.UserVO.user_name}</a>
      		 	<div class="w3-dropdown-hover" style="padding-top:1%;">
				   <button class="w3-bar-item w3-hover-none w3-button"><i class="fas fa-bars"></i></button>
				   <div class="w3-dropdown-content w3-bar-block w3-border" style="right:0;top:30%;left:auto">
				      <a href="#" class="w3-bar-item w3-button"><i class="far fa-folder-open"></i><b>카테고리</b></a>
				       <hr style="margin:0;padding:0;"/>
				       <c:choose>
		  	        		<c:when test="${not empty sessionScope.UserVO.user_id}">
		  	        			<a href="/member/mypage" class="w3-bar-item w3-button">마이페이지</a>
		  	        			<a href="knowList" class="w3-bar-item w3-button">지식공유</a>
				    			<a href="calMain" class="w3-bar-item w3-button">공모전</a>
			  	        	</c:when>
			  	        	<c:otherwise>
		  	        			<a href="knowList" class="w3-bar-item w3-button">지식공유</a>
				    			<a href="calMain" class="w3-bar-item w3-button">공모전</a>
			  	        	</c:otherwise>
  	        		  </c:choose>
				    </div>
				    
				 </div>
      		   
    		</div>
    	</div>
    	
		<div class="container-fluid" style="background-color:#3b5998;"><h1></h1></div>
	</div>
</body>
</html>