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
                        <a class="nav-link fw-bold active" aria-current="page" href="#">Jobs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-secondary" href="my-job">My Job</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-secondary" href="apply-job">Apply Job</a>
                    </li>
                </ul>

                <div class="search-bar mt-3">
                    <form action="jobs-search" method="get" class="d-flex">
                        <input type="text" name="keyword" class="form-control me-2" placeholder="Search..."
                            aria-label="Search" name="searchValue" id="searchValue">
                        <button class="btn btn-outline-dark h-6" type="submit">Search</button>
                    </form>
                </div>


                <div class="row row-cols-1 row-cols-md-2 g-4 mt-3">
                    <c:forEach items="${searchJob}" var="job">
                        <div class="col">
                            <div class="card p-3 d-flex">
                                <div class="wrapper d-flex align-items-center me-3">
                                    <div class="logo me-3">
                                        <img src="${job.getCompany_image()}" alt="" />
                                    </div>
                                    <div class="detail">
                                        <h5 class="fw-semibold">${job.getJob_name()}</h5>
                                        <h5 class="text-secondary fs-6">${job.getCompany_name()}</h5>
                                        <a class="text-decoration-none"
                                            href="jobs-search?keyword=${job.getJob_level()}"><small
                                                class="text-muted">${job.getJob_level()},</small></a>
                                        <a class="text-decoration-none"
                                            href="jobs-search?keyword=${job.getJob_time()}"><small
                                                class="text-muted">${job.getJob_time()}</small></a>
                                    </div>
                                </div>
                                <div class="Job-description mt-4">
                                    <p>${job.getJob_description()}</p>
                                </div>

                                <c:if test="${user.getJob() == null}">
                                    <div class="wrapper d-flex align-items-center my-3">
                                        <button
                                            onclick="location.href = '<%= request.getContextPath() %>/applyJob?id_job=${job.getId_job()}';"
                                            class="btn btn-outline-primary">Apply</button>
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