<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %><!-- add session!! -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    $(function(){
    	var id = ${id}
		$("#id").val(id);
		$("#submitBtn").attr("disabled", "disabled");
		
        $("#alert-success").hide();
        $("#alert-danger").hide();
        $("input").keyup(function(){
            var pwd1=$("#pwd1").val();
            var pwd2=$("#pwd2").val();
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                    $("#alert-success").show();
                    $("#alert-danger").hide();
                    $("#submitBtn").removeAttr("disabled");
                }else{
                    $("#alert-success").hide();
                    $("#alert-danger").show();
                    $("#submitBtn").attr("disabled", "disabled");
                }    
            }
        });
    });
</script>
<head>	
	<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<style>
       @import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);
		body { 
		font-family: 'Nanum Square'; 
		}
		
		.container{
			padding-top:7%;
			width: 50%;
            height: 50px;
			
		}
		 .btn-ok{
 		 background-color: #8b9dc3; 
         border: none;
         color: white;
         padding: 6px 20px;
         text-align: center;
         display: inline-block;
         font-size: 15px;
         cursor: pointer;
         hover:none;
         -webkit-transition-duration: 0.4s; /* Safari */
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
	         -webkit-transition-duration: 0.4s; /* Safari */
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
	</style>

</head>
<body>

<div class="container">
              <div class="text-center"><h2><i class="fas fa-lock"></i> 비밀번호 수정</h2></div>      
                    <br>
                    <div  class="panel panel-default">                       
                        </div>  
                        <div class="panel-body" >
                            <form id="pwUpdateForm" action="/member/password/update" method="post" class="form-horizontal" role="form">
                                    
                                
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">새 비밀번호</label>
                                    <div class="col-md-7">
                                        <input type="password" class="form-control" id="pwd1" name="password" placeholder="영문+숫자(8~16자리 이내)">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="password2" class="col-md-3 control-label">비밀번호 확인</label>
                                    <div class="col-md-7">
                                        <input type="password" class="form-control" id="pwd2" placeholder="동일한 비밀번호를 입력해주세요">
                                    </div>
                                </div>
                                                              
                                <div class="form-group">
                                    <label for="password3" class="col-md-3 control-label"></label>
                                    <div class="col-md-7" id="alert-success"><b style="color:red;">비밀번호가 일치합니다.</b></div>
                                    <div class="col-md-7" id="alert-danger"><b style="color:red;">비밀번호가 일치하지 않습니다.</b></div>
                                </div>
                                    
                                <div class="form-group">
                                    <!-- Button -->                                        
                                 			  <div class="text-center">
                                 			  
											    <button type="button" class="btn btn-ok"  id="submitBtn" data-toggle="modal" data-target="#myModal">비밀번호 수정</button>
											    <button type="button" class="btn btn-reset" onclick="location='mainLogin'">취소</button>
								            
								             </div>
                                </div>
                                <input type="hidden" name="id" id="id">
                                
                            </form>
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
                     style="text-align: center; font-family: Nanum Square; padding-top: 20px">비밀번호 수정이 완료되었습니다.</h4>

               </div>
               <div class="modal-footer"
                  style="height: 50px; background-color: #ffffff; width: 400px">
                  <button type="button" class="button"
                  style="margin-top: -10px; margin-bottom: 10px; margin-right: 5px"
                  data-dismiss="modal" role="button"
                  onclick="location='login.jsp'">로그인하기</button>

               <button type="button" class="button"
                  style="margin-top: -10px; margin-bottom: 10px; background-color: #d9d9d9;"
                  data-dismiss="modal" role="button"
                  onclick="location='mainLogin.jsp'">메인으로 이동</button>
                                         
               </div>
            </div>
         </div>
      </div>
      <!--  모달 끝 -->
</div>

               
               

</body>
</html>