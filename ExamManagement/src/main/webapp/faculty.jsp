<%@page import="com.exam.helper.ConnectionProvider" %>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
		<%@ page import="com.exam.dao.*" %>
			<%@ page import="com.exam.entity.*" %>
				<%@ page import="java.util.*" %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="ISO-8859-1">
						<link rel="stylesheet"
							href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
						<title>Faculty : Exam Management</title>
						<%@ include file="pages/headers.jsp" %>
					</head>
					<style>
						.suc {
							padding: 4% 2%;
							border-radius: 16px;
							color: white;
							background: linear-gradient(to right, #00ff41b0, #f5ff46b0);
							font-size: 14px;
							margin: 1% 0% 1% 0%;
							width: 100%;
							font-weight: 500;
							border: none;
							box-shadow: 0px 0px 15px 0px rgb(99, 255, 0);
						}

						.card-body-span {
							margin: 1% 1%;
							padding: 1% 1%;
						}

						.suc-me-up {
							padding: 1% 2%;
							border-radius: 16px;
							color: black;
							background: linear-gradient(to right, #56ff81b0, #f4ff2fb0);
							font-size: 14px;
							margin: 1% 0% 1% 0%;
							width: 100%;
							font-weight: 500;
							border: none;
							box-shadow: 0px 0px 20px -5px rgb(99, 255, 0);
						}
					</style>

					<body>

						<div class=" container">
								<div class="card scrollbar-near-moon">
									<div class="card-body">
										<h4 id="section1">
											<strong>Recent Uploaded</strong>
										</h4>
										<hr>
										<%
									System.out.println("In FACULTY MAIL ID : "+user.getEmail());
										ArrayList<UploadMark> allUser = null;
									if(user.getEmail()!=null){
										MarksUploadDao rd = new MarksUploadDao(ConnectionProvider.getConnection());
										allUser = rd.getFacUploadation(user.getEmail());
									}
									
									if(allUser.isEmpty()){ 
										System.out.println("There Was No Recent Data");
									%>
										<div class="paperNm-fold">No Recent Uploads</div>
										
									<% 
										} else{
											for (UploadMark Uploadmark : allUser) {
											String ap = String.valueOf(Uploadmark.getConf());
											if(ap.equals("1")){ ap="Approved"; } else { ap="Pending"; }

									%>	
										<div class="paperNm-fold"><%=Uploadmark.getId()%>&nbsp;<%=Uploadmark.getPaperNm()%>(<%=Uploadmark.getPaperTy()%>)&nbsp;<a style="color: tomato;padding: 0.5% 2%;border-radius: 3vh;background: white;box-shadow: 0px 0px 12px -4px;" target="_blank" href="uploads/<%=Uploadmark.getMarksFile()%>"><%=Uploadmark.getMarksFile()%></a>&nbsp;&nbsp;<%=ap%></div>
									<%}}%>
									</div>
								</div>
						</div>	
						<section>
							<div class=" container">
								<div class="card scrollbar-near-moon">
									<div class="card-body">
										<h4 id="section1">
											<strong>Uploads Marks</strong>
										</h4>
										<hr>
										<% Messages m=(Messages) session.getAttribute("msg"); if (m !=null) { %>
											<div class="card-body-span">
												<span class="<%=m.getCssClass()%>">
													<%=m.getContent()%>
												</span>
											</div>
											<br>
											<% session.removeAttribute("msg"); } %>
												<!--  enctype="multipart/form-data"-->
							
												<form action="UploadMarkServlet" method="post"
													enctype="multipart/form-data">
													<div class="row top-my">
														<div class="dropSub col">

															<div class="drop-sub-span">Subject Name</div>
															<hr>
															<div class="drop-select-sub">
																<select name="paperNm" id="subNm" class="paperNm"
																	onchange="#getData" required>
																	<option value="" disabled selected>Select Subject
																	</option>
																	<% SubjectDao s=new
																		SubjectDao(ConnectionProvider.getConnection());
																		List<Subject> sub =
																		s.getAllSubjectByUId(user.getId());
																		for (Subject s1 : sub) {
																		%>


																		<option value="<%=s1.getSubName()%>">
																			<%=s1.getSubId()%>
																				<%=s1.getSubName()%>
																		</option>

																		<% } %>
																</select>
															</div>
														</div>
														<input type="hidden" name="facmail" value="<%=user.getEmail()%>">
														<div class="col dropSub">

															<div class="drop-sub-span">Paper Marks</div>
															<hr>
															<div class="drop-select-sub">
																<input placeholder="Mark Of Paper" type="number" name="marksUp" class="markUp" />
															</div>
														</div>
														<div class="dropSub col">

															<div class="drop-sub-span">Paper Type</div>
															<hr>
															<div class="drop-select-sub">
																<select name="paperTy" class="paperTy" required>
																	<option value="" disabled selected>Select Type
																	</option>
																	<option value="mid-sem">Mid-sem</option>
																	<option value="final-Sen">Final Sem</option>
																</select>
															</div>
														</div>
													</div>
													<br>
													<div id="anouncements" class="me-with-upload">

														<div class="me-file">
															Choose File<input type="file" name="fileName" id="marks"
																class="marks" style="padding: 13px;"
																onchange="return fileValidation()" \>

														</div>
														<button id="upload" type="submit" name="upload"
															class="the-upload-btn">Upload</button>
													</div>
												</form>
									</div>
								</div>
							</div>
						</section>
						<br>

						<script>
							function fileValidation() {
								var fileInput = document.getElementById('marks');

								var filePath = fileInput.value;

								// Allowing file type
								var allowedExtensions = /(\.pdf|\.cs)$/i;

								if (!allowedExtensions.exec(filePath)) {
									alert('Invalid file type');
									fileInput.value = '';
									return false;
								}
							}
						</script>
					
						<form action="choiceServlet" method="post">
							<div class=" container">
								<div class="card scrollbar-near-moon">
									<div class="card-body" style="margin-bottom: -4%;">
								<p class="legend">Choose the type of Paper:</p>
								<hr>
								<div class="grid-container-me">

									<div class="item1">
										<img src="omr-type.png" class="all-hover-img" alt="mcq">
									</div>
									<div class="item2">
										<img src="question-type.png" class="all-hover-img" alt="question">
									</div>
									
									<div class="item4">
										<input name="typ" type="radio" id="mcq" value="MCQ"><label for="mcq"
											class="labelT">MCQ</label>
									</div>
									<div class="item4">
										<input name="typ" type="radio" id="Written" value="Written"><label for="Written"
											class="labelT">Written</label>
									</div>
									
								</div>
								<div class="papaer_for">
									<div class="row top-my">
											<div class="dropSub-in2-f col">
												<div class="drop-sub-in2-span">Subject Name</div>
												<hr>
												<select name="examtype" id="PaperType" class="dropSub-in2" onchange="#getData" required>
													<option value="" disabled selected>Select Paper Type</option>
													<option value="Mid-sem">Mid-Sem</option>
													<option value="Final-sem">Final-Sem</option>
												</select>
											</div>
											<div class="dropSub-in2-f col">
												<div class="drop-sub-in2-span">Total Marks</div>
													<hr>
													<div class="">
														<input placeholder="Exam Totle Marks" type="number" name="tmarkMCQ" class="marksMCQ markUp-2" />
													</div>
											</div>
									</div>
									<div class="row top-my">
										<div class="dropSub-in2-f col">
										<div class="drop-sub-in2-span">Subject Paper Type</div>
										<hr>
										<select name="subnm" id="subNm" class="dropSub-in2" onchange="#getData" required>
											<option value="" disabled selected>Select Subject</option>
												<% for (Subject s1 : sub) { %>
													<option value="<%=s1.getSubName()%>">
													<%=s1.getSubName()%>
											</option>
											<% } %>
										</select>
										</div>
									<div class="dropSub-in2-f col">
										<div class="drop-sub-in2-span">Exam Time(in Minute)</div>
											<hr>
											<div class="">
												<input placeholder="Exam Time" type="number" name="etime" class="etime markUp-2" />
											</div>
										</div>
									</div>
								</div>
								

							</div>
								<button type="submit" class="btn-for-paper">Submit</button>
						</div>
						</div>
						</form>
						
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