<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<%@ page isELIgnored = "false" %> 
<!DOCTYPE html>
<html>

<head>
    <%@ include file="../components/header.jsp" %>
        <link href="css/threads.css" rel="stylesheet" />
</head>

<body>
    <div class="d-flex flex-column min-vh-100">
        <%@ include file="../components/navbar.jsp" %>

            <div class="container my-3 ">
                <ul class="nav nav-pills border-bottom border-primary">
                    <li class="nav-item ">
                        <a class="nav-link fw-bold active" aria-current="page" href="threads"><b>Posts</b></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-secondary" href="my-thread"><b>My Post</b></a>
                    </li>
                </ul>

                <button onclick="location.href = '<%= request.getContextPath() %>/post-thread';" type="button"
                    class="btn fw-bold btn-primary mt-2" style=color:orange;><b>Create Post</b></button>

                <div class="search-bar mt-3">
                    <form action="thread-search" method="get" class="d-flex">
                        <input type="text" name="keyword" class="form-control me-2" placeholder="Search..."
                            aria-label="Search" name="searchValue" id="searchValue">
                        <button class="btn btn-outline-dark h-6" type="submit"><b>Search</b></button>
                    </form>
                </div>

                <div class="row row-cols-1 row-cols-md-2 g-4 mt-3">
                    <c:forEach items="${searchThread}" var="thread">
                        <div class="col mt-3">
                            <div class="card p-3 d-flex">
                                <div class="wrapper d-flex align-items-center me-3">
                                    <div class="logo me-3">
                                        <a class="text-decoration-none"
                                            href="view-profile?name=${thread.getProfile().getFirst_name()}&id=${thread.getProfile().getId_profile()}">
                                            <img src="${thread.getProfile().getPicture()}" alt="profile"
                                                style="width:100px; border-radius:50%;" />
                                        </a>
                                    </div>
                                    <div class="detail">
                                        <a class="text-decoration-none"
                                            href="view-profile?name=${thread.getProfile().getFirst_name()}&id=${thread.getProfile().getId_profile()}">
                                            <span class="fs-5 fw-bold text-dark">${thread.getProfile().getFirst_name()}
                                                ${thread.getProfile().getLast_name()}</span></a>
                                        <h5 class="text-secondary fs-6">${thread.getTitle()}</h5>
                                        <small class="text-muted">Tags: </small>
                                        <a class="text-decoration-none"
                                            href="thread-search?keyword=${thread.getTags().getFirst_tag()}"><small
                                                class="text-muted">${thread.getTags().getFirst_tag()},</small></a>
                                        <a class="text-decoration-none"
                                            href="thread-search?keyword=${thread.getTags().getSecond_tag()}"><small
                                                class="text-muted">${thread.getTags().getSecond_tag()}</small></a>
                                    </div>
                                </div>


                                <div class="my-3 text-end">
                                    <button
                                        onclick="location.href = '<%= request.getContextPath() %>/thread?id=${thread.getId_thread()}';"
                                        class="btn btn-outline-primary"><b>See Post</b></button>
                                </div>

                            </div>

                        </div>

                    </c:forEach>

                </div>
                <c:if test="${searchThread == null || searchThread.isEmpty()}">
                    <div class="mt-4 text-center">
                        <h4 class="text-secondary">Thread not found.</h4>
                    </div>
                </c:if>
            </div>

            <%@ include file="../components/footer.jsp" %>
    </div>
</body>

</html>