<%@ page import="org.hibernate.Session" %>
<%@ page import="com.tanver.web.notetaker.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="com.tanver.web.notetaker.entities.Note" %><%--
  Created by IntelliJ IDEA.
  User: tanver
  Date: 1/4/22
  Time: 11:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Note</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>

<%--Navbar--%>
<div class="container-fluid p-0 m-0">
    <%@ include file="navbar.jsp" %>
</div>
<br>

<%
    // fetch note id
    int note_id = Integer.parseInt(request.getParameter("note_id").trim());
    Session s = FactoryProvider.getSessionFactory().openSession();
    Note note = s.get(Note.class, note_id);
%>

<%--    edit form--%>
<div class="container">
    <h1>Edit your code.</h1>
    <br>
    <form action="UpdateServlet" method="post">
        <input value="<%=note_id%>" name="note_id" hidden>
        <div class="mb-3">
            <label for="note-title">Note Title</label>
            <input type="text"
                   name="title"
                   class="form-control"
                   id="note-title" required
                   placeholder="Enter Title Here"
                   aria-describedby="emailHelp"
                   value="<%=note.getTitle()%>"/>
        </div>
        <div class="mb-3">
            <label for="note-content" class="form-label">Note Content</label>
            <textarea
                    id="note-content" required
                    name="content"
                    class="form-control"
                    placeholder="Enter your content here"
                    style="height: 300px"><%=note.getContent()%></textarea>
        </div>
        <%--        <div class="container text-center">--%>
        <button type="submit" class="btn btn-success">Save Your Note</button>
        <%--        </div>--%>
    </form>
</div>

</body>
</html>
