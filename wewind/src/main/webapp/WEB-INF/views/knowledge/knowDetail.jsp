<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
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

<style>
@import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);

#detailTable {
	border-collapse: collapse;
	width: 100%;
}

#detailTable td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
	font-family: Nanum Square;
}

#detailTable th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #3b5998;
	color: white;
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
<body>
	<!-- top -->
	<jsp:include page="../navbarTop.jsp" flush="false" />
	<br>
	<br>
	<br>
	<br>

	<div class="row">
		<!-- side -->
		<div class="col-md-2">
			<jsp:include page="../sideBar.jsp" flush="false" />
		</div>

		<div class="col-md-10">
			<div class="container-fluid">
				<br>
				<jsp:include page="../navbarShoulder.jsp?b_no=${b_no}&name='know'" flush="false" />
				<!-- 여기에 내용 붙여 넣기!! 위에 내용은 지우지말아주세요!-->
				<!-- 게시판 -->
				<br>

				<div class="container">

					<div class="row">

						<table id="detailTable">
							<thead>

								<tr>
									<th colspan="2">지식공유_제목</th>
								</tr>

							</thead>

							<tbody>
								<tr>

									<td style="text-align: center; width: 20%">제목</td>

									<td>${knowledgeVO.know_title}</td>

								</tr>
								<tr>
									<td style="text-align: center; width: 20%">작성자</td>

									<td>${knowledgeVO.know_writer}</td>
								</tr>

								<tr>
									<td style="text-align: center; width: 20%">작성일</td>
									<td>${knowledgeVO.know_writedate}</td>
								</tr>

								<tr>
									<td style="text-align: center; width: 20%">내용</td>
									<td style="min-height: 200px; text-align: left;"><br>
										${knowledgeVO.know_content}</td>

								</tr>
							</tbody>


						</table>
						<br>
						<button class="button">첨부파일</button>
						<br> <br>
						<button class="button">이전글</button>
						<button class="button">다음글</button>
						<button onclick="location='/baram/${b_no}/knowledge'"
							class="button">목록</button>
						<button class="button pull-right" style="margin: 0px 0px 0px 10px"
							onclick="location='/baram/${b_no}/knowledge/${know_no}/edit'">수정</button>
						<button class="button pull-right" data-toggle="modal"
							data-target="#delete">삭제</button>
					</div>


					<!-- 삭제 Modal 시작-->
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
										style="margin-top: -40px; margin-bottom: 10px; margin-right: 5px"
										role="button"
										data-action="delete_knowledge${knowledgeVO.know_no}">삭제</button>

									<button type="button" class="button"
										style="margin-top: -40px; margin-bottom: 10px; background-color: #d9d9d9;"
										data-dismiss="modal" role="button">닫기</button>
								</div>
							</div>
						</div>
					</div>
					<!--  모달 끝 -->
					<script>
						//form을 만든후 전송한다.
						$(
								'[data-action="delete_knowledge${knowledgeVO.know_no}"]')
								.click(
										function() {

											location.href = "/baram/${b_no}/knowledge/${knowledgeVO.know_no}/delete";

										})
						$('[data-action="update_award${award.award_no}"]')
								.click(
										function() {

											var $form = $('<form></form>');
											$form
													.attr('action',
															'/admin/award/${award.award_no}');
											$form.attr('method', 'post');
											$form.appendTo('body');

											var a_no = "${award.award_no}";

											var b_name = $("#update_b_name")
													.val();
											var b_content = $(
													"#update_b_content").val();

											var form_a_no = $('<input type="hidden" value="${award.award_no}" name="award_no">');
											var form_b_name = $('<input type="hidden" value="'+b_name+'" name="b_name">');
											var form_b_content = $('<input type="hidden" value="'+b_content+'" name="award_content">');

											$form.append(form_a_no).append(
													form_b_name).append(
													form_b_content);
											$form.submit();

										})
					</script>


				</div>

			</div>
		</div>
	</div>


</body>
</html>