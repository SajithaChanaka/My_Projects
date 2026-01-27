<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>

<head>
    <%@ include file="../components/header.jsp" %>
        <!-- <link href="css/view-profile.css" rel="stylesheet" /> -->
        <link href="css/profile.css" rel="stylesheet" />
        <link>
</head>

<body>
    <div class="root">
        <%@ include file="../components/navbar.jsp" %>

            <section class="profile">
                <div class="container">
                    <div class="profile">
                        <div class="card">
                            <div class="rounded-top text-white d-flex flex-row bg-dark" style="height:200px;">
                                <div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">
                                    <img src="${view.picture}" alt="Generic placeholder image"
                                        class="img-fluid img-thumbnail mt-4 mb-2 rounded-circle"
                                        style="width: 150px; z-index: 1">

                                    <p class="text-dark text-center" style="z-index: 1;"><svg
                                            xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
                                                d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694 1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z" />
                                            <path
                                                d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z" />
                                        </svg> ${profile.getJob().getCompany_name()}</p>

                                </div>
                                <div class="ms-3" style="margin-top: 130px;">
                                    <h4 class="fw-bold">${view.first_name} ${view.last_name}</h4>
                                    <p>${view.city}, ${view.country}</p>
                                </div>
                            </div>
                            <div class="p-4 text-black" style="background-color: #f8f9fa;">
                                <div class="d-flex justify-content-end text-center py-1">
                                    <div>
                                        <a href="edit-profile" class="btn btn-primary h5 fw-bold"><b>Follow</b></a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-4 text-black">

                                <div class="card-body p-4">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <button class="nav-link active fw-bold" id="nav-home-tab"
                                                data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab"
                                                aria-controls="nav-home" aria-selected="true" style=color:purple;><b>About</b></button>
                                            <button class="nav-link fw-bold" id="nav-profile-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-profile" type="button" role="tab"
                                                aria-controls="nav-profile" aria-selected="false" style=color:purple;><b>Job</b></button>
                                            <button class="nav-link fw-bold" id="nav-contact-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-contact" type="button" role="tab"
                                                aria-controls="nav-contact" aria-selected="false" style=color:purple;><b>Posts</b></button>
                                            <button class="nav-link fw-bold" id="nav-contact-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-network" type="button" role="tab"
                                                aria-controls="nav-network" aria-selected="false" style=color:purple;><b>${view.first_name}'s
                                                Network</b></button>
                                        </div>
                                    </nav>
                                    <div class="tab-content" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                                            aria-labelledby="nav-home-tab" tabindex="0">
                                            <div class="row p-3 card">
                                                <c:if test="${view.about == null}">
                                                    <p class="mt-3">No about available.</p>
                                                </c:if>
                                                <p class="mt-3">${view.about}</p>

                                            </div>
                                        </div>

                                        <c:if test="${view.getJob() != null}">
                                            <div class="tab-pane fade" id="nav-profile" role="tabpanel"
                                                aria-labelledby="nav-profile-tab" tabindex="0">
                                                <div class="row card profile-header">
                                                    <div class="body">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-12">
                                                                <div class="job-image float-md-right"> <img
                                                                        src="${view.getJob().getCompany_image()}"
                                                                        alt="picture" style="width:60px;">
                                                                </div>
                                                            </div>
                                                            <h4 class="m-t-0 m-b-0">
                                                                <strong>${view.getJob().getJob_name()}</strong>
                                                            </h4>
                                                            <span
                                                                class="job_post">${view.getJob().getCompany_name()}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                        <div class="tab-pane fade" id="nav-contact" role="tabpanel"
                                            aria-labelledby="nav-contact-tab" tabindex="0">
                                            <div class="row p-3 card">
                                                ...
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-network" role="tabpanel"
                                            aria-labelledby="nav-disabled-tab" tabindex="0">
                                            <div class="row p-3 card">
                                                ...
                                            </div>
                                        </div>
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