<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    @import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);
	.button{
	     background-color: #8b9dc3; 
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
  	table>thead>tr>th{text-align:center;}
  	select { 
		padding: 8px 10px; 
		border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
		-moz-appearance: none; 
		appearance: none; 
		}

   #list_table>tbody>tr:hover { background-color: #dfe3ee;  font-family: Nanum Square;}
}
</style>


</head>
<body>
	<!-- top -->
	<jsp:include page="../navbarTop.jsp" flush="false" />
	<br><br><br><br>

	<div class="row">
		<!-- side -->
		<div class="col-md-2">
			<jsp:include page="../sideBar.jsp" flush="false" />
		</div>

		<div class="col-md-10 font-face">
			<div class="container-fluid">
				<jsp:include page="../navbarShoulder.jsp" flush="false" />
				<!-- 여기에 내용 붙여 넣기!! 위에 내용은 지우지말아주세요!-->

				<div class="container-fluid">

					<div class="row">
						<div class="col-md-4">

							<%@page session="true" import="java.util.*"%>
							<%
								// JSP Calendar:--
								// Created by Jason Benassi
								// jbenassi@lime-light.com
								// http://www.wakeboardutah.com
								// 7-2002
							%>

							<%
								// Global Vars
								int action = 0; // incoming request for moving calendar up(1) down(0) for month
								int currYear = 0; // if it is not retrieved from incoming URL (month=) then it is set to current year
								int currMonth = 0; // same as year
								String boxSize = "50"; // how big to make the box for the calendar

								//build 2 calendars

								Calendar c = Calendar.getInstance();
								Calendar cal = Calendar.getInstance();
								Date sch;

								if (request.getParameter("action") == null) { // Check to see if we should set the year and month to the current
									currMonth = c.get(c.MONTH);
									currYear = c.get(c.YEAR);
									cal.set(currYear, currMonth, 1);
								}

								else {
									if (!(request.getParameter("action") == null)) { // Hove the calendar up or down in this if block
										currMonth = Integer.parseInt(request.getParameter("month"));
										currYear = Integer.parseInt(request.getParameter("year"));

										if (Integer.parseInt(request.getParameter("action")) == 1) {
											cal.set(currYear, currMonth, 1);
											cal.add(cal.MONTH, 1);
											currMonth = cal.get(cal.MONTH);
											currYear = cal.get(cal.YEAR);
										} else {
											cal.set(currYear, currMonth, 1);
											cal.add(cal.MONTH, -1);
											currMonth = cal.get(cal.MONTH);
											currYear = cal.get(cal.YEAR);
										}
									}
								}
							%>

							<%!public boolean isDate(int m, int d, int y) { // This method is used to check for a VALID date
		m -= 1;
		Calendar c = Calendar.getInstance();
		c.setLenient(false);

		try {
			c.set(y, m, d);
			Date dt = c.getTime();
		} catch (IllegalArgumentException e) {
			return false;

		}
		return true;
	}%>


							<%!public String getDateName(int monthNumber) { // This method is used to quickly return the proper name of a month
		String strReturn = "";
		switch (monthNumber) {
			case 0 :
				strReturn = "1월";
				break;
			case 1 :
				strReturn = "2월";
				break;
			case 2 :
				strReturn = "3월";
				break;
			case 3 :
				strReturn = "4월";
				break;
			case 4 :
				strReturn = "5월";
				break;
			case 5 :
				strReturn = "6월";
				break;
			case 6 :
				strReturn = "7월";
				break;
			case 7 :
				strReturn = "8월";
				break;
			case 8 :
				strReturn = "9월";
				break;
			case 9 :
				strReturn = "10월";
				break;
			case 10 :
				strReturn = "11월";
				break;
			case 11 :
				strReturn = "12월";
				break;
		}
		return strReturn;
	}%>

							<table class="font-face" width='350' celpadding='0' cellspacing='0'>
								  <br>
								  <br>
								  <tr>
								   <td width='70' align='center' valign='middle'><a href="list?month=<%=currMonth%>&year=<%=currYear%>&action=0"><font size="5" color="#3b5998"> < </font></a></td>
								   <td class="font-face" width='100' align='center' valign='middle'><b><font size="4" color="#000000"><%=getDateName (cal.get(cal.MONTH)) + " " + cal.get(cal.YEAR)%></font></b></td>
								   <td width='70' align='center' valign='middle'><a href="list?month=<%=currMonth%>&year=<%=currYear%>&action=1"><font size="5" color="#3b5998"> > </font></a></td>
								  </tr>
							</table>

							<table class="font-face" border="0" width="520" bordercolorlight="#C0C0C0" bordercolordark="#808080" style="border-collapse: collapse" bordercolor="#3b5998" cellpadding="0" cellspacing="0">
								<td width="100%">
									<table border="2" width="300" bordercolorlight="#C0C0C0" bordercolordark="#000000" style="border-collapse: collapse" bordercolor="#3b5998" cellpadding="0" cellspacing="0" bgcolor="#DFDCD8">
										<tr>
											<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998"><font color="#ffffff"><b>일</b></font></td>
											<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998"><font color="#ffffff"><b>월</b></font></td>
											<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998"><font color="#ffffff"><b>화</b></font></td>
											<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998"><font color="#ffffff"><b>수</b></font></td>
											<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998"><font color="#ffffff"><b>목</b></font></td>
											<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998"><font color="#ffffff"><b>금</b></font></td>
											<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998"><font color="#ffffff"><b>토</b></font></td>
										</tr>

										<%
											//'Calendar loop
											int currDay;
											String todayColor;
											int count = 1;
											int dispDay = 1;

											for (int w = 1; w < 7; w++) {
										%>
										<tr>
											<%
												for (int d = 1; d < 8; d++) {
														if (!(count >= cal.get(c.DAY_OF_WEEK))) {
											%>
											<td width="<%=boxSize%>" height="<%=boxSize%>" valign="top"
												align="left">&nbsp;</td>
											<%
												count += 1;
														} else {
															if (isDate(currMonth + 1, dispDay, currYear)) { // use the isDate method
																if (dispDay == c.get(c.DAY_OF_MONTH) && c.get(c.MONTH) == cal.get(cal.MONTH)
																		&& c.get(c.YEAR) == cal.get(cal.YEAR)) { // Here we check to see if the current day is today
																	todayColor = "#ffffff";
																}else {
																	todayColor = "#ffffff";
																	%>
																	<c:forEach var="list" items="${scheduleList}">
																		<c:set var="sch_date" value="${list.sch_date}"/>
																	<%
																		sch = (Date)pageContext.getAttribute("sch_date");
																		
																		if (sch.getDate() == dispDay  && (sch.getMonth()+1) == (currMonth + 1) && (sch.getYear()+1900) == currYear) { 
																			todayColor = "#8b9dc3";
																		}
																	
																	%>
																	</c:forEach>
																	<%
																}
																			%>
																
											
											<td id="dayclick<%=dispDay%>" bgcolor="<%=todayColor%>"
												width="<%=boxSize%>" align="left" height="<%=boxSize%>"
												valign="top"><%=dispDay%><br></td>
											
											<%
												count += 1;
																dispDay += 1;
															} else {
											%>
											<td width="<%=boxSize%>" align="left" height="<%=boxSize%>"
												valign="top">&nbsp;</td>

											<%
												}
														}

													}
											%>
										</tr>

										<%
											}
										%>

									</table>
								</td>
								<tr>
									<td>
							</table>

							<br>
						</div>
						<div class="col-md-8">
							<button onclick="location='/schedule/writeView'" class="button pull-right"
								style="top: 0">글쓰기</button>
							<br><br>
							<table class="table" id="list_table" style="text-align: center; border: 1px;">
								<thead style="background-color:#3b5998; color:#ffffff">
									<tr >
										<th>No</th>
										<th>제목</th>
										<th>작성자</th>
										<th>일정</th>
										<th>시간</th>
									</tr>
								</thead>

								<tbody>
									<% int count_no=0; %>
									<c:forEach var="list" items="${scheduleList}">
										<c:set var="calMonth" value="<%=(cal.get(cal.MONTH)+1) %>" />
										<c:set var="calYear" value="<%=(cal.get(cal.YEAR)) %>" />
										<fmt:formatDate var="schMonth" value="${list.sch_date}"  type="date" pattern="M"/>
										<fmt:formatDate var="schYear" value="${list.sch_date}"  type="date" pattern="YYYY"/>
											<c:if test="${calYear eq schYear}">
											<c:if test="${calMonth eq schMonth}">
											   <% count_no++; %>
											<tr>
											<td><%= count_no %></td>
											<td>
												<form name="myForm<%=count_no%>" action="/schedule/contentView" method="post">
													<input type="hidden" name="sch_no" value="${list.sch_no}"/>
													<input type="hidden" name="sch_b_no" value="${list.sch_b_no}"/>
													
													<a href="#" onclick="javascript:document.myForm<%=count_no%>.submit();">${list.sch_title}</a>
												</form>
											</td>
											<td>${list.sch_writer}</td>
											<td>${list.sch_date}</td>
											<td>${list.sch_time}</td>
										</tr>
										</c:if>
											</c:if>
										
										
									</c:forEach>
								</tbody>
							</table>



							<!-- Pagination -->
							<nav aria-label="Page navigation" style="text-align: center">
								<ul class="pagination">
									<li><a href="#" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>


							<div class="form-inline" style="text-align: center;">
								<div class="form-group"  style="margin:0 -15px">
									<select>
										<option value="1">제목</span></option>
										<option value="2">내용</option>
										<option value="3">작성자</option>
									</select>
								</div>
								<div class="form-group">
									<form class="navbar-form" role="search">
										<span class="form-group"> <input type="text"
											class="form-control" placeholder="Search">
										</span>
										<button type="submit" class="button">검색</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br>
</body>
</html>