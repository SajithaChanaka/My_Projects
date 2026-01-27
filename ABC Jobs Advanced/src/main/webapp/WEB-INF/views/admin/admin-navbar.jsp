<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored = "false" %>

<nav class="navbar navbar-expand-lg bg-dark navbar-light sticky-top shadow-sm">
  <div class="container">
    <a class="btn fw-bold fs-4 link-primary border-0" href="<%= request.getContextPath() %>">
      <b>ABC <span class="badge text-bg-primary bg-primary">Jobs</span></b>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse text-center" id="navbarNav">
      <ul class="navbar-nav ms-auto mx-3 fw-bold">
        <li class="nav-item">
          <a href="<%= request.getContextPath() %>/" class="nav-link" style=color:white;><b>Home</b></a>
        </li>
        <c:if test="${admin != null}">
        <li class="nav-item">
          <a href="admin-dashboard" class="nav-link" style=color:white;><b>Dashboard</b></a>
        </li>
        <li class="nav-item">
          <a href="manage-job" class="nav-link" style=color:white;><b>Manage Jobs</b></a>
        </li>
        </c:if>
        </ul>
        <c:if test="${admin != null}">
          <ul class="navbar-nav fw-semibold">
             <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                 <div class="nav-account me-2">
                   <img src="images/user/default.png" alt="profile" style="width:25px; border-radius:50%;"/>
                 </div>
               </a>
               <ul class="dropdown-menu">
                 <li>
                   <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal" href="logout">
                     <i class="fa-solid fa-briefcase"></i><b>Log Out</b>
                   </a>
                 </li>
               </ul>
             </li>
           </ul>
        </c:if>
    </div>
  </div>
</nav>

 

 <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Log Out</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Are you sure want to log out?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
        <button onclick="location.href = '<%= request.getContextPath() %>/adminLogout';" type="button" class="btn btn-danger">Yes, Log Out</button>
      </div>
    </div>
  </div>
</div>