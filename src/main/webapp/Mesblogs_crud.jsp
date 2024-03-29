<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <style>
  .image-arrondie {
    border-radius: 10%; 
    overflow: hidden;
    width: 500px; /* Largeur souhaitée */
    height: auto; 
  }
</style>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <!-- nice select -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha256-mLBIhmBvigTFWPSCtvdu6a76T+3Xyt+K571hupeFLg4=" crossorigin="anonymous" />
  <!-- datepicker -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css">
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />

</head>

<body>

<%@ page import="java.util.concurrent.atomic.AtomicInteger" %>

<%
    // Récupérer la variable depuis la portée de la demande
    AtomicInteger counter = (AtomicInteger) request.getAttribute("counter");

    // Vérifier si la variable existe, sinon initialiser à zéro
    if (counter == null) {
        counter = new AtomicInteger(0);
    }

    // Incrémenter la variable
    int incrementedValue = counter.incrementAndGet();

    // Enregistrer la variable dans la portée de la demande
    request.setAttribute("counter", counter);
%>

  <div class="hero_area">

    <%@include file="navbar.jsp" %>
    
    </div>
    
    
    <%@ page import="java.util.*" %>
    
    
    <%@ page import="dao.blog" %>

   <div class="my-5 mx-5" >
    <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">title</th>
      <th scope="col">description</th>
      <th scope="col">created_at</th>
      <th scope="col">photo</th>
      <th scope="col">Update</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${liste}" var="li">
   
    <tr>
      <th scope="row"><p> <%= counter.incrementAndGet()-1 %></p></th>
      <td>${li.title}</td>
      <td>${fn:substring(li.description, 0,20)}...</td>
      <td>${li.created_at}</td>
      <td>  ${fn:substring(li.photo, 0,20)}... </td>
      <td>
      <form action="up_del" method="get">
                <input type="hidden" name="type" value="up" />
                <input type="hidden" name="id" value="${li.blog_id}" />
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
      </td>
      <td><form action="up_del" method="get">
                 <input type="hidden" name="type" value="del" />
                <input type="hidden" name="id" value="${li.blog_id}" />
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
            </td>
    </tr>
      </c:forEach>
  </tbody>
</table>


   
   </div>  
    
    
 <section class="info_section ">
          <div class="container">
            <div class="info_top">
              <div class="info_logo">
                <a href="">
                  <img src="pain.png" alt="" class="image-arrondie" >
                </a>
              </div>
             
            </div>
            <div class="info_bottom layout_padding2">
              <div class="row info_main_row">
                <div class="col-md-6 col-lg-3">
                  <h5>
                    Address
                  </h5>
                  <div class="info_contact">
                    <a href="">
                      <i class="fa fa-map-marker" aria-hidden="true"></i>
                      <span>
                        Location
                      </span>
                    </a>
                    <a href="">
                      <i class="fa fa-phone" aria-hidden="true"></i>
                      <span>
                        Call +01 1234567890
                      </span>
                    </a>
                    <a href="">
                      <i class="fa fa-envelope"></i>
                      <span>
                        demo@gmail.com
                      </span>
                    </a>
                  </div>
                  <div class="social_box">
                    <a href="">
                      <i class="fa fa-facebook" aria-hidden="true"></i>
                    </a>
                    <a href="">
                      <i class="fa fa-twitter" aria-hidden="true"></i>
                    </a>
                    <a href="">
                      <i class="fa fa-linkedin" aria-hidden="true"></i>
                    </a>
                    <a href="">
                      <i class="fa fa-instagram" aria-hidden="true"></i>
                    </a>
                  </div>
                </div>
                <div class="col-md-6 col-lg-3">
                  <div class="info_links">
                    <h5>
                      Useful link
                    </h5>
                    <div class="info_links_menu">
                      <a class="active" href="index.html">
                        Home
                      </a>
                      <a href="about.html">
                        About
                      </a>
                      <a href="treatment.html">
                        Treatment
                      </a>
                      <a href="doctor.html">
                        Doctors
                      </a>
                      <a href="testimonial.html">
                        Testimonial
                      </a>
                      <a href="contact.html">
                        Contact us
                      </a>
                    </div>
                  </div>
                </div>
                
               
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- end info_section -->
      
      
        <!-- footer section -->
        <footer class="footer_section">
          <div class="container">
            <p>
              &copy; <span id="displayYear"></span> All Rights Reserved By
              
            </p>
          </div>
        </footer>   
    
    
    
    </body>
    </html>