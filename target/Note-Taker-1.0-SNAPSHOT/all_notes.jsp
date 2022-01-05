<%@ page import="org.hibernate.Session" %>
<%@ page import="com.tanver.web.notetaker.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tanver.web.notetaker.entities.Note" %>
<%--
  Created by IntelliJ IDEA.
  User: tanver
  Date: 1/4/22
  Time: 9:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Notes</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>

<%--Navbar--%>
<div class="container-fluid p-0 m-0">
    <%@ include file="navbar.jsp" %>
</div>
<br>

<div class="container">
    <h1 class="text-uppercase">All Notes:</h1>
    <div class="row">
        <div class="col-12">

            <%
                Session s = FactoryProvider.getSessionFactory().openSession();
                Query query = s.createQuery("from Note");
                List<Note> noteList = query.list();
                for (Note note : noteList) {
            %>

            <div class="card mt-3">
                <img class="card-img-top m-4" src="image/notepad.png"
                     style="max-width: 100px">
                <div class="card-body px-5">
                    <h5 class="card-title"><%=note.getTitle()%>
                    </h5>
                    <p class="card-text"><%=note.getContent()%>
                    </p>
                    <p><b class="text-primary"><%=note.getAddedDate()%>
                    </b></p>
                    <%--                    <div class="container mt-4">--%>
                    <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
                    <a href="edit.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Update</a>
                    <%--                    </div>--%>
                </div>
            </div>

            <%
                }
                s.close();
            %>

        </div>
    </div>
</div>

<br><br><br>

</body>
</html>
