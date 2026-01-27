<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<div class="footer bg-dark mt-auto">
  <div class="container">
    <footer class="row row-cols-5 py-5 mt-5 border-top">
      <div class="col">
        <a class="btn fw-bold fs-1 link-primary border-0">
          ABC <span class="badge text-bg-primary bg-primary">Jobs</span>
        </a>
       <p class="text-white">© 2023 | All rights Reserved.</p>
      </div>

      <div class="col">

      </div>

      <div class="col" style=color:red;>
        <h5><b>General</b></h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2"><a href="<%= request.getContextPath() %>/" class="nav-link p-0 text-white">Home</a></li>
          <li class="nav-item mb-2"><a href="" class="nav-link p-0 text-white">About</a></li>
          <li class="nav-item mb-2"><a href="" class="nav-link p-0 text-white">Help</a></li>
          <li class="nav-item mb-2"><a href="" class="nav-link p-0 text-white">FAQs</a></li>
          <li class="nav-item mb-2"><a href="" class="nav-link p-0 text-white">Careers</a></li>
        </ul>
      </div>

      <div class="col" style=color:red;>
        <h5><b>Social Media</b></h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2"><a href="" class="nav-link p-0 text-white">Facebook</a></li>
          <li class="nav-item mb-2"><a href="" class="nav-link p-0 text-white">Instagram</a></li>
          <li class="nav-item mb-2"><a href="" class="nav-link p-0 text-white">YouTube</a></li>
        </ul>
      </div>

      <div class="col" style=color:red;>
        <h5><b>Legal and Privacy</b></h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2"><a href="" class="nav-link p-0 text-white">Terms of Us</a></li>
          <li class="nav-item mb-2"><a href="" class="nav-link p-0 text-white">Privacy Policy</a></li>
        </ul>
      </div>
    </footer>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>