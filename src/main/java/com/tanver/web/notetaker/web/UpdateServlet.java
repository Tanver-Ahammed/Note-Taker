package com.tanver.web.notetaker.web;

import com.tanver.web.notetaker.entities.Note;
import com.tanver.web.notetaker.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "UpdateServlet", value = "/UpdateServlet")
public class UpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            // fetch note data
            int note_id = Integer.parseInt(request.getParameter("note_id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            Session session = FactoryProvider.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();

            Note note = session.get(Note.class, note_id);
            note.setTitle(title);
            note.setContent(content);
            note.setAddedDate(new Date());

            transaction.commit();
            session.close();

            response.sendRedirect("all_notes.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
