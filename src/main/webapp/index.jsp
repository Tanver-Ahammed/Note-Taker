<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <title>Note Home</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>

<div class="container-fluid p-0 m-0">
    <%@ include file="navbar.jsp" %>
</div>
<br>

<div class="container">
    <div class="card py-5">
        <img class="img-fluid mx-auto" style="max-width: 400px"
             src="image/notepad.png">
        <h1 class="text-primary text-uppercase text-center mt-3">
            Start Taking Your Notes</h1>
        <div class="container text-center">
            <button class="btn btn-outline-primary text-center">
                <a href="add_notes.jsp" style="color: black">Start Here</a>
            </button>
        </div>
    </div>
</div>

</body>
</html>