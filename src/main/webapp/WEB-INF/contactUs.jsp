<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<!--  Enable Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!--  Access the Static Resources without using spring URL -->
<link href="/css/style.css" rel="stylesheet" />
<script src="/js/script.js"></script>

</head>

<body>



	<%@ include file="header.jsp"%>

	<div class="row p-5 mb-5 bg-light">
	<h2 style=padding-left:600px;font-size:40px;><b>Contact</b></h2><br>
	<img src="/images/contact.jpeg" alt="" style=height:300px;>

		<div  style=padding-left:460px;>
	
			
			<h4 style=color:red;><b>Contact us and we'll get back to you within 24 hours.</b></h4>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span><b> Sri Lanka, KL</b>
				</p>
						<p>
							<span class="glyphicon glyphicon-phone" style=padding-left:60px;></span><h5 style=color:purple;><b>Telephone No:-</b> +94 1515151515</h5> 
						</p>
						
						<span class="glyphicon glyphicon-envelope"></span><h5 style=color:purple;><b>Address:-</b> 34/B katugathota road,kandy</h5>
						
						</p>
						<p>
							<span class="glyphicon glyphicon-envelope"></span><h5 style=color:purple;><b>E-mail Address:-</b> ABCcar23@gmail.com</h5>
						</p>
						<p>
							<span class="glyphicon glyphicon-envelope"></span><h5 style=color:purple;><b>Facebook:-</b> ABCcar34@facebook.com</h5>
						</p>
						
						<span class="glyphicon glyphicon-envelope"></span><h5 style=color:purple;><b>Skype:-</b> ABCcar64@skype.com</h5>
						
						</p>
			</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
