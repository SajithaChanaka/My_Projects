<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../components/header.jsp" %>
<link href="css/forgot-password-confirmation.css" rel="stylesheet" />
<link>
</head>
<body>
	<div class="d-flex flex-column min-vh-100">
      <%@ include file="../components/navbar.jsp" %>
      <section class="h-100 mt-3">
		  <div class="container h-100">
		    <div class="row justify-content-sm-center h-100">
		      <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
		        <div class="card shadow">
		          <div class="card-body">
		            <div class="card-body">
		              <h1 class="fs-4 card-title fw-bold text-center"><b>Thank You</b></h1>
		              <div class="card-body text-center">
		                <img src="images/vector/forgot-password-confirm.jpg" alt="image" style=" width: 200px;">
		                <div class="card-body">
		                  <span class="card-text" style=color:red;><b>Your password has been reset, please check your email to create a new
		                    password</b></span>
		                </div>
		                <div class="d-grid gap-2 col-6 mx-auto mt-3">
		                  <button class="btn btn-primary fw-bold" type="button" onclick="location.href = '<%= request.getContextPath() %>/login';"><b>Continue Login</b></button>
		                  <a class="text-black" href="<%= request.getContextPath() %>/"><b>Back to Home</b></a>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>
		 <%@ include file="../components/footer.jsp" %>
   	</div>

     
</body>
</html>