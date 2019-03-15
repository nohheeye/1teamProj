<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<title>Insert title here</title>
<style>
		.member{
			overflow:auto;
			position:fixed;
			width:12%;
			height:60%;
			padding-bottom:10%;	
			min-height: 40%;
		}
		#member_profile{padding:10%;}
   		#newmember_btn{
		  background-color: #ffffff;
		  border: 5px solid #ffeead;
		  color: #ff6f69;
		  padding: 10px 20px;
		  text-align: center;
		  vertical-align:middle;
		  cursor: pointer;
		  border-radius: 16px;
		  font-size:15px;
		}
		#newmember_btn span {
		  cursor: pointer;
		  display: inline-block;
		  position: relative;
		  transition: 0.5s;
		}
		
		#newmember_btn span:after {
		  content: '\00bb';
		  position: absolute;
		  opacity: 0;
		  top: 0;
		  right: -20px;
		  transition: 0.5s;
		}
		#newmember_btn:hover span {padding-right: 25px;}
		#newmember_btn:hover span:after {opacity: 1; right: 0;}
		.dot {
		  height: 50px;
		  width: 50px;
		  background-color: #bbb;
		  border: 4px solid #96ceb4;
		  border-radius: 50%;
		  display: inline-block;
		  padding: 2% 0;
		}
		.nav-stacked>li{padding:0 0 5px;}
		#user_default{vertical-align:middle;font-size:25px;color:white;padding:5px 0 0 10px;}
		.member::-webkit-scrollbar{width: 10%;}
		.member::-webkit-scrollbar-track {background-color:#f1f1f1;}
		.member::-webkit-scrollbar-thumb {background-color:#ffeead;border-radius: 10px;}
		
		
</style>
</head>
<body>
	<jsp:include page="navbar-top.jsp" flush="false"/>
	<br><br><br><br><br>
	<div class="container">
		<div class="row">
			<div class='col-md-2' style="padding-left:3%;">
				<button class="btn" id="newmember_btn"><span>가입하기</span></button><br><br>
			    <b class="mem_count">참여인원&nbsp;<span class="label label-warning">11</span></b><br>	
				<div class="member">
					<ul class="nav nav-pills nav-stacked">
						<li><span class="dot"><i class="far fa-user" id="user_default"></i></span><span id="member_profile">김재연님</span></li>
						<li><span class="dot"><i class="far fa-user" id="user_default"></i></span><span id="member_profile">곽경은님</span></li>
						<li><span class="dot"><i class="far fa-user" id="user_default"></i></span><span id="member_profile">김영진님</span></li>
						<li><span class="dot"><i class="far fa-user" id="user_default"></i></span><span id="member_profile">김주영님</span></li>
						<li><span class="dot"><i class="far fa-user" id="user_default"></i></span><span id="member_profile">김신비님</span></li>
						<li><span class="dot"><i class="far fa-user" id="user_default"></i></span><span id="member_profile">김용희님</span></li>
						<li><span class="dot"><i class="far fa-user" id="user_default"></i></span><span id="member_profile">노희예님</span></li>
						<li><span class="dot"><i class="far fa-user" id="user_default"></i></span><span id="member_profile">이서현님</span></li>
						<li><span class="dot"><i class="far fa-user" id="user_default"></i></span><span id="member_profile">정성환님</span></li>
						<li><span class="dot"><i class="far fa-user" id="user_default"></i></span><span id="member_profile">정유연님</span></li>
						
						<!--<li><img src='./resources/img/img_avatar.png' id='member_profile' class='img-circle'>노희예님</li> -->				
					</ul> 
				</div>
			</div>
		</div>
	</div>
</body>
</html>