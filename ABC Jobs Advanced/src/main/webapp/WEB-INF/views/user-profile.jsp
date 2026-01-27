<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <%@ include file="../components/header.jsp" %>
        <!-- <link href="css/user-profile.css" rel="stylesheet" /> -->
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
                                    <img src="${profile.picture}" alt="Generic placeholder image"
                                        class="img-fluid img-thumbnail mt-4 mb-2 rounded-circle"
                                        style="width: 150px; z-index: 1">
                                    <c:if test="${profile.getJob() != null}">
                                        <p class="text-dark text-center" style="z-index: 1;"><svg
                                                xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd"
                                                    d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694 1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z" />
                                                <path
                                                    d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z" />
                                            </svg> <b>${profile.getJob().getCompany_name()}</b></p>
                                    </c:if>
                                </div>
                                <div class="ms-3" style="margin-top: 130px;color: yellow;">
                                    <h4 class="fw-bold">${profile.first_name} ${profile.last_name}</h4>
                                    <p>${profile.city}, ${profile.country}</p>
                                </div>
                            </div>
                            <div class="p-4 text-black" style="background-color: silver;">
                                <div class="d-flex justify-content-end text-center py-1">
                                    <div>
                                        <!-- <a href="change-banner" class="btn btn-secondary h5 fw-bold">Change Banner</a> -->
                                        <a href="edit-profile" class="btn btn-primary h5 fw-bold"><b>Edit Profile</b></a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-4 text-black">
                                <div class="accordion mb-3" id="accordionPanelsStayOpenExample">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                            <button class="accordion-button fw-bold" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne"
                                                aria-expanded="true" aria-controls="panelsStayOpen-collapseOne" style=color:red;>
                                                <b>People Around You</b>
                                            </button>
                                        </h2>
                                        <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show"
                                            aria-labelledby="panelsStayOpen-headingOne">
                                            <div class="accordion-body">
                                                <div class="container profile-page">
                                                    <div class="row">
                                                        <c:forEach items="${listPeople}" var="people">
                                                            <div class="col-xl-6 col-lg-7 col-md-12">
                                                                <div class="card profile-header">
                                                                    <div class="body">
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 col-12">
                                                                                <div
                                                                                    class="profile-image float-md-right">
                                                                                    <img src="${people.picture}"
                                                                                        alt="picture">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-8 col-md-8 col-12">
                                                                                <h4 class="m-t-0 m-b-0">
                                                                                    <strong>${people.first_name}
                                                                                    </strong>${people.last_name}
                                                                                </h4>
                                                                                <c:if test="${people.getJob() != null}">
                                                                                    <span
                                                                                        class="job_post">${people.getJob().getCompany_name()}</span>
                                                                                </c:if>
                                                                                <p> ${people.city}, ${people.country}
                                                                                </p>
                                                                                <div>
                                                                                    <button
                                                                                        class="btn btn-primary btn-round me-3" style=color:white;
                                                                                        onclick="location.href = '<%= request.getContextPath() %>/view-profile?id=${people.id_profile}';"><b>View
                                                                                        Profile</b></button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body p-4"  style=background-color:silver;>
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
                                                aria-controls="nav-network" aria-selected="false" style=color:purple;><b>My Network</b></button>
                                        </div>
                                    </nav>
                                    <div class="tab-content" id="nav-tabContent">
                                        <c:if test="${profile.about != null}">
                                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                                                aria-labelledby="nav-home-tab" tabindex="0">
                                                <div class="row p-3 card">
                                                    <p class="mt-3">${profile.about}</p>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${profile.getJob() != null}">
                                            <div class="tab-pane fade" id="nav-profile" role="tabpanel"
                                                aria-labelledby="nav-profile-tab" tabindex="0">
                                                <div class="row card profile-header">
                                                    <div class="body">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-12">
                                                                <div class="job-image float-md-right"> <img
                                                                        src="${profile.getJob().getCompany_image()}"
                                                                        alt="picture" style="width:60px;">
                                                                </div>
                                                            </div>
                                                            <h4 class="m-t-0 m-b-0">
                                                                <strong>${profile.getJob().getJob_name()}</strong>
                                                            </h4>
                                                            <span
                                                                class="job_post">${profile.getJob().getCompany_name()}</span>
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