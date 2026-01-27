<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../components/header.jsp" %>
<link href="css/search-user.css" rel="stylesheet" />
<link>
</head>
<body>
	<div class="d-flex flex-column min-vh-100">
      <%@ include file="../components/navbar.jsp" %>
 
      <form:form action="search" method="get" modelAttribute="searchUser">
		  <div class="container my-3">
		    <div class="container-fluid">
		    <h2 class="fw-semibold"><b>Search User</b></h2>
		      <div class="d-flex">
				<form:input type="text" path="keyword" class="form-control me-2" placeholder="Search..." aria-label="Search" name="searchValue" id="searchValue" />
				<button class="btn btn-outline-dark h-6" type="submit"><b>Search</b></button>
		      </div>
		    </div>
		  </div>
	  </form:form>
	  
	  <section class="search-list">
		  <div class="container profile-page">
		    <div class="row">
		    <c:forEach items="${result}" var="r">
		      <div class="col-xl-6 col-lg-7 col-md-12">
		        <div class="card profile-header">
		          <div class="body">
		            <div class="row">
		              <div class="col-lg-4 col-md-4 col-12">
		                <div class="profile-image float-md-right" >
		                <img src="${r.picture}" alt="picture" >
		                </div>
		              </div>
		              <div class="col-lg-8 col-md-8 col-12">
		                <h4 class="m-t-0 m-b-0"><strong>${r.first_name}</strong> ${r.last_name}</h4>
		                <c:if test="${r.getJob() != null}">
		                <span class="job_post"> ${r.getJob().getCompany_name()}</span>
		                </c:if>
		                <p>${r.city}, ${r.country}</p>
		                <div>
		                  <button onclick="location.href = '<%= request.getContextPath() %>/view-profile?id=${r.id_profile}';" class="btn btn-primary btn-round me-3"><b>View Profile</b></button>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		      </c:forEach>
		    </div>
		  </div>
		</section>

		

      <%@ include file="../components/footer.jsp" %>
   	</div>
</body>
</html>