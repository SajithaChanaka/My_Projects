<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page isELIgnored = "false" %>   
<!DOCTYPE html>
<html>
<head>
<%@ include file="../components/header.jsp" %>
<link href="css/forgot-password.css" rel="stylesheet" />
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
	              <h1 class="fs-4 card-title fw-bold text-center"><b>Forgot your password?</b></h1>
	              <div class="card-body">
	                <div class="text-center">
	                <img src="images/vector/forgot-password.jpg" alt="image" style="width: 200px;">
	                 </div>
	                <form:form name="form" action="forgot-password-confirmation" method="post" modelAttribute="fpUser" id="form">
             
		              <div class="form-floating mb-3">
		                <form:input path="email" style="${error}" id="email" class="form-control" type="text" placeholder="Email address" />
		                <label for="floatingInput email"><b>Email address</b></label>
		                <p style="color: #b02a37; margin-top: 6px; text-align: start; margin-bottom: 0; margin-left: 2px">${message}</p>
		              </div>
		
		              <button class="w-100 btn btn-lg btn-primary" type="submit"><b>Reset Password</b></button>
		            </form:form>
	                <div class="d-grid gap-2 col-6 mx-auto mt-3 text-center">
	                  <a href="<%= request.getContextPath() %>/login" class="text-black"><b>Back</b></a>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="card-footer py-3 border-0">
	            <div class="text-center">
	              <b>Don't have an account? <a href="<%= request.getContextPath() %>/login" class="text-blue">Register</a></b>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>

      <%@ include file="../components/footer.jsp" %>
   	</div>
   	<script src="js/forgot-password.js"></script>
</body>
</html>