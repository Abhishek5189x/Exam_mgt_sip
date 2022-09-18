<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="ISO-8859-1">
		<script type="text/javascript" src="js/new.js"></script>
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>Information : Exam Management</title>
		<%@ include file="pages/header.jsp" %>

	<body>
		<%-- <% String type=request.getParameter("utype"); %>
			<% String type2=request.getParameter("uname"); %>
				<% String type3=request.getParameter("password"); %>
					<% out.print(type+" "+type2+" "+type3); %> --%>
	<br>
	<form action=" #" method="post">

						<div id=" OptionValue" class="OptionValue">
							<h1>Information Collect</h1>

							<div id="anouncements-contain">
								<ul>
									<li>* All Input Must Not Empty.</li>
									<li>* Make sure Marks of input not Zero.</li>
									<li>* Total Marks Must be equal to Paper Type Marks.</li>
								</ul>
							</div>


							<textarea class="textArea" rows="10" cols="30" placeholder="Your Questions"
								id="f1"></textarea>


							<!--  <button type="button" id="addBtnSbm" class="addBtnSbm" type="submit">Submit</button>-->
							<input id="pdf-button" type="button" class="addBtnSbm" value="Download PDF"
								onclick="downloadPDF()" />

						</div>


						</form>
						<script type="text/javascript">
							$(document)
								.ready(
									function () {
										//alert("hello");
										$("#add")
											.click(
												function () {
													$('#containerForAppend')
														.append(
															'<br><input type="number" id="txt1" class="questNo num" required/><div class="spanMid">X</div><input type="number" class="markNo num" id="queSelect txt2" required onblur="changeclass()"/><div class="spanMid">=</div><input type="number" id="txt3" class="tot" readonly /><br>');
												});
									});
							let res = 0;
							let sum = 1;
							let j = 0, i = 0;
							function changeclass() {
								let inputs = document.getElementsByClassName("num");
								let total = document.getElementsByClassName("tot");
								let a, b;
								for (i; i < inputs.length; i = i + 2) {
									sum = 1;
									if (inputs[i].type == "number") {
										a = inputs[i].value;
										b = inputs[i + 1].value;
										sum = a * b;
										//document.getElementById("txt3").value = sum;

										let els = document.getElementsByClassName("tot")[j];
										els.value = sum;
									}
									j++;
									console.log("i " + i + " Inner a " + a + " b " + b + " sum "
										+ sum + "Res " + res + "  " + inputs[i].type + " "
										+ inputs[i].value + " " + inputs.length);

								}
								console.log("i " + i + "Outer a " + a + " b " + b + " sum " + sum
									+ "Res " + res + "  " + inputs[0].type + " "
									+ inputs[0].value + " " + inputs.length);

								sum = 0;
								let c = 0;
								let noom = document.getElementById("MyGrandTot");
								for (let j = 0; j < total.length; j++) {
									if (total[j].type == "number") {
										c = parseInt(total[j].value);
										sum = c + sum;
										noom.value = sum;
										//document.getElementById("txt3").value = sum;
									}
									console.log("c  " + c + " Res " + res + "  Type "
										+ total[j].type + "  Value" + total[j].value
										+ "  Length " + total.length + " Sum" + sum);
								}

							}
						</script>

						<script src="https://docraptor.com/docraptor-1.0.0.js"></script>



						<script type="text/javascript">
							var downloadPDF = function () {

								DocRaptor.createAndDownloadDoc("YOUR_API_KEY_HERE", {
									test: true,
									type: "pdf",

									document_content: document.querySelector('#f1').innerHTML,

								})

							}
						</script>
						<br>
						<%@ include file="pages/footer.jsp" %>