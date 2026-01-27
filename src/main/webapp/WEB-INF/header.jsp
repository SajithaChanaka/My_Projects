<!-- Navbar -->
<div class="my-4" style="margin-bottom: 0px;">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a href="cars" class="navbar-brand" data-toggle="tooltip"
				data-placement="top" title="Home"> <img
				src="/images/car2.jpeg" height="40">
			</a>
			<button type="button" class="navbar-toggler"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">


				<sec:authorize access="!isAuthenticated()">
					<div class="navbar-nav">

						<a href="register_user" class="nav-item nav-link"><b>Register</b></a> <a
							href="about_us" class="nav-item nav-link"><b>About Us</b></a> <a
							href="contact_us" class="nav-item nav-link"><b>Contact Us</b></a>
					</div>
					<div class="navbar-nav ms-auto">
						<a href="login" class="nav-item nav-link" style= color:red;><b>Login</b></a>
					</div>
				</sec:authorize>


				<sec:authorize access="isAuthenticated()">

					<sec:authorize access="hasRole('Users')">
						<div class="navbar-nav">
							<a class="nav-item nav-link" href="cars"><b>Home</b></a>
						</div>

					</sec:authorize>

					<sec:authorize access="hasRole('Administrator')">
						<div class="navbar-nav">
							<a class="nav-item nav-link" href="cars"><b>Home</b></a> <a
								class="nav-item nav-link" href="all_cars"><b>Car Management</b></a> <a
								class="nav-item nav-link" href="users"><b>User Management</b></a>
						</div>

					</sec:authorize>

					<sec:authorize access="hasAnyRole('Administrator','Users')">

						<div class="navbar-nav px-5" style="width: 70%;">
							<sf:form action="search" method="get" style="width: 100%;">
								<div class="input-group">
									<input type="search" class="form-control rounded"
										placeholder="Search" aria-label="Search" name="keyword"
										aria-describedby="search-addon" />
									<button type="submit" class="btn btn-outline-primary"><b>search</b></button>
								</div>
							</sf:form>
						</div>

						<!-- /logout must be a POST request, as csrf is enabled.
			        This ensures that log out requires a CSRF token and that a malicious user cannot forcibly log out your users.-->
						<div class="navbar-nav ms-auto">

							<a class="nav-item nav-link p-3" href="profile"><b>Profile</b></a>

							<form action="logout" method="post" style="padding: 7px;">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="submit" name="Logout"
									value="Logout" class="btn btn-primary"></input>
							</form>
						</div>


					</sec:authorize>


				</sec:authorize>




			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<a href="cars" class="navbar-brand " data-toggle="tooltip"
			data-placement="top" title="Home"> <img src="/images/logo.png"
			height="60%">
		</a>
	</div>
</div>