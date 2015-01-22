<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="/Diary/assets/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
    <link href="/Diary/assets/css/bootstrap-responsive.css" rel="stylesheet">

   

    
  </head>

  <body>

    <div class="container">

      <form class="form-signin" name="signupForm" id="signupForm" method="post" >
        <h2 class="form-signin-heading">Please Sign Up</h2>
        <input type="text" name="username" id="username" class="input-block-level" placeholder="User Name" value="<%= request.getAttribute("username") %>">
         <button class="btn btn-primary" id="checkuser" name="checkuser" type="submit" >Check User</button>
         <br>
        <input type="password" name="password"  id="password" class="input-block-level" placeholder="Password">
         <input type="password" name="password2" id="password2 class="input-block-level" placeholder="Re-Enter Password">
         <input type="text" name="firstName" id="firstName" class="input-block-level" placeholder="First Name">
         <input type="text" name="lastName" id="lastName" class="input-block-level" placeholder="Last Name">
          <input type="text" name="email" id="email" class="input-block-level" placeholder="Email Id">
       
           <button class="btn btn-large btn-primary" id="signup" name="signup" type="submit" >Sign Up</button>
      </form>
	<%= request.getAttribute("message") %>
    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src=" /Diary/assets/js/jquery.js"></script>
    <script src=" /Diary/assets/js/bootstrap-transition.js"></script>
    <script src=" /Diary/assets/js/bootstrap-alert.js"></script>
    <script src=" /Diary/assets/js/bootstrap-modal.js"></script>
    <script src=" /Diary/assets/js/bootstrap-dropdown.js"></script>
    <script src=" /Diary/assets/js/bootstrap-scrollspy.js"></script>
    <script src=" /Diary/assets/js/bootstrap-tab.js"></script>
    <script src=" /Diary/assets/js/bootstrap-tooltip.js"></script>
    <script src=" /Diary/assets/js/bootstrap-popover.js"></script>
    <script src=" /Diary/assets/js/bootstrap-button.js"></script>
    <script src=" /Diary/assets/js/bootstrap-collapse.js"></script>
    <script src=" /Diary/assets/js/bootstrap-carousel.js"></script>
    <script src=" /Diary/assets/js/bootstrap-typeahead.js"></script>
    <script type="text/javascript">
    $("#signup").click(function(){
    	jemail = $("#email").val();
    	if($.trim(jemail).length == 0 || $("#username").val()=="" || $("#password").val()=="" || $("#password2").val()=="" || $("#firstName").val()==""|| $("#lastName").val()=="" ){
    		alert('All fields are mandatory');
    		
    	}
    	
    	if (validateEmail(jemail)) {
    		document.getElementById("signupForm").action="/Diary/signup.do";
    		
    		}else {
    		alert('Invalid Email Address');
    		
    		}
    	
    });
    
    $("#checkuser").click(function(){
    	if($("#username").val()=="" || $("#username").val()=="username"|| $("#username").val()=="null"){
    		alert('please enter username');
    	}else{
    		
    	}
    	
    });
    function dataFormate(valDate){
    	
    	if (valDate.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})"))
    	    return true;
    	else
    	   return false;
    }
    function validateEmail(sEmail) {
    	var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    	if (filter.test(sEmail)) {
    	return true;
    	}
    	else {
    	return false;
    	}
    	}
    if(<%= request.getAttribute("username") %> == null){
    	$("#username").val("username") ;
    }
  
    	if(<%= request.getAttribute("message") %> == null){
        	
        }
        else{
        	
        }
    
    
    
    </script>

  </body>
</html>
