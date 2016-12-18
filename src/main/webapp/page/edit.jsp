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
                <div class="col-md-12 col-lg-12 col-xl-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <h2 class="panel-title">Danh sách hoạt động</h2>
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
                                <div class="col-sm-2">
                                    <div class="mb-md">
                                        <a href="/admin/post/add" class="btn btn-primary">
                                            Thêm bài viết
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="mb-md">
                                        <a href="/admin/category" class="btn btn-primary">
                                            Thêm chuyên mục
                                        </a>
                                    </div>
                                </div>

                            </div>

                        <table id="postTable" class="table table-bordered table-striped mb-none dataTable no-footer">
                            <thead>
                            <tr>
                            <th>STT</th>
                            <th>Tên hoạt động</th>
                            <th>Tác giả</th>
                            <th>Chuyên mục</th>
                            <th>Hình đại diện</th>
                            <th>Ngày đăng</th>
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
                        <p>Bạn có muốn xóa hoạt động này?</p>
                    </div>
                </div>
            </div>
            <footer class="panel-footer">
                <div class="row">
                    <div class="col-md-12 text-right">
                        <form id="formDel" method="post">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-danger">Xóa</button>
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
        function post(index,id, name, create_by, category_name,avatar, create_date) {
            this.index = index;
            this.id = id;
            this.name = name;

            this.create_by = create_by;
            this.category_name = category_name;
            this.avatar = avatar;
            this.create_date = create_date;
        };
        var table = $('#postTable').DataTable({
            data: [
                <c:forEach items="${posts}" var="item">
                new post("${index}", "${item.id}", "${item.name}", "${item.create_by}","${item.category.name}", "${item.imageURL}",moment('${item.create_date}').format('DD-MM-YYYY hh:mm')),
                </c:forEach>
            ],

            columns: [
                {data: 'index' },
                {data: 'name',
                    "render": function (data, type, full, meta) {

                        return '<a href="/post/' + full.id + '"><h4>'+data+'</h4></a> ';
                    }

                },
                {data: 'create_by'},
                {data: 'category_name'},
                {data: 'avatar',
                    "render": function (data, type, full, meta) {

                        return '<img src="'+data+'" width="75" height="75"> ';
                    }
                },
                {data: 'create_date'},
                {
                    data: 'id',
                    "render": function (data, type, full, meta) {
                        return '<a href="/admin/edit/' + data + '" class="btn btn-default">' +
                            '<i class="fa fa-pencil"></i>  Chỉnh sửa</a> ' +
                            '<a data-toggle="modal" data-target="#delmodal" value="' + data + '" class="btn btn-danger del"><i class="fa fa-trash-o"></i>  Xóa</a>';
                    }
                }

            ],
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
        $(".del").click(function () {
            console.log("as");
            $('#formDel').attr("action", "/admin/post/delete/" + $(this).attr('value'));
        });
//        $('#postTable tbody').on('click', '.edit', function () {
//            var data = table.row($(this).parents('tr')).data();
//            console.log(data);
//            $('#id').val(data.id);
//            $('#id').removeAttr('disabled');
//            $('#name_room').val(data.name);
//            $('#start_time').val(moment(data.start_time, 'DD-MM-YYYY HH:mm', true).format('YYYY-MM-DD HH:mm'));
//            $('#end_time').val(moment(data.end_time, 'DD-MM-YYYY HH:mm', true).format('YYYY-MM-DD HH:mm'));
//            $('#modal').modal('toggle');
//            $('#form').attr('action', '/room/edit/' + data.id);
//        });
//        $("#add").click(function () {
//            $('#modal').modal('toggle');
//            $('#id').attr('disabled', 'true');
//            $("#form").trigger('reset');
//            $('#form').attr('action', '/room/add');
//        })
    });
</script>
</body>
</html>