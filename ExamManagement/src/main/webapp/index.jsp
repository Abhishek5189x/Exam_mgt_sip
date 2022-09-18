<%@page import="com.exam.dao.ExamChoiceDataDao" %>
	<%@page import="com.exam.dao.OtherExamDataDao" %>
		<%@page import="com.exam.dao.SubjectDao" %>
			<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
				<%@ page import="com.exam.helper.ConnectionProvider" %>
					<%@ page import="java.sql.*" %>
						<%@ page import="com.exam.entity.*" %>
							<%@ page import="java.time.LocalDateTime" %>
								<%@ page import="java.time.format.DateTimeFormatter" %>
									<!DOCTYPE html>
									<html>

									<head>
										<meta charset="ISO-8859-1">
										<link rel="stylesheet"
											href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
										<title>Student : Exam Management</title>
										<%@ include file="pages/headers.jsp" %>
									</head>
	<style>
		
	</style>
									<body>


										<!--  <a href="LoginServlet">Click to call Servlet</a>-->
										<section>
											<div class="container">
												<div class="card scrollbar-near-moon">
													<div class="card-body">
														<h4 id="section1">
															<strong>General Announcement</strong>
														</h4>
														<hr>
														<br>
														<div class="anouncements">
															<b>
																<blink3>New</blink3>
															</b> &nbsp; <font color="blue">Date : 10-06-2020</font>
															<font color="green"> Latest Exam Time table</font> <a
																href="links/Notice_Revised_MSC_Exam.pdf"
																target="_blank">
																<font class="col-me-let" color="red"> Click here...</font>
															</a>
														</div>
													</div>
												</div>
											</div>
										</section>
										<br>
										<section>
											<div class="container">
												<div class="card scrollbar-near-moon">
													<div class="card-body">
														<h4 id="section1">
															<strong>Todays Exam</strong>
														</h4>
														<hr>
														<div class="#">
															<% ExamChoiceDataDao e=new
																ExamChoiceDataDao(ConnectionProvider.getConnection());
																Examdata examdata=e.getTodayExamDetail(user.getYear());
																if (examdata.getSubnm() !=null) {
																System.out.print(examdata.getSubnm()); String yer="" ;
																if (user.getYear()==1) { yer="FIRST" ; } else if
																(user.getYear()==2) { yer="SECOND" ; } else if
																(user.getYear()==3) { yer="THIRD" ; } else if
																(user.getYear()==4) { yer="FOURTH" ; } else if
																(user.getYear()==5) { yer="FIFTH" ; } %>
																<% LocalDateTime myDateObj=LocalDateTime.now();
																	System.out.println("Before formatting: " + myDateObj);
						DateTimeFormatter myFormatObj = DateTimeFormatter
								.ofPattern(" MMM dd yyyy HH:" + (myDateObj.getMinute() + examdata.getTime()) + ":ss" ); String
																	formattedDate=myDateObj.format(myFormatObj);
																	System.out.println("After formatting: " + formattedDate);
						%>
						<h1 style="    background: linear-gradient(45deg, #feafff, #ffec48);
    padding: 1% 1%;
    margin: 1% 0% auto;
    width: 100%;
    text-align: center;
    border-radius: 1rem;
    box-shadow: 0px 0px 9px 3px #e9e9e9;
    font-size: 4vh;"><i class="fa fa-graduation-cap"></i><%=yer%>&nbsp; YEAR -&nbsp;<%=examdata.getSubnm()%></h1>
	<div class="card-small-index">
						<h3 class="h3-for-card-small">
							Exam :
							<%=examdata.getEtype()%>
							&emsp;Paper :
							<%=examdata.getPtype()%></h3>
						<h2 class="inline-h2p">
							Total Marks :
							<%=examdata.getTotmarks()%></h2>
						<strong class="strong-inlinep"><i class="fa fa-clock-o"></i> Exam Time : <%=examdata.getTime()%>&nbsp;minutes
						</strong>
						<div>
							<a
								href=" examOmr.jsp?count=1&&subnm=<%=examdata.getSubnm()%>&&examid=<%=examdata.getEdtid()%>&&fdate=
																		<%=formattedDate%>"><button type="button"
																				class="btn-start"><span class="btn-start-span" >Start
																				Exam</span></button></a>
														</div>
														<% } else { %>
															<h3 style="text-align: start; margin: 0%; font-size: 3vh;">
																No
																Exam Today</h3>
															<% } %>
													</div>
												</div>
												</div>
											</div>
											</div>
										</section>
										<br>
										<!-- <section>
		<div class="container">
			<div class="card1 scrollbar-near-moon">
				<div class="card-body">
					<h4 id="section1">
						&emsp;&emsp;<strong>Recent Years Exam Papers</strong>&emsp;&emsp;
					</h4>
					<hr>
					<br>
					<div class="papaers">
						<p class="info-paper">* All Subject Papers are commprased on
							zip</p>
						<ul
							style="border: 5px solid gray; padding: 24px; border-radius: 13px;">
							<li>2019<a href="#"> click here..</a>
							</li>
							<li>2020<a href="#"> click here..</a>
							</li>
							<li>2021<a href="#"> click here..</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section> -->

										<script>
											function myFunction() {
												var x = document.getElementById("myTopnav");
												if (x.className === "topnav") {
													x.className += " responsive";
												} else {
													x.className = "topnav";
												}
											}
										</script>
										<br>
										<%@ include file="pages/footer.jsp" %>