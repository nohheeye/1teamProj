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
<title>22_knowList</title>

<style>
@import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);

select {
	padding: 8px 10px;
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-moz-appearance: none;
	appearance: none;
}

#listTable tr:hover {
	background-color: #dfe3ee;
	font-family: Nanum Square;
}

#trTable {
	background-color: #3b5998;
	text-align: center;
	color: #ffffff;
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

.font-face {
	font-family: 'Nanum Square';
}
</style>

</head>
<body style="font-family: Nanum Square;">

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
				<jsp:include page="../navbarShoulder.jsp?b_no=${b_no}&name='know'" flush="false" />
				<!-- 여기에 내용 붙여 넣기!! 위에 내용은 지우지말아주세요!-->

				<div class="container">
					<div class="row">
						<table class="table" id="listTable"
							style="text-align: center; border: 1px; font-family: Nanum Square;">
							<thead>
								<tr>
									<th id="trTable">No</th>
									<th id="trTable">제목</th>
									<th id="trTable">작성자</th>
									<th id="trTable">작성일</th>
								</tr>
							</thead>
							<tbody>
									<c:forEach items="${knowledgeList}" var="knowledge" begin="0"
									end="${pageMaker.displayPageNum-1}" step="1" varStatus="status">
										<tr id="knowledge${knowledge.know_no}" class="card-link">	
										<td>${pageMaker.totalCount - status.count - criteria.perPageNum*(criteria.page-1)+1}</td>
										<td>${knowledge.know_title}</td>
										<td>${knowledge.know_writer}</td>
										<td>${knowledge.know_writedate}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>

						<button class="button pull-right"
							onclick="location='/baram/${b_no}/knowledge/create'">글쓰기</button>
					</div>


					<!-- Pagination -->
					<div class="box-footer">
						<div class="text-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li><a
										href="/baram/${b_no}/knowledge?page=${pageMaker.startPage-1}">&laquo;</a>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li
										<c:out value="${pageMaker.criteria.page==idx?'class=active' : ''}"/>>
										<a href="/baram/${b_no}/knowledge?page=${idx}">${idx}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage>0}">
									<li><a
										href="/baram/${b_no}/knowledge?page=${pageMaker.endPage+1}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>


					<div class="form-inline" style="text-align: center;">
						<div class="form-group" style="margin: 0 -15px">
							<select>
								<option value="1">제목<span class="caret"></span></option>
								<option value="2">내용</option>
								<option value="3">작성자</option>
							</select>
						</div>
						
						<div class="form-group">
							<form class="navbar-form" role="search">
								<span class="form-group"> <input type="text"
									class="form-control" placeholder="Search">
								</span>
								<button type="submit" class="btn btn-default">검색</button>
							</form>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>
	<script>
		<c:forEach items="${knowledgeList}" var="knowledge">
		$("#knowledge${knowledge.know_no}").click(function() {
			location.href = "/baram/${b_no}/knowledge/${knowledge.know_no}";
		});
		</c:forEach>
	</script>

</body>
</html>