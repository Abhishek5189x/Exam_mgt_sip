<%@page import="com.exam.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.exam.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<title>Admin Page Exam Management</title>
</head>
<%@ include file="pages/adminHeader.jsp"%>
<%@ include file="pages/adminNavigation.jsp"%>
<style>
.panel {
	border: 5px solid white;
	transition: all 0.2s ease-in-out;
	box-shadow: 0 5px 20px 0px rgb(0 0 0/ 5%);
	-moz-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.05);
	-webkit-box-shadow: 0 5px 20px 0px rgb(0 0 0/ 5%);
	-o-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.05);
	-ms-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.05);
}

.panel:hover, .panel:focus {
	-webkit-box-shadow: 0 0px 20px 0px rgb(255 255 255/ 55%);
	filter: hue-rotate(98deg);
	transform: scale(0.96);
}

.panel-footer {
	border: 5px solid white;
	border-bottom-left-radius: 26px;
	border-bottom-right-radius: 26px;
	width: 75%;
	box-shadow: 0px 0px 9px 1px white;
	color: black;
	background-color: #ffffffba;
	font-weight: 500;
	margin: 0% 14% 17% 14%;
	transition: width 3s, margin 3s;
}

.panel-footer:hover {
	width: 100%;
	margin: 11% 0%;
	box-shadow: 0px 0px 15px 6px white;
}
</style>
<body>
	<div id="wrapper">


		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							Welcome To Admin Page <small>Kssbm Exam</small>
						</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="index.php">Dashboard</a>
							</li>
							<!-- <li class="active">
                                <i class="fa fa-file"></i> Home
                            </li> -->
						</ol>
					</div>
				</div>
				<!-- /.row -->

			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->
		<br>
		<%
		UserDao u = new UserDao(ConnectionProvider.getConnection());
		%>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3 col-md-6 ">
					<div class="panel"
						style="background-image: linear-gradient(129deg, #fff387, #ffc4fc, #adf6eaeb); border-radius: 31px; color: white; border: none; padding: 11% 0% 0% 0%;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-user fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">



									<div class='huge'>There are total <%=u.getCountMe("student")%></div>
									<div>Students</div>
								</div>
							</div>
						</div>
						<a href="student_data.jsp">
							<div class="panel-footer" style="">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 ">
					<div class="panel"
						style="background-image: linear-gradient(143deg, #82ffae, #ffa9ec, #bff0eeeb); border-radius: 31px; color: white; border: none; padding: 11% 0% 0% 0%;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fas fa-chalkboard-teacher fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">

									<div class='huge'>There are total <%=u.getCountMe("faculty")%></div>


									<div>Faculties Data</div>
								</div>
							</div>
						</div>
						<a href="faculty_data.jsp">
							<div class="panel-footer" style="">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel"
						style="background-image: linear-gradient(129deg, #77f8ff, #ffeb3b); border-radius: 31px; color: white; border: none; padding: 11% 0% 0% 0%;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-upload fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">

									<div class='huge'>There are total <%=u.getCountMe("result")%></div>
									<div>Upload Mark Approval</div>
								</div>
							</div>
						</div>
						<a href="uploadMarkApr.jsp">
							<div class="panel-footer" style="">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel"
						style="background-image: linear-gradient(129deg, #a7acf9, #7bf3db, #f7ff88); border-radius: 31px; color: white; border: none; padding: 11% 0% 0% 0%;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-check-circle-o fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">

									<div class='huge'>There are total <%=u.getCountMe("examdata")%></div>

									<div>Exam Data</div>
								</div>
							</div>
						</div>
						<a href="isExam_admin.jsp">
							<div class="panel-footer" style="">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- row again -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel"
						style="background-image: linear-gradient(129deg, #86ffa3, #ffeb3b); border-radius: 31px; color: white; border: none; padding: 11% 0% 0% 0%;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-database fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">

									<div class='huge'>There are total <%=u.getCountMe("otherexam")%></div>




									<div>Other Exam Data</div>
								</div>
							</div>
						</div>
						<a href="otherExamData.jsp">
							<div class="panel-footer" style="">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<!-- <div class="col-lg-3 col-md-6">
					<div class="panel"
						style="background-image: linear-gradient(129deg, #b2ff88, #f8bbbbeb); border-radius: 31px; color: white; border: none; padding: 11% 0% 0% 0%;">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-inr fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">

									<div class='huge'>There ar total </div>


									<div>Gross Now</div>
								</div>
							</div>
						</div>
						<a href="order_item.php">
							<div class="panel-footer" style="">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>

				</div> -->
			</div>


		</div>


	</div>
	<!-- /.container-fluid -->

	</div>



	<%@ include file="pages/adminFooter.jsp"%>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
	<script src="https://js.pusher.com/4.1/pusher.min.js"></script>


</body>
</html>