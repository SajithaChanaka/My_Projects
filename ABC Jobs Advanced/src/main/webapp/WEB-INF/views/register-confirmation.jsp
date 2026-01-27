<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../components/header.jsp" %>
<link href="css/register-confirmation.css" rel="stylesheet" />
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
		              <h1 class="fs-4 card-title fw-bold mb-4 text-center">Congratulations!</h1>
		              <div class="card-body text-center">
		                <img src="images/vector/email-confirm.jpg" alt="images" style="width: 250px;">
		                <p>Your email has already been confirmed, <br> You can now login to the application.</p>
		                <div class="d-grid gap-2 col-6 mx-auto">
		                 <a href="login">
		                  <button class="btn btn-primary" type="button">Continue</button>
		                 </a>
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