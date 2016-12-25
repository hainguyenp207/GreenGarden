<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<!DOCTYPE html>
<html lang="en"
      class="fixed js flexbox flexboxlegacy no-touch csstransforms csstransforms3d no-overflowscrolling sidebar-light no-mobile-device custom-scroll sidebar-left-collapsed">
<head>
    <meta charset="utf-8"/>
    <title>HCMUTE - INFORMATION TECHNOLOGY</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@include file="./header.jsp" %>
    <script src="../../assets/ckeditor/ckeditor.js"></script>
    <link rel="shortcut icon" href="favicon.ico"/>
    <style>
        .category{
            font-family: "Roboto Condensed";
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 400;
            font-style: normal;
            color: #ec407a;
            font-size: 10px;
        }
        .category a{
            color: #e65100;
        }
    </style>
</head>
<body>
<section class="body">
    <c:if test="${userInfo !=null}">
        <%@include file="./page-navbar.jsp" %>
        </br>
        </br>
        </br>
    </c:if>
    <c:if test="${userInfo ==null}">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">GreenGarden</a>
            <form class="navbar-form navbar-right" action="/" method="post">
                <div class="form-group">
                    <input type="text" name="keyword" class="form-control" placeholder="Nhập từ khóa">
                </div>
                <button type="submit" class="btn btn-default">Tìm kiếm</button>
            </form>

        </div><!--/.container-fluid -->
    </nav>
    </c:if>

    <section role="main" class="content-body">
        <!-- start: page -->
        <div class="row">

            <div class="col-md-9">
                <c:if test="${post==null}">
                    <h3>Bài viết không tồn tại</h3>
                </c:if>
                <c:if test="${post!=null}">
                <section class="panel">
                    <header class="panel-heading">
                        <h1 class="panel-title"><b>${post.name}</b></h1>
                    </header>
                    <div class="panel-body">

                        <div class="row">
                            <div class="col-sm-12">
                                <div style="padding: 24px">
                               ${post.description}
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                </c:if>
            </div>
            <div class="col-md-3">
                <div class="row">
                    <section class="panel">
                        <header class="panel-heading">
                            <h2 class="panel-title">Bài viết mới</h2>
                        </header>
                        <div class="panel-body">
                            <c:if test="${newPosts==null}">
                                <h2>Không có bài viết mới</h2>
                            </c:if>
                            <c:if test="${newPosts!=null}">
                                <c:forEach items="${newPosts}" var="newPost">
                            <div class="row">
                                <div class="col-md-3 col-sm-4">
                                    <img src="${newPost.imageURL}" width="80" height="80">
                                </div>
                                <div class="col-md-8 col-sm-7">
                                    <div class="row category">
                                        <a href="/post/category/${newPost.category.id}">${newPost.category.name}</a>
                                    </div>
                                    <div class="row">
                                        <a href="/post/${newPost.id}"><h4>${newPost.name}</h4></a>
                                    </div>
                                </div>
                            </div>
                            <br>
                                </c:forEach>
                            </c:if>

                        </div>
                    </section>
                </div>
                <div class="row">
                    <section class="panel">
                        <header class="panel-heading">
                            <h2 class="panel-title">Bài viết nổi bật</h2>
                        </header>
                        <div class="panel-body">
                            <c:if test="${viewTopPosts==null}">
                                <h2>Không có bài viết</h2>
                            </c:if>
                            <c:if test="${viewTopPosts!=null}">
                                <c:forEach items="${viewTopPosts}" var="viewPost">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-4">
                                            <img src="/images/default.jpg" width="80" height="80">
                                        </div>
                                        <div class="col-md-8 col-sm-7">
                                            <div class="row category">
                                                <a href="/post/category/${viewPost.category.id}">${viewPost.category.name}</a>
                                            </div>
                                            <div class="row">
                                                <a href="/post/${viewPost.id}"><h4>${viewPost.name}</h4></a>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                </c:forEach>
                            </c:if>
                        </div>

                    </section>
                </div>

            </div>


        </div>
        <!-- end: page -->
    </section>


</section>
<%@include file="./footer.jsp" %>
</body>
</html>