<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Exam Management signUp</title>
        <link rel="stylesheet" type="text/css" href="css/style1.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    </head>

    <body>
        <div class="container" id="container">
            <div class="overlay-container1">
                <div class="overlay">
                    <div class="overlay-panel overlay-right">
                        <img width="150" src="ks-logo.png" alt="Green Leaf">
                        <h1>WELCOME to KSSBM's Exam's</h1>
                        <p>Green leaf nursery that provide plants, seeds, fertilizers and gardning related services.
                        </p>
                    </div>
                </div>
            </div>
            <div class="form-container1 log-in-container">
                <form action="signup-check.php" method="post" class="signup">
                    <h1>Create Account</h1>
                    <div class="social-container">
                        <a href="login.html" class="social"><i class="fa fa-unlock-alt"><label for="me">
                                    Login</label></i></a>
                        <a href="index.php" class="social"><i class="fa fa-home"><label for="me"> Home</label></i></a>
                        <hr>
                        <!--Error if -->
                        <!-- <span class="err">
                        <!-- here code java --
                    </span> -->
                        <!-- exit code java -->

                    </div>

                    <script language="javascript">
                        function passwordChanged() {
                            var strength = document.getElementById('strength');
                            var strongRegex = new RegExp("^(?=.{8,16})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
                            var mediumRegex = new RegExp("^(?=.{8,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
                            var enoughRegex = new RegExp("(?=.{8,}).*", "g");
                            var pwd = document.getElementById("myInput");
                            if (pwd.value.length == 0) {
                                strength.innerHTML = document.getElementById("myInput").style.border = '5px solid cyan';
                            } else if (false == enoughRegex.test(pwd.value)) {
                                strength.innerHTML = document.getElementById("myInput").style.border = '5px solid purple';
                            } else if (strongRegex.test(pwd.value)) {
                                strength.innerHTML = document.getElementById("myInput").style.border = '5px solid lightgreen';
                            } else if (mediumRegex.test(pwd.value)) {
                                strength.innerHTML = document.getElementById("myInput").style.border = '5px solid orange';
                            } else {
                                strength.innerHTML = document.getElementById("myInput").style.border = '5px solid red';
                            }


                        }
                        function passwordChanged1() {
                            var strength = document.getElementById('strength');
                            var strongRegex = new RegExp("^(?=.{8,16})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
                            var mediumRegex = new RegExp("^(?=.{8,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
                            var enoughRegex = new RegExp("(?=.{8,}).*", "g");
                            var pwd = document.getElementById("myInput1");
                            if (pwd.value.length == 0) {
                                strength.innerHTML = document.getElementById("myInput1").style.border = '5px solid cyan';
                            } else if (false == enoughRegex.test(pwd.value)) {
                                strength.innerHTML = document.getElementById("myInput1").style.border = '5px solid purple';
                            } else if (strongRegex.test(pwd.value)) {
                                strength.innerHTML = document.getElementById("myInput1").style.border = '5px solid lightgreen';
                            } else if (mediumRegex.test(pwd.value)) {
                                strength.innerHTML = document.getElementById("myInput1").style.border = '5px solid orange';
                            } else {
                                strength.innerHTML = document.getElementById("myInput1").style.border = '5px solid red';
                            }
                        }
                        function ValidateEmail() {
                            var strength1 = document.getElementById('strength1');
                            var pwd = document.getElementById("mailid");
                            var validmail = new RegExp("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");

                            if (pwd.value.length == 0) {
                                strength1.innerHTML = document.getElementById("mailid").style.border = '5px solid cyan';
                            }
                            else if (validmail.test(pwd.value)) {
                                // return (true)
                                strength1.innerHTML = document.getElementById("mailid").style.border = '5px solid lightgreen';
                            }
                            else {
                                // alert("You have entered an invalid email address!")
                                // return (false)
                                strength1.innerHTML = document.getElementById("mailid").style.border = '5px solid red';

                            }



                        }


                    </script>

                    <span>or create your new account</span>
                    <input type="text" class="input" name="name" placeholder="Your Name" />
                    <input type="email" class="input" id="mailid" name="uname" placeholder="example@gmail.com"
                        onkeyup="return ValidateEmail();" />
                    <input type="password" class="input" id="myInput" name="password" placeholder="Password"
                        onkeyup="return passwordChanged();" />
                    <input type="password" class="input" id="myInput1" name="re_password" placeholder="Confirm-Password"
                        onkeyup="return passwordChanged1();" />
                    <div class="show"><input type="checkbox" class="check" onclick="myFunction()"
                            title="show password"><span>show password</span></div><br>

                    <script>
                        function myFunction() {
                            var x = document.getElementById("myInput");
                            if (x.type === "password") {
                                x.type = "text";
                            } else {
                                x.type = "password";
                            }
                            var y = document.getElementById("myInput1");
                            if (y.type === "password") {
                                y.type = "text";
                            } else {
                                y.type = "password";
                            }
                        }

                    </script>
                    <div class="color" style="font-size: 11px;">
                        <i style="color:cyan" class="fa fa-square" aria-hidden="true"></i>Blank
                        <i style="color:red" class="fa fa-square" aria-hidden="true"></i>Low
                        <i style="color:orange" class="fa fa-square" aria-hidden="true"></i>Medium
                        <i style="color:purple" class="fa fa-square" aria-hidden="true"></i>NumAlph + < 8 <i
                            style="color:lightgreen" class="fa fa-square" aria-hidden="true"></i>Strong




                    </div><br>
                    <!-- <a href="Forgotpass/forgot.php">Forgot your password?</a> -->
                    <button name="submit">Sign up</button>
                </form>
            </div>

        </div>
    </body>

    </html>