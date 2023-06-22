<jsp:include page="../../header.jsp">
    <jsp:param value="Thank You !" name="HTMLtitle" />
</jsp:include>
<div class="container">
     <img src="images/Thank you.jfif" alt="Thank You" height="60%" width="60%"></img><br><br>
    <h1>Thank You !</h1>
    <p>Thank you <span class="fw-bold">${email}</span> for your registration. <br>Click the Below button to get the Link.</p>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ver">
	  <b>Get Confirmation Link</b>
	</button><br><br>
	<a href="registration" class="btn btn-primary input-group-text"><b>Back to Register</b></a>
</div>
<!-- Modal -->
<div class="modal fade text-center" id="ver" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      	<i class='bx bxs-envelope fs-2'></i>
      	<h2><b>Successful</b></h2>
      	<p>The link has been sent it to your Email</p>
       	<a href="verified" class="btn btn-secondary">Continue</a>
      </div>
    </div>
  </div>
</div>

<jsp:include page="../../footer.jsp"></jsp:include>