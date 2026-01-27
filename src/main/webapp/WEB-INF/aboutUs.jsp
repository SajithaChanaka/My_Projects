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

	<div class="row p-5 mb-5 bg-light" style=overflow:hidden;background:linear-gradient(129deg,rgb(54,47,186),rgb(62,71,221));>
   <h2 style=font-size:50px;padding-left:390px;><b>About ABC Car Portal</b></h2>
		<div class="col-5">
			<br>
			<h2 style=font-size:2.8rem;color:yellow;letter-spacing:-1.1px;margin-top:20px;>We are a Sri Lankan online marketplace.</h2>
			<span style=font-size:20px;line-height:1.73;color:rgb(255,255,255);display:block;max-width:420px;>We bring you new markets, new customers and new opportunities for the purchase and sale of used cars. Now you can buy and sell a used car safely and comfortablly online, with only a few easy clicks.</span>
			<img src=/images/car_company.jpeg alt="" style=padding-left:680px;margin-top:-280px;height:360px;>
			
		</div>
	</div>
	<div style=font-size:1.2rem;line-height:1.2;font-weight:500;color:violet;padding:0px;margin:0px;letter-spacing:0.8px;text-transform:uppercase;padding-left:580px;margin-top:15px;><span class="css-1xfs4bs e1o0obct0">We are new and growing fast</span></div>
	<h2 style=font-size:35px;letter-spacing:-0.7px;line-height:1.73;margin-bottom:30px;padding-left:540px;>ABC Car Portal in numbers</h2>
	
	<div style=padding-left:160px;margin-top:70px;>
	<img src="/images/n.car.png" alt="" style=padding-left:90px;>
	<h3><b>More than 2 million cars</b></h3>
	<p style=color:red;>ABC car is the largest used car market<br> 
	with vehicles from all over Asia.</p>
	</div>
	
	<div style=padding-left:560px;margin-top:-204px;>
	<img src="/images/building.png" alt="">
	<h3 style=padding-left:98px;><b>7 subsidiaries</b></h3>
	<p style=color:red;>We have expanded fast and have already managed<br>to open 7 subsidiaries.</p>
	</div>
	
	<div style=padding-left:1000px;margin-top:-200px;>
	<img src="/images/flag.png" alt="">
	<h3 style=padding-left:110px;><b>7 countries</b></h3>
	<p style=color:red;>We operate in 7 Asian countries and will add more soon.</p>
	</div>
	
	<div style= font-size:1.2rem;line-height:1.2;font-weight:500;color:#3E47DD;letter-spacing:0.8px;text-transform:uppercase;padding-left:520px;margin-top:50px;> 
	<span>You choose. We check, finance, deliver.</span>
	</div>
	
	<div>
	<h2 style=font-size:40px;letter-spacing:-0.7px;line-height:1.3;margin-bottom:15px;padding-left:290px;>Everything for your convenient purchase and sale.</h2>
	<p style=padding-left:340px;>Cars from all over Europe at one site. More cars, more choice and better prices. All this convienient and safe.</p>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>

   
    
    
     
      
    
   
    
   
    
    
    
    
  
  
  
   
    
   
   
    
        
   
   
   
   
    
   
       
    