<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page isELIgnored = "false" %>   
<html>

<head>
    <%@ include file="../../components/header.jsp" %>
       
</head>

<body>
    <div class="root">
        <%@ include file="admin-navbar.jsp" %>

            <section class="h-100 mt-3">
                <div class="container h-100">
                    <div class="row justify-content-sm-center h-100">
                        <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
                            <div class="card m-3 shadow">
                                <div class="card-body p-5">
                                    <h1 class="fs-4 card-title fw-bold mb-4" style=color:red;padding-left:45px;><b>Admin Login</b></h1>
                                    <form:form action="adminLogin" method="post" modelAttribute="adminLogin" id="form">
                                        <div class="form-floating mb-3">
                                            <form:input path="email" type="email" class="form-control" style="${error}"
                                                placeholder="name@example.com" name="email" id="email" />
                                            <label for="floatingInput" style=padding-left:60px;><b>Email address</b></label>

                                        </div>

                                        <div class="form-floating mb-3">
                                            <form:input path="password" type="password" class="form-control"
                                                style="${error}" placeholder="Password" name="password" id="password" />
                                            <label for="floatingPassword" style=padding-left:70px;><b>Password</b></label>

                                        </div>

                                        <div class="form-floating mb-3">
                                            <span
                                                style="color: #b02a37; margin-top: 5px margin-bottom: 5px">${message}</span>
                                        </div>

                                        <button class="w-100 btn btn-lg btn-primary" type="submit"><b>Login</b></button>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


    </div>
</body>

</html>