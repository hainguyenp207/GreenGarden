<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class='v2 index' dir='ltr' xmlns='http://www.w3.org/1999/xhtml' xmlns:b='http://www.google.com/2005/gml/b'
      xmlns:data='http://www.google.com/2005/gml/data' xmlns:expr='http://www.google.com/2005/gml/expr'>
<head>
    <meta content='width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1' name='viewport'/>
    <meta content='text/html;charset=UTF-8' http-equiv='Content-Type'/>
    <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'/>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type'/>
    <meta content='blogger' name='generator'/>
    <![endif]-->
    <meta content='http://gridz-themexpose.blogspot.com/' property='og:url'/>
    <meta content='Gridz Responsive Blogger Template' property='og:title'/>
    <meta content='' property='og:description'/>
    <!--[if IE]>
    <script> (function () {
        var html5 = ("abbr,article,aside,audio,canvas,datalist,details," + "figure,footer,header,hgroup,mark,menu,meter,nav,output," + "progress,section,time,video").split(',');
        for (var i = 0; i < html5.length; i++) {
            document.createElement(html5[i]);
        }
        try {
            document.execCommand('BackgroundImageCache', false, true);
        } catch (e) {
        }
    })(); </script> <![endif]-->
    <!-- SEO Meta Tag -->
    <meta content='Gridz Responsive Blogger Template' name='keywords'/>
    <!-- SEO Title Tag -->
    <title>
        Green Garden - Ươm mầm giấc mơ
    </title>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'/>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'/>
    <link href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet'/>
    <link type='text/css' rel='stylesheet'
          href='https://www.blogger.com/static/v1/widgets/178992763-css_bundle_v2.css'/>
    <link type='text/css' rel='stylesheet'
          href='https://www.blogger.com/dyn-css/authorization.css?targetBlogID=8716316713512045313&amp;zx=eb9f4983-611b-434e-8ce9-a6cf0a00fb40'/>


    <link rel="stylesheet" href="/css/style_custom.css">
    <!-- LOAD JQUERY -->
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js' type='text/javascript'></script>

    <script style='text/javascript'>
        //<![CDATA[
        function authorshow(data) {
            for (var i = 0; i < 1; i++) {
                var entry = data.feed.entry[i];
                var avtr = entry.author[0].gd$image.src;
                document.write('<img width="100" height="100" src="' + avtr + '"/>');
            }
        }
        //]]>
    </script>
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script> <![endif]-->
</head>
<body>

<!-- PRELOADER -->
<div id='preloader'>
    <div class='tb-cell'>
        <div class='page-loading'>
            <div class='item-icon'></div>
        </div>
    </div>
</div>
<!-- END / PRELOADER -->
<!-- PAGE WRAP -->
<div id='page-wrap'>
    <!-- NAVIGATION -->
    <div class='pi-navigation1'>
        <div class='container'>
            <div class='topnav section' id='topnav'>
                <div class='widget PageList' data-version='1' id='PageList1'>
                    <h2>Pages</h2>
                    <div class='widget-content navlist'>
                        <ul>
                            <li class='selected'><a href='/'>Home</a></li>
                            <c:if test="${pageContext.request.userPrincipal.authenticated}">
                                <li><a href='/logout'>Đăng xuất</a></li>
                                <li><a href='/admin/edit'>Quản lý bài viết</a></li>
                            </c:if>
                            <c:if test="${!pageContext.request.userPrincipal.authenticated}">
                                <li><a href='/login'>Đăng nhập</a></li>
                            </c:if>
                        </ul>
                        <div class='clear'></div>
                    </div>
                </div>
            </div>
            <div class='search-box'>
<span class='icon-search'>
<i class='fa fa-search'></i>
</span>
                <form action='/' method='post'>
                    <input name='keyword' type='search' value='Tìm kiếm hoạt động'/>
                </form>
            </div>
            <div class='share-box'>
                <a class='social-facebook' href='#' target='_blank'><i class='fa fa-facebook'></i></a>
                <a class='social-twitter' href='#' target='_blank'><i class='fa fa-twitter'></i></a>
                <a class='social-gplus' href='#' target='_blank'><i class='fa fa-google-plus'></i></a>
                <a class='social-linkedin' href='#' target='_blank'><i class='fa fa-linkedin'></i></a>
                <a class='social-pinterest' href='#' target='_blank'><i class='fa fa-pinterest'></i></a>
                <a class='social-youtube' href='#' target='_blank'><i class='fa fa-youtube'></i></a>
                <a class='social-vimeo' href='#' target='_blank'><i class='fa fa-vimeo-square'></i></a>
                <a class='social-instagram' href='#' target='_blank'><i class='fa fa-instagram'></i></a>
            </div>
        </div>
    </div>
    <!-- END / NAVIGATION -->
    <!-- HEADER -->
    <header class='header' id='header'>
        <div class='container'>
            <!-- LOGO -->
            <div class='logo text-center'>
                <div class='header section' id='header'>
                    <div class='widget Header' data-version='1' id='Header1'>
                        <div id='header-inner'>
                            <a href='http://gridz-themexpose.blogspot.com/' style='display: block'>
                                <img alt='GreenGarden' height='72px; ' id='Header1_headerimg'
                                     src='/images/logo.jpg'
                                     style='display: block' width='220px; '/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END / LOGO -->
        </div>
    </header>
    <nav class='pi-navigation' data-menu-responsive='992'>
        <div class='container'>
            <div class='open-menu'>
                <span class='item item-1'></span>
                <span class='item item-2'></span>
                <span class='item item-3'></span>
            </div>
            <div class='close-menu'></div>
            <ul class='navlist'>
                <c:forEach items="${categories}" var="category">
                    <li>
                        <a href="/post/category/${category.id}"> ${category.name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </nav>
    <!-- END / HEADER -->
    <!-- FEATURED -->
    <div class='featured' id='featured'>
        <script type='text/javascript'>
            var numposts = 6;
            var outerclass = "featured-slider";
            var starttag = "";
            var endtag = "";
            var intag = 'li';
        </script>
        <script>
            document.write("<script src=\"/feeds/posts/default/-/featured?max-results=" + numposts + "&orderby=published&alt=json-in-script&callback=labelthumbs\"><\/script>");
        </script>
    </div>
    <!-- END / FEATURED -->
    <!-- BLOG MAIN CONTENT -->
    <article class='blog-content blog-grid'>
        <div class='container'>
            <div class='row'>
                <!-- CONTENT -->
                <div class='col-md-9'>
                    <div class='content'>
                        <div class='main section' id='main'>
                            <div class='widget Blog' data-version='1' id='Blog1'>
                                <div class='post-wrapper'>
                                    <c:if test="${posts==null}">
                                        <h1 style="padding: 15px; text-align: center">${message}</h1>
                                    </c:if>
                                    <c:forEach items="${posts}" var="post">

                                    <div class='grid-item col-md-4'>

                                        <div class='post hentry' itemprop='blogPost' itemscope='itemscope'
                                             itemtype='http://schema.org/BlogPosting'>
                                            <div class='entry-content' id='post-body-202452633544924310'
                                                 itemprop='description articleBody'>
                                                <div class='post-media'>
                                                    <div class='image-wrap'>
                                                        <div class='mask'></div>
                                                        <img alt='${post.create_by}'
                                                             <c:if test="${post.imageURL!=null}">src="${post.imageURL}"</c:if>
                                                             <c:if test="${post.imageURL==null}">src="/images/default.jpg"</c:if>/>
                                                    </div>
                                                </div>
                                                <div class='post-body'>
                                                    <div class='post-author'>
                                                        <div class='image-thumb'>
                                                            <img alt='Post Author'
                                                                 <c:if test="${post.imageURL!=null}">src="${post.imageURL}"</c:if>
                                                                    <c:if test="${post.imageURL==null}">src="/images/default.jpg"</c:if> />
                                                        </div>
                                                        <div class='name-author'>
                                                            <cite>${post.create_by}</cite>
                                                        </div>
                                                    </div>
                                                    <div class='post-title'>
                                                        <h2>
                                                            <a href='/post/${post.id}'>
                                                                    ${post.name}</a></h2>
                                                    </div>
                                                    <div class='post-entry'>
                                                        <p> </p>
                                                    </div>
                                                    <div class='traingle'></div>
                                                    <div class='postfooter clearfix'>
                                                        <a href='/post/${post.id}'>
                                                            <div class='read'>
                                                                Đọc bài
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div style='clear: both;'></div>
                                            </div>
                                        </div>

                                    </div>
                                    </c:forEach>

                                </div>


                            </div>
                        </div>
                    </div>
                </div>
                <!-- END / CONTENT -->
                <!-- SIDEBAR -->
                <div class='col-md-3'>
                    <div class='sidebar section' id='sidebar'>
                        <div class='widget PopularPosts' data-version='1' id='PopularPosts1'>
                            <h2>Bài viết nổi bật</h2>
                            <div class='widget-content popular-posts'>
                                <ul>
                                    <c:if test="${viewTopPosts!=null}">
                                        <c:forEach items="${viewTopPosts}" var="viewPost">
                                            <li>
                                                <div class='item-thumbnail-only'>
                                                    <div class='item-thumbnail'>
                                                        <a href='' target='_blank'>
                                                            <img alt='' border='0'
                                                                 <c:if test="${post.imageURL!=null}">src="${post.imageURL}"</c:if>
                                                                    <c:if test="${post.imageURL==null}"> style="height: 300px"
                                                                        src="/images/default.jpg"</c:if>
                                                            />
                                                        </a>
                                                    </div>
                                                    <div class='item-title'>
                                                        <a href='/post/${viewPost.id}'>${viewPost.name}</a></div>
                                                </div>
                                                <div style='clear: both;'></div>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END / SIDEBAR -->
                <div class='clear'></div>
            </div>
        </div>
    </article>
    <!-- BLOG MAIN CONTENT -->
    <!-- FOOTER -->
    <footer class='footer' id='footer'>
        <div class='container'>
            <div class='row'>
                <!-- WIDGET NEWSLETTER -->
                <div class='col-md-4'>
                    <div class='footer-section section' id='footer1'>
                        <div class='widget PopularPosts' data-version='1' id='PopularPosts2'>
                            <h2>Bài viết nổi bật</h2>
                            <div class='widget-content popular-posts'>
                                <ul>
                                    <c:if test="${viewTopPosts!=null}">
                                        <c:forEach items="${viewTopPosts}" var="viewPost">

                                            <li>
                                                <div class='item-thumbnail-only'>
                                                    <div class='item-thumbnail'>
                                                        <a href='/post/${viewPost.id}' target='_blank'>
                                                            <img width="72" height="72" alt='' border='0'
                                                                 <c:if test="${post.imageURL!=null}">src="${post.imageURL}"</c:if>
                                                                    <c:if test="${post.imageURL==null}">
                                                                        src="/images/default.jpg"</c:if>
                                                            />
                                                        </a>
                                                    </div>
                                                    <div class='item-title'><a
                                                            href='/post/${viewPost.id}'>${viewPost.name}</a></div>
                                                </div>
                                                <div style='clear: both;'></div>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                </ul>
                                <div class='clear'></div>

                                <div class='clear'></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END / WIDGET NEWSLETTER -->
                <!-- WIDGET META -->
                <div class='col-md-4'>
                    <div class='footer-section section' id='footer2'>
                        <div class='widget Label' data-version='1' id='Label5'>
                            <h2>Từ khóa</h2>
                            <div class='widget-content cloud-label-widget-content'>
<span class='label-size label-size-5'>
<a dir='ltr' href='/'>Trẻ em</a>
</span>
                                <span class='label-size label-size-5'>
<a dir='ltr' href=''>Thủ đức</a>
</span>
                                <span class='label-size label-size-4'>
<a dir='ltr' href=''>Mẹ và bé</a>
</span>
                                </span>
                                <div class='clear'></div>

                                <div class='clear'></div>
                            </div>
                        </div>
                        <div class='widget HTML' data-version='1' id='HTML5'>
                            <div class='widget-content'>
                                <div class="flickr_plugin">
                                    <script src="http://www.flickr.com/badge_code_v2.gne?count=8&amp;display=latest&amp;size=s&amp;layout=x&amp;source=user&amp;user=58782395@N03"
                                            type="text/javascript"></script>
                                </div>
                            </div>
                            <div class='clear'></div>

                        </div>
                    </div>
                </div>
                <!-- END / WIDGET META -->
                <!-- WIDGET TWITTER -->
                <div class='col-md-4'>
                    <div class='footer-section section' id='footer3'>
                        <div class='widget BlogArchive' data-version='1' id='BlogArchive1'>
                            <h2>Chuyên mục</h2>
                            <div class='widget-content'>
                                <div id='ArchiveList'>
                                    <div id='BlogArchive1_ArchiveList'>
                                        <ul class='flat'>
                                            <c:forEach items="${categories}" var="category">
                                                <li class='archivedate'>
                                                    <a href='/post/category/${category.id}'>${category.name}</a>

                                                </li>
                                            </c:forEach>

                                        </ul>
                                    </div>
                                </div>
                                <div class='clear'></div>
                                <span class='widget-item-control'>
<span class='item-control blog-admin'>
<a class='quickedit'
   href='//www.blogger.com/rearrange?blogID=8716316713512045313&widgetType=BlogArchive&widgetId=BlogArchive1&action=editWidget&sectionId=footer3'
   onclick='return _WidgetManager._PopupConfig(document.getElementById("BlogArchive1"));' target='configBlogArchive1'
   title='Edit'>
<img alt='' height='18' src='https://resources.blogblog.com/img/icon18_wrench_allbkg.png' width='18'/>
</a>
</span>
</span>
                                <div class='clear'></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END / WIDGET TWITTER -->
                <!-- END / WIDGET ARCHIVES -->
                <div class='clear'></div>
            </div>
        </div>
        <div class='copyright text-center'>
            <div class='container'>
                <div class='footer-left'>
                    Copyright &#169; 2016
                    <a href='/'>
                        FIT HCMUTE
                    </a>
                </div>
            </div>
            <div class='totop'>
                <div class='totop-inner'>
                    <i class='fa fa-angle-up'></i>
                </div>
            </div>
        </div>
    </footer>
    <!-- END / FOOTER -->
</div>
<!-- END / PAGE WRAP -->
<script type='text/javascript'>
    //<![CDATA[

    var pageCount = 9;
    var displayPageNum = 3;
    var upPageWord = "<i class='fa fa-angle-left'></i>";
    var downPageWord = "<i class='fa fa-angle-right'></i>";


    //]]>
</script>
<script class='java' type='text/javascript'>
    //<![CDATA[
    $(document).ready(function () {
        $('.entry-content .post-media .image-wrap img').each(function () {
            this.src = this.src.replace('/s72-c/', '/s420-p/');
        });
    });
    //]]>
</script>
<script class='java' type='text/javascript'>
    //<![CDATA[
    $(document).ready(function () {
        $(window).scroll(function () {
            $(this).scrollTop() ? $(".totop").fadeIn() : $(".totop").fadeOut()
        }), $(".totop").click(function () {
            $("html,body").animate({
                scrollTop: 0
            }, 500)
        });
        var n = window.location.href;
        $(".navlist li a,.navlist li ul li ul li a").filter(function () {
            return $(this).prop("href") === n
        }).parent("li").addClass("current-menu-parent");
        var l = window.location.href;
        $(".navlist li ul li a,.navlist li ul li a").filter(function () {
            return $(this).prop("href") === l
        }).parents("li").parents("ul").parent().addClass("current-menu-parent"), $(".navlist ul").parent().addClass("menu-item-has-children item-plus")
    });
    !function (e) {
        "use strict";

        function i() {
            e(".blog-grid").length && setTimeout(function () {
                e(".blog-grid .post-wrapper").masonry({
                    columnWidth: ".grid-item",
                    itemSelector: ".grid-item"
                })
            }, 1)
        }

        function t() {
            var i = e('input[type="search"], input[type="text"], input[type="email"], textarea');
            i.each(function () {
                var i = e(this),
                    t = i.val();
                i.focus(function () {
                    e(this).val() === t && e(this).val("")
                }), i.blur(function () {
                    "" === e(this).val() && e(this).val(t)
                })
            })
        }

        function a() {
            if (e(".blog-timeline").length) {
                var i = e(window).scrollTop(),
                    t = e(window).height(),
                    a = e(".blog-timeline .content").offset().top,
                    n = i - a;
                e(".pi-line").css({
                    top: "0",
                    "-webkit-transform": "translateY(" + n + "px)",
                    "-o-transform": "translateY(" + n + "px)",
                    "-ms-transform": "translateY(" + n + "px)",
                    "-moz-transform": "translateY(" + n + "px)",
                    transform: "translateY(" + n + "px)"
                }), e(".blog-timeline .post-meta").each(function () {
                    var a = e(this),
                        n = a.offset().top,
                        s = n - t / 2;
                    i >= s ? a.addClass("metaLight") : a.removeClass("metaLight")
                })
            }
        }

        function n() {
            e().tweet && e(".latest-tweets").each(function () {
                var i = e(".latest-tweets");
                i.tweet({
                    username: i.data("username"),
                    join_text: "auto",
                    avatar_size: null,
                    count: i.data("number"),
                    template: "{text}",
                    loading_text: "loading tweets...",
                    modpath: i.data("modpath"),
                    callback: d
                })
            })
        }

        function s() {
            var i = e(".pi-navigation"),
                t = e("#header").offset().top + e("#header").outerHeight() - 52,
                a = e(window).scrollTop();
            a >= t ? i.addClass("nav-fixed") : i.removeClass("nav-fixed")
        }

        var o = {
                Android: function () {
                    return navigator.userAgent.match(/Android/i)
                },
                BlackBerry: function () {
                    return navigator.userAgent.match(/BlackBerry/i)
                },
                iOS: function () {
                    return navigator.userAgent.match(/iPhone|iPad|iPod/i)
                },
                Opera: function () {
                    return navigator.userAgent.match(/Opera Mini/i)
                },
                Windows: function () {
                    return navigator.userAgent.match(/IEMobile/i)
                },
                any: function () {
                    return o.Android() || o.BlackBerry() || o.iOS() || o.Opera() || o.Windows()
                }
            },
            r = (window.innerWidth, e(window).height(), ['<i class="fa fa-caret-left"></i>', '<i class="fa fa-caret-right"></i>']),
            l = function () {
                var i = e(".post-slider");
                i.length > 0 && i.owlCarousel({
                    autoPlay: !1,
                    slideSpeed: 300,
                    navigation: !0,
                    pagination: !1,
                    singleItem: !0,
                    autoHeight: !0,
                    navigationText: r
                })
            },
            c = function () {
                var i = e(".featured-slider");
                i.length > 0 && i.owlCarousel({
                    autoPlay: 2e4,
                    slideSpeed: 300,
                    navigation: !0,
                    pagination: !1,
                    items: 5,
                    loop: true,
                    itemsCustom: [
                        [0, 1],
                        [500, 2],
                        [992, 3],
                        [1200, 3],
                        [1400, 4]
                    ],
                    navigationText: r,
                })
            },
            u = {
                obj: {
                    subscribeEmail: e("#subscribe-email"),
                    subscribeButton: e("#subscribe-button"),
                    subscribeMsg: e("#subscribe-form .subscribe-status"),
                    subscribeContent: e("#subscribe-form .form-remove"),
                    dataMailchimp: e("#subscribe-form").attr("data-mailchimp"),
                    success_message: "Thank you for joining our mailing list. Please check your email for a confirmation link.",
                    failure_message: "There was a problem processing your submission.",
                    noticeError: "{msg}",
                    noticeInfo: "{msg}",
                    basicAction: "mail/subscribe.php",
                    mailChimpAction: "mail/subscribe-mailchimp.php"
                },
                eventLoad: function () {
                    var i = u.obj;
                    e(i.subscribeButton).on("click", function () {
                        if ("" != i.subscribeEmail.val()) {
                            if (window.ajaxCalling) return;
                            var e = "true" === i.dataMailchimp;
                            u.ajaxCall(e ? i.mailChimpAction : i.basicAction)
                        } else i.subscribeMsg.html("Email is required.").fadeIn("slow");
                        return !1
                    })
                },
                ajaxCall: function (i) {
                    window.ajaxCalling = !0;
                    var t = u.obj,
                        a = t.subscribeMsg.html("").hide();
                    t.subscribeButton.val("Sending"), e.ajax({
                        url: i,
                        type: "POST",
                        dataType: "json",
                        data: {
                            subscribeEmail: t.subscribeEmail.val()
                        },
                        success: function (e) {
                            if (e.status) t.subscribeContent.fadeOut(500, function () {
                                a.html(t.success_message).fadeIn(500)
                            });
                            else {
                                switch (e.msg) {
                                    case "email-required":
                                        a.html(t.noticeError.replace("{msg}", "Email is required."));
                                        break;
                                    case "email-err":
                                        a.html(t.noticeError.replace("{msg}", "Email invalid."));
                                        break;
                                    case "duplicate":
                                        a.html(t.noticeError.replace("{msg}", "Email is duplicate."));
                                        break;
                                    case "filewrite":
                                        a.html(t.noticeInfo.replace("{msg}", "Mail list file is open."));
                                        break;
                                    case "undefined":
                                        a.html(t.noticeInfo.replace("{msg}", "undefined error."));
                                        break;
                                    case "not-support":
                                        a.html(t.noticeInfo.replace("{msg}", "Your host do not support php mail function."));
                                        break;
                                    case "api-error":
                                        t.subscribeContent.fadeOut(500, function () {
                                            a.html(t.failure_message)
                                        })
                                }
                                t.subscribeButton.val("Send"), a.fadeIn(500)
                            }
                        },
                        error: function () {
                            alert("Connection error")
                        },
                        complete: function () {
                            window.ajaxCalling = !1
                        }
                    })
                }
            },
            d = function () {
                e(".twitter-slider").owlCarousel({
                    autoPlay: !1,
                    slideSpeed: 300,
                    navigation: !0,
                    pagination: !1,
                    singleItem: !0,
                    autoHeight: !0,
                    transitionStyle: "fade",
                    navigationText: ['<i class="fa fa-caret-left"></i>', '<i class="fa fa-caret-right"></i>']
                })
            };
        e(document).ready(function () {
            u.eventLoad(), o.any() && e("html").addClass("ismobile"), e(document).on("click", ".share-toggle", function () {
                var i = e(this);
                i.toggleClass("toggle-active"), i.siblings(".share").toggleClass("share-active")
            }), e(".search-box .icon-search").on("click", function () {
                e(this).toggleClass("active"), e('.search-box input[type="search"]').toggleClass("fadein")
            }), e("html").on("click", function () {
                e(".search-box .icon-search").removeClass("active"), e('.search-box input[type="search"]').removeClass("fadein")
            }), e(".search-box").on("click", function (e) {
                e.stopPropagation()
            }), e(".pi-line").height(e(window).height() / 2), e(window).scroll(function () {
                a(), s()
            })
        }), e(window).on("load resize", function () {
            var i = e(".sidebar-right"),
                t = e(".sidebar-left");
            i.closest(".blog-standard").find(".content").css("margin-right", "100px"), t.closest(".blog-standard").find(".content").css({
                "margin-left": "30px",
                "margin-right": "70px"
            }), i.closest(".blog-grid, .blog-list, .blog-timeline").find(".content").css("margin-right", "30px"), t.closest(".blog-grid, .blog-list, .blog-timeline").find(".content").css("margin-left", "30px"), t.closest(".blog-content").find(".col-md-9").addClass("col-md-push-3"), t.closest(".blog-content").find(".col-md-3").addClass("col-md-pull-9"), e(".blog-standard .post").each(function () {
                var i = e(this),
                    t = i.find(".post-meta"),
                    a = i.find(".post-title"),
                    n = i.find(".post-media");
                t.insertAfter(window.innerWidth < 992 ? a : n)
            }), e(".blog-list .post").each(function () {
                {
                    var i = e(this),
                        t = i.find(".post-meta"),
                        a = i.find(".post-title"),
                        n = i.find(".post-author");
                    i.find(".post-media")
                }
                n.insertAfter(t.children().first()), t.insertAfter(a)
            }), e(".pi-navigation").each(function () {
                var i = e(this),
                    t = i.find(".open-menu"),
                    a = i.find(".close-menu"),
                    n = i.find(".navlist"),
                    s = i.find(".sub-menu"),
                    o = e("#header"),
                    r = window.innerWidth,
                    l = e(window).height(),
                    c = i.data("menu-responsive");
                c > r ? (t.show(), o.addClass("header-responsive"), n.addClass("off-canvas").css("height", l - 52), n.children(".menu-item-has-children").removeClass("item-plus"), 0 === i.find(".submenu-toggle").length && (e(".menu-item-has-children, .navList > .menu-item-language-current").children("a").after('<span class="submenu-toggle"><i class="fa fa-angle-right"></i></span>'), n.on("click", ".submenu-toggle", function (i) {
                        i.preventDefault(), e(this).siblings(".sub-menu").addClass("sub-menu-active")
                    })), s.each(function () {
                        var t = e(this);
                        0 === t.find(".back-mb").length && t.prepend('<li class="back-mb"><a href="#">Back</a></li>'), i.on("click", ".back-mb a", function (i) {
                            i.preventDefault(), e(this).parent().parent().removeClass("sub-menu-active")
                        })
                    }), t.on("click", function () {
                        n.addClass("off-canvas-active"), e(this).addClass("toggle-active"), a.show()
                    }), a.on("click", function () {
                        n.removeClass("off-canvas-active"), t.removeClass("toggle-active"), e(".sub-menu").removeClass("sub-menu-active"), e(this).hide()
                    }), e("html").on("click", function () {
                        n.removeClass("off-canvas-active"), t.removeClass("toggle-active"), e(".sub-menu").removeClass("sub-menu-active"), a.hide()
                    }), i.on("click", function (e) {
                        e.stopPropagation()
                    })) : (t.hide(), o.removeClass("header-responsive"), n.removeClass("off-canvas").css("height", "auto"), n.children(".menu-item-has-children").addClass("item-plus"), e(".back-mb, .submenu-toggle").remove())
            })
        }), e(window).load(function () {
            e("#preloader").fadeOut(1e3), n(), i(), t(), l(), c()
        })
    }(jQuery);

    //]]>
</script>
<script type='text/javascript'>
    //<![CDATA[
    $(document).ready(function () {
        $(".fancybox").fancybox();
    });
    //]]>
</script>
<script>
    $(document).ready(function () {
        $(".widget h2").wrapInner("<span></span>");
    });
</script>

<script type="text/javascript" src="https://www.blogger.com/static/v1/widgets/803954089-widgets.js"></script>

</body>
<script class='java' type='text/javascript'>
    //<![CDATA[
    $(window).load(function () {
        $('.java').remove();
    });
    //]]>
</script>
</html>