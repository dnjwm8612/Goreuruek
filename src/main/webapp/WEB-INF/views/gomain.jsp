<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/publicView/jstl.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Page Title -->
    <title>Goreureuk</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/logo/favicon.png" type="image/x-icon">

    <!-- CSS Files -->
    <link rel="stylesheet" href="${contextPath }/resources/assets/css/animate-3.7.0.css">
    <link rel="stylesheet" href="${contextPath }/resources/assets/css/font-awesome-4.7.0.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/assets/css/bootstrap-4.1.3.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/assets/css/owl-carousel.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/assets/css/jquery.datetimepicker.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/assets/css/style.css">
</head>
<body>
    <!-- Preloader Starts -->
    <div class="preloader">
        <div class="spinner"></div>
    </div>
    <!-- Preloader End -->

    <!-- Header Area Starts -->
	<header class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo-area">
                        <a href="${contextPath }/recipe/recipeList" style="color: #f15858"><img src="${contextPath }/resources/images/g-icon.png" alt="logo" style="width: 60px">꼬르륵</a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="custom-navbar">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>  
                    <div class="main-menu">
                        <ul>
                            <li class="active"><a href="about.html" style="color: #f15858">소개</a></li>
                            <li><a href="${contextPath }/recipe/recipeList" style="color: #f15858">먹스타</a></li>
                            <li><a href="${contextPath }/freeboard/freeboardList" style="color: #f15858">요리를 부탁해</a>
                                <ul class="sub-menu">
                                    <li><a href="blog-home.html">Blog Home</a></li>
                                    <li><a href="blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="${contextPath}/tip/getTipBoardList" style="color: #f15858">팁</a></li>
                            <li><a href="${contextPath}/qna/qnaMain" style="color: #f15858">공지사항</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Area End -->

    <!-- Banner Area Starts -->
    <section class="banner-area text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6>the most interesting recipe in the world</h6>
                    <h1>Discover the <span class="prime-color">flavors</span><br>  
                    <span class="style-change">of <span class="prime-color">Go</span>reureuk</span></h1>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Area End -->



    

    
<!-- Testimonial Area Starts -->
    <section class="testimonial-area section-padding4">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-top2 text-center">
                        <h3>Developer <span>says</span></h3>
                        <p><i>--</i></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="testimonial-slider owl-carousel">
                        <div class="single-slide d-sm-flex">
                            <div class="customer-img mr-4 mb-4 mb-sm-0">
                                <img src="${contextPath }/resources/assets/images/customer1.png" alt="">
                            </div>
                            <div class="customer-text">
                                <h5>김성빈</h5>
                                <span><i>Developer</i></span>
                                <p class="pt-3">aaaaa</p>
                            </div>
                        </div>
                        <div class="single-slide d-sm-flex">
                            <div class="customer-img mr-4 mb-4 mb-sm-0">
                                <img src="${contextPath }/resources/assets/images/customer2.png" alt="">
                            </div>
                            <div class="customer-text">
                                <h5>강대진</h5>
                                <span><i>Developer</i></span>
                                <p class="pt-3">bbbb</p>
                            </div>
                        </div>
                        <div class="single-slide d-sm-flex">
                            <div class="customer-img mr-4 mb-4 mb-sm-0">
                                <img src="${contextPath }/resources/assets/images/customer1.png" alt="">
                            </div>
                            <div class="customer-text">
                                <h5>김알찬</h5>
                                <span><i>Developer</i></span>
                                <p class="pt-3">ccccc</p>
                            </div>
                        </div>
                        <div class="single-slide d-sm-flex">
                            <div class="customer-img mr-4 mb-4 mb-sm-0">
                                <img src="${contextPath }/resources/assets/images/customer1.png" alt="">
                            </div>
                            <div class="customer-text">
                                <h5>노승철</h5>
                                <span><i>Developer</i></span>
                                <p class="pt-3">dddd</p>
                            </div>
                        </div>
                        <div class="single-slide d-sm-flex">
                            <div class="customer-img mr-4 mb-4 mb-sm-0">
                                <img src="${contextPath }/resources/assets/images/customer1.png" alt="">
                            </div>
                            <div class="customer-text">
                                <h5>윤병준</h5>
                                <span><i>Developer</i></span>
                                <p class="pt-3">eeeee</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial Area End -->


    


    <!-- Footer Area Starts -->
    <footer class="footer-area">
        <div class="footer-widget section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="single-widget single-widget1">
                            <a href="${contextPath }/recipe/recipeList"><img src="${contextPath }/resources/images/g-icon.png" alt="" style="width: 45px"></a>
                            <p class="mt-3" style="color: white">레시피</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="single-widget single-widget2 my-5 my-md-0">
                            <h5 class="mb-4">contact us</h5>
                            <div class="d-flex">
                                <div class="into-icon" style="color: white">
                                    <i class="fa fa-map-marker"></i>
                                </div>
                                <div class="info-text">
                                    <p style="color: white">ICIA 태승빌딩</p>
                                </div>
                            </div>
                            <div class="d-flex">
                                <div class="into-icon" style="color: white">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <div class="info-text">
                                    <p style="color: white">(123) 456 78 90</p>
                                </div>
                            </div>
                            <div class="d-flex">
                                <div class="into-icon" style="color: white">
                                    <i class="fa fa-envelope-o"></i>
                                </div>
                                <div class="info-text">
                                    <p style="color: white">test@test.com</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="single-widget single-widget3">
                            <h5 class="mb-4">opening hours</h5>
                            <p style="color: white">every day</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-6">
                        <span><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></span>
                    </div>
                    <div class="col-lg-5 col-md-6">
                        <div class="social-icons">
                            <ul>
                                <li class="no-margin">Follow Us</li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Area End -->


    <!-- Javascript -->
    <script src="${contextPath }/resources/assets/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="${contextPath }/resources/assets/js/vendor/bootstrap-4.1.3.min.js"></script>
    <script src="${contextPath }/resources/assets/js/vendor/wow.min.js"></script>
    <script src="${contextPath }/resources/assets/js/vendor/owl-carousel.min.js"></script>
    <script src="${contextPath }/resources/assets/js/vendor/jquery.datetimepicker.full.min.js"></script>
    <script src="${contextPath }/resources/assets/js/vendor/jquery.nice-select.min.js"></script>
    <script src="${contextPath }/resources/assets/js/main.js"></script>
</body>
</html>
