<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
.btn_newwind .btn {
	background-color: #ffffff;
	border: 5px solid #ffeead;
	color: #ff6f69;
	padding: 10px 20px;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
	border-radius: 16px;
	font-size: 12px;
}

.button {
	border-radius: 24px;
	background-color: #ffcc5c;
	border: 5px solid #ffeead;
	color: #ffffff;
	text-align: center;
}
</style>
</head>
<body>
	<!-- top -->
	<jsp:include page="../navbarTop.jsp" flush="false" />
	<br>
	<br>
	<br>
	<br>
	<div class="form-inline"
		style="text-align: center; padding-right: 40%;">
		<img src="/images/logo.png" style="width: auto; height: 55px;" />
		<button class="button" type="button">
			<span id="year"></span>2019년 바람개비 개설
		</button>
	</div>
	<form action="/baram" method="POST" id="create-form"
		class="form-horizontal" style="padding: 0 0 0 18%;">
		<div class="form-group">
			<label class="col-md-2 control-label">구분</label>
			<!-- control-label에 패딩있음 -->
			<div class="col-md-2">
				<select class="form-control" id="b_classify" name="b_classify">
					<option value="volvo">신규</option>
					<option value="saab">기존</option>
				</select>
			</div>
			<div class="col-md-2">
				<select class="form-control" id="b_cate_parent" name="b_cate_parent">
					<option value="" disabled selected>대분류</option>
					<option disabled="disabled">--------------</option>

					<c:forEach items="${categoryPar}" var="categoryPar">
						<option value="${categoryPar.b_cate_parent}">${categoryPar.b_cate_parent}</option>
						
					</c:forEach>

				</select>
			</div>

			<div class="col-md-2">
				<select class="form-control" id="b_cate" name="b_cate">
				<option value="소분류" disabled selected>소분류</option>
				</select>
			</div>
	
			<!-- category ajax-->
			<script>
	    	
	    	$('#b_cate_parent').change(function(){
	    		var change_b_cate_parent = $("#b_cate_parent").val();
	    		
	    		$("b_cate").val("");
    	      	$.ajax({
	    	         async : true,
	    	         type : 'POST',
	    	         data : change_b_cate_parent,
	    	         cache : false,
	    	         url : '/baram/makecate',
	    	         dataType : 'json',
	    	         contentType : 'application/json; charset=UTF-8',
	    	         success : function(data) { //
						var input_html="";
	    	        	input_html+='<option value="소분류" disabled selected>소분류</option>';
						for(var i =0;i<data.categorylist.length;i++){
							input_html +='"<option value="'+data.categorylist[i].b_cate+'">'+data.categorylist[i].b_cate+'</option>';
						} 
	
	   					var activityinfolist = document.getElementById('b_cate');
	   					activityinfolist.innerHTML = input_html;
	    	         },
	    	         error : function(e) {
	    	            alert('아이디를 입력하세요!');
	    	         }
    	      	})
	
	    	});
	    	
	    	
	
	    </script>
			<!-- 수정 끝 지워야함 위에  -->
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-md-2 control-label">바람개비명</label>
			<div class="col-md-5">
				<input type="text" class="form-control" placeholder="바람개비명을 입력해주세요"
					id="b_name" name="b_name">
				<p id="same_name"></p>
			</div>
			<div class="col-md-2">
				<button class="button" type="button" id="idcheckbtn">중복확인</button>
			</div>
			<input type="text" value="0" id="idcheck-value" style="display : none">
		</div>

		<div class="form-group">
			<label for="inputPassword" class="col-md-2 control-label">바람개비소개</label>
			<div class="col-md-6">
				<textarea rows="3" class="form-control" placeholder="바람개비소개를 입력해주세요"
					id="b_introduce" name="b_introduce"></textarea>
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword" class="col-md-2 control-label">활동계획서</label>
			<div class="col-md-6">
				<textarea rows="3" class="form-control" placeholder="활동계획서를 입력해주세요"
					id="b_activityplan" name="b_activityplan"></textarea>
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword" class="col-md-2 control-label">학습수준</label>
			<div class="col-md-6">
				<select class="form-control" id="b_difficulty" name="b_difficulty">
					<option value="기본">기본</option>
					<option value="심화">심화</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword" class="col-md-2 control-label">학습장소</label>
			<div class="col-md-6">
				<select class="form-control" id="b_place" name="b_place">
					<option value="방배">방배</option>
					<option value="분당 ">분당</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword" class="col-md-2 control-label">지원사항</label>
			<div class="col-md-6">
				<select class="form-control" id="newwind_support" name="b_support">
					<option value="도서 및 교구지원">도서 및 교구지원</option>
					<option value="외부강사초청">외부강사초청</option>
					<option value="SW플랫폼 및 라이센스 지원">SW플랫폼 및 라이센스 지원</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="inputPassword" class="col-md-2 control-label">건의사항</label>
			<div class="col-md-6">
				<input type="text" class="form-control" placeholder="건의사항을 입력하세요"
					id="b_proposal" name="b_proposal">
			</div>
		</div>

		<div class="btn_newwind" style="padding-left: 30%">
			<button type="button" class="btn" data-toggle="modal"
				data-target="#createModal">만들기</button>
			<button type="button" class="btn">취소</button>
		</div>

	</form>

	<div class="modal fade" id="createModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<h4 align="center">바람개비를 만드시겠습니까?</h4>
				</div>
				<div class="modal-footer">
					<div class="button-group" style="text-align: center">
						<button type="button" class="btn btn-warning"
							id="create-form-submit">네</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	$("#create-form-submit").click(function(){
		
		if($("#b_name").val()=="") {
            alert('바람개비 명을 입력해주세요');
			$('#b_name').focus();
        }
		
		else if($("#b_introduce").val()==""){
				
			alert('바람개비 소개를 입력해주세요');
			
            $('#b_introduce').focus();
		}
		else {
			//중복확인 체크
			if($("#idcheck-value").val()=="1"){
					$("#create-form").submit();		
			}else{
				alert("아이디 중복확인을 해주세요");
			}
				
		}
		
		
		
	});
  
	
  $("#idcheckbtn").click(function() {
      var b_name = $("#b_name").val();
      
      
      alert(b_name+"/"+typeof(b_name));
      
      $.ajax({
         async : true,
         type : 'POST',
         data : b_name,
         cache : false,
         url : '/baram/idcheck',
         dataType : 'json',
         contentType : 'application/json; charset=UTF-8',
         success : function(data) {
            if (data.count > 0) {
               alert('이미 존재하는 아이디 입니다.');
               $('#b_name').focus();
               $("#idcheck-value").val(0);
               //            
//               $('#idcheckbtn').attr("disabled", "disabled");
            } else {
               alert('사용 가능한 아이디입니다.');
               // 아이디가 중복하지 않으면
               $("#idcheck-value").val(1);
 //              $('#idcheckbtn').removeAttr("disabled");
            }
         },
         error : function(e) {
            alert('아이디를 입력하세요!');
         }
      })
	});
	</script>
</body>
</html>