<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en"
      class="fixed js flexbox flexboxlegacy no-touch csstransforms csstransforms3d no-overflowscrolling sidebar-light no-mobile-device custom-scroll sidebar-left-collapsed">
<head>
    <meta charset="utf-8"/>
    <title>Green Garden</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link rel="shortcut icon" href="favicon.ico"/>

    <%@include file="./header.jsp" %>
    <link rel="stylesheet" href="/assets/cubeportfolio/css/cubeportfolio.min.css">
    <link rel='stylesheet' id='google_font_open_sans-css'  href='http://fonts.googleapis.com/css?family=Open+Sans%3A300italic%2C400italic%2C600italic%2C400%2C600%2C700&#038;ver=4.5.4' type='text/css' media='all' />
    <link rel='stylesheet' id='google_font_roboto-css'  href='http://fonts.googleapis.com/css?family=Roboto%3A500%2C400italic%2C700%2C900%2C500italic%2C400%2C300&#038;ver=4.5.4' type='text/css' media='all' />
    <link rel='stylesheet' id='google-fonts-style-css'  href='http://fonts.googleapis.com/css?family=Poppins%3A400%2C700%7CDroid+Serif%3A400%2C700&#038;ver=4.5.4' type='text/css' media='all' />
    <style>
        /*nav{*/
        /*height: 75px;*/
        /*}*/
        * {
            box-sizing: border-box
        }

        body {
            font-family: Verdana, sans-serif;
        }

        .mySlides {
            display: none
        }

        /* Slideshow container */
        .slideshow-container {
            max-width: 1000px;
            position: relative;
            margin: auto;
        }

        /* Caption text */
        .text {
            color: #f2f2f2;
            font-size: 15px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            text-align: center;
        }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        /* The dots/bullets/indicators */
        .dot {
            height: 13px;
            width: 13px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

        .active {
            background-color: #717171;
        }

        /* Fading animation */
        .fade {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 1.5s;
            animation-name: fade;
            animation-duration: 1.5s;
        }

        @-webkit-keyframes fade {
            from {
                opacity: .4
            }
            to {
                opacity: 1
            }
        }

        @keyframes fade {
            from {
                opacity: .4
            }
            to {
                opacity: 1
            }
        }

        /* On smaller screens, decrease text size */
        @media only screen and (max-width: 300px) {
            .text {
                font-size: 11px
            }
        }

        body {
            font-family: "Droid Serif";
            font-size: 16px;
            line-height: 24px;
            background-image: url("/images/background.jpg");
            background-position: center;
            background-repeat: no-repeat;
        }

        .cbp-item {
            height: 400px; /* your desire value */
        }

        .breadcrumb {
            font-size: 16px;
            text-transform: uppercase;

        }

        .breadcrumb a:hover {
            cursor: auto;

        }

        .breadcrumb a {
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 400;
            font-style: normal;
            color: #333333;
            font-size: 14px;

        }

        .uppercase {
            text-transform: uppercase;
        }

        .top-header {
            height: 30px;
            color: #fff;
            background-color: #222;
            padding-left: 15px;
        }

        .wrap {
            background: #fff;
        }
#weather, #datetime,#datetime1{
    display: inline-block;
    font-family: 'Open Sans', arial, sans-serif;
    font-size: 11px;
}
        #datetime1{
         text-decoration: none;
            cursor: auto;

        }
        .item-menu{
            list-style: none;
            float: left;
        }
        .item-menu a{
            padding: 0 14px;
            line-height: 48px;
            font-size: 14px;
            color: #000;
            font-weight: 700;
            text-transform: uppercase;
        }
        .item-menu a:hover{
            text-decoration: none;
        }

        li.item-menu a:after{

            background-color: transparent;
            content: "";
            width: 100%;
            height: 4px;
            position: absolute;
            bottom: 0;
            left: 0;
            -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
        }
        li.item-menu:hover > a:after {
            background-color: #35a533;
        }
        .menu-header{
            -webkit-box-shadow: 2px 2px 5px 0px rgba(50, 50, 50, 0.75);
            -moz-box-shadow:    2px 2px 5px 0px rgba(50, 50, 50, 0.75);
            box-shadow:         2px 2px 5px 0px rgba(50, 50, 50, 0.75);
        }


    </style>
</head>

<body>

<section class="body" >
    <div class="container">
        <div class="wrap">
            <div class="wrap-header">
        <div class="top-header">
            <div id="weather">
                Hanoi, Vietnam
            </div>
            <div id="datetime">
                Thứ Bảy, Tháng Mười Hai 17, 2016

            </div>
            <c:if test="${pageContext.request.userPrincipal.authenticated}">
                <div id="datetime1" class="pull-right" style="margin-right: 24px">
                <a href="/logout">Đăng xuất</a>
            </div>
                <div id="datetime1" class="pull-right" style="margin-right: 24px">
                    <a href="/admin/edit">Quản lý bài viết</a>
                </div>
            </c:if>
            <c:if test="${!pageContext.request.userPrincipal.authenticated}">



                <div id="datetime1" class="pull-right" style="margin-right: 24px">
                <a href="/login">Đăng nhập</a>
            </div>


            </c:if>


            
        </div>
<div class="menu-header" style="height: 52px">
<ul>
    <c:forEach items="${categories}" var="category">
        <li class="item-menu"><a href="/post/category/${category.id}"> ${category.name}</a></li>
        </c:forEach>
</ul>
    <form class="navbar-form navbar-right" action="/" method="post" style="margin-right: 20px">
    <div class="form-group">
    <input type="text" name="keyword" class="form-control" placeholder="Tìm bài viết">
    </div>
    <button type="submit" class="btn btn-default">Go</button>
    </form>
</div>
   <div class="logo" style="text-align: center; padding: 20px">
       <a href="/">
       <img style="width: 65%; height: 300px; margin: 0 auto" src="http://blog.saokim.com.vn/wp-content/uploads/2012/06/thiet-thuong-hieu-thoi-trang-tre-em.jpg" alt="">
       </a>
   </div>

            </div>


            <c:if test="${posts==null}">
                <h1 style="padding: 15px">${message}</h1>
            </c:if>
            <br><br><br>
            <div id="grid-container" style="padding: 0 24px">
                <c:forEach items="${posts}" var="post">
                    <div class="cbp-item">
                        <div class="cbp-caption">
                            <div class="cbp-caption-defaultWrap">
                                <div class="cbp-caption-defaultWrap">
                                    <img style="height: 300px"
                                         <c:if test="${post.imageURL!=null}">src="${post.imageURL}"</c:if>
                                    <c:if test="${post.imageURL==null}"> style="height: 300px"
                                         src="/images/default.jpg"</c:if> alt="custom alt 1" width="100%">
                                </div>
                            </div>
                            <%--<div class="cbp-caption-activeWrap">--%>
                                <%--<div class="cbp-l-caption-alignCenter">--%>
                                    <%--<div class="cbp-l-caption-body">--%>
                                        <%--<a href="/post/${post.id}"--%>
                                           <%--class="cbp-l-caption-buttonLeft btn red uppercase">Đọc--%>
                                            <%--thêm</a>--%>

                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        </div>
                        <div class="cbp-l-grid-projects-desc" style="color: #35a533;font-size: 12px;
    line-height: 20px;
    font-weight: 500;">${post.category.name}</div>
                        <div class="cbp-l-grid-projects-title" style="">
                       <a href="/post/${post.id}">   <h3 class="uppercase" style="color: #35a533;font-size: 20px; margin: 0;
    line-height: 20px;
    font-weight: 500;">${post.name}</h3></a>
                        </div>

                    </div>
                </c:forEach>
            </div>
        </div>
        </div>
    </div>

</section>

<%@include file="./footer.jsp" %>
<script type="text/javascript" src="/assets/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
<script>
    $(document).ready(function () {
        $('#grid-container').cubeportfolio('init', {
            layoutMode: 'grid',
//           defaultFilter: '*',
            animationType: 'quicksand',
            gapHorizontal: 35,
            gapVertical: 30,
            gridAdjustment: 'responsive',
            mediaQueries: [{
                width: 1500,
                cols: 5
            }, {
                width: 1100,
                cols: 5
            }, {
                width: 800,
                cols: 3
            }, {
                width: 480,
                cols: 2
            }, {
                width: 320,
                cols: 1
            }],
            caption: 'overlayBottomReveal',
            displayType: 'sequentially',
            displayTypeSpeed: 80,

            // singlePage popup
//           singlePageDelegate: '.cbp-singlePage',
//           singlePageDeeplinking: true,
//           singlePageStickyNavigation: true,
//           singlePageCounter: '<div class="cbp-popup-singlePage-counter">{{current}} of {{total}}</div>'
        });
//       $('#grid-container1').cubeportfolio('init',{
//           layoutMode:'slider',
//           showNavigation:true,
//           showPagination:true,
//           rewindNav:true,
//           auto:true,
//           autoTimeout:2000
//        });
    })
</script>
</body>

</html>