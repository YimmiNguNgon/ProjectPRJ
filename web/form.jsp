<%-- 
    Document   : form
    Created on : Oct 21, 2024, 9:32:06 AM
    Author     : Huy
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HDH.CODE</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="<%= request.getContextPath() %>/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" style="color: #001C66">HDH.CODE</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">ALL COURSE</a></li>
                </ul>

            </div>
        </div>
    </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">HDH.CODE</h1>
                </div>
            </div>
        </header>
        <!-- Section-->
        
        <div class="info" style="text-align: center; justify-content: space-around; margin-top: 20px; color: #001B64; font-style: inherit; margin-bottom: 0px">
        <h1 style="font-size: 50px;">HDH.CODE - Become A Better Developer</h1> <!-- Chỉnh font-size cho h1 -->
        <h2 style="font-size: 18px; font-style: italic;">HDH.CODE is a provider of high quality programming courses with the biggest goal of helping IT students develop their knowledge and career !</h2> <!-- Chỉnh font-size cho h2 -->
        <img src="<%= request.getContextPath() %>/img/lotrinh.png" alt="learning path" width="750" height="380">
        </div>
        
        <h1 style="text-align: center; justify-content: space-around;
            margin-top: 80px; color: #001B64">FEARTURED COURSE AT HDH.CODE</h1>
            <section class="py-5" style="margin-top: -100px">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <!-- Product 1 -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="/ProjectPrj-01/img/fullstack.png" alt="learning path" width="280" height="155">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name -->
                                    <h5 class="fw-bolder">FullStack NodeJS</h5>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <span class="text-muted text-decoration-line-through">13.000.000đ</span>
                                    5.800.000đ
                                </div>
                            </div>
                            <!-- Product actions -->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="/ProjectPrj-01/img/c++basic.png" alt="learning path" width="280" height="155">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name -->
                                    <h5 class="fw-bolder">Basic to Advanced C++</h5>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price -->
                                    <span class="text-muted text-decoration-line-through">4.800.000đ</span>
                                    2.600.000đ
                                </div>
                            </div>
                            <!-- Product actions -->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="/ProjectPrj-01/img/javawebbackend.png" alt="learning path" width="280" height="155">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name -->
                                    <h5 class="fw-bolder">Java Back-end Programming</h5>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price -->
                                    <span class="text-muted text-decoration-line-through">14.000.000đ</span>
                                    7.000.000đ
                                </div>
                            </div>
                            <!-- Product actions -->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img src="/ProjectPrj-01/img/dataal.png" alt="learning path" width="280" height="155">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name -->
                                    <h5 class="fw-bolder">Data Structures and Algorithms</h5>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price -->
                                    <span class="text-muted text-decoration-line-through">6.000.000đ</span>
                                    2.950.000đ
                                </div>
                            </div>
                            <!-- Product actions -->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <!-- Add more products similarly -->
                </div>
            </div>
        </section>
        
        <!-- about hdh.code-->
        <div class="about-section">
            <div class="container">
                <div class="row align-items-center">
                    <!-- Image Section -->
                    <div class="col-md-6 text-center">
                        <img src="img\ngdeokinh.png" alt="Image" class="about-image">
                    </div>
                    <!-- Text Section -->
                    <div class="col-md-6">
                        <h2 class="about-title">About HDH.CODE</h2>
                        <p class="about-description">
                            HDH.CODE is a team of Programmers currently working in many different fields but sharing a common passion for teaching and sharing knowledge.
                        </p>
                        <p class="about-description">
                            HDH.CODE always trying to innovate, hone skills, accept contributions, and overcome bad points to bring students programming courses of the highest quality.
                        </p>
                        <ul class="about-benefits">
                            <li>🎓 Experienced instructors</li>
                            <li>📚 Quality lectures and exercises</li>
                        </ul>
                        <a href="#" class="course-link">LIST COURSE➔</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="about-section" style="margin-top: 100px">
            <div class="container">
                <div class="row align-items-center">
                    <!-- Image Section -->
                    <div class="col-md-6 text-center">
                        <img src="img\ngngoi.png" alt="Student Thinking" class="thinking-image">
                    </div>
                    <!-- Text Section -->
                    <div class="col-md-6">
                        <h2 class="why-title">Why should you study with HDH.CODE</h2>
                        <div class="row align-items-center-benefit">
                        <div class="col-md-4 text-center-align-items-benefit">
                            <div class="benefit-icon">
                                <img src="img\logo1.png" alt="Chất lượng cao">
                            </div>
                            <div class="benefit-content">
                                <h4>High quality</h4>
                                <p>The content of the course is invested in both quality and quantity, the teachers are experienced and extremely dedicated to teaching.</p>
                            </div>
                        </div>
                        <div class="col-md-4 text-center-align-items-benefit">
                            <div class="benefit-icon">
                                <img src="img\logo2.png" alt="Kỹ năng quan trọng">
                            </div>
                            <div class="benefit-content">
                                <h4>Provides many important skills</h4>
                                <p>The course provides programming techniques, logical thinking, problem solving, algorithms... Skills that will follow you forever in your future studies and work.</p>
                            </div>
                        </div>
                        <div class="col-md-4 text-center-align-items-benefit"> 
                            <div class="benefit-icon">
                                <img src="img\logo3.png" alt="Lập trình viên chuyên nghiệp">
                            </div>
                            <div class="benefit-content">
                                <h4>Solid preparation steps for a programmer</h4>
                                <p>Programming techniques are the first skills to learn when you want to become a programmer. Learning programming techniques well will be a solid stepping stone for your career.</p>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
            <div class="row align-items-center-feedback">
                    <h1 style="text-align: center; justify-content: space-around;
                    margin-top: 80px; color: #001B64" >Student Testimonials</h1>
                    <div class="col-md-4 text-center-feedback">
                        <h3>Truong Xuan Giang (C/C++)</h3>
                        <p>“Excellent teaching quality, enthusiastic lecturers and teaching assistants...”</p>
                        <p class="rating">★★★★★</p>
                    </div>
                    
                    <div class="col-md-4 text-center-feedback">
                        <h3>Tran Nhat Nam (C/C++)</h3>
                        <p>“The course is so great, so quality, so wonderful. Super cute and funny instructor. always support students”</p>
                        <p class="rating">★★★★★</p>
                    </div>
                    
                    <div class="col-md-4 text-center-feedback">
                        <h3>Ha Duc Huy (C/C++)</h3>
                        <p>“The quality of teaching is really good, exercises are full of all types from basic to advanced”</p>
                        <p class="rating">★★★★★</p>
                    </div>
            </div>
                
        <jsp:include page="footer.jsp" ></jsp:include>
    </body>
</html>