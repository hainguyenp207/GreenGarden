<%@ page language="java" contentType="text/html; charset=UTF-8"
                pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en" class="fixed js flexbox flexboxlegacy no-touch csstransforms csstransforms3d no-overflowscrolling sidebar-light no-mobile-device custom-scroll sidebar-left-collapsed">
<head>
    <meta charset="utf-8"/>
    <title>HCMUTE - INFORMATION TECHNOLOGY</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <link rel="shortcut icon" href="favicon.ico"/>
    <%@include file="./header.jsp" %>
</head>
<body>
<section class="body">

    <!-- start: header -->
    <%@include file="./page-navbar.jsp" %>
    <!-- end: header -->
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
                <div class="col-md-4 col-lg-4 col-xl-4">
                    <section class="panel">
                        <header class="panel-heading">
                            <h2 class="panel-title">Thêm chuyên mục</h2>
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
                                    <form class="form-horizontal" method="get">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label" for="name">Tên</label>
                                            <div class="col-md-8">
                                                <input type="text" name="name" placeholder="Tên riêng sẽ hiển thị trên trang mạng của bạn." class="form-control" id="name">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-2 control-label" for="description">Mô tả</label>
                                            <div class="col-md-8">
                                                <textarea class="form-control" row="6" id="description" name="description" placeholder="Mô tả chuyên mục"></textarea>
                                            </div>
                                        </div>
                                        <input type="hidden" id="id">
                                    </form>

                                </div>
                            </div>

                        </div>
                        <footer class="panel-footer">
                            <button id="addCategory" class="btn btn-primary">Thêm chuyên mục</button>
                            <button id="editCategory" hidden class="btn btn-primary">Sửa chuyên mục</button>
                            <button id="cancelCategory" hidden  class="btn btn-primary">Bỏ qua</button>
                        </footer>
                    </section>
                </div>
                <div class="col-md-8 col-lg-8 col-xl-8">
                    <section class="panel">
                        <header class="panel-heading">
                            <h2 class="panel-title">Danh sách chuyên mục</h2>
                        </header>
                        <div class="panel-body">

                        <table id="categoryTable" class="table table-bordered table-striped mb-none dataTable no-footer">
                            <thead>
                            <tr>
                            <th>STT</th>
                            <th>Tên</th>
                            <th>Mô tả</th>
                            <th>Số bài viết</th>
                            <th>Hành động</th>
                            </tr>
                            </thead>
                        </table>
                        </div>
                    </section>
                </div>

            </div>
            <!-- end: page -->
        </section>
    </div>

</section>
<div class="modal fade in" id="delmodal" tabindex="-1" role="basic" aria-hidden="true"
     style="display: none; padding-right: 15px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <header class="panel-heading">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h2 class="panel-title">Bạn có muốn xóa không?</h2>
            </header>
            <div class="panel-body">
                <div class="modal-wrapper">
                    <div class="modal-icon">
                        <i class="fa fa-question-circle"></i>
                    </div>
                    <div class="modal-text">
                        <p>Bạn có muốn xóa chuyên mục này?</p>
                    </div>
                </div>
            </div>
            <footer class="panel-footer">
                <div class="row">
                    <div class="col-md-12 text-right">
                        <form id="formDel" method="post">
                            <input id="delID" type="hidden">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Đóng</button>
                            <button id="delButton" type="button" class="btn btn-danger">Xóa</button>
                        </form>
                    </div>
                </div>
            </footer>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<%@include file="./footer.jsp" %>
<script>
    $(document).ready(function () {
        $('#editCategory').hide();
        $('#cancelCategory').hide();
        




        function post(index,id, name,category_name, create_date) {
            this.index = index;
            this.id = id;
            this.name = name;
            this.category_name = category_name;
            this.create_date = create_date;
        };
        var table = $('#categoryTable').DataTable({
           ajax:{
               "url":"/category",
               "dataSrc":""
           },

            columns: [
                {data: 'id' },
                {data: 'name'},
                {data: 'description'},
                {data: 'total'},
                {
                    data: 'id',
                    "render": function (data, type, full, meta) {
                        return '<button data="'+data+'"class="edit btn btn-default">' +
                            '<i class="fa fa-pencil"></i>  Chỉnh sửa</button> ' +
                            '<button data-toggle="modal" data-target="#delmodal" value="' + data + '" class="btn btn-danger del"><i class="fa fa-trash-o"></i>  Xóa</button>';
                    }
                }

            ],
            "processing": true,
            "serverSide": false,
            "language": {
                "lengthMenu": "Hiện thị _MENU_ hàng",
                "zeroRecords": "Nothing found - sorry",
                "info": "Hiện thị trang _PAGE_ trên tổng _PAGES_ trang",
                "infoEmpty": "Chưa có hoạt động nào được đăng",
                "infoFiltered": "(filtered from _MAX_ total records)",
                "paginate": {
                    "first":      "Trang đầu",
                    "last":       "Trang cuối",
                    "next":       "Trang tiếp",
                    "previous":   "Trang trước"
                },
                "search":         "Tìm kiếm:",
                "loadingRecords": "Đang tải dữ liệu...",
                "processing":     "Processing...",
            },


        });
        table.on('order.dt search.dt', function () {
            table.column(0, {search: 'applied', order: 'applied'}).nodes().each(function (cell, i) {
                cell.innerHTML = i + 1;
            });
        }).draw();

        $("#delButton").click(function () {
            $.ajax({
                type: "DELETE",
                url: "/category/"+$("#delID").val(),
                contentType:"application/json"
            }).done(function() {

            })
                .fail(function() {

                })
                .always(function() {

                });
            $("#delmodal").modal('hide');
            table.ajax.reload();
        });
        $('#categoryTable tbody').on('click', '.edit', function () {
            var data = table.row($(this).parents('tr')).data();
            $("#name").val(data.name);
            $("#description").val(data.description);
            $('#id').val(data.id);
            $('#id').removeAttr('disabled');
            $('#addCategory').attr("disabled", true);
            $('#addCategory').hide();
            $('#editCategory').show();
            $('#cancelCategory').show();

        });
        $('#categoryTable tbody').on('click', '.del', function () {
            var data = table.row($(this).parents('tr')).data();
            $('#delID').val(data.id);
            $('#delID').removeAttr('disabled');
            $('#addCategory').removeAttr("disabled", true);
            $('#addCategory').show();
            $('#editCategory').hide();
            $('#cancelCategory').hide();

        });
        $("#addCategory").click(function (e) {
            var name;
            var description;
            var data = {
                name: $("#name").val(),
                description: $("#description").val()
            }
            $.ajax({
                type: "POST",
                url: "/category",
                contentType:"application/json",
                data: JSON.stringify(data)
            }).done(function() {
                $('#addCategory').removeAttr('disabled');
            })
                .fail(function() {
                    $('#addCategory').removeAttr('disabled');
                })
                .always(function() {
                    table.ajax.reload();
                });

        });
        $("#cancelCategory").click(function (e) {
            $("#name").val("");
            $("#description").val("");
            $('#editCategory').hide();
            $('#cancelCategory').hide();
            $('#addCategory').removeAttr('disabled');
            $('#addCategory').show();


        });
        $("#editCategory").click(function (e) {
            var data = {
                name: $("#name").val(),
                description: $("#description").val()
            }
            $.ajax({
                type: "PUT",
                url: "/category/"+$("#id").val(),
                contentType:"application/json",
                data: JSON.stringify(data)
            }).done(function() {

            })
                .fail(function() {

                })
                .always(function() {

                });
            table.ajax.reload();
        });

    });
</script>
</body>
</html>