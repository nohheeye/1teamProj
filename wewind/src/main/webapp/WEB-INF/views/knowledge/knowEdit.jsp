<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="smarteditor2-master/dist/js/service/HuskyEZCreator.js"
	charset="UTF-8"></script>
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


<title>25_knowEdit</title>

<style>
@import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);

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
	<jsp:include page="../navbarTop.jsp" flush="false" /> <br><br><br><br>
	
	<div class="row">
		<!-- side -->
		<div class="col-md-2">
			<jsp:include page="../sideBar.jsp" flush="false" />
		</div>

		<div class="col-md-10">
			<div class="container-fluid">
							<jsp:include page="../navbarShoulder.jsp?b_no=${b_no}&name='know'" flush="false" />
			<!-- 여기에 내용 붙여 넣기!! 위에 내용은 지우지말아주세요!-->
				<div class="container">

					<div class="row">

						<!-- 글 입력 페이지 -->
				<!-- 글 입력 페이지 -->

				<form id="edit_submit_form"
					action="/baram/${b_no}/knowledge/${know_no}" method="post">
					<div class="container">
						<div class="row">

							<table class="table table-striped"
								style="text-align: center; border: 1px;">

								<tbody>


									<input class="form-control" type="text" id="know_title"
										style="width: 100%; margin: 0px 0px 10px 0px; border-radius: 5px"
										value="${knowledgeVO.know_title}" name="know_title"
										maxlength="50">

									<tr>
										<br>
										<textarea class="form-control" placeholder="글 내용"
											style="width: 100%;" rows=12 name="know_content"
											id="know_content" maxlength="20480">${knowledgeVO.know_content}</textarea>
									</tr>
								</tbody>
							</table>

							<button class="button pull-right" type="button"
								style="margin: 0px 0px 100px 10px;" data-toggle="modal"
								data-target="#edit">수정</button>
							<button
								style="margin: 0px 0px 100px 10px; background-color: #d9d9d9;"
								class="button pull-right" onclick="location='knowList.jsp'"
								type="button">취소</button>
							<div class="form-group">
								<div class="input-group input-file" name="Fichier1">
									<span class="input-group-btn">
										<button class="button btn-choose" type="button"
											style="margin: 0px -1px 0px 0px; height: 35px; vertical-align: center">파일첨부</button>
									</span> <input type="text" class="form-control"
										placeholder='Choose a file...' disabled="disabled"
										style="width: 300px; height: 35px" /> <span
										class="input-group-btn" style="float: left">
										<button class="button btn-reset" type="button">
											<span>Reset</span>
										</button>
									</span>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>

		<!-- new !!!! 버튼 두개 모달 시작 버튼-->
		<div class="modal fade" id="edit" role="dialog">
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
							style="text-align: center; font-family: Nanum Square; padding-top: 20px">수정하시겠습니까?</h4>

					</div>
					<div class="modal-footer"
						style="height: 50px; background-color: #ffffff; width: 400px">
						<button type="button" class="button"
							style="margin-top: -10px; margin-bottom: 10px; margin-right: 5px"
							role="button" data-action="edit_know${knowledgeVO.know_no}">수정</button>

						<button type="button" class="button"
							style="margin-top: -10px; margin-bottom: 10px; background-color: #d9d9d9;"
							data-dismiss="modal" role="button">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!--  모달 끝 -->

		<!-- 수정 버튼 눌렀을 때 모달띄우고 그 다음 수정 완료 버튼 누를때 작동 -->
		<script>
			$('[data-action="edit_know${knowledgeVO.know_no}"]').click(
					function() {
						$("#edit_submit_form").submit();

					});
		</script>

		<script id="rendered-js">
			function bs_input_file() {
				$(".input-file")
						.before(
								function() {
									if (!$(this).prev().hasClass('input-ghost')) {

										var element = $("<input type='file'  class='input-ghost' style='visibility:hidden; height:0'>");
										element.attr("name", $(this).attr(
												"name"));
										element
												.change(function() {
													element
															.next(element)
															.find('input')
															.val(
																	element
																			.val()
																			.split(
																					'\\')
																			.pop());
												});
										$(this).find("button.btn-choose")
												.click(function() {
													element.click();
												});
										$(this).find("button.btn-reset").click(
												function() {
													element.val(null);
													$(this).parents(
															".input-file")
															.find('input').val(
																	'');
												});
										$(this).find('input').css("cursor",
												"pointer");
										$(this).find('input').mousedown(
												function() {
													$(this).parents(
															'.input-file')
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

		<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator
					.createInIFrame({
						oAppRef : oEditors,
						elPlaceHolder : "bbsContent", //textarea ID
						sSkinURI : "smarteditor2-master/workspace/SmartEditor2Skin.html", //skin경로
						htParams : {
							bUseToolbar : true,
							bUseVerticalResizer : false,
							bUseModeChanger : false,
							fOnBeforeUnload : function() {
							}
						},
						fOnAppLoad : function() {
							oEditors.getById["bbsContent"].exec("PASTE_HTML",
									[ "지식공유 내용을 입력해주세요!" ]);
						},
						fCreator : "createSEditor2",
					});
			$("#save").click(
					function() {
						oEditors.getById["bbsContent"].exec(
								"UPDATE_CONTENTS_FIELD", []);
						$("#frm").submit();
					});
		</script>
</body>
</html>