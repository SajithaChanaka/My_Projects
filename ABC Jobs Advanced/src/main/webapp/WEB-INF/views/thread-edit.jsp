<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <%@ include file="../components/header.jsp" %>
        <link href="css/thread-form.css" rel="stylesheet" />
</head>

<body>
    <div class="root">
        <%@ include file="../components/navbar.jsp" %>

            <section class="h-100 mt-3">
                <div class="container h-100">
                    <div class="row justify-content-sm-center h-100">
                        <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
                            <div class="card m-3 shadow">
                                <div class="card-body p-5">
                                    <h1 class="fs-4 card-title fw-bold mb-4" style=color:red;padding-left:65px;><b>Edit Post</b></h1>
                                    <form:form action="editThread" method="post" modelAttribute="editThread" id="form">

                                        <form:hidden path="id_thread" />
                                        <form:hidden path="tags.id_thread_tag" />

                                        <div class="form-floating mb-3">
                                            <form:input path="title" type="text" class="form-control"
                                                placeholder="Title" name="title" id="title" />
                                            <label for="title"><b>Title</b></label>
                                            <div class="invalid-feedback error errorTitle">
                                                <div>${messageTitle}</div>
                                            </div>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <form:textarea path="content" type="text" class="form-control"
                                                placeholder="Content" name="content" id="content" />
                                            <label for="content"><b>Content</b></label>
                                            <div class="invalid-feedback error errorContent">
                                                <div>
                                                    ${messageContent}
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <form:select path="tags.first_tag" class="form-select ${error}" name="tag1"
                                                id="floatingSelect" aria-label="Floating label select example">
                                                <option value="" disabled="disabled" selected>Choose First Tag</option>

                                                <c:forEach items="${tags}" var="tag">
                                                    <<option value="${tag.getFirst_tag()}" <c:if
                                                        test="${tag.getFirst_tag().equals(editThread.getTags().getFirst_tag())}">
                                                        selected</c:if>>
                                                        ${tag.getFirst_tag()}
                                                        </option>
                                                </c:forEach>
                                            </form:select>
                                            <label for="floatingSelect tag1"><b>First Tag</b></label>
                                        </div>
                                        <p class="error">${messageTag}</p>

                                        <div class="form-floating mb-3">
                                            <form:select path="tags.second_tag" class="form-select ${error}" name="tag2"
                                                id="floatingSelect" aria-label="Floating label select example">
                                                <option value="" disabled="disabled" selected>Choose Second Tag</option>
                                                <option value="">No Tag</option>
                                                <c:forEach items="${tags}" var="tag">
                                                    <option value="${tag.getSecond_tag()}" <c:if
                                                        test="${tag.getSecond_tag().equals(editThread.getTags().getSecond_tag())}">
                                                        selected</c:if>>
                                                        ${tag.getSecond_tag()}
                                                    </option>
                                                </c:forEach>
                                            </form:select>
                                            <label for="floatingSelect tag2"><b>Second Tag</b></label>
                                        </div>
                                        <p class="error">${messageTag}</p>
                                        <button class="w-100 btn btn-lg btn-primary" type="submit"><b>Post</b></button>
                                    </form:form>
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
