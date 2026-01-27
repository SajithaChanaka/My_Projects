<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page isELIgnored = "false" %>   
<!DOCTYPE html>
<html>

<head>
    <%@ include file="../components/header.jsp" %>
        <link href="css/login.css" rel="stylesheet" />
        <link>
</head>

<body>
    <div class="d-flex flex-column min-vh-100">
        <%@ include file="../components/navbar.jsp" %>

            <section class="h-100 mt-3">
                <div class="container h-100">
                    <div class="row justify-content-sm-center h-100">
                        <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
                            <div class="card m-3 shadow">
                                <div class="card-body p-5">
                                    <h1 class="fs-4 card-title fw-bold mb-4" style=color:red;padding-left:100px><b>Login</b></h1>
                                    <form:form name="form" id="form" action="doLogin" method="post"
                                        modelAttribute="userLogin" onsubmit="return checkValidation()">
                                        <div class="form-floating mb-3">
                                            <form:input path="email" type="email" class="form-control" style="${error}"
                                                placeholder="name@example.com" name="email" id="email" />
                                            <label for="floatingInput" style=padding-left:80px;><b>Email address</b></label>
                                            <div class="invalid-feedback error errorEmail">
                                                <div>Email is Required</div>
                                            </div>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <form:input path="password" type="password" class="form-control"
                                                style="${error}" placeholder="Password" name="password" id="password" />
                                            <label for="floatingPassword" style=padding-left:90px;><b>Password</b></label>
                                            <div class="invalid-feedback error errorPassword">
                                                <div>
                                                    Password is Required
                                                </div>
                                            </div>
                                        </div>

                                        <span
                                            style="color: #b02a37; margin-top: 5px margin-bottom: 5px">${message}</span>

                                        <div class="d-flex align-items-center mb-5">
                                            <div class="form-check">
                                                <input type="checkbox" name="remember" id="remember"
                                                    class="form-check-input">
                                                <label for="remember" class="form-check-label"><b>Remember Me</b></label>
                                            </div>
                                            <div class="col">
                                                <a href="<%= request.getContextPath() %>/forgot-password"
                                                    class="float-end" style=color:red;>
                                                    <b>Forgot Password?</b>
                                                </a>
                                            </div>
                                        </div>
                                        <button class="w-100 btn btn-lg btn-primary" type="submit"><b>Login</b></button>
                                    </form:form>
                                </div>
                                <div class="card-footer py-3 border-0">
                                    <div class="text-center">
                                        <b>Don't have an account? <a href="<%= request.getContextPath() %>/register"
                                            class="text-blue">Register</a></b>
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