<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-08
  Time: 오후 7:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />

    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>


    <style>
        *{
            padding: 0;
            margin: 0;
        }
    </style>
</head>

<body>
<div class="border-bottom border-3">
    <div class="d-flex justify-content-between align-items-center mx-auto" style="width: 1440px; height: 105px;">
        <div class="h-100 col-3" style="background-image: url(https://i.ibb.co/MfHDQ8C/image.png); background-size: contain; background-repeat: no-repeat;">
            <a href="/admin"></a>
        </div>
        <div class="h-50 col-3 d-flex justify-content-around me-3 align-items-center">
            <div class="dropdown col-5">
                <div class="btn dropdown-toggle w-100 text-end" data-bs-toggle="dropdown" aria-expanded="false">
                    세션 이름
                </div>
                <div class="dropdown-menu w-100 text-center">
                    <div><a class="dropdown-item" href="#">로그아웃</a></div>
                </div>
            </div>
            <div class="col-3 fw-bold">
                <i class="bi bi-clock mx-2"></i>
                <span>60:00</span>
            </div>
            <div class="col-4 text-center">
                <div class="btn btn-outline-secondary w-100 fw-bold">시간연장</div>
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript" src="https://uicdn.toast.com/tui.pagination/v3.4.0/tui-pagination.js"></script>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>


    <script>

    </script>
</body>
</html>