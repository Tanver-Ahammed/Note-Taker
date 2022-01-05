package com.tanver.web.notetaker.web;

import com.tanver.web.notetaker.entities.Note;
import com.tanver.web.notetaker.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "SaveNoteServlet", value = "/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        try {
            PrintWriter out = response.getWriter();

            // note's title content fetch
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            Note note = new Note(title, content, new Date());

            // hibernate save
            Session session = FactoryProvider.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();

            // save()
            session.save(note);

            transaction.commit();
            session.close();
            out.println("<h1 style='text-align:center'>Note is added successfully.</h1>");
            out.println("<h1 style='text-align:center'><a href='all_notes.jsp'>View All</a></h1>");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
