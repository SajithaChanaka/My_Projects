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
        <div class="row justify-content-sm-center h-100">
            <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
                <div class="card m-3 shadow">
                    <div class="card-body p-5">
                        <h1 class="fs-4 card-title fw-bold mb-4" style=color:red;padding-left:80px;><b>Post Job</b></h1>
                        <form:form action="postJob" method="post" modelAttribute="manageJob" id="form">

                            <div class="form-floating mb-3">
                                <form:select path="job_level" class="form-select" id="floatingSelect" name="job_level"
                                    aria-label="Floating label select example">
                                    <option value="" selected disabled><b>-- Select Job Level --</b></option>
                                    <option value="Senior">Senior</option>
                                    <option value="Junior">Junior</option>
                                    <option value="Intern">Intern</option>
                                </form:select>
                                <label for="floatingSelect job_level"><b>Job Level</b></label>
                            </div>
                            
                            <div class="form-floating mb-3">
                                <form:select path="job_time" class="form-select" id="floatingSelect" name="job_time"
                                    aria-label="Floating label select example">
                                    <option value="" selected disabled><b>-- Select Job Time --</b></option>
                                    <option value="Full Time">Full-Time</option>
                                    <option value="Part Time">Part-Time</option>
                                </form:select>
                                <label for="floatingSelect job_time"><b>Job Time</b></label>
                            </div>

                            <div class="form-floating mb-3">
                                <form:input path="job_name" type="text" class="form-control" placeholder="Job Name"
                                    name="job_name" id="job_name" />
                                <label for="job_name"><b>Job Name</b></label>
                            </div>

                            <div class="form-floating mb-3">
                                <form:textarea path="job_description" type="text" class="form-control" placeholder="Job Description"
                                    name="job_description" id="job_description" />
                                <label for="job_description"><b>Job Description</b></label>
                            </div>

                            <div class="form-floating mb-3">
                                <form:select path="company_name" class="form-select" id="floatingSelect" name="company_name"
                                    aria-label="Floating label select example">
                                    <option value="" selected disabled><b>-- Select Company --</b></option>
                                    <option value="Google">Google</option>
					                  <option value="Amazon">Amazon</option>
					                  <option value="Microsoft">Microsoft</option>
					                  <option value="Samsung">Samsung</option>
					                  <option value="Nvidia">Nvidia</option>
                                </form:select>
                                <label for="floatingSelect company_name"><b>Company</b></label>
                            </div>
                            <button class="w-100 btn btn-lg btn-primary fw-bold" type="submit"><b>Post</b></button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>