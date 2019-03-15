<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<title>Insert title here</title>


	<style>
	@import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);
	.newmember_btn{
		  
		  background-color: #8b9dc3; /* Green */
  		 border: none;
  		 color: white;
  		 padding: 6px 20px;
  		 text-align: center;
  		 display: inline-block;
  		 font-size: 15px;
  		 cursor: pointer;
  		 hover:none;

		}
	.font-face {font-family: 'Nanum Square';}
	.dot {
	  height: 10px;
	  width: 10px;
	  background-color: #bbb;
	  border-radius: 50%;
	  display: inline-block;
	}
	.filebox input[type="file"] { 
	position: absolute; 
	width: 100%; 
	height: 350px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0; 
	} 

	.filebox label { 
		display: inline-block; 
		padding: .5em .75em; 
		color: #999; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #fdfdfd; 
		cursor: pointer; 
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2; 
		border-radius: .25em; 
		} /* named upload */ 
	.filebox .upload-name { 
		display: inline-block; 
		 background-color:#dfe3ee; /* Green */
	  		 border: none;
	  		 color: white;
	  		 padding: 6px 20px;
	  		 text-align: center;
	  		 display: inline-block;
	  		 font-size: 15px;
	  		 cursor: pointer;
	  		 hover:none;
							}
	.filebox .upload-display { /* 이미지가 표시될 지역 */ margin-bottom: 5px; }
	@media(min-width: 768px) { 
		.filebox .upload-display { 
		display: inline-block;  
		margin-right: 5px; 
		margin-bottom: 0; 
		} 
		}
	.filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */ 
	display: inline-block; 
	width: 100%;
	height:355px; 
	padding: 2px; 
	vertical-align: middle; 
	border: 1px solid #ddd; 
	border-radius: 5px;
	background-color: #fff; } 
	.filebox .upload-display img { /* 추가될 이미지 */ 
	display: inline-block; 
	width: 100%; 
	height:350px; }
</style>
	
	
 <script>


 
 $(document).ready(function(){ 
	 var imgTarget = $('.preview-image .upload-hidden');
	 var fileTarget = $('.filebox .upload-hidden'); 
	 fileTarget.on('change', function(){ // 값이 변경되면
		 var parent = $(this).parent();
	 	 parent.children('.upload-display').remove();
	 	 
	 	 
		 if(window.FileReader){ // modern browser 
			 if (!$(this)[0].files[0].type.match(/image\//)) return;
			 var reader = new FileReader();
			 reader.onload = function(e){
				 var src = e.target.result; parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); 
			 }
			 
			 reader.readAsDataURL($(this)[0].files[0]);

			 var filename = $(this)[0].files[0].name; } 
		 else { // old IE 
			 $(this)[0].select();
		 	 $(this)[0].blur();
		 	var imgSrc = document.selection.createRange().text;
		 	parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
		 	var img = $(this).siblings('.upload-display').find('img'); 
		 	img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; 

			 var filename = $(this).val().split('/').pop().split('\\').pop();
		// 파일명만 추출 
		} 
	 // 추출한 파일명 삽입 
	 $(this).siblings('.upload-name').val(filename); 
	 });
	 
	 $(this).find("button.btn-reset").click(function(){
		 $(this).siblings('.upload-name').val('Choose a file..');
		 $(this).siblings('.upload-display').remove();
		
	 });
	 
	
 }); 

 
 </script>	
	
	
	
</head>
<body>
	<!-- top -->
	<jsp:include page="../navbarTop.jsp" flush="false" /> <br><br><br><br>
	
			<br><br>
			<!-- 여기에 내용 붙여 넣기!! 위에 내용은 지우지말아주세요!-->
			
			
<%@page session="true" import="java.util.*" %>
<%
// JSP Calendar:--
// Created by Jason Benassi
// jbenassi@lime-light.com
// http://www.wakeboardutah.com
// 7-2002
%>





<h2 class="font-face" align="center">공모전 일정 수정하기</h2><hr>
  
  



</table>
</td>
<tr><td>
</table>
</div>


<div class="col-sm-5" style="padding-left:20%; height:400px ">
<div class="filebox preview-image" style="margin-top:20px">
<div class="upload-display">
<br><br>
<label style="background-color: #8b9dc3; /* Green */
  		 border: none;
  		 color: white;
  		 padding: 6px 20px;
  		 text-align: center;
  		 display: inline-block;
  		 cursor: pointer;
  		 hover:none;
  		 border-radius: 0px 0px 0px 0px;
  		 font-family: 'Nanum Square';
" for="input-file">파일첨부</label> 
<input type="file" id="input-file" class="upload-hidden newmember_btn"> 

<input type="text" class="upload-name newmember_btn font-face" style="background-color:#d9d9d9; width:170px;" value="Choose a file.." disabled="disabled">
 <button  class="newmember_btn btn-reset font-face" type="button" ><span>Reset</span></button>
</div>
</div>
</div>


<div class="col-lg-7 pull-right" >
      

<div class="col-lg-7">
<form method="POST" class="form-horizontal font-face" style="padding-top:10%;" >
			  <div class="form-group">
			    <label class="col-sm-2 control-label">공모전 명</label> 
			    <div class="col-md-8">
			     	
			      <input type="text" class="form-control" placeholder="공모전 명을 입력하세요" id="contestName" name="contestName" vlaue="<%=request.getParameter("contestName") %>" >
			
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">분야</label> 
			    <div class="col-md-8">	
			      <input type="text" class="form-control" placeholder="공모전의 분야를 입력하세요" id="contestField" >
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">주최/주관</label> 
			    <div class="col-md-8">	
			      <input type="text" class="form-control" placeholder="주최/주관을 입력하세요" id="contestHost" >
			    </div>
			  </div>
			    <div class="form-group">
			   <label class="col-sm-2 control-label">출처</label> 
			    <div class="col-md-8">	
			      <input type="text" class="form-control" placeholder="출처를 입력하세요" id="contestRef" >
			    </div>
			  </div>
			  </form>
			  
			     
 <form class="form-inline font-face" style="padding-left:3%;">
<label class="control-label">접수기간</label> 
				<div class="form-group">
			    <div class="col-md-8" style="padding-left:15%;">	
			      <input type="date" class="form-control" placeholder="일정제목을 입력하세요" id="contestStartday" >
			    </div>
			  </div>
			  
			  <label class="control-label" style="padding-left:1.7%;">~</label> 
			  <div class="form-group">
			    <div class="col-md-8">
			      <input type="date" class="form-control" placeholder="일정제목을 입력하세요" id="contestLastday" >
			    </div>
			  </div>
</form>
</div>

<div class="col-sm-7" style="padding-left:32%;">			  
 <br><br> <button type="button" class="newmember_btn font-face" id="newmember_btn" data-toggle="modal" data-target="#myModal">수정</button>
 <button type="button" class="newmember_btn font-face" id="newmember_btn" style="background-color:#d9d9d9" onclick="location='contestMain'">취소</button>
</div>



 
 </div> 
 
 
 
 <div class="container">

   <!-- new !!!! 버튼 두개 모달 시작 버튼-->
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
                     style="text-align: center; font-family: Nanum Square; padding-top: 20px">수정이 완료되었습니다.</h4>

               </div>
               <div class="modal-footer"
                  style="height: 50px; background-color: #ffffff; width: 400px">
                  <button type="button" class="button newmember_btn"
                     style="margin-top: -40px; margin-bottom: 10px; margin-right: 5px"
                     data-dismiss="modal" role="button"
                     onclick='location="contestMain"'>확인</button>

                 
               </div>
            </div>
         </div>
      </div>
      <!--  모달 끝 -->
 </div>

		
</body>
</html>