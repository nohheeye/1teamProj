<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %><!-- add session!! -->
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
	    @import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);
		p{color:red;}	
	    #profile_group{ box-sizing: border-box;  position: relative; max-width: 300px;}
	    #my_profile{display: block; width:auto; height:200px;}
	    .profile_overlay {
		  position: absolute; 
		  top:30%;
		  color: #f1f1f1; 
		  width: 100%;
		  transition: .3s ease;
		  opacity:0;
		  color: #ffffff;
		  font-size: 30px;	
		  padding:0 5px;		
		  text-align: center;
		}
		.button{
		  background-color: #8b9dc3; 
   		  border: none;
  		  color: white;
  		  padding: 6px 20px;
   		  text-align: center;
   		  display: inline-block;
  		  font-size: 15px;
   		  cursor: pointer;
   		  hover:none;
		}
		.mypage_btn{
		 border-radius:50px; background-color:#8b9dc3; border: 4px solid #dfe3ee; color:#ffffff; text-align:center;}
		.form-group:hover .profile_overlay {opacity: 1}
		.table-hover tr{text-align: center; vertical-align: middle;}
		.font-face {font-family: 'Nanum Square';}
		
	</style>
</head>
<body>
	
	<br><br><br><br>
	<!-- 이름  #my_name, 비밀번호 #my_pw, 비밀번호 확인#my_pwcheck, 이메일입력#my_email, 사진#my_profile 유효성검사 #pw_same-->
	
	<div class="form-inline font-face" style="padding-left:30%">
	 	<div class="form-group" id="profile_group"><!-- onError="this.src='./resources/img/m_img.png'"  -->
 			<img class="img-circle" id="my_profile" data-toggle="modal" data-target="#profileModal" src="/img/w_img.png" />
 			<div class="profile_overlay">수정하기</div>
 			<h4 id="my_num" align="center">${userVO.id} ${userVO.name}님</h4>	 		
	 	</div>
	 	
	 	<div class="form-group font-face" style="padding:1% 0 0 7%">
	 		<button class="mypage_btn" type="button"><span id="year"></span>년 &nbsp;나의 바람개비 </button><br><br>
	 		<table class="table table-hover" >
		    <tr class="warning"> <th class="text-center" style="background-color:#8b9dc3" ><font color="#ffffff">No.</font></th> <th class="text-center"  style="background-color:#8b9dc3"><font color="#ffffff">바람개비명</font></th></tr>
				<c:forEach items="${baramList}" var="baram" varStatus="status">
					<tr>
						<td>${status.count}</td><td colspan="2"><a href="${baram.b_no}">${baram.b_name}</a></td>
					<tr>
				</c:forEach>
			</table>
	 	</div>	
	</div>
	<hr>
	<form id="mypageForm"  action="/member/mypage/update" method="POST" class="form-horizontal" style="padding:0 0 0 18%;">
	  <div class="form-group">
	    <label class="col-md-2 control-label">이름</label> <!-- control-label에 패딩있음 -->
	    <div class="col-md-6">
	      <input type="text" class="form-control" placeholder="이름을 입력하시오." id="my_name" name="name" value="${userVO.name}" >
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label for="inputPassword" class="col-md-2 control-label">비밀번호</label>
	    <div class="col-md-6">
	      <input type="password" class="form-control" placeholder="영문과 숫자를 조합해 8~16자리" id="my_pw" name="password" value="${userVO.password}">
	    </div>
	  </div>
	  
 	  <div class="form-group">
	    <label for="inputPassword" class="col-md-2 control-label">비밀번호확인</label>
	    <div class="col-md-6">
	      <input type="password" class="form-control" placeholder="비밀번호를 재입력해주세요" id="my_pwcheck" value="${userVO.password}">
	      <p id="pw_same"></p> <!-- 비밀번호 유효성 표기 -->
	  	</div>
	  </div>
	  
	  <div class="form-group">
	    <label for="inputPassword" class="col-md-2 control-label">이메일</label>
	    <div class="col-md-10">
	      <div class="form-inline"><input type="text" class="form-control" placeholder="이메일을 입력해주세요" id="my_email" name="email" value="${userVO.email}">
	      <span>&nbsp;@kt.com</span></div>
	  	</div>
	  </div>
	
	  <br>

	  <div class="font-face" style="padding-left:30%">
<button type="button" id="updateBtn" class="button">수정</button>
       <button type="button" class="button" style="background-color:#d9d9d9" onclick="location='/'">취소</button>
 	  </div>
	  
	</form>
<!-- 수정 Modal -->
            <div class="modal fade" id="profileModal" role="dialog">
               <div class="modal-dialog" style="width: 600px">

                  <!-- modal content -->

                  <div class="modal-content">
                     <div class="modal-header"
                        style="background-color: #3b5998; height: 35px; width: 600px">
                        <button type="button" class="close" data-dismiss="modal"
                           style="color: white; margin: -8px 0px">&times;</button>
                     </div>
                     <div class="modal-body"
                        style="background-color: #ffffff; width: 600px">
                           <label for="picture">프로필 사진 수정 </label><br>
                           <div class="form-group">
                              <div class="input-group input-file">
                                 <span class="input-group-btn">
                                    <button class="button" type="button" style="margin: 0px -1px 0px 0px; padding: 6px 20px;">파일첨부</button>
                                 </span> 
                                 <input type="text" class="form-control"  placeholder="Choose a file..." style="float: left; width: 300px; height: 33px; margin: 0px 0px 0px 0px" />
                                 <span class="input-group-btn" style="float: left"> 
                                    <button class="button btn-reset" type="button">Reset</button>
                                 </span>
                              </div>
                           </div>
                     </div>

                     <div class="modal-footer"
                        style="height: 50px; background-color: #ffffff; width: 600px">
                        <button type="button" class="button"
                           style="margin-top: -10px; margin-bottom: 10px; margin-right: 5px"
                           data-dismiss="modal" role="button"
                           onclick="#">저장</button>

                        <button type="button" class="button"
                           style="margin-top: -10px; margin-bottom: 10px; background-color: #d9d9d9;"
                           data-dismiss="modal" role="button">닫기</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- 수정 모달 끝 -->

	<script>
	  $(function() {
			$("#my_pw").keyup(function(){
				if($("#my_pw").val()!=$("#my_pwcheck").val()){
					document.getElementById("pw_same").innerHTML="비밀번호가 다릅니다.";
				}else{
					document.getElementById("pw_same").innerHTML="동일한 비밀번호 입니다.";
				}
			});
			
			$("#my_pwcheck").keyup(function(){
				if($("#my_pw").val()!=$("#my_pwcheck").val()){
					document.getElementById("pw_same").innerHTML="비밀번호가 다릅니다.";
				}else{
					document.getElementById("pw_same").innerHTML="동일한 비밀번호 입니다.";
				}
			});
			
			$("#updateBtn").click(function() {
				if($("#my_name").val() == null){
					alert("이름을 입력하세요.");
				}else if($("#my_pw").val() == null){
					alert("pw를 입력하세요.");
				}else if($("#my_email").val() == null){
					alert("mail를 입력하세요.");
				}else{
				 	$("#mypageForm").submit();
				}
			});
		});
	  
	  var today = new Date().getFullYear();
	  document.getElementById("year").innerHTML = today;
	  
	  function readURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		            $('#showimg').attr('src', e.target.result);
		        }

		        reader.readAsDataURL(input.files[0]);
		    }
		}

		$("#imgInp").change(function(){
		    readURL(this);
		});
	</script>
	
	<script id="rendered-js">
      function bs_input_file() {
         $(".input-file")
               .before(
                     function() {
                        if (!$(this).prev().hasClass('input-ghost')) {

                           var element = $("<input type='file'  class='input-ghost' style='visibility:hidden; height:0'>");
                           element.attr("name", $(this).attr("name"));
                           element.change(function() {
                              element.next(element).find('input')
                                    .val(
                                          element.val().split(
                                                '\\').pop());
                           });
                           $(this).find("button.btn-choose").click(
                                 function() {
                                    element.click();
                                 });
                           $(this).find("button.btn-reset").click(
                                 function() {
                                    element.val(null);
                                    $(this).parents(".input-file")
                                          .find('input').val('');
                                 });
                           $(this).find('input').css("cursor",
                                 "pointer");
                           $(this).find('input').mousedown(
                                 function() {
                                    $(this).parents('.input-file')
                                          .prev().click();
                                    return false;
                                 });
                           return element;
                        }
                     });
      }
      $(function() {
         bs_input_file();
      });
   </script>

	
</body>
</html>