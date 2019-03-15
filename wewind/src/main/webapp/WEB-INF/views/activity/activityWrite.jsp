<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="smarteditor2-master/dist/js/service/HuskyEZCreator.js"
	charset="UTF-8"></script>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<title>Insert title here</title>
	
	<style>
	</style>
	
</head>
<body>
	<!-- top -->
	<jsp:include page="../navbarTop.jsp" flush="false" /> <br><br><br><br>
	
	<div class="row">
		<!-- side -->
		<div class="col-md-2">
			<jsp:include page="../sideBar.jsp" flush="false" />
		</div>
		
		<div class="col-md-10">
			<div class="container-fluid">
					<jsp:include page="../navbarShoulder.jsp?b_no=${b_no}&name='activity'" flush="false" />
	
			<!-- 여기에 내용 붙여 넣기!! 위에 내용은 지우지말아주세요!-->
	<form action="/baram/${b_no}/activity" method="post" id="save_form">
		<div class="container">
			<div class="row" style="line-height:200%">
					<table class="table table-striped"
						style="text-align: center; border: 1px;">
						<tbody>
							<br>
								
								<input type="text" style="width: 100%; margin:0px 0px 10px 0px" placeholder="제목을 입력하세요"
									id="acti_title" name="acti_title" maxlength="50">
								
							<tr style="text-align:left;"><span
								style="font-size: 1.2em; font-weight: bold" size=30>참석자
									&nbsp;&nbsp;&nbsp;&nbsp;</span> 
							<input type="checkbox" id="Check1" value="노희예"> 노희예
								</label> <label class="checkbox-inline">
								<input type="checkbox" id="Check2" value="서예지"> 서예지
								</label> <label class="checkbox-inline">
								<input type="checkbox" id="Check3" value="김재연"> 김재연
								</label> <label class="checkbox-inline">
								<input type="checkbox" id="Check4" value="이서현"> 이서현
								</label> <label class="checkbox-inline">
								<input type="checkbox" id="Check5" value="곽경은"> 곽경은
								</label>
							
								</div><div style="line-height:110%"> <br>
								<span style="font-size: 1.2em;font-weight: bold;"
								size=30>날짜 &nbsp;&nbsp;&nbsp;</span> <label class="checkbox-inline">
								  
								  <select name="month" onchange="categoryChange(this)">
									<option value="1">&nbsp;01&nbsp;</option>
									<option value="2">&nbsp;02&nbsp;</option>
									<option value="3">&nbsp;03&nbsp;</option>
									<option value="4">&nbsp;04&nbsp;</option>
									<option value="5">&nbsp;05&nbsp;</option>
									<option value="6">&nbsp;06&nbsp;</option>
									<option value="7">&nbsp;07&nbsp;</option>
									<option value="8">&nbsp;08&nbsp;</option>
									<option value="9">&nbsp;09&nbsp;</option>
									<option value="10">&nbsp;10&nbsp;</option>
									<option value="11">&nbsp;11&nbsp;</option>
									<option value="12">&nbsp;12&nbsp;</option>
								</select>
								
							<span style="font-size: 1.2em; font-weight: bold" size=30>월
									</span>
								 
								<select name="day" id="good">
									<option value="1">&nbsp;01&nbsp;</option>
									<option value="2">&nbsp;02&nbsp;</option>
									<option value="3">&nbsp;03&nbsp;</option>
									<option value="4">&nbsp;04&nbsp;</option>
									<option value="5">&nbsp;05&nbsp;</option>
									<option value="6">&nbsp;06&nbsp;</option>
									<option value="7">&nbsp;07&nbsp;</option>
									<option value="8">&nbsp;08&nbsp;</option>
									<option value="9">&nbsp;09&nbsp;</option>
									<option value="10">&nbsp;10&nbsp;</option>
									<option value="11">&nbsp;11&nbsp;</option>
									<option value="12">&nbsp;12&nbsp;</option>
									<option value="13">&nbsp;13&nbsp;</option>
									<option value="14">&nbsp;14&nbsp;</option>
									<option value="15">&nbsp;15&nbsp;</option>
									<option value="16">&nbsp;16&nbsp;</option>
									<option value="17">&nbsp;17&nbsp;</option>
									<option value="18">&nbsp;18&nbsp;</option>
									<option value="19">&nbsp;19&nbsp;</option>
									<option value="20">&nbsp;20&nbsp;</option>
									<option value="21">&nbsp;21&nbsp;</option>
									<option value="22">&nbsp;22&nbsp;</option>
									<option value="23">&nbsp;23&nbsp;</option>
									<option value="24">&nbsp;24&nbsp;</option>
									<option value="25">&nbsp;25&nbsp;</option>
									<option value="26">&nbsp;26&nbsp;</option>
									<option value="27">&nbsp;27&nbsp;</option>
									<option value="28">&nbsp;28&nbsp;</option>
									<option value="29">&nbsp;29&nbsp;</option>
									<option value="30">&nbsp;30&nbsp;</option>
									<option value="31">&nbsp;31&nbsp;</option>
								</select>
								
								<span style="font-size: 1.2em; font-weight: bold" size=30>일</span>
								
								</br>
								
<script>
								function categoryChange(e) {
									  var day_31 = ["&nbsp;01&nbsp;","&nbsp;02&nbsp;","&nbsp;03&nbsp;","&nbsp;04&nbsp;","&nbsp;05&nbsp;","&nbsp;06&nbsp;","&nbsp;07&nbsp;","&nbsp;08&nbsp;","&nbsp;09&nbsp;","&nbsp;10&nbsp;","&nbsp;11&nbsp;","&nbsp;12&nbsp;","&nbsp;13&nbsp;","&nbsp;14&nbsp;","&nbsp;15&nbsp;","&nbsp;16&nbsp;","&nbsp;17&nbsp;","&nbsp;18&nbsp;","&nbsp;19&nbsp;","&nbsp;20&nbsp;","&nbsp;21&nbsp;","&nbsp;22&nbsp;","&nbsp;23&nbsp;","&nbsp;24&nbsp;","&nbsp;25&nbsp;","&nbsp;26&nbsp;","&nbsp;27&nbsp;","&nbsp;28&nbsp;","&nbsp;29&nbsp;","&nbsp;30&nbsp;","&nbsp;31&nbsp;",];
									  var day_30 = ["&nbsp;01&nbsp;","&nbsp;02&nbsp;","&nbsp;03&nbsp;","&nbsp;04&nbsp;","&nbsp;05&nbsp;","&nbsp;06&nbsp;","&nbsp;07&nbsp;","&nbsp;08&nbsp;","&nbsp;09&nbsp;","&nbsp;10&nbsp;","&nbsp;11&nbsp;","&nbsp;12&nbsp;","&nbsp;13&nbsp;","&nbsp;14&nbsp;","&nbsp;15&nbsp;","&nbsp;16&nbsp;","&nbsp;17&nbsp;","&nbsp;18&nbsp;","&nbsp;19&nbsp;","&nbsp;20&nbsp;","&nbsp;21&nbsp;","&nbsp;22&nbsp;","&nbsp;23&nbsp;","&nbsp;24&nbsp;","&nbsp;25&nbsp;","&nbsp;26&nbsp;","&nbsp;27&nbsp;","&nbsp;28&nbsp;","&nbsp;29&nbsp;","&nbsp;30&nbsp;"];
									  var day_29 = ["&nbsp;01&nbsp;","&nbsp;02&nbsp;","&nbsp;03&nbsp;","&nbsp;04&nbsp;","&nbsp;05&nbsp;","&nbsp;06&nbsp;","&nbsp;07&nbsp;","&nbsp;08&nbsp;","&nbsp;09&nbsp;","&nbsp;10&nbsp;","&nbsp;11&nbsp;","&nbsp;12&nbsp;","&nbsp;13&nbsp;","&nbsp;14&nbsp;","&nbsp;15&nbsp;","&nbsp;16&nbsp;","&nbsp;17&nbsp;","&nbsp;18&nbsp;","&nbsp;19&nbsp;","&nbsp;20&nbsp;","&nbsp;21&nbsp;","&nbsp;22&nbsp;","&nbsp;23&nbsp;","&nbsp;24&nbsp;","&nbsp;25&nbsp;","&nbsp;26&nbsp;","&nbsp;27&nbsp;","&nbsp;28&nbsp;","&nbsp;29&nbsp;"];
									  var target = document.getElementById("good");
									 
									  if(e.value == "1") var d = day_31;
									  else if(e.value == "2") var d = day_29;
									  else if(e.value == "3") var d = day_31;
									  else if(e.value == "4") var d = day_30;
									  else if(e.value == "5") var d = day_31;
									  else if(e.value == "6") var d = day_30;
									  else if(e.value == "7") var d = day_31;
									  else if(e.value == "8") var d = day_31;
									  else if(e.value == "9") var d = day_30;
									  else if(e.value == "10") var d = day_31;
									  else if(e.value == "11") var d = day_30;
									  else if(e.value == "12") var d = day_31;
									  
									 
									  target.options.length = 0;
									 
									  for (x in d) {
									    var opt = document.createElement("option");
									    opt.value = d[x];
									    opt.innerHTML = d[x];
									    target.appendChild(opt);
									  } 
									}
								</script>		
								

							
							<tr>
							<div style="line-height:100%"> <br></div>
								<textarea placeholder="글 내용" style="width:100%;"
										rows=12 name="acti_content" id="acti_content" maxlength="20480"></textarea>
							</tr>
							
							</tr>
						</tbody>	
					</table>

<form method="POST" action="#" enctype="multipart/form-data">
		<!-- <input type="submit" class="btn btn-warning pull-right" value="저장 " style="margin: 0px 0px 100px 10px">  -->
		<!-- <input type="submit" style="margin: 0px 0px 100px 10px" class="btn btn pull-right" value="취소">	 -->	
		<input  class="btn btn-warning pull-right" onclick="submitButton(document.form_check);"
		style="margin: 0px 0px 100px 10px" value="저장">
		<a href="${path}/activity" id="btn_"style="margin: 0px 0px 100px 10px" class="btn btn-default pull-right" >취소</a>		
	<div class="form-group">
		<div class="input-group input-file" name="Fichier1">
			<span class="input-group-btn">
        		<button class="btn btn-warning btn-choose" type="button" >파일첨부</button>
        		<!-- style="border-radius: 0em" 위에 넣으면 버튼 동그랗게 됨 -->
    		</span>
    		<input type="text" class="form-control" placeholder='Choose a file...' 
    		disabled="disabled"; style="width:300px; height:34px; margin:0px 0px 0px 0px"/>
    		<span class="input-group-btn"  style="float:left">
    			<button  class="btn btn-default btn-reset" type="button" >Reset</button>
    		</span>
		</div>
	</div>
</form>

<script>
function submitButton() {
	msg = ""
	for(a=1; a<=5;a++){
		b = $('#Check'+a).is(':checked')
		if(b){
			msg += $('#Check'+a).val() + " ";
		} else{
			continue;
		}
	}
	alert(msg);
	$("#save_form").submit();
}
</script>
			

<script id="rendered-js">function bs_input_file() {
  $(".input-file").before(
  function () {
    if (!$(this).prev().hasClass('input-ghost')) {
    		
      var element = $("<input type='file'  class='input-ghost' style='visibility:hidden; height:0'>");
      element.attr("name", $(this).attr("name"));
      element.change(function () {
        element.next(element).find('input').val(element.val().split('\\').pop());
      });
      $(this).find("button.btn-choose").click(function () {
        element.click();
      });
      $(this).find("button.btn-reset").click(function () {
        element.val(null);
        $(this).parents(".input-file").find('input').val('');
      });
      $(this).find('input').css("cursor", "pointer");
      $(this).find('input').mousedown(function () {
        $(this).parents('.input-file').prev().click();
        return false;
      });
      return element;
    }
  });
}
$(function () {
  bs_input_file();
});
</script>

</form>


				
				<script type="text/javascript">
					var oEditors = [];
					nhn.husky.EZCreator
							.createInIFrame({
								oAppRef : oEditors,
								elPlaceHolder : "bbsContent", //textarea ID sSkinURI
								sSkinURI : "smarteditor2-master/workspace/SmartEditor2Skin.html", //skin경로
								htParams : {
									bUseToolbar : true,
									bUseVerticalResizer :false,
									bUseModeChanger : false,
									fOnBeforeUnload : function() {
									}
								},
								fOnAppLoad : function() {
									oEditors.getById["bbsContent"].exec(
											"PASTE_HTML", [""]);
								},
								fCreator: "createSEditor2",
							});
					$("#save").click(
							function() {
								oEditors.getById["bbsContent"].exec(
										"UPDATE_CONTENTS_FIELD", []);
								$("#frm").submit();
							});
				</script>
		</div>
		</div>
	</div>
	
		
</body>
</html>