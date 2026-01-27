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
    
   <section class="h-100 mt-3">
		<div class="container h-100">
		
		<div class="card m-3 shadow" style=background-color:silver;>
		<h3 class="text-center fw-bold mt-3" style=color:red;><b>Manage Applicant</b></h3>
		<div class="row row-cols-1 row-cols-md-2 g-4 mt-3">
        <c:forEach items="${listApplicant}" var="applicant">
            <div class="col m-3">
           
                <div class="card p-3 d-flex">
                 <p class="job-apply text-center fw-semibold">${applicant.getJob().getJob_name()} <br> ${applicant.getJob().getCompany_name()}</p>
                    <div class="wrapper d-flex align-items-center me-3">
                        <div class="logo me-3">
                            <img src="${applicant.getUserProfile().getPicture()}" alt="picture" style="width:100px;" />
                        </div>
                        <div class="detail">
                            <h5 class="fw-semibold">${applicant.getUserProfile().getFirst_name()} ${applicant.getUserProfile().getLast_name()}</h5>
                            <h5 class="text-secondary fs-6"> ${applicant.getUserProfile().getCity()}, ${applicant.getUserProfile().getCountry()}</h5>
                            
                        </div>
                    </div>
                    <div class="Job-description mt-4">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis fugit perspiciatis accusantium, nemo voluptates provident!</p>
                    </div>

               
                        <div class="wrapper d-flex align-items-center my-3">
                            <button
                                onclick="location.href = '<%= request.getContextPath() %>/acceptJob?id_profile=${applicant.getUserProfile().getId_profile()}&id_job=${applicant.getJob().getId_job()}&id_apply=${applicant.getId_apply_job()}';"
                                class="btn btn-primary me-3"><b>Accept</b></button>
                                 <button
                                onclick="location.href = '<%= request.getContextPath() %>/declineJob?id_apply=${applicant.getId_apply_job()}';"
                                class="btn btn-danger"><b>Decline</b></button>
                        </div>
                        
                
                 
                </div>
            </div>

        </c:forEach>
    </div>
			</div>
		</div>
	</section>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>