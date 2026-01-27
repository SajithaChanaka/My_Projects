<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false" %> 
<!DOCTYPE html>
<html>

<head>
    <%@ include file="../components/header.jsp" %>
        <link href="css/jobs.css" rel="stylesheet" />
</head>

<body>
<div class="d-flex flex-column min-vh-100">
    <%@ include file="../components/navbar.jsp" %>

        <div class="container my-3 ">
            <ul class="nav nav-pills border-bottom border-primary">
                <li class="nav-item ">
                    <a class="nav-link fw-bold text-secondary" href="jobs"><b>Jobs</b></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold active" aria-current="page" href="my-job"><b>My Job</b></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold text-secondary" href="apply-job"><b>Apply Job</b></a>
                </li>
            </ul>

            <div class="row row-cols-1 mt-3" style=background-color:silver;>
                <c:if test="${user.getJob() != null}">
                    <div class="col">
                        <div class="card p-3 d-flex">
                            <div class="wrapper d-flex align-items-center me-3">
                                <div class="logo me-3">
                                    <img src="${user.getJob().getCompany_image()}" alt="company" />
                                </div>
                                <div class="detail">
                                    <h5 class="fw-semibold"><b>${user.getJob().getJob_name()}</b></h5>
                                    <h5 class="text-secondary fs-6"><b>${user.getJob().getCompany_name()}</b></h5>
                                    <a class="text-decoration-none"
                                        href="jobs-search?keyword=${user.getJob().getJob_level()}"><small
                                            class="text-muted">${user.getJob().getJob_level()},</small></a>
                                    <a class="text-decoration-none"
                                        href="jobs-search?keyword=${user.getJob().getJob_time()}"><small
                                            class="text-muted">${user.getJob().getJob_time()}</small></a>
                                </div>
                            </div>
                            <div class="Job-description mt-4" style=color:red;>
                                <p><b>${user.getJob().getJob_description()}</b></p>
                            </div>
                        </div>
                    </div>

                </c:if>
            </div>

            <div class="row row-cols-1 mt-3">
                <c:if test="${user.getJob() == null}">
                    <div class="no-job">
                        <div class="text-center mt-3">
                            <h5 class="fw-semibold mb-3">You don't have a job</h5>
                            <a href="jobs">
                                <button class="btn btn-primary fw-bold">Apply For Job</button>
                            </a>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>

        <%@ include file="../components/footer.jsp" %>
</div>
           
</body>

</html>