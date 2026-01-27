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
                    <a class="nav-link fw-bold text-secondary" href="my-job"><b>My Job</b></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold active" aria-current="page" href="apply-job"><b>Apply Job</b></a>
                </li>
            </ul>

            <div class="row row-cols-1 mt-3">
                <c:forEach items="${listApply}" var="apply">
                    <div class="col">
                        <div class="card p-3 d-flex">
                            <div class="wrapper d-flex align-items-center me-3">
                                <div class="logo me-3">
                                    <img src="${apply.getJob().getCompany_image()}" alt="company" />
                                </div>
                                <div class="detail">
                                    <h5 class="fw-semibold">${apply.getJob().getJob_name()}</h5>
                                    <h5 class="text-secondary fs-6">${apply.getJob().getCompany_name()}</h5>
                                    <a class="text-decoration-none"
                                        href="jobs-search?keyword=${apply.getJob().getJob_level()}"><small
                                            class="text-muted">${apply.getJob().getJob_level()},</small></a>

                                    <a class="text-decoration-none"
                                        href="jobs-search?keyword=${apply.getJob().getJob_level()}"><small
                                            class="text-muted">${apply.getJob().getJob_time()}</small></a>
                                </div>
                            </div>
                            <div class="Job-description mt-4">
                                <p>${apply.getJob().getJob_description()}</p>
                            </div>

                            <c:if test="${apply.getStatus() == 'PENDING'}">
                                <div class="wrapper d-flex align-items-center my-3">
                                    <p class="fw-bold bg-secondary text-white p-2 rounded-1">${apply.getStatus()}</p>
                                </div>
                            </c:if>

                            <c:if test="${apply.getStatus() == 'ACCEPTED'}">
                                <div class="wrapper d-flex align-items-center my-3">
                                    <p class="fw-bold bg-success text-white p-2 rounded-1">${apply.getStatus()}</p>
                                </div>
                            </c:if>

                            <c:if test="${apply.getStatus() == 'DECLINED'}">
                                <div class="wrapper d-flex align-items-center my-3">
                                    <p class="fw-bold bg-danger text-white p-2 rounded-1">${apply.getStatus()}</p>
                                </div>
                            </c:if>
                        </div>
                    </div>

                </c:forEach>
            </div>
        </div>

        <%@ include file="../components/footer.jsp" %>

</div>
</body>

</html>