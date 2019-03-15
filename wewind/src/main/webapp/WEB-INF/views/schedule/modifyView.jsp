<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<script type="text/javascript" src="/smarteditor2-master/dist/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
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
		
		<div class="col-md-10 font-face">
			<div class="container-fluid">
				<jsp:include page="../navbarShoulder.jsp" flush="false" />
				
				<!-- 여기에 내용 붙여 넣기!! 위에 내용은 지우지말아주세요!-->
				
			<div class="container-fluid">
				
				<div class="row">
					<div class="col-md-3">
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

	   <table class="font-face" width='350' celpadding='0' cellspacing='0'>
			  <tr>
			   <td width='70' align='center' valign='middle'><a href="modifyView?month=<%=currMonth%>&year=<%=currYear%>&action=0"><font size="5" color="#3b5998"> < </font></a></td>
			   <td class="font-face" width='100' align='center' valign='middle'><b><font size="4" color="#000000"><%=getDateName (cal.get(cal.MONTH)) + " " + cal.get(cal.YEAR)%></font></b></td>
			   <td width='70' align='center' valign='middle'><a href="modifyView?month=<%=currMonth%>&year=<%=currYear%>&action=1"><font size="5" color="#3b5998"> > </font></a></td>
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
		<div class="col-md-8 pull-right">
			<form name="myForm" action="/schedule/modify" method="post" class="form-horizontal">
				<input type="hidden" name="sch_no" value="${vo.sch_no}">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">제목</label> <!-- control-label에 패딩있음 -->
			    <div class="col-md-9">	
			      <input type="text" class="form-control" name="sch_title" value="${vo.sch_title}">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">장소</label>
			    <div class="col-md-9">
			      <input type="text" class="form-control" name="sch_place" value="${vo.sch_place}">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">일정</label>
			    <div class="col-md-9">
					 <input type="date" class="form-control" name="sch_date" value="${vo.sch_date}">
			  	</div>
			  </div>
	  
		 	  <div class="form-group">
			    <label class="col-sm-2 control-label">시간</label>
			    <div class="col-md-9">
					 <input type="time" class="form-control" name="sch_time" value="${vo.sch_time}">
			  	</div>
			  </div>
	  
			 <div class="form-group">
			    <label class="col-sm-2 control-label">내용</label>
			    <div class="col-md-9">
			      <textarea class="form-control" id="bbsContent" name="sch_content"  style="width: 100%;" rows=12 id="bbsContent" maxlength="20480">${vo.sch_content}</textarea>
			      <!-- <b class="pull-right" style="color:#ff6f69"><input type="checkbox" value="send_email">일정메일보내기</b> -->
			  	</div>
			  </div>
			  <div class="plan_btn" style="padding-left:72%">
		 	   <input type="submit" class="button" value="수정">
		 	   <button type="button" class="button" onclick="location='/schedule/list'" style="background-color:#d9d9d9">취소</button>
		 	  </div>
			</form>
			

			
		</div>								
	    </div>
	   </div>
	  </div>
	</div>
</div>
<%-- 
			  <form name="myForm" action="/schedule/modify" method="post" >
				<br>제목<input type="text" name="sch_title" value="${vo.sch_title}">
		 		<br>장소<input type="text" name="sch_place" value="${vo.sch_place}">
		 		<br>일정<input type="date" name="sch_date" value="${vo.sch_date}">
		 		<br>시간<input type="time" name="sch_time" value="${vo.sch_time}">
		 		<br>내용<textarea rows="3" name="sch_content">${vo.sch_content}</textarea>
		 		<input type="hidden" name="sch_no" value="${vo.sch_no}">
				<b class="pull-right" style="color:#ff6f69"><input type="checkbox">일정메일보내기</b>
				<br><a class="btn btn-default" href="#" onclick="javascript:document.myForm.submit();">수정</a>
				<br><button type="button" class="btn" onclick="location='/schedule/list'">취소</button>
			  </form>
 --%>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator
			.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "bbsContent", //textarea ID sSkinURI
				sSkinURI : "/smarteditor2-master/workspace/SmartEditor2Skin.html", //skin경로
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


</body>
</html>