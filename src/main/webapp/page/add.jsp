
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<!DOCTYPE html>
<html lang="en" class="fixed js flexbox flexboxlegacy no-touch csstransforms csstransforms3d no-overflowscrolling sidebar-light no-mobile-device custom-scroll sidebar-left-collapsed">
<head>
    <meta charset="utf-8"/>
    <title>HCMUTE - INFORMATION TECHNOLOGY</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@include file="./header.jsp"%>
    <script src="../../assets/ckeditor/ckeditor.js"></script>
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<body>
<section class="body">

<%@include file="./page-navbar.jsp" %>
    <div class="inner-wrapper">

        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Quản lý bài viết</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="/">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Quản lý bài viết</span></li>
                    </ol>

                    <a class="sidebar-right-toggle"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <!-- start: page -->
            <div class="row">
                <form action="/admin/post/add" method="post" enctype="multipart/form-data">
                <div class="col-md-9">
                    <section class="panel">
                        <header class="panel-heading">
                            <h2 class="panel-title">Thêm bài viết</h2>
                        </header>
                        <div class="panel-body">
                            <c:if test="${status == 'success'}">
                                <div class="alert alert-success">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <strong>Thành công!</strong> ${message}.
                                </div>
                            </c:if>
                            <c:if test="${status == 'fail'}">
                                <div class="alert alert-danger">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <strong>Lỗi!</strong> ${message}.
                                </div>
                            </c:if>

                            <div class="row">
                                <div class="col-sm-12">
                                        <div class="form-group">
                                            <label class="col-md-1 control-label" for="name">Tên</label>
                                            <div class="col-md-9">
                                                <input type="text" name="name" placeholder="Tên tiêu đề bài viết ở đây." class="form-control" id="name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-1 control-label" for="name">Nội dung</label>
                                            <div class="col-md-9">
                                                <textarea maxlength="5000" name="description" id="editor"></textarea>
                                            </div>
                                        </div>
                                    <%--<input type="hidden" id="id">--%>

                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-md-3">
                    <div class="row">
                        <section class="panel">
                            <div class="panel-body">
                                <button id="addPost" type="submit" class="btn btn-primary">Đăng bài viết</button>
                            </div>
                        </section>
                    </div>
                    <div class="row">
                    <section class="panel">
                        <header class="panel-heading">
                            <h2 class="panel-title">Chọn chuyên mục</h2>
                        </header>
                        <div class="panel-body">
                            <select multiple="" name="category_id" class="form-control">
                                <c:forEach items="${categories}" var="category">
                                <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </section>
                    </div>
                    <div class="row">
                    <section class="panel">
                        <header class="panel-heading">
                            <h2 class="panel-title">Chọn ảnh đại diện</h2>
                        </header>
                        <div class="panel-body">
                            <input type="hidden" name="location" class="form-control" id="url" >
                            <img id="img" src="${post.imageURL}" width="200" height="200">
                            <input type="file" name="file" id="imgInp" class="btn btn-default"  value="Upload ảnh">
                        </div>

                    </section>
                    </div>
                </div>

                </form>
            </div>
            <!-- end: page -->
        </section>
    </div>

    <ckeditor:replace replace="editor" basePath="../../ckeditor/" />

</section>
<%@include file="./footer.jsp"%>
<script>
    $(document).ready(function () {
        $('#img').hide();

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#img').attr('src', e.target.result);
                    $('#img').show();
                }

                reader.readAsDataURL(input.files[0]);
            }
        };

        $("#imgInp").change(function(){
            readURL(this);
        });
    })

</script>
</body>
</html>