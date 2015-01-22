<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="/Diary/assets/css/style.css" type="text/css" rel="stylesheet"/>
<link href="/Diary/assets/css/bootstrap-responsive.css" type="text/css" rel="stylesheet"/>
<link href="/Diary/assets/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet"/>
<link href="/Diary/assets/css/bootstrap.css" type="text/css" rel="stylesheet"/>
<link href="/Diary/assets/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
<script src="/Diary/assets/js/bootstrap.js"></script>
<script src="/Diary/assets/js/bootstrap.js"></script>
<script src="/Diary/assets/jquery1_11_2.js"></script>
<script src="scriptjava.js"></script>
<style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>
</head>
<body>
       
 <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
         
          <div class="nav-collapse collapse">
        <form action="/Diary/logout.do" method="post">
    <input type="submit" class="navbar-text pull-right" value="Logout" />
</form>
            <p class="navbar-text pull-right">
              Logged in as <a href="#" class="navbar-link"><%= session.getAttribute("username") %></a>
            </p>
            <ul class="nav nav-pills">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    <div class="page-header">
    <h1>My Diary <small>Memory... is the diary that we all carry about with us.</small></h1>
    </div>
    
     <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">Profile</li>
              <li class="active"><img src="Penguins.jpg" style="width: 120px; height: 130px" class="img-polaroid"></li>
              <li></br><h3 ><%= session.getAttribute("firstName") %> <%=session.getAttribute("lastName") %></h3>	</li>
              <li><h5 >Email  : <small><%= session.getAttribute("email") %></small></h5>	</li>
              <li><h5>Living In  :  <small>USA</small></h5>
    			</li>
              </ul>
          </div><!--/.well -->
        </div><!--/span-->
       
       <div class="span9">
          <div class="hero-unit">
            <h3>Hello, world!</h3>
            <form class="form-horizontal" method="post" action="addpost.do">
             <div class="control-group">
						<label class="control-label" >Enter Title</label>
						<div class="controls">
						<input type="text" id="title" placeholder="Title" name="title">
						</div>
						</div>
    		 			
    		 			<label class="control-label" >Enter Yours Daily Memories </label>
						<div class="controls">
						    <textarea rows="3" name="description" id ="description"></textarea>
						
						<br>
						<select class="span3" name="feelings">
    		 				<option>Feeling good</option>
    		 				<option>Feeling bad</option>
    		 				<option>Feeling boring</option>
    		 				<option>In Movie</option>
    		 				
    		 			</select>
    		 			</br>
    		 			<button class="btn" type="submit">Submit</button>
    		 			</div>
    		 			
    		 		</form>
    		 		</div>
    		 		
    		 		<div class="spam9">
    		 		<div class="hero-unit">
    		 		<h4>List Of Post</h4>
    		 		<% int count=1;  %>
    		 		<c:forEach items="${diaryList}" var="post1">
           <div class="blog-post">
           
    		<form name="postedForm" id="postedForm"  method="post">
            <h2  name="title" id = "title" class="blog-post-title">${post1.title }</h2>
            <small name="postedDate"  >Posted On:${post1.postedDate }</small>
            <input type="hidden" id="countId" name="countId" value="${post.countId}" >
            <small name="feelings" >${post1.feelings }</small>

            <p class="lead" name="description">${post1.description }</p>
            <input type="submit" name="edit" id="edit" value="edit" class="navbar-text pull-right" onclick="editFunction()"> 
            <input type="submit" name="delete" id="delete"  value="delete" class="navbar-text pull-right" onclick="deleteFunction()"> 
            </form>
           </div>
            </c:forEach>
            </div>
         </div>
        </div><!--/span-->
      </div><!--/row-->
      </div>
      
      <script type="text/javascript">
      if(<%= session.getAttribute("username") %> == null){
    	  window.location="login.jsp";
      }
      function editFunction(){
    	  document.getElementById("postedForm").action="/Diary/edit.do";
      }
     function deleteFunction(){
    	 document.getElementById("postedForm").action="/Diary/delete.do";
     }
     
     
      
      </script>
</body>
</html>