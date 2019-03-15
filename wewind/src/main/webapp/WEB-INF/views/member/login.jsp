<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %><!-- add session!! -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<head>
	<title>Login Page</title>
   
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<style>
		@import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);
				
		body { 
		font-family: 'Nanum Square'; 
		}
		.container{
			padding-top:5%;
			width: 300px;
		}
   
	    img {
	      padding-top:5%;
	    }
    
  
    .btn-w3r{
         background-color: #FBFBFB; /* white */
         border-color: none;
         outline:#8b9dc3;
         color: #8b9dc3;
         text-decoration: none;
         display: inline-block;
         font-size: 12px;
      }
      .btn-ok{
		   background-color: #8b9dc3;
		   font-family: Nanum Square;
		   border: none;
		   color: white;
		   padding: 6px 20px;
		   text-align: center;
		   display: inline-block;
		   font-size: 15px;
		   cursor: pointer;
		   hover: none;
		   -webkit-transition-duration: 0.4s; /* Safari */
}

	</style>

	
</head>
<script>
	$(function() {
		$("#loginBtn").click(function(){
			if($("#id").val() == ""){
				alert("ID를 입력하세요.");
			}else if($("#password").val() == ""){
				alert("PW를 입력하세요.");
			}else{
				$("#loginForm").submit();
			}
		});
		$("#findPwBtn").click(function(){
			window.location.href="/member/password/find";
		});
		$("#joinBtn").click(function(){
			window.location.href="/member/join";
		});
		
	});
</script>

<body>
<div class="container">
	
		
		<div>
			<div class="text-center">
			<img src="./img/icon.png" alt="My Image" width="50%", height="50%" class="center-block" onclick="location='/'">
			</div>
			<br>
			<div>
				<form id="loginForm" action="/member/login" method="post">
			      <div class="input-group">
					  <span class="input-group-addon" id="basic-addon1"><span class = "glyphicon glyphicon-user"></span></span>
					  <input type="text" class="form-control" name="id" id="id"  placeholder="사번" aria-describedby="basic-addon1">
					</div>
					<br>
			      <div class="input-group">
					  <span class="input-group-addon" id="basic-addon1"><span class = "glyphicon glyphicon-ok"></span></span>
					  <input type="password" name="password" id="password" class="form-control" placeholder="******" aria-describedby="basic-addon1">
				  </div>					
					
                    <br>
					<button type="button" id="loginBtn" class="btn btn-ok btn-block" >Login</button>
					
				</form>
			</div>
		
			<div class="row">
			<div class="text-center">
	          <div class="btn-group btn-group-sm" role="group" style="padding-top: 10px">
			    <button type="button" id="mainBtn"  class="btn btn-w3r" onclick="location='/'">돌아가기</button>
			    <button type="button" id="findPwBtn"class="btn btn-w3r" >비밀번호찾기</button>
			    <button type="button" id="joinBtn" class="btn btn-w3r" >회원가입</button>
              </div>
		    </div>
		    </div>
		</div>
	
</div>

</body>
</html>