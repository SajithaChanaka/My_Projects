<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../components/header.jsp" %>
<link href="css/thank-you.css" rel="stylesheet" />
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
		              <h1 class="fs-4 card-title fw-bold mb-4 text-center">Thank You <br> For Your Registration</h1>
		              <div class="card-body text-center">
		                <img src="images/vector/thank-you.jpg" alt="image" style="width: 250px;">
		                <p>We have send you an confirmation email to <span class="text-primary"><%= request.getAttribute("email") %></span><br> Please confirm your email address to
		                  activate
		                  your account</p>
		                <div class="d-grid gap-2 col-6 mx-auto">
		                  <button onclick="location.href = '<%= request.getContextPath() %>/';" class="btn btn-primary" type="button">Continue</button>
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