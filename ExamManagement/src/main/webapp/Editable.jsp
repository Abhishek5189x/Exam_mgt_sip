<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- <script type="text/javascript" src="js/new.js"></script> -->
	<style>
		body {
			margin: 0;
			font-family: Arial, Helvetica, sans-serif;
		}

		.topnav {
			overflow: hidden;
			background: linear-gradient(44deg, #FB91EF, #f9ff87, #c0deff, #a7ffa7, #f3a6f3,
					#f2f7cf);
			-webkit-animation: hue 10s infinite linear;
		}

		.topnav a {
			float: left;
			color: #000000;
			background: #ffffff00;
			text-align: center;
			padding: 26px 16px;
			border-left: 2px solid rgb(0, 0, 0);
			text-decoration: none;
			font-size: 17px;
			transition: transform 1.2s;
		}

		@ -webkit-keyframes hue {
			from {
				-webkit-filter: hue-rotate(0deg);

			}

			to {
				-webkit-filter: hue-rotate(-360deg);
			}

		}

		.topnav a:hover {
			background-color: rgb(255, 255, 255);
			color: black;
			transform: scale(1.2);
		}

		.topnav-right {
			float: right;
		}
	</style>
</head>

<body>

	<div class="topnav">
		<img src="ks-logo.png" width="100"></img>
		<div class="topnav-right">
			<a class="" href="#home">Home</a> <a href="#news">News</a> <a href="#contact">Contact</a>
		</div>
	</div>
	<form action="">
		<div style="padding-left: 16px">
			<h2>Top Navigation with Right Aligned Links</h2>
			<p>Some content..</p>
		</div>
		<div id="container">
			<input type="button" id="add" class="addBtn" value="add" />
		</div>
	</form>
	<script>
		$(document).ready(function () {
			alert("HEllo");
			$("#add").click(function () {
				$('#containerForAppend').append('<br>input type="number" id="txt1" class="questNo num" required /><div class="spanMid">X</div><input type="number" class="markNo num" id="txt2" required /><div class="spanMid">=</div><input type="text" id="txt3" class="tot" required /><br><input type="button" id="add" class="addBtn" value="  " onclick="changeclass()" /><br>');
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
				console.log("i " + i + " Inner a " + a + " b " + b + " sum " + sum + "Res " + res + "  " + inputs[i].type + " " + inputs[i].value + " " + inputs.length);

			}
			console.log("i " + i + "Outer a " + a + " b " + b + " sum " + sum + "Res " + res + "  " + inputs[0].type + " " + inputs[0].value + " " + inputs.length);

			sum = 0;
			let c = 0;
			for (let i = 0; i < total.length; i++) {
				if (total[i].type == "text") {
					c = parseInt(total[i].value);
					sum = c + sum;
					//document.getElementById("txt3").value = sum;
				}
				console.log("c  " + c + " Res " + res + "  Type " + total[i].type + "  Value" + total[i].value + "  Length " + total.length + " Sum" + sum);
			}

		}
	</script>
</body>

</html>