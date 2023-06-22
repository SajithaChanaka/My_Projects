<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../../header.jsp">
	<jsp:param value="Reset" name="HTMLtitle" />
</jsp:include>

<div class="container">
<img src="images/reset.png" alt="" height="150px" width="200px">
	<h1>Reset your Password</h1>
	<form:form action="reset" method="post">
	  <div class="mb-3">
	    <label for="password" class="form-label"><b>New Password</b></label>
	    <input type="password" class="form-control" id="password" name="password" required>
	    <div class="invalid-feedback">
      		Password required & must be match
   		</div>
	  </div>
	  <div class="mb-3">
	    <label for="passwordConfirmation" class="form-label"><b>New Password Confirmation</b></label>
	    <input type="password" class="form-control" id="passwordConfirmation" required>
	    <div class="invalid-feedback">
      		Password required & must be match
   		</div>
	  </div>
	  <button type="submit" class="btn btn-primary"><b>Update Password</b></button>
	</form:form>
</div>

<jsp:include page="../../footer.jsp"></jsp:include>