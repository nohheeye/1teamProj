<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
		<div class="container">
		<div class="row">
			<table class="table table-striped" id="list_table"
				style="text-align: center; border: 1px;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">No</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
			
					<c:forEach items="${activityList}" var="activity"
								 begin="0" end="${pageMaker.displayPageNum-1}" step="1" 
								 varStatus="status">
					  <tr id="activity${activity.acti_no}" class="card-link">
					  		<td>${pageMaker.totalCount - status.count - criteria.perPageNum*(criteria.page-1)+1}</td>
							<td>${activity.acti_title}</td>
							<td>${activity.acti_writer}</td>
							<td>${activity.acti_writedate}</td>
					  </tr>
					 </c:forEach>

					<!-- 
					<c:forEach items="${activityList}" var="activity">
						<tr id="activity${activity.acti_no}" class="card-link" >
						
							<td>${activity.acti_no}</td>
							<td>${activity.acti_title}</td>
							<td>${activity.acti_writer}</td>
							<td>${activity.acti_writedate}</td>
					
						</tr>
						
					</c:forEach>
					 -->
				</tbody>
			</table>

			<a href="/baram/${b_no}/activity/create" class="btn btn-default pull-right">글쓰기</a>
		</div>
	<script>
	//alert("page is ${criteria.page}/ criteria.perPageNum is ${criteria.perPageNum}");
		<c:forEach items="${activityList}" var="activity">
			$("#activity${activity.acti_no}").click(function(){
				location.href = "/baram/${b_no}/activity/${activity.acti_no}";
			});
		</c:forEach>
	</script>


			<!-- Pagination -->
		<div class="box-footer">
			<div class="text-center">
				<ul class="pagination">
						<c:if test="${pageMaker.prev}">
						<li><a href="/baram/${b_no}/activity?page=${pageMaker.startPage-1}">&laquo;</a>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li <c:out value="${pageMaker.criteria.page==idx?'class=active' : ''}"/>>
							<a href ="/baram/${b_no}/activity?page=${idx}">${idx}</a>
						</li>		
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage>0}">
						<li><a href="/baram/${b_no}/activity?page=${pageMaker.endPage+1}">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>


		<div class="form-inline" style="text-align: center;">
			<div class="form-group">
				<select>
										<option value="1">&nbsp;제목&nbsp;</option>
										<option value="2">&nbsp;내용&nbsp;</option>
										<option value="3">&nbsp;작성자&nbsp;</option>
										
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
<br></br>
		</div>
		</div>
	</div>
	
		
</body>
</html>