/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lms.controller;

import com.lms.data.BookClassificationDao;
import com.lms.data.BookDao;
import com.lms.model.Book;
import com.lms.model.BookClassification;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Natsu
 */
@WebServlet(name = "EditBookController", urlPatterns = {"/EditBookController"})
public class EditBookController extends HttpServlet {

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
            out.println("<title>Servlet EditBookController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditBookController at " + request.getContextPath() + "</h1>");
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
        
        Book book = new Book();
        BookDao bookDao = new BookDao();
        BookClassification bookClassification = new BookClassification();
        BookClassificationDao bookClassificationDao = new BookClassificationDao();
        
        String bookId = request.getParameter("editBookId");
        String bookTitle = request.getParameter("editBookTitle");
        String bookAuthor = request.getParameter("editBookAuthor");
        String bookMainClassificationId = request.getParameter("editBookMainClassification");
        String bookSubClassificationId = request.getParameter("editBookSubClassification");
        String bookPublishYear = request.getParameter("editBookPublishYear");
        String bookLastPrintYear = request.getParameter("editBookLastPrintYear");
        String bookISBN = request.getParameter("editISBN");
        int bookNoOfPages = Integer.parseInt(request.getParameter("editNoOfPages"));
        
        book.setBookId(bookId);
        book.setTitle(bookTitle);
        book.setAuthor(bookAuthor);
        book.setPublishYear(bookPublishYear);
        book.setLastPrintYear(bookLastPrintYear);
        book.setIsbnNo(bookISBN);
        book.setNoOfPages(bookNoOfPages);
        bookClassification.setBookId(bookId);
        bookClassification.setSubClassificationId(bookSubClassificationId);
        
        bookDao.editBook(book);
        bookClassificationDao.updateBookClassification(bookClassification);
        request.getRequestDispatcher("/ViewBookController?").forward(request, response);
        
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
