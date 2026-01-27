<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../components/header.jsp" %>
</head>
<body>
    <%@ include file="admin-navbar.jsp" %>
 
    <section class="h-100 mt-3" >
		<div class="container h-100">
		
		<div class="card m-3 shadow" style=background-color:silver;>
		<h3 class="text-center fw-bold mt-3" style=color:red;><b>Manage Jobs</b></h3>
			<div class="m-4">
				<button type="button" onclick="location.href = '<%= request.getContextPath() %>/post-job';"
					class="btn fw-bold btn-primary" style=color:orange;><b>Post Job</b></button>
					<button type="button" onclick="location.href = '<%= request.getContextPath() %>/job-applicant';"
					class="btn fw-bold btn-primary" style=color:orange;><b>Manage Applicant</b></button>
				<table class="table mt-3">
					<tr class="text-center" style=background-color:white;>
			  <th><b>ID</b></th>
              <th><b>Job Name</b></th>
              <th><b>Job Level</b></th>
              <th><b>Job Time</b></th>
              <th><b>Job Description</b></th>
              <th><b>Company</b></th>
              <th><b>Action</b></th>
					</tr>
					<c:forEach items="${listJob}" var="job">
						<tr style=background-color:black;color:purple;>
              <td><b>${job.getId_job()}</b></td>
              <td><b>${job.getJob_name()}</b></td>
              <td><b>${job.getJob_level()}</b></td>
              <td><b>${job.getJob_time()}</b></td>
              <td style="max-width: 500px;"><b>${job.getJob_description()}</b></td>
              <td><b>${job.getCompany_name()}</b></td>
              <td>
              <a href="job-edit?id=${job.getId_job()}" class="text-decoration-none">
                  <button class="btn btn-outline-warning mb-1 mt-1 btn-sm">Edit</button>
                </a>
                <a href="job-delete?id=${job.getId_job()}" id="yesDelete" data-bs-toggle="modal" data-bs-target="#deletejobmodal" class="text-decoration-none">
                  <button class="btn btn-outline-danger mb-1 mt-1 btn-sm">Delete</button>
                </a>
              </td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</div>
		</div>
	</section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
            	<%@ include file="../../components/footer.jsp" %>
    
</body>
</html>