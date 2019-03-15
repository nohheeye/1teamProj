<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page session="true"%>

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
<title>39_awardAdmin</title>

<style>
@import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);

#tableStyle {
	background-color: #3b5998;
	text-align: center;
	color: white;
}

#listTable tr:hover {
	background-color: #dfe3ee;
	font-family: Nanum Square;
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

<body style="font-family: Nanum Square;">
	<br>
	<br>


	<div class="row">
		<!-- side -->
		<div class="col-md-2">
			<jsp:include page="../navbarTop.jsp" flush="false" />
		</div>

		<br> <br> <br>
		<!-- 여기에 내용 붙여 넣기!! 위에 내용은 지우지말아주세요!-->
		<div class="container-fluid" style="font-family: Nanum Square;">

			<div class="row">
				<div class="container">
					<br>

					<ul class="nav nav-tabs">
						<li><a href="activity">활동 내역</a></li>
						<li class="active"><a href="award">수상 내역</a></li>
					</ul>

					<br> <br>

				</div>

				<div class="container">
					<div class="row">

						<button class="button pull-right" type="button"
							data-toggle="modal" data-target="#regist">등록</button>
						<br> <br>
						<table class="table" style="text-align: center; border: 1px">
							<thead>
								<tr>
									<th id="tableStyle" style="width: 10%">No</th>
									<th id="tableStyle" style="width: 20%">바람개비명</th>
									<th id="tableStyle" style="width: 45%">수상내역</th>
									<th id="tableStyle" style="width: 15%"></th>
								</tr>
							</thead>

							<tbody>

								<c:forEach items="${awardList}" var="award">
									<tr>
										<td>${award.award_no}</td>
										<td>${award.b_name}</td>
										<td>${award.award_content}</td>
										<input type="text" value="${award.award_b_no}"
											style="display: none">
										<td><button class="button" type="button"
												data-toggle="modal" data-target="#edit${award.award_no}">수정</button>
											<button class="button" type="button" data-toggle="modal"
												data-target="#delete" style=" background-color:#d9d9d9">삭제</button></td>
									</tr>

								</c:forEach>


							</tbody>

						</table>

					</div>
				</div>

				<!-- Pagination -->

				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="/admin/award?page=${pageMaker.startPage-1}">&laquo;</a>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.criteria.page==idx?'class=active' : ''}"/>>
									<a href="/admin/award?page=${idx}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage>0}">
								<li><a href="/admin/award?page=${pageMaker.endPage+1}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>

				<!-- 등록 Modal -->
				<div class="modal fade" id="regist" role="dialog">
					<div class="modal-dialog" style="width: 600px">

						<!-- modal content -->

						<div class="modal-content">
							<div class="modal-header"
								style="background-color: #3b5998; height: 35px; width: 600px">
								<button type="button" class="close" data-dismiss="modal"
									style="color: white; margin: -8px 0px">&times;</button>
							</div>
							<div class="modal-body"
								style="background-color: #ffffff; height: 350px; width: 600px">
								<form>
									<div class="form-group">
										<label for="title">바람개비명 </label> <input type="text"
											class="form-control" id="b_name">
									</div>
									<div class="form-group">
										<label for="context">수상내역 </label>

										<textarea class="form-control" style="width: 100%;" rows=5
											id="award_content" maxlength="100"></textarea>

									</div>

									<label for="picture">사진 등록</label><br>
									<div class="form-group">

										<div class="input-group input-file" name="Fichier1">
											<span class="input-group-btn">
												<button class="button btn-choose" type="button"
													style="margin: 0px -1px 0px 0px; padding: 6px 20px;">파일첨부</button>
												<!-- style="border-radius: 0em" 위에 넣으면 버튼 동그랗게 됨 -->
											</span> <input type="text" class="form-control"
												placeholder='Choose a file...' disabled="disabled"
												style="float: left; width: 300px; height: 35px; margin: 0px 0px 0px 0px" />
											<span class="input-group-btn" style="float: left">
												<button class="button btn-reset" type="button">Reset</button>
											</span>
										</div>
									</div>
									<br>
								</form>
							</div>

							<div class="modal-footer"
								style="height: 50px; background-color: #ffffff; width: 600px">
								<button type="button" class="button"
									style="margin-top: -10px; margin-bottom: 10px; margin-right: 5px"
									data-action="save_award" role="button">등록</button>

								<button type="button" class="button"
									style="margin-top: -10px; margin-bottom: 10px; background-color: #d9d9d9;"
									data-dismiss="modal" role="button" onclick="location='award'">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 등록 모달 끝 -->

				<script>
					$('[data-action="save_award"]')
							.click(
									function() {

										var $form = $('<form></form>');
										$form.attr('action', '/admin/award');
										$form.attr('method', 'post');
										$form.appendTo('body');

										var b_name = $("#b_name").val();
										var award_content = $("#award_content").val();
										var award_b_no = 1;//이거 값바꿔야함

										var form_b_name = $('<input type="hidden" value="'+b_name+'" name="b_name">');
										var form_award_content = $('<input type="hidden" value="'+award_content+'" name="award_content">');
										var form_award_b_no = $('<input type="hidden" value="'+award_b_no+'" name="award_b_no">');

										$form.append(form_b_name).append(
												form_award_content).append(
												form_award_b_no);
										$form.submit();

									});
				</script>




				<c:forEach items="${awardList}" var="award">


					<!-- 수정 Modal -->
					<div class="modal fade" id="edit${award.award_no}" role="dialog">
						<div class="modal-dialog" style="width: 600px">

							<!-- modal content -->

							<div class="modal-content">
								<div class="modal-header"
									style="background-color: #3b5998; height: 35px; width: 600px">
									<button type="button" class="close" data-dismiss="modal"
										style="color: white; margin: -8px 0px">&times;</button>
								</div>
								<div class="modal-body"
									style="background-color: #ffffff; height: 350px; width: 600px">
									<form>
										<input id="update_a_no" type="text" value="${award.award_no}"
											style="display: none">
										<div class="form-group">
											<label for="title">바람개비명 </label> <input type="text"
												class="form-control" id="update_b_name"
												value="${award.b_name}">
										</div>
										<div class="form-group">
											<label for="context">수상내역 </label>

											<textarea class="form-control" style="width: 100%;" rows=5
												maxlength="100" id="update_b_content">${award.award_content}</textarea>

										</div>

										<label for="picture">사진 수정 </label><br>
										<div class="form-group">

											<div class="input-group input-file" name="Fichier1">
												<span class="input-group-btn">
													<button class="button btn-choose" type="button"
														style="margin: 0px -1px 0px 0px; padding: 6px 20px;">파일첨부</button>
													<!-- style="border-radius: 0em" 위에 넣으면 버튼 동그랗게 됨 -->
												</span> <input type="text" class="form-control"
													placeholder='Choose a file...' disabled="disabled"
													style="float: left; width: 300px; height: 35px; margin: 0px 0px 0px 0px" />
												<span class="input-group-btn" style="float: left">
													<button class="button btn-reset" type="button">Reset</button>
												</span>
											</div>
										</div>
										<br>
									</form>
								</div>

								<div class="modal-footer"
									style="height: 50px; background-color: #ffffff; width: 600px">
									<button type="button" class="button"
										style="margin-top: -10px; margin-bottom: 10px; margin-right: 5px"
										role="button" data-action="update_award${award.award_no}">수정</button>

									<button type="button" class="button"
										style="margin-top: -10px; margin-bottom: 10px; background-color: #d9d9d9;"
										data-dismiss="modal" role="button" onclick="location='award'">닫기</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 수정 모달 끝 -->

					<!-- 삭제 Modal -->
					<!-- new !!!! 버튼 두개 모달 시작 버튼-->
					<div class="modal fade" id="delete" role="dialog">
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
										style="text-align: center; font-family: Nanum Square; padding-top: 20px">삭제하시겠습니까?</h4>

								</div>
								<div class="modal-footer"
									style="height: 50px; background-color: #ffffff; width: 400px">
									<button type="button" class="button"
										style="margin-top: -10px; margin-bottom: 10px; margin-right: 5px;"
										role="button"
										onclick="location='/admin/award/${award.award_no}/delete'">삭제</button>

									<button type="button" class="button"
										style="margin-top: -10px; margin-bottom: 10px; background-color: #d9d9d9;"
										data-dismiss="modal" role="button" onclick="location='award'">닫기</button>
								</div>
							</div>
						</div>
					</div>
					<!--  모달 끝 -->
			</div>

		</div>
	</div>


	<script>
		//form을 만든후 전송한다.
		$('[data-action="delete_award${award.award_no}"]')
				.click(
						function() {
							var $form = $('<form></form>');
							$form.attr('action',
									'/admin/award/${award.award_no}');
							$form.attr('method', 'post');
							$form.appendTo('body');

							//var a_no =  "${award.award_no}";

							var form_award_no = $('<input type="hidden" value="${award.award_no}" name="award_no">');
							var form_delete = $('<input type="hidden" value="delete" name="_method">');

							$form.append(form_award_no).append(form_delete);
							$form.submit();
						});

		//form을 만든후 전송한다.
		$('[data-action="update_award${award.award_no}"]')
				.click(
						function() {

							var $form = $('<form></form>');
							$form.attr('action',
									'/admin/award/${award.award_no}');
							$form.attr('method', 'post');
							$form.appendTo('body');

							var a_no = "${award.award_no}";

							var b_name = $("#update_b_name").val();
							var b_content = $("#update_b_content").val();

							var form_a_no = $('<input type="hidden" value="${award.award_no}" name="award_no">');
							var form_b_name = $('<input type="hidden" value="'+b_name+'" name="b_name">');
							var form_b_content = $('<input type="hidden" value="'+b_content+'" name="award_content">');

							$form.append(form_a_no).append(form_b_name).append(form_b_content);
							$form.submit();

						})
	</script>

	<!-- 파일 첨부 스크립트 -->

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
	</c:forEach>
</body>
</html>