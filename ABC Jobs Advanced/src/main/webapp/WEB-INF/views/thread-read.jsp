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
    <%@ include file="../components/navbar.jsp" %>

        <div class="container my-3 " >
            <div class="row row-cols-1 mt-3" style=background-color:silver;>

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
                                    <span class="fs-3 fw-bold text-dark">${thread.getProfile().getFirst_name()}
                                        ${thread.getProfile().getLast_name()}</span></a>

                            </div>
                        </div>
                        <div class="content mt-3">
                            <h5 class="text-secondary fs-3">${thread.getTitle()}</h5>
                            <p>${thread.getContent()}</p>
                            <small class="text-muted">Tags: </small>
                            <a class="text-decoration-none"
                                href="thread-search?keyword=${thread.getTags().getFirst_tag()}"><small
                                    class="text-muted">${thread.getTags().getFirst_tag()}, </small></a>
                            <a class="text-decoration-none"
                                href="thread-search?keyword=${thread.getTags().getSecond_tag()}"><small
                                    class="text-muted">${thread.getTags().getSecond_tag()}</small></a>
                        </div>
                        <div class="comments">
                            <div class="heading">
                                <h4><b>Comments</b></h4>
                            </div>

                            <c:forEach items="${listComment}" var="comment">

                                <div class="row row-cols-1 mt-3 mb-3">
                                    <div class="col mt-3">
                                        <div class="card p-3 d-flex">
                                            <div class="wrapper d-flex align-items-center me-3">
                                                <div class="logo me-3">
                                                    <a class="text-decoration-none"
                                                        href="view-profile?id=${comment.getProfile().getId_profile()}">
                                                        <img src="${comment.getProfile().getPicture()}" alt="profile"
                                                            style="width:50px; border-radius:50%;" />
                                                    </a>
                                                </div>
                                                <div class="detail">
                                                    <a class="text-decoration-none"
                                                        href="view-profile?name=${thread.getProfile().getFirst_name()}&id=${thread.getProfile().getId_profile()}">
                                                        <span
                                                            class="fs-6 fw-bold text-dark">${comment.getProfile().getFirst_name()}
                                                            ${comment.getProfile().getLast_name()}</span></a>
                                                </div>
                                            </div>
                                            <div class="content mt-3">
                                                <p>${comment.getComment()}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:if test="${listComment.isEmpty()}">
                                <div class="no-comment">
                                    <p class="text-secondary text-center">Be the first one to comment this post</p>
                                </div>
                            </c:if>
                            <form:form action="postComment" method="post" modelAttribute="threadComment"
                                onsubmit="return checkValidation()">
                                <input type="hidden" name="id" value="${thread.id_thread}">
                                <div class="form-floating">
                                    <form:textarea path="comment" class="form-control" id="comment"></form:textarea>
                                    <label for="floatingTextarea">Comment</label>
                                </div>
                                <p class="error">Can't post blank comment</p>
                                <button type="submit" class="btn btn-primary fw-bold mt-3"><b>Send Comment</b></button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="../components/footer.jsp" %>
                <script type="text/javascript" src="js/comment.js"></script>
        </div>
</body>

</html>