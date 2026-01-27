<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../components/header.jsp" %>
<link href="css/change-password.css" rel="stylesheet" />
<link>
</head>
<body>
	<div class="d-flex flex-column min-vh-100">
      <%@ include file="../components/navbar.jsp" %>

      <section class="h-100 mt-3">
		  <div class="container h-100">
		    <div class="row justify-content-sm-center h-100">
		      <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
		        <div class="card m-3 shadow">
		          <div class="card-body p-5">
		            <h1 class="fs-4 card-title fw-bold mb-4">Change Password</h1>
		            <form:form action="changePassword" modelAttribute="changePassword" method="post" id="form">
		            <div class="form-floating mb-3">
		            	<input type="hidden" class="form-control" name="token" id="token" value="${token}"/>
		            </div>
		            
		            <div class="form-floating mb-3">
		                <form:input path="oldPassword" style="${error}" type="password" class="form-control" placeholder="Old Password" name="old-password" id="old-password" />
		                <label for="floatingPassword old-password">Old Password</label>
		                
		              </div>
		              
		              <div class="form-floating mb-3">
		                <form:input path="newPassword" style="${error}" type="password" class="form-control" placeholder="New Password" name="new-password" id="new-password" />
		                <label for="floatingPassword new-password">New Password</label>
		                
		              </div>
		              
		             <div class="form-floating mb-3">
		             <p style="color: #b02a37; margin-top: 6px">${message}</p>
		            </div>
		              <button class="w-100 fw-bold btn btn-lg btn-primary" type="submit" id="save" name="save">Change Password</button>
		            </form:form>
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