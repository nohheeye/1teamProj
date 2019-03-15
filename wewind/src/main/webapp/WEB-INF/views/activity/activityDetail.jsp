<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>

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
	</style>
	
</head>
<body>
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

	<form id="frm" action="insertSupport" method="post">
		<div class="container">
			<div class="row" style="line-height:200%">
					<table class="table table-striped"
						style="text-align: center; border: 1px;">
						<tbody>
							<br>
								<div style="font-size: 1.2em; font-weight: bold" size=50>${activity.acti_title}
										&nbsp;&nbsp;&nbsp;&nbsp;</div>
									 
								
								<span style="font-size: 1.2em; font-weight: bold" size=50>작성일
										&nbsp;&nbsp;&nbsp;&nbsp; </span>${activity.acti_writedate}
					
							<br>
							<tr style="text-align:left;"><span
								style="font-size: 1.2em; font-weight: bold" size=30>참석자
									&nbsp;&nbsp;&nbsp;&nbsp;</span> <label class="checkbox-inline">
									<input type="checkbox" id="Check1" value="노희예" checked="checked"  onclick="return false;"> 노희예
							</label> <label class="checkbox-inline" onclick="return false;"> <input type="checkbox"
									id="Check2" value="서예지" > 서예지
							</label> <label class="checkbox-inline"> <input type="checkbox"
									id="Check3" value="김재연" checked="checked"  onclick="return false;"> 김재연
							</label> <label class="checkbox-inline"> <input type="checkbox"
									id="Check4" value="이서현" checked="checked"  onclick="return false;"> 이서현
							</label> <label class="checkbox-inline"> <input type="checkbox"
									id="Check4" value="곽경은" checked="checked"  onclick="return false;"> 곽경은
							</label>
								</div><div style="line-height:110%"> <br>
								<span style="font-size: 1.2em;font-weight: bold;"
								size=30>날짜 &nbsp;&nbsp;&nbsp;</span> <label class="checkbox-inline">
								
								
								<span style="font-size: 1.2em; font-weight: bold" size=30>03월
									</span>
								
				
								 
								<span style="font-size: 1.2em; font-weight: bold" size=30>14일 </span>
								
								</br>
								


							
							<tr>
							<div style="line-height:100%"> <br></div>
								<textarea placeholder="" style="width:100%; "
										rows=12  maxlength="20480" readonly> ${activity.acti_content}</textarea>
							</tr>
							
							</tr>
						</tbody>	
					</table>



<form method="POST" action="#" enctype="multipart/form-data">
				
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
	<input  class="btn btn-default pull-left" value="이전글" style="width:50pt;margin: 0px 0px 0px 0px"> 
		<input  style="width:50pt;margin: 0px 0px 0px 10px" class="btn btn-default pull-left" value="다음글">
		
		<a href="/baram/${b_no}/activity" class="btn btn-default pull-left" style="margin: 0px 0px 0px 10px">목록</a>
		
		<a href="/baram/${b_no}/activity/${activity.acti_no}/edit" class="btn btn-default pull-right" style="margin: 0px 0px 0px 10px">수정</a>
		<a class="btn btn-default pull-right"
				data-toggle="modal" data-target="#delete">삭제</a>



	<!-- 삭제 Modal 시작-->
		<div class="modal fade" id="delete" role="dialog">
			<div class="modal-dialog modal-sm">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<h4 style="text-align: center">삭제하시겠습니까?</h4>

					</div>
					<div class="modal-footer">
						<div class="btn-group btn-group-justified" role="group"
							aria-label="group button">
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-warning"
									data-action="delete_activity${activity.acti_no}" 
									 role="button">네</button>
							</div>

							<div class="btn-group" role="group">
								<button type="button" id="saveImage"
									class="btn btn-default btn-hover-green" data-action="save"
									data-dismiss="modal"
									role="button">아니오</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

			<script>
			$('[data-action="delete_activity${activity.acti_no}"]').click(function(){
				
				location.href = "/baram/${b_no}/activity/${activity.acti_no}/delete";
	
				
			})
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