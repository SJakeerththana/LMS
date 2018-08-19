/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lms.controller;

import com.lms.data.BookDao;
import com.lms.model.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Natsu
 */
@WebServlet(name = "SearchBookController", urlPatterns = {"/SearchBookController"})
public class SearchBookController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchBookController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchBookController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String firstFilterType = request.getParameter("firstFilterType");
        String firstFilterText = request.getParameter("firstFilterText");
        String secondFilterType = request.getParameter("secondFilterType");
        String secondFilterText = request.getParameter("secondFilterText");
        String btnViewAll = request.getParameter("viewAllRecords");

        BookDao bookDao = new BookDao();
        ArrayList<Book> bookList = new ArrayList<>();

        if ("viewAllRecords".equals(btnViewAll)) {
            bookList = bookDao.searchBook();
        } else {
            if (!"".equals(secondFilterText)) {
                if (!"".equals(firstFilterText)) {
                    if (!"".equals(firstFilterType) && !"".equals(secondFilterType)) {
                        bookList = bookDao.searchBook(firstFilterType, firstFilterText, secondFilterType, secondFilterText);
                    } else if ("".equals(firstFilterType) && !"".equals(secondFilterType)) {
                        bookList = bookDao.searchBook(secondFilterType, secondFilterText);
                    } else if (!"".equals(firstFilterType) && "".equals(secondFilterType)) {
                        bookList = bookDao.searchBook(firstFilterType, firstFilterText);
                    }
                } else if ("".equals(firstFilterText)) {
                    if (!"".equals(secondFilterType)) {
                        bookList = bookDao.searchBook(secondFilterType, secondFilterText);
                    } else if ("".equals(secondFilterType)) {
                        bookList = bookDao.searchBook(secondFilterText);
                    }
                }
            } else if (("".equals(secondFilterText))) {
                if (!"".equals(firstFilterText) && !"".equals(firstFilterType)) {
                    bookList = bookDao.searchBook(firstFilterType, firstFilterText);
                } else if (!"".equals(firstFilterText) && "".equals(firstFilterType)) {
                    bookList = bookDao.searchBook(firstFilterText);
                } else {
                    bookList = bookDao.searchBook();
                }
            }
        }

        response.setContentType("application/json");
        PrintWriter writer = response.getWriter();

        JsonObjectBuilder rootBuilder = Json.createObjectBuilder();
        JsonArrayBuilder arrayBuilder = Json.createArrayBuilder();
        JsonObject bookJson = null;

        for (Book book : bookList) {
            JsonObjectBuilder bookBuilder = Json.createObjectBuilder();

            bookJson = bookBuilder
                    .add("bookId", book.getBookId())
                    .add("Title", book.getTitle() != null ? book.getTitle() : "")
                    .add("Author", book.getAuthor() != null ? book.getAuthor() : "")
                    .add("PublishYear", book.getPublishYear() != null ? book.getPublishYear() : "")
                    .add("LastPrintYear", book.getLastPrintYear() != null ? book.getLastPrintYear() : "")
                    .add("ISBN", book.getIsbnNo() != null ? book.getIsbnNo() : "")
                    .add("NoOfPages", book.getNoOfPages())
                    .add("MainClassificationId", book.getMainClassificationId() != null ? book.getMainClassificationId() : "")
                    .add("MainClassificationName", book.getMainClassificationName() != null ? book.getMainClassificationName() : "")
                    .add("SubClassificationId", book.getSubClassificationId() != null ? book.getSubClassificationId() : "")
                    .add("SubClassificationName", book.getSubclassificationName() != null ? book.getSubclassificationName() : "")
                    .build();

            arrayBuilder.add(bookJson);
        }
        JsonObject root = rootBuilder.add("books", arrayBuilder).build();
        writer.print(root);
        writer.flush();
        writer.close();
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
