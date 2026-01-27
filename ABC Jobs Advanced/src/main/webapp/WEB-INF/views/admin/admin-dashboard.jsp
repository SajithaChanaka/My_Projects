<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false" %> 
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
                    <h3 class="text-center fw-bold mt-3" style=color:red;><b>Admin Dashboard</b></h3>
                    <div class="m-4">
                        <button type="button" onclick="location.href = '<%= request.getContextPath() %>/admin-add';"
                            class="btn fw-bold btn-primary" style=color:orange;><b>Add User</b></button>
                        <button type="button"
                            onclick="location.href = '<%= request.getContextPath() %>/send-bulk-email';"
                            class="btn fw-bold btn-primary" style=color:orange;><b>Send Bulk Email</b></button>
                        <table class="table mt-3">
                            <tr class="text-center" style=background-color:white;>
                                <th><b>ID</b></th>
                                <th><b>First Name</b></th>
                                <th><b>Last Name</b></th>
                                <th><b>Email</b></th>
                                <th><b>Country</b></th>
                                <th><b>City</b></th>
                                <th><b>Company</b></th>
                                <th><b>Job</b></th>
                                <th><b>Action</b></th>
                            </tr>
                            <c:forEach items="${listUser}" var="user">
                                <tr style=color:purple;background-color:black;>
                                    <td><b>${user.getUser().getId_user()}</b></td>
                                    <td><b>${user.first_name}</b></td>
                                    <td><b>${user.last_name}</b></td>
                                    <td><b>${user.getUser().getEmail()}</b></td>
                                    <td><b>${user.country}</b></td>
                                    <td><b>${user.city}</b></td>
                                    <td><b>${user.getJob().getCompany_name()}</b></td>
                                    <td><b>${user.getJob().getJob_name()}</b></td>
                                    <td>
                                        <a href="admin-edit?id=${user.id_profile}" class="text-decoration-none">
                                            <button class="btn btn-outline-warning mb-1 mt-1 btn-sm"><b>Edit</b></button>
                                        </a>
                                        <a href="admin-delete?id=${user.getUser().getId_user()}"
                                            class="text-decoration-none">
                                            <button class="btn btn-outline-danger mb-1 mt-1 btn-sm"><b>Delete</b></button>
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