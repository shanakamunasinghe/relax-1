<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*, java.lang.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<link href="<s:url value="/css/dashboard-component.css" includeParams="none"/>" rel="stylesheet" type="text/css">
	
	<s:include value="/WEB-INF/content/common/meta-tags.jsp"></s:include>
    <title><s:text name="global.application.title" /></title>
	<s:include value="/WEB-INF/content/common/css-include.jsp"></s:include>
</head>


<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<s:include value="/WEB-INF/content/common/title-bar.jsp"></s:include>
			<s:include value="/WEB-INF/content/common/top-bar.jsp"></s:include>
			
			<!-- page content -->
			<div class="right_col" role="main">
				<h2>Daily Reports</h2>
				
				<hr>

				<div class="row">
	            	<div class="col-md-3 col-sm-3 col-xs-12"  >
	       			<% String ss = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); 
	       				
	       			%>
						<%-- <input type="date" class="form-control" id="report-Date" 
							name="customReportDaily" value='<s:property value='%{customReport.daily}' default='2017-12-01'/>'> --%>
							<input type="date" class="form-control" id="report-Date" name="customReportDaily" value=<%=ss %>>
					</div>
	            	<div class="col-md-3 col-sm-3 col-xs-12"  >
	            		<s:url var="dailyPrint" namespace="/report" action="#"></s:url>
				
						<s:a href="%{#dailyPrint}" cssClass="btn btn-primary" style="padding: 6px 60px;" role="button">
							<i class="glyphicon glyphicon-print" style="padding: 0px;"></i>
							Print
						</s:a>
					</div>						
	            	
			    </div>
			    
			    <br>
			    
				<div class="row">
	            	<div class="col-md-6 col-sm-6 col-xs-12" style="padding: 10px; background-color: frfrfr;">
	            		<s:actionerror cssClass="errorMessage"/>
			
						<s:if test="pager != null && pager.list != null && pager.list.size != 0">
						
							<table class="table table-condensed" id="patient_tbl">
		  						<tr>
		  							<th>Serial No.</th>
		  							<th>Name (Title, First Name)</th>
		  							<th>Date of Birth</th>		  							
		  							<th>Gender</th>		  							
		  						</tr>
								<s:iterator value="pager.list" status="rowIndex">
								  <tr>
									<td title="Registered: <s:date name='insertDatetime' format='yyyy/MM/dd hh:mm'/>"><s:property value="serialNumber" /></td>
		  							<td><s:property value="%{surname}"/> <s:property value="%{initials}"/> 
		  								(<s:property value="%{title}"/>, <s:property value="%{firstName}"/> )</td>	
		  							<td><s:date name="dateOfBirth" format="dd-MM-yyyy"/></td>	  							
		  							<td><s:property value="sex" /></td>
		  						  </tr>
								</s:iterator>
							</table>
							
							<div class="text-center">
			                   <s:include value="/WEB-INF/content/common/pager.jsp" ></s:include>
			                </div>
						</s:if>
						<s:else>
							<div class="bg-info text-white">No Patient Registrations</div>				
						</s:else>
	            	</div>
	            	
	            	<div class="col-md-4 col-sm-4 col-xs-12" style="padding: 10px 20px;">
	            	
	            		<!-- Here How to obtain the data from the ReportAction.java class which is called from report.xml reports-daily action -->
	            		<div class="row flexRow">
			            	<h5 ><b>Total Patients: </b></h5><h5><s:property value="%{report.totalCount}"/></h5>
			            </div>
	            		<div class="row flexRow">
			            	<h5><b>Total Males: </b></h5><h5><s:property value="%{RegTotal.maleCount}"/></h5>
			            </div>
			            <div class="row flexRow">
			            	<h5><b>Total Females: </b></h5><h5><s:property value="%{RegTotal.femaleCount}"/></h5>
			            </div>
			            <div class="row flexRow">
			            	<h5><b>Total Children: </b></h5><h5><s:property value="%{RegTotal.childCount}"/></h5>
			            </div>
	            		
	            	</div>
	            	
			    </div>
				
				
			            	
				
				
				
				
			</div>	
			<!-- /page content -->

		</div>
	</div>
	
	<s:include value="/WEB-INF/content/common/footer.jsp"></s:include>
	<!-- Custom Theme Scripts -->
	<s:include value="/WEB-INF/content/common/js-include.jsp" ></s:include>


</body>

</html>