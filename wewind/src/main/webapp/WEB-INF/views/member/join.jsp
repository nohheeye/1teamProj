<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %><!-- add session!! -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("#auth-success").hide();
		$("#auth-danger").show();
		$("#submitBtn").attr("disabled", "disabled");
		
		$("input").keyup(function() {
			var pwd1 = $("#auth_password").val();
			var pwd2 = $("#auth_password2").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
				}
			}
		});

		$("#sendAuthNumBtn").click(function() {
			$.ajax({
				url : "/member/mail/check",
				type : "POST",
				//json string타입으로 넘길 것 아니라면 생략하고 form전송
				//name값으로 객체에 mapping
				//contentType	: "application/json;charset=UTF-8",
				//dataType: "json",
				//dataType : 'text',
				data : $("#joinform").serialize(),
				async : true,
				success : function(result) {
					if (result.cnt == 1) {
						return true;
					} else if(result.cnt == 2){
						alert("id 중복 오류.");
						return false;
					}else {
						alert("mail 전송 오류.");
						return false;
					}
				}
			});
		});

		$("#checkAuthNumBtn").click(function() {
			$.ajax({
				url : "/member/num/check",
				type : "POST",
				data : $("#joinform").serialize(),
				async : true,
				success : function(result) {
					if (result.cnt == 1) {
						//인증완료.
						$("#auth-danger").hide();
						$("#auth-success").show();
						$("#submitBtn").removeAttr("disabled");
						$("#auth").val(1);
						return true;
					} else if (result.cnt == 2) {
						alert("인증번호가 일치하지 않습니다.");
						return false;
					} else if (result.cnt == 3) {
						alert("인증번호를 다시 받아주세요.");
						return false;
					} else {
						alert("인증 오류");
						return false;
					}
				}
			});
		});

		$("#submitBtn").click(function() {
			if ($("#auth_name").val() == null) {
				alert("이름을 입력하세요.");
			} else if ($("#auth_id").val() == null) {
				alert("ID를 입력하세요.");
			} else if ($("#auth_password").val() == null) {
				alert("비밀번호를 입력하세요.");
			} else if ($("#auth_password2").val() == null) {
				alert("비밀번호 확인을 입력하세요.");
			} else if ($("#auth_email").val() == null) {
				alert("이메일을 입력하세요.");
			} else if ($("#auth").val() == 0) {
				alert("이메일 인증을 해주세요.");
			} else {
				;
			}
		});
		
		$("#loginBtn").click(function(){
			$("#joinform").submit();
		});

	});
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
       @import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);

		body { 
		font-family: 'Nanum Square'; 
		}	
		span>#time {
			color: red;
		}
		
		.btn-reset{
		 		 background-color: #d9d9d; 
		         border: none;
		         color: white;
		         padding: 6px 20px;
		         text-align: center;
		         display: inline-block;
		         font-size: 15px;
		         cursor: pointer;
		         hover:none;
		}
		.button {
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
        .panel-title{
        color:white;
        }
</style>
</head>
<script>
var t, count=300;

function display() {
	var hours = Math.floor(count / 60);  
	var minutes = count % 60;
    document.getElementById('timer').innerHTML =  hours + ":" + minutes;
}

function countdown() {
    display();
    if (count === 0) {
        // time is up
    } else {
        count--;
        t = setTimeout(countdown, 1000);
    }
}

function countpause() {
    // pauses countdown
    clearTimeout(t);
}

function cdreset() {
    // resets countdown
    countpause();
    count = 5;
    display();
}
</script>
<body>
	<div class="container">
		<div id="signupbox" style="margin-top: 50px"
			class="mainbox col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
			<img src="./img/icon.png" alt="My Image" width="20%" height="20%" class="left">
			<div class="panel panel-default">
				<div style="background-color: #3b5998" class="panel-heading">
					<div class="text-center">
						<div class="panel-title">회원가입</div>
					</div>
					<div style="float: right; font-size: 85%; position: relative; top: -10px">
						<a id="signinlink" href="#"
							onclick="$('#signupbox').hide(); $('#loginbox').show()"></a>
					</div>
				</div>
				<div class="panel-body">
					<form id="joinform" action="/member/insert" method="post" class="form-horizontal" role="form">
						<div class="form-group">
							<label for="name" class="col-md-3 control-label">이름</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="auth_name"
									id="auth_name" placeholder="이름을 입력해주세요">
							</div>
						</div>

						<div class="form-group">
							<label for="number" class="col-md-3 control-label">사번</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="auth_id" id="auth_id" placeholder="사번을 입력해주세요">
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="col-md-3 control-label">비밀번호</label>
							<div class="col-md-7">
								<input type="password" class="form-control" id="auth_password" name="auth_password" placeholder="영문+숫자(8~16자리 이내)">
							</div>
						</div>

						<div class="form-group">
							<label for="password2" class="col-md-3 control-label">비밀번호
								확인</label>
							<div class="col-md-7">
								<input type="password" class="form-control" id="auth_password2"
									placeholder="동일한 비밀번호를 입력해주세요">
							</div>
						</div>

						<div class="form-group">
							<label for="password3" class="col-md-3 control-label"></label>
							<div class="col-md-7" id="alert-success">
								<b style="color: red;">비밀번호가 일치합니다.</b>
							</div>
							<div class="col-md-7" id="alert-danger">
								<b style="color: red;">비밀번호가 일치하지 않습니다.</b>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="col-md-3 control-label">이메일</label>
							<div class="col-md-7">
								<div class="form-inline">
									<span><input type="text" class="form-control"
										name="auth_email" id="auth_email" placeholder="이메일주소">
										@kt.com
										<button type="button" id="sendAuthNumBtn"
											class="btn button btn pull-right" onclick="countdown()" data-toggle="modal"
											data-target="#sendModal">인증요청</button></span>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="col-md-3 control-label"></label>
							<div class="col-md-7">
								<div class="form-inline">
									<span><input type="text" class="form-control"
										name="auth_code" placeholder="인증번호 입력"> <b id="timer" style="color:red;"></b>  
										<button type="button" id="checkAuthNumBtn"
											class="btn button btn pull-right" onclick="countpause()">확인</button></span>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password4" class="col-md-3 control-label"></label>
							<div class="col-md-7" id="auth-success">
								<b style="color: red;">인증되었습니다.</b>
							</div>
							<div class="col-md-7" id="auth-danger">
								<b style="color: red;">인증을 진행해주세요.</b>
							</div>
						</div>

						<div class="form-group">
							<!-- Button -->
							<div class="text-center">

								<button type="button" id="submitBtn" class="btn button"
									data-toggle="modal" data-target="#myModal">가입</button>
								<button type="button" class="btn btn-reset"
									onclick="location='/'">취소</button>

							</div>
						</div>
						<input type="hidden" name="auth" id="auth" value=0>
					</form>
				</div>
			</div>




		</div>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
         <div class="modal-dialog" style="width: 400px">


            <div class="modal-content" style="font-family: Nanum Square;">
               <div class="modal-header"
                  style="background-color: #3b5998; height: 35px; width: 400px">
                  <button type="button" class="close" data-dismiss="modal"
                     style="color: white; margin: -8px 0px">&times;</button>
               </div>
               <div class="modal-body"
                  style="background-color: #ffffff; height: 110px; width: 400px">
                  <h4
                     style="text-align: center; font-family: Nanum Square; padding-top: 20px">가입이 완료되었습니다.</h4>

               </div>
               <div class="modal-footer"
                  style="height: 50px; background-color: #ffffff; width: 400px">
				<button type="button" class="button"
                  style="margin-top: -10px; margin-bottom: 10px; margin-right: 5px"
                  data-dismiss="modal" role="button"
                  onclick="location='/'">메인으로 이동</button>

               </div>
            </div>
         </div>
      </div>
		
		<!-- 인증요청모달 -->
      <div class="modal fade" id="sendModal" role="dialog">
         <div class="modal-dialog" style="width: 400px">


            <div class="modal-content" style="font-family: Nanum Square;">
               <div class="modal-header"
                  style="background-color: #3b5998; height: 35px; width: 400px">
                  <button type="button" class="close" data-dismiss="modal"
                     style="color: white; margin: -8px 0px">&times;</button>
               </div>
               <div class="modal-body"
                  style="background-color: #ffffff; height: 110px; width: 400px">
                  <h5
                     style="text-align: center; font-family: Nanum Square; padding-top: 10px">인증번호가 mail로 전송되었습니다.</h5>
                  <h5  style="text-align: center; font-family: Nanum Square; padding-top: 10px">인증을 진행해 주세요.</h5>
               </div>
               <div class="modal-footer"
                  style="height: 50px; background-color: #ffffff; width: 400px">
                  <button type="button" class="button"
                  style="margin-top: -10px; margin-bottom: 10px; margin-right: 5px"
                  data-dismiss="modal" role="button">확인</button>
               </div>
            </div>
         </div>
      </div>
      <!--  모달 끝 -->
		
	</body>
</html>