<%--
  Created by IntelliJ IDEA.
  User: tanver
  Date: 1/3/22
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="all_js_css.jsp" %>
    <title>Add Note</title>
</head>
<body>

<%--Navbar--%>
<div class="container-fluid p-0 m-0">
    <%@ include file="navbar.jsp" %>
</div>
<br>

<%--    add form--%>
<div class="container">
    <h1>Please, Fill your Note Details.</h1>
    <br>
    <form action="SaveNoteServlet" method="post">
        <div class="mb-3">
            <label for="note-title">Note Title</label>
            <input type="text"
                   name="title"
                   class="form-control"
                   id="note-title" required
                   placeholder="Enter Title Here"
                   aria-describedby="emailHelp"/>
        </div>
        <div class="mb-3">
            <label for="note-content" class="form-label">Note Content</label>
            <textarea
                    id="note-content" required
                    name="content"
                    class="form-control"
                    placeholder="Enter your content here"
                    style="height: 300px"></textarea>
        </div>
<%--        <div class="container text-center">--%>
            <button type="submit" class="btn btn-primary">Add Note</button>
<%--        </div>--%>
    </form>
</div>


</body>
</html>
