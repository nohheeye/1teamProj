<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<title>Insert title here</title>
	
	<style>
	@import url(//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css);
	.newmember_btn{
	  
		  background-color: #8b9dc3; /* Green */
  		 border: none;
  		 color: white;
  		 padding: 6px 20px;
  		 text-align: center;
  		 display: inline-block;
  		 font-size: 15px;
  		 cursor: pointer;
  		 hover:none;

		}
		
.dot {
  height: 10px;
  width: 10px;
  background-color: #00cc66;
  border-radius: 50%;
  display: inline-block;
} 
.font-face{font-family: 'Nanum Square';}

	</style>
	
	
</head>
<body>
	<!-- top -->
	<jsp:include page="../navbarTop.jsp" flush="false" /> <br><br><br><br>
	
			<br><br>
			<!-- 여기에 내용 붙여 넣기!! 위에 내용은 지우지말아주세요!-->
			
			
			<%@page session="true" import="java.util.*" %>
<%
// JSP Calendar:--
// Created by Jason Benassi
// jbenassi@lime-light.com
// http://www.wakeboardutah.com
// 7-2002
%>

<%

// Global Vars
int action = 0;  // incoming request for moving calendar up(1) down(0) for month
int currYear = 0; // if it is not retrieved from incoming URL (month=) then it is set to current year
int currMonth = 0; // same as year
String boxSize = "50";  // how big to make the box for the calendar


//build 2 calendars

Calendar c = Calendar.getInstance();
Calendar cal = Calendar.getInstance();

   if (request.getParameter("action") == null){ // Check to see if we should set the year and month to the current
      currMonth = c.get(c.MONTH);
      currYear = c.get(c.YEAR);
      cal.set(currYear, currMonth,1);
   }

   else{
      if (!(request.getParameter("action") == null)){ // Hove the calendar up or down in this if block
         currMonth = Integer.parseInt(request.getParameter("month"));
         currYear = Integer.parseInt(request.getParameter("year"));

            if (Integer.parseInt( request.getParameter("action")) == 1 ){
               cal.set(currYear, currMonth, 1);
               cal.add(cal.MONTH, 1);
               currMonth = cal.get(cal.MONTH);
               currYear = cal.get(cal.YEAR);
            }
            else{
               cal.set(currYear, currMonth ,1);
               cal.add(cal.MONTH, -1);
               currMonth = cal.get(cal.MONTH);
               currYear = cal.get(cal.YEAR);
            }
      }
   } 
%>

<%!
    public boolean isDate(int m, int d, int y){ // This method is used to check for a VALID date
        m -= 1;
        Calendar c = Calendar.getInstance();
        c.setLenient(false);

        try{
                c.set(y,m,d);
                Date dt = c.getTime();
        }
          catch (IllegalArgumentException e){
                return false;

          }
                return true;
    }
%>


<%!
   public String getDateName (int monthNumber){ // This method is used to quickly return the proper name of a month
        String strReturn = "";
      switch (monthNumber){ 
   case 0:
      strReturn = "1월";
      break;
   case 1:
      strReturn = "2월";
      break;
   case 2:
      strReturn = "3월";
      break;
   case 3:
      strReturn = "4월";
      break;
   case 4:
      strReturn = "5월";
      break;
   case 5:
      strReturn = "6월";
      break;
   case 6:
      strReturn = "7월";
      break;
   case 7:
      strReturn = "8월";
      break;
   case 8:
      strReturn = "9월";
      break;
   case 9:
      strReturn = "10월";
      break;
   case 10:
      strReturn = "11월";
      break;
   case 11:
      strReturn = "12월";
      break;
   }
   return strReturn;
  }
%>


<h2 align="center" class="font-face">공모전 일정</h2>
<hr>
  
  
  

<div class="col-sm-3" style="padding-left:20%;">
<table width='350' celpadding='0' cellspacing='0'>
  <tr>
   <td width='70' align='center' valign='middle'><a href="http://localhost:8088/wewind/contestMain?month=<%=currMonth%>&year=<%=currYear%>&action=0"><font size="5" color="#3b5998"> < </font></a></td>
   <td class="font-face" width='100' align='center' valign='middle'><b><font size="4" color="#000000" ><%=getDateName (cal.get(cal.MONTH)) + " " + cal.get(cal.YEAR)%></font></b></td>
   <td width='70' align='center' valign='middle'><a href="http://localhost:8088/wewind/contestMain?month=<%=currMonth%>&year=<%=currYear%>&action=1"><font size="5" color="#3b5998"> > </font></a></td>

  </tr>
   </table>
   
<table border="0" width="520" bordercolorlight="#C0C0C0" bordercolordark="#808080" style="border-collapse: collapse" bordercolor="#3b5998" cellpadding="0" cellspacing="0">
  <td width="100%">
    <table border="2" width="300" bordercolorlight="#C0C0C0" bordercolordark="#000000" style="border-collapse: collapse" bordercolor="#3b5998" cellpadding="0" cellspacing="0" bgcolor="#DFDCD8">
     <tr>
          <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998">
          <font color="#ffffff"><b>일</b></font></td>
          <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998">
          <font color="#ffffff"><b>월</b></font></td>
          <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998">
          <font color="#ffffff"><b>화</b></font></td>
          <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998">
            <font color="#ffffff"><b>수</b></font></td>
          <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998">
          <font color="#ffffff"><b>목</b></font></td>
          <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998">
          <font color="#ffffff"><b>금</b></font></td>
          <td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#3b5998">
          <font color="#ffffff"><b>토</b></font></td>
     </tr>
     
<%
//'Calendar loop
   int currDay;
   String todayColor;
   String selectColor;
   int count = 1;
   int dispDay = 1;

   for (int w = 1; w < 7; w++){
%>
     <tr>
<% 
        for (int d = 1; d < 8; d++){
         if (! (count >= cal.get(c.DAY_OF_WEEK))){ 

%>
      <td width="<%=boxSize%>" height="<%=boxSize%>" valign="top" align="left">&nbsp;</td>
<%
            count += 1;
         } 
         else{
            if (isDate ( currMonth + 1, dispDay, currYear) ){ // use the isDate method
                   if ( dispDay == c.get(c.DAY_OF_MONTH) && c.get(c.MONTH) == cal.get(cal.MONTH) && c.get(c.YEAR) == cal.get(cal.YEAR)){ // Here we check to see if the current day is today
                	   todayColor = "#dfe3ee";
                   
                  }
                  else{
                     todayColor = "#ffffff";
                  }
%>
      <td id = "dayclick<%=dispDay%>" bgcolor ="<%=todayColor%>" width="<%=boxSize%>" align="left" height="<%=boxSize%>" valign="top"><%=dispDay%><br>
      
      </td>
      <script>
         $("#dayclick<%=dispDay%>").click(function(){
            alert("<%=dispDay%>");
         });
      </script> 
<%
               count += 1;
               dispDay += 1;
            }
            else{
%>
      <td width="<%=boxSize%>" align="left" height="<%=boxSize%>" valign="top">&nbsp;</td>

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
<tr><td>
</table>
</div>





<div class="col-lg-7 text-right pull-right font-face">
<div class="col-lg-7">
<span class="font-face"><font color="green" >★시작 </font> <font color="red" >	★마감</font></span>

<div style="overflow-x:hidden;width:600px; height:300px;">

<c:forEach var="list" items="${contestList}">

 <div class="row">
 <br>
 <div class="col-md-7 text-left">
  <button type="button" class="btn btn-link" class="font-face">${list.contest_title}</button>
  </div>
  <div class="col-md-5" align="right">
  <button type="button" class="btn btn-link" class="font-face"><a href="">수정</a></button>
  <button type="button" class="btn btn-link" class="font-face" data-toggle="modal" data-target="#myModal">삭제</button>
  </div>
</div>
<div>
  <text class="form-control text-left" rows="2" id="comment">${list.contest_content}</text>
</div>

</c:forEach>





<br> 
</div>
<button class="newmember_btn" id="newmember_btn" onclick="location='/contest/writeView'"><span>글쓰기</span></button><br><br>

 
 </div> 
			
			
			
		</div>
		
		</div>
	</div>
	
	
 <div class="container">

  <!-- new !!!! 버튼 두개 모달 시작 버튼-->
      <div class="modal fade" id="myModal" role="dialog">
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
                  <button type="button" class="button newmember_btn"
                     style="margin-top: -40px; margin-bottom: 10px; margin-right: 5px"
                     data-dismiss="modal" role="button">예</button>
              <button type="button" class="button newmember_btn"
                     style="margin-top: -40px; margin-bottom: 10px; background-color: #d9d9d9;"
                     data-dismiss="modal" role="button"
                     onclick="location='/contest/list'">아니오</button>
              
                 
               </div>
            </div>
         </div>
      </div>
      <!--  모달 끝 -->
 </div>	
	
		
</body>
</html>
