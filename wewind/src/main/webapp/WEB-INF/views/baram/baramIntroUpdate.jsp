<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			<jsp:include page="../navbarShoulder.jsp?b_no=${b_no}&name='intro'" flush="false" />
	
			<!-- 여기에 내용 붙여 넣기!! 위에 내용은 지우지말아주세요!-->
			<br></br>
	<form id="edit_submit_form" action="/baram/${baram.b_no}" method="post">
		<div class="container">
			
					<table class="table table-striped"
						style="text-align: center; border: 1px;">
						<tbody>
							
							<div style="line-height:100%"> <br></div>
								<textarea placeholder="글 내용" style="width:100%; "
										rows=12 name="b_introduce" id="b_introduce" maxlength="20480">${baram.b_introduce}</textarea>
							</tr>
							
							</tr>
						</tbody>	
					</table>


 <input type="button" data-toggle="modal" data-target="#edit"
	class="btn btn-warning pull-right" value="수정 " style="margin: 0px 0px 100px 10px">
	<a href="/baram/${baram.b_no}" id="btn_"style="margin: 0px 0px 100px 10px" class="btn btn-default pull-right" >취소</a>		
	


<!-- 수정 완료 Modal 시작-->
		<div class="modal fade" id="edit" role="dialog">
			<div class="modal-dialog modal-sm">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<h4 style="text-align: center">장말로 수정하시겠습니까?</h4>

					</div>
					<div class="modal-footer">
						<div class="btn-group btn-group-justified" role="group"
							aria-label="group button">
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-warning"
									data-action="edit_baram${baram.b_no}" role="button">수정
									완료</button>
							</div>

							<div class="btn-group" role="group">
								<button type="button" id="saveImage" class="btn btn-default"
									data-dismiss="modal" role="button">취소</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!--  모달 끝 -->

			
		<!-- 수정 버튼 눌렀을 때 모달띄우고 그 다음 수정 완료 버튼 누를때 작동 -->
		<script>
			$('[data-action="edit_baram${baram.b_no}"]').click(
					function() {
						$("#edit_submit_form").submit();

					});
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