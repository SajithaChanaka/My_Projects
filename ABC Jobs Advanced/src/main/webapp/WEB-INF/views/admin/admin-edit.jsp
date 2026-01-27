<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                <h1 class="fs-4 card-title fw-bold mb-4" style=color:red;><b>Edit Profile</b></h1>
                                <form:form action="saveEditAdmin" method="post" modelAttribute="editAdmin" id="form">

                                    <div class="form-floating mb-3">
                                        <form:hidden path="id_profile" class="form-control" />
                                    </div>

                                    <div class="form-floating mb-3">
                                        <form:input path="first_name" type="text" class="form-control"
                                            placeholder="first_name" name="first_name" id="first_name" />
                                        <label for="first_name">First Name</label>
                                        <div class="invalid-feedback error errorFname">
                                            <div>
                                                First Name is required
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <form:input path="last_name" type="text" class="form-control"
                                            placeholder="last_name" name="last_name" id="last_name" />
                                        <label for="last_name">Last Name</label>
                                        <div class="invalid-feedback error errorLname">
                                            <div>
                                                Last Name is required
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <form:input path="city" type="text" class="form-control" placeholder="city"
                                            name="city" id="city" />
                                        <label for="city">City</label>
                                        <div class="invalid-feedback error errorCity">
                                            <div>City is required</div>
                                        </div>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <form:input path="country" type="text" class="form-control"
                                            placeholder="country" name="country" id="country" />
                                        <label for="country">Country</label>
                                        <div class="invalid-feedback error errorCountry">
                                            <div>
                                                Country is required
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <form:input path="job.id_job" type="text" class="form-control"
                                            placeholder="ID Job" name="job" id="job" />
                                        <label for="job">ID Job</label>
                                        <div class="invalid-feedback error errorAbout">
                                            <div>
                                                ID Job is required
                                            </div>
                                        </div>
                                    </div>

                                    <button class="w-100 btn btn-lg btn-primary" type="submit">Edit</button>
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