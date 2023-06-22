<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../../header.jsp">
	<jsp:param value="Registration" name="HTMLtitle" />
</jsp:include>
<div class="d-flex justify-content-center">
 <img alt="register" src="images/register.jpeg" width="40%" height="30%" style="margin-top=100px;">
   <div class="col-6 px-5 py-2 d-flex flex-column justify-content-center">
    <h1>Registration</h1>
 	<p class="mb-4">By creating an account you can join ABC Company Portal, just insert your FirstName,
            LastName, Email, Password and your Account will be created.</p>

    <div class="alert alert-danger ${errMsg != null ? " d-block" : "d-none" }" role="alert">
      ${errMsg}
    </div>

    <form:form action="registration" method="post" modelAttribute="registration">
      <div class="mb-3">
        <label for="firstName" class="form-label">First Name</label>
        <input type="text" class="form-control"  style="width:40%;"  id="firstName" name="firstName" placeholder="Steve" required>
        <div class="invalid-feedback">
          First Name is required
        </div>
      </div>

      <div class="mb-3">
        <label for="lastName" class="form-label">Last Name</label>
        <input type="text" class="form-control"  style="width:40%;"  id="lastName" name="lastName" placeholder="Mark" required>
        <div class="invalid-feedback">
          Last Name is required
        </div>
      </div>

      <div class="mb-3">
        <label for="emailAddresss" class="form-label">Email address</label>
        <input type="email" class="form-control"  style="width:40%;"  id="emailAddress" name="email"  placeholder="name@example.com" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required>
        <div class="invalid-feedback">
          Email address should be have @ and .
        </div>
      </div>

      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
       <input type="password" class="form-control"  style="width:40%;" id="password" name="password" required>
        <div class="invalid-feedback">
          Password required & must be match
        </div>
      </div>

      <div class="mb-3">
        <label for="passwordConfirmation" class="form-label">Password Confirmation</label>
           <input type="password" class="form-control"  style="width:40%;" id="passwordConfirmation" name="passwordConfirmation" required>
        <div class="invalid-feedback">
          Password required & must be match
        </div>
      </div>
        <p> Have an account? <a href="login">Login</a></p>
       <button type="submit" class="btn btn-primary w-10" style="margin-left:290px; margin-top:-70px;"><b>Register</b></button>
    </form:form>
  </div>
</div>
<jsp:include page="../../footer.jsp"></jsp:include>