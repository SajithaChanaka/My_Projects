<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../components/header.jsp" %>
<link href="css/home.css" rel="stylesheet" />
</head>
<body>
	<div class="root">
      <%@ include file="../components/navbar.jsp" %>

     <section class="hero">
		  <div class="container col-xxl-8 px-4">
		    <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
		      <div class="col-10 col-sm-8 col-lg-6">
		        <img src="images/vector/hero.jpg" class="d-block mx-lg-auto img-fluid" alt="Bootstrap Themes">
		      </div>
		      <div class="col-md-10 mx-auto col-lg-5">
		        <h2 class="fw-bold">Find your dream job with ABC Jobs</h2>
		      </div>
		    </div>
		  </div>
		</section>
		
		<section class="company">
		  <div class="container">
		    <div class="row cards mt-5">
		      <h3 class="text-center p-3 fw-bold">Popular Companies</h3>
		      <div class="col-md-4 d-flex justify-content-center">
		        <div class="card m-3 border-0">
		          <div class="card-body">
		            <div class="text-center">
		              <img src="images/company/amazon.png" class="rounded" alt="{{company.alt}}">
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="col-md-4 d-flex justify-content-center">
		        <div class="card m-3 border-0">
		          <div class="card-body">
		            <div class="text-center">
		              <img src="images/company/google.png" class="rounded" alt="{{company.alt}}">
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="col-md-4 d-flex justify-content-center">
		        <div class="card m-3 border-0">
		          <div class="card-body">
		            <div class="text-center">
		              <img src="images/company/intel.png" class="rounded" alt="{{company.alt}}">
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="col-md-4 d-flex justify-content-center">
		        <div class="card m-3 border-0">
		          <div class="card-body">
		            <div class="text-center">
		              <img src="images/company/meta.png" class="rounded" alt="{{company.alt}}">
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="col-md-4 d-flex justify-content-center">
		        <div class="card m-3 border-0">
		          <div class="card-body">
		            <div class="text-center">
		              <img src="images/company/microsoft.png" class="rounded" alt="{{company.alt}}">
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="col-md-4 d-flex justify-content-center">
		        <div class="card m-3 border-0">
		          <div class="card-body">
		            <div class="text-center">
		              <img src="images/company/nvidia.png" class="rounded" alt="{{company.alt}}">
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="col-md-4 d-flex justify-content-center">
		        <div class="card m-3 border-0">
		          <div class="card-body">
		            <div class="text-center">
		              <img src="images/company/oracle.png" class="rounded" alt="{{company.alt}}">
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="col-md-4 d-flex justify-content-center">
		        <div class="card m-3 border-0">
		          <div class="card-body">
		            <div class="text-center">
		              <img src="images/company/samsung.png" class="rounded" alt="{{company.alt}}">
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="col-md-4 d-flex justify-content-center">
		        <div class="card m-3 border-0">
		          <div class="card-body">
		            <div class="text-center">
		              <img src="images/company/tencent.png" class="rounded" alt="{{company.alt}}">
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>
		
		<section class="category mt-5 bg-light p-5">
		  <div class=" container">
		    <div class="heading text-center p-3">
		      <h3 class="fw-bold">Explore Jobs by Categories</h3>
		    </div>
		    <div class="d-flex flex-wrap mt-3 justify-content-center">
		      <div class="me-3 mb-3">
		        <button type="button" class="btn btn-outline-secondary">Account and Finance</button>
		      </div>
		      <div class="me-3 mb-3">
		        <button type="button" class="btn btn-outline-secondary">Content Writing</button>
		      </div>
		      <div class="me-3 mb-3">
		        <button type="button" class="btn btn-outline-secondary">Design</button>
		      </div>
		      <div class="me-3 mb-3">
		        <button type="button" class="btn btn-outline-secondary">Development</button>
		      </div>
		      <div class="me-3 mb-3">
		        <button type="button" class="btn btn-outline-secondary">Digital Marketing</button>
		      </div>
		      <div class="me-3 mb-3">
		        <button type="button" class="btn btn-outline-secondary">HR Management</button>
		      </div>
		      <div class="me-3 mb-3">
		        <button type="button" class="btn btn-outline-secondary">UI/UX Design</button>
		      </div>
		      <div class="me-3 mb-3">
		        <button type="button" class="btn btn-outline-secondary">Sales</button>
		      </div>
		    </div>
		  </div>
		</section>
		
		<section class="jobs mt-5">
		  <div class="container">
		    <div class="heading text-center p-3">
		      <h3 class="fw-bold">Explore Popular Jobs</h3>
		    </div>
		    <div class="d-flex flex-wrap mt-3 justify-content-center">
		      <div class="job-container me-3 mb-3">
		        <div class="card p-3 d-flex">
		          <div class="wrapper d-flex align-items-center me-3">
		            <div class="logo me-3">
		              <img src="images/logo/google.png" alt="" />
		            </div>
		            <div class="detail">
		              <h5 class="fw-semibold">Back End Developer</h5>
		              <h5 class="text-secondary fs-6">Google</h5>
		              <p class="card-text"><small class="text-muted">Full-Time</small></p>
		            </div>
		          </div>
		          <div class="wrapper d-flex align-items-center my-3">
		            <button onclick="location.href = '<%= request.getContextPath() %>/jobs';" class="btn btn-outline-primary">Apply</button>
		          </div>
		        </div>
		      </div>
		      <div class="job-container me-3 mb-3">
		        <div class="card p-3 d-flex">
		          <div class="wrapper d-flex align-items-center me-3">
		            <div class="logo me-3">
		              <img src="images/logo/amazon.png" alt="" />
		            </div>
		            <div class="detail">
		              <h5 class="fw-semibold">Amazon</h5>
		              <h5 class="text-secondary fs-6">Fullstack Developer</h5>
		              <p class="card-text"><small class="text-muted">Part-Time</small></p>
		            </div>
		          </div>
		          <div class="wrapper d-flex align-items-center my-3">
		            <button onclick="location.href = '<%= request.getContextPath() %>/jobs';" class="btn btn-outline-primary">Apply</button>
		          </div>
		        </div>
		      </div>
		      <div class="job-container me-3 mb-3">
		        <div class="card p-3 d-flex">
		          <div class="wrapper d-flex align-items-center me-3">
		            <div class="logo me-3">
		              <img src="images/logo/microsoft.png" alt="" />
		            </div>
		            <div class="detail">
		              <h5 class="fw-semibold">Microsoft</h5>
		              <h5 class="text-secondary fs-6">UI Designer</h5>
		              <p class="card-text"><small class="text-muted">Full-Time</small></p>
		            </div>
		          </div>
		          <div class="wrapper d-flex align-items-center my-3">
		            <button onclick="location.href = '<%= request.getContextPath() %>/jobs';" class="btn btn-outline-primary">Apply</button>
		          </div>
		        </div>
		      </div>
		      <div class="job-container me-3 mb-3">
		        <div class="card p-3 d-flex">
		          <div class="wrapper d-flex align-items-center me-3">
		            <div class="logo me-3">
		              <img src="images/logo/samsung.png" alt="" />
		            </div>
		            <div class="detail">
		              <h5 class="fw-semibold">Samsung</h5>
		              <h5 class="text-secondary fs-6">Front End Developer</h5>
		              <p class="card-text"><small class="text-muted">Full-Time</small></p>
		            </div>
		          </div>
		          <div class="wrapper d-flex align-items-center my-3">
		            <button onclick="location.href = '<%= request.getContextPath() %>/jobs';" class="btn btn-outline-primary">Apply</button>
		          </div>
		        </div>
		      </div>
		      <div class="job-container me-3 mb-3">
		        <div class="card p-3 d-flex">
		          <div class="wrapper d-flex align-items-center me-3">
		            <div class="logo me-3">
		              <img src="images/logo/nvidia.png" alt="" />
		            </div>
		            <div class="detail">
		              <h5 class="fw-semibold">Nvidia</h5>
		              <h5 class="text-secondary fs-6">Software Engineer</h5>
		              <p class="card-text"><small class="text-muted">Part-Time</small></p>
		            </div>
		          </div>
		          <div class="wrapper d-flex align-items-center my-3">
		            <button onclick="location.href = '<%= request.getContextPath() %>/jobs';" class="btn btn-outline-primary">Apply</button>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>
		
		<section class="section mt-5 p-5 border-top">
		  <div class=" container">
		    <div class="d-flex flex-wrap mt-3 justify-content-center">
		      <div class="row">
		        <div class="col-sm-6">
		          <div class="card border-0">
		            <div class="card-body">
		              <img src="images/vector/communication.jpg" alt="image" class="section">
		              <h5 class="card-title my-3">Connect with people who can help</h5>
		              <a href="search-user" class="btn btn-outline-secondary">Find people you know</a>
		            </div>
		          </div>
		        </div>
		        <div class="col-sm-6">
		          <div class="card border-0">
		            <div class="card-body">
		              <img src="images/vector/learn.jpg" alt="image" class="section">
		              <h5 class="card-title my-3">Learn the skills you need to succeed</h5>
		              <a href="jobs" class="btn btn-outline-secondary">Learn now</a>
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