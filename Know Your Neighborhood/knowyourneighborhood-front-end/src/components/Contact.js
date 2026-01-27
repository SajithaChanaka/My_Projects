import React, { Component } from 'react';

class Contact extends Component{
    render() {

        return (
            <section class="py-5">
            <div class="container text-primary">
              <div class="row">
                <div class="col-md-6">
                  <h1>Contact Us</h1>
                  <p class="lead">We value your feedback and are here to assist you. Please don't hesitate to get in touch with us if you have any questions, suggestions, or concerns. Our dedicated support team is ready to help!</p>
      
                  <h3>General Inquiries:</h3>
                    <p><i class="bi bi-envelope-fill px-3"></i>Email: info@knowyourneighborhood.com</p>
                    <p><i class="bi bi-telephone-fill px-3"></i>Phone: +1 (555) 123-4567</p>
      
                  <h3>Media Inquiries:</h3>
                    <p><i class="bi bi-envelope-fill px-3"></i>Email: press@knowyourneighborhood.com</p>
                    <p><i class="bi bi-telephone-fill px-3"></i>Phone: +1 (555) 987-6543</p>
      
                  <h3>Advertising and Partnership Opportunities:</h3>
                  <p><i class="bi bi-envelope-fill px-3"></i>Email: partnerships@knowyourneighborhood.com</p>
      
                  <h3>Customer Support:</h3>
                  <p><i class="bi bi-envelope-fill px-3"></i>Email: support@knowyourneighborhood.com</p>
      
                  <p>We aim to respond to all inquiries within 24-48 hours. Your satisfaction is important to us, and we appreciate your patience.</p>
      
                  <h3>Connect with us on social media:</h3>
                  <ul class="list-group list-group-horizontal px-4">
                    <li class="list-group-item fs-2"><a href="https://www.facebook.com/knowyourneighborhood"><i class="bi bi-facebook"></i></a></li>
                    <li class="list-group-item fs-2"><a href="https://twitter.com/knowyournhood"><i class="bi bi-twitter"></i></a></li>
                    <li class="list-group-item fs-2"><a href="https://www.instagram.com/knowyourneighborhood"><i class="bi bi-instagram"></i></a></li>
                  </ul>
                </div>
                <div class="col-md-6">
                  <img src="./assets/images/cont.jpg" alt="Call Us Yeah" class="img-fluid"/>
                </div>
              </div>
            </div>
          </section>
        )
    }

}

export default Contact