<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- <%@include file="/Diary/assets/js/bootstrap-tab.js"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
     <link href="/Diary/assets/css/bootstrap.css"  rel="stylesheet">
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

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="/Diary/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="ico/favicon.png">
  </head>

  <body>

    <div class="container">
		<form:errors path="login.*"/>
      <form class="form-signin" name="loginfrom" id="loginfrom" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" class="input-block-level" placeholder="User Name" name="username" id="username">
        <input type="password" class="input-block-level" placeholder="Password" name="password" id="password">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-large btn-primary" type="submit" name="signin" id="signin">Sign in</button>
        <button class="btn btn-large btn-primary" type="submit" name="signup" id="signup">Sign Up</button>
       <!--  <a href="signup.jsp" class="btn btn-large btn-primary" >Sign Up</a> -->
      </form>

    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="/Diary/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/Diary/assets/js/bootstrap-transition.js"></script>
    <script type="text/javascript" src="/Diary/assets/js/bootstrap-alert.js"></script>
    <script type="text/javascript" src="/Diary/assets/js/bootstrap-modal.js"></script>
    <script type="text/javascript" src="/Diary/assets/js/bootstrap-dropdown.js"></script>
    <script type="text/javascript" src="/Diary/assets/js/bootstrap-scrollspy.js"></script>
    <script type="text/javascript" src="/Diary/assets/js/bootstrap-tab.js"></script>
    <script type="text/javascript" src="/Diary/assets/js/bootstrap-tooltip.js"></script>
    <script type="text/javascript" src="/Diary/assets/js/bootstrap-popover.js"></script>
    <script type="text/javascript" src="/Diary/assets/js/bootstrap-button.js"></script>
    <script type="text/javascript" src="/Diary/assets/js/bootstrap-collapse.js"></script>
    <script type="text/javascript" src="/Diary/assets/js/bootstrap-carousel.js"></script>
    <script type="text/javascript" src="/Diary/assets/js/bootstrap-typeahead.js"></script>
    <script type="text/javascript">
    $("#signin").click(function(){
    	if($("#username").val()=="" || $("#password").val()==""){
    		alert('All fields are mandatory');
    	}else{
    		document.getElementById("loginfrom").action="/Diary/home1.do";
    	}
    	
    });
    
    $("#signup").click(function(){
    	document.getElementById("loginfrom").action="/Diary/signup1.do";
    });
    
    </script>

  </body>
</html>
