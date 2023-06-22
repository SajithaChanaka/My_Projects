<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../header.jsp">
    <jsp:param value="Admin Dashboard" name="HTMLtitle" />
</jsp:include>

<div class="container">
  <h1>Welcome back, ${adminName}</h1>
  <a href="admin/send-bulk" class="btn btn-outline-primary">Send bulk email</a>
  <a href="admin/all-users" class="btn btn-outline-primary">Show all users</a>
</div>

<jsp:include page="../../footer.jsp"></jsp:include>