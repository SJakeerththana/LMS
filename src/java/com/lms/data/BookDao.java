package com.lms.data;

import com.lms.model.Book;
import com.lms.model.BookClassification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BookDao {

    Connection con = null;
    PreparedStatement pstmt = null;

    public void addBook(Book book) {
        String sql = "INSERT INTO book_details (bookId, title, author, publishYear, lastPrintYear, isbnNo, noOfPages) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, book.getBookId());
            pstmt.setString(2, book.getTitle());
            pstmt.setString(3, book.getAuthor());
            pstmt.setString(4, book.getPublishYear());
            pstmt.setString(5, book.getLastPrintYear());
            pstmt.setString(6, book.getIsbnNo());
            pstmt.setInt(7, book.getNoOfPages());

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            //Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("PreparedStatement Query Error: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }
    }

    public ArrayList viewBook() {
        //String sql = "SELECT * FROM book_details";
        String sql = "SELECT * FROM book_details bd "
                + "JOIN book_classification bc "
                + "ON bd.bookId =  bc.bookId "
                + "JOIN sub_classification sc "
                + "ON sc.subClassificationId = bc.subClassificationId "
                + "JOIN main_classification mc ON mc.mainClassificationId=sc.mainClassificationId "
                + "ORDER BY bd.bookId";

        ArrayList<Book> bookList = new ArrayList<>();
        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getString("bookId"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPublishYear(rs.getString("publishYear"));
                book.setLastPrintYear(rs.getString("lastPrintYear"));
                book.setIsbnNo(rs.getString("isbnNo"));
                book.setNoOfPages(rs.getInt("noOfPages"));
                book.setMainClassificationName(rs.getString("mainClassificationName"));
                book.setSubclassificationName(rs.getString("subClassificationName"));
                bookList.add(book);
            }

        } catch (SQLException ex) {
            //Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("PreaparedStatement Query Error: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }
        return bookList;
    }

    public ArrayList viewBookById(String bookId) {
        String sql = "SELECT * FROM book_details bd "
                + "JOIN book_classification bc ON bd.bookId=bc.bookId "
                + "JOIN sub_classification sc ON bc.subClassificationId=sc.subClassificationId "
                + "JOIN main_classification mc ON sc.mainClassificationId=mc.mainClassificationId "
                + "WHERE bd.bookId = '" + bookId + "'";

        ArrayList<Book> bookList = new ArrayList<>();
        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getString("bookId"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPublishYear(rs.getString("publishYear"));
                book.setLastPrintYear(rs.getString("lastPrintYear"));
                book.setIsbnNo(rs.getString("isbnNo"));
                book.setNoOfPages(rs.getInt("noOfPages"));
                book.setMainClassificationId(rs.getString("mainClassificationId"));
                book.setMainClassificationName(rs.getString("mainClassificationName"));
                book.setSubClassificationId(rs.getString("subClassificationId"));
                book.setSubclassificationName(rs.getString("subClassificationName"));
                bookList.add(book);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbConnection.closeConnections();
        }
        return bookList;
    }

    public void editBook(Book book) {
        String sql = "UPDATE book_details SET "
                + "title = ?, "
                + "author = ?, "
                + "publishYear = ?, "
                + "lastPrintYear = ?, "
                + "isbnNo = ?, "
                + "noOfPages = ? "
                + "WHERE bookId = '" + book.getBookId() + "'";

        try {
            //con.setAutoCommit(false);

            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, book.getTitle());
            pstmt.setString(2, book.getAuthor());
            pstmt.setString(3, book.getPublishYear());
            pstmt.setString(4, book.getLastPrintYear());
            pstmt.setString(5, book.getIsbnNo());
            pstmt.setInt(6, book.getNoOfPages());
            pstmt.executeUpdate();

            //con.commit();
        } catch (SQLException ex) {
//            try {
//                //Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
//                con.rollback();
//                System.out.println("SQL Query Error Exception: " + ex);
//            } catch (SQLException exrollback) {
//                //Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, exrollback);
//                System.out.println("SQL Query Error & rollback error Exception: " + exrollback);
//            }
            System.out.println("SQL Query Error Exception: " + ex);
        } finally {
            DbConnection.closeConnections();
        }
    }

    public void deleteBook(String bookId) {
        String sql = "DELETE FROM book_details "
                + "WHERE bookId = '" + bookId + "'";

        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("SQL Query Error Exception: " + ex);
        } finally {
            DbConnection.closeConnections();
        }
    }

    public ArrayList searchBook() {
        ArrayList<Book> bookSearchList = new ArrayList<>();
        String sql = "SELECT * FROM book_details bd "
                + "JOIN book_classification bc "
                + "ON bd.bookId =  bc.bookId "
                + "JOIN sub_classification sc "
                + "ON sc.subClassificationId = bc.subClassificationId "
                + "JOIN main_classification mc ON mc.mainClassificationId=sc.mainClassificationId "
                + "ORDER BY bd.bookId";

        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getString("bookId"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPublishYear(rs.getString("publishYear"));
                book.setLastPrintYear(rs.getString("lastPrintYear"));
                book.setIsbnNo(rs.getString("isbnNo"));
                book.setNoOfPages(rs.getInt("noOfPages"));
                book.setMainClassificationId(rs.getString("mainClassificationId"));
                book.setMainClassificationName(rs.getString("mainClassificationName"));
                book.setSubClassificationId(rs.getString("subClassificationId"));
                book.setSubclassificationName(rs.getString("subClassificationName"));
                bookSearchList.add(book);
            }

        } catch (SQLException ex) {
            //Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
        }

        return bookSearchList;
    }

    public ArrayList searchBook(String firstFilterText) {
        ArrayList<Book> bookSearchList = new ArrayList<>();
        String sql = "SELECT * FROM book_details bd "
                + "JOIN book_classification bc "
                + "ON bd.bookId =  bc.bookId "
                + "JOIN sub_classification sc "
                + "ON sc.subClassificationId = bc.subClassificationId "
                + "JOIN main_classification mc "
                + "ON mc.mainClassificationId = sc.mainClassificationId "
                + "WHERE bd.bookId LIKE '" + firstFilterText + "%' "
                + "OR bd.title LIKE '" + firstFilterText + "%' "
                + "OR bd.author LIKE '" + firstFilterText + "%' "
                + "OR bd.publishYear LIKE '" + firstFilterText + "%' "
                + "OR bd.lastPrintYear LIKE '" + firstFilterText + "%' "
                + "OR bd.isbnNo LIKE '" + firstFilterText + "%' "
                + "OR bd.noOfPages LIKE '" + firstFilterText + "%' "
                + "OR mc.mainClassificationName LIKE '" + firstFilterText + "%' "
                + "OR sc.subClassificationName LIKE '" + firstFilterText + "%' "
                + "ORDER BY bd.bookId";

        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getString("bookId"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPublishYear(rs.getString("publishYear"));
                book.setLastPrintYear(rs.getString("lastPrintYear"));
                book.setIsbnNo(rs.getString("isbnNo"));
                book.setNoOfPages(rs.getInt("noOfPages"));
                book.setMainClassificationId(rs.getString("mainClassificationId"));
                book.setMainClassificationName(rs.getString("mainClassificationName"));
                book.setSubClassificationId(rs.getString("subClassificationId"));
                book.setSubclassificationName(rs.getString("subClassificationName"));
                bookSearchList.add(book);
            }

        } catch (SQLException ex) {
            //Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
        }

        return bookSearchList;
    }
    
    public ArrayList searchBook(String firstFilterType, String firstFilterText) {
        ArrayList<Book> bookSearchList = new ArrayList<>();

        String sql = "SELECT * FROM book_details bd "
                + "JOIN book_classification bc "
                + "ON bd.bookId =  bc.bookId "
                + "JOIN sub_classification sc "
                + "ON sc.subClassificationId = bc.subClassificationId "
                + "JOIN main_classification mc "
                + "ON mc.mainClassificationId = sc.mainClassificationId "
                + "WHERE " + firstFilterType + " LIKE '" + firstFilterText + "%' ORDER BY bd.bookId";

        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getString("bookId"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPublishYear(rs.getString("publishYear"));
                book.setLastPrintYear(rs.getString("lastPrintYear"));
                book.setIsbnNo(rs.getString("isbnNo"));
                book.setNoOfPages(rs.getInt("noOfPages"));
                book.setMainClassificationId(rs.getString("mainClassificationId"));
                book.setMainClassificationName(rs.getString("mainClassificationName"));
                book.setSubClassificationId(rs.getString("subClassificationId"));
                book.setSubclassificationName(rs.getString("subClassificationName"));
                bookSearchList.add(book);
            }

        } catch (SQLException ex) {
            //Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
        }

        return bookSearchList;
    }

    public ArrayList searchBook(String firstFilterType, String firstFilterText, String secondFilterType, String secondFilterText) {
        ArrayList<Book> bookSearchList = new ArrayList<>();
        
        String sql = "SELECT * FROM book_details bd "
                + "JOIN book_classification bc "
                + "ON bd.bookId =  bc.bookId "
                + "JOIN sub_classification sc "
                + "ON sc.subClassificationId = bc.subClassificationId "
                + "JOIN main_classification mc "
                + "ON mc.mainClassificationId = sc.mainClassificationId "
                + "WHERE " + firstFilterType + " LIKE '"
                + firstFilterText + "%' AND " + secondFilterType + " LIKE '" + secondFilterText + "%' ORDER BY bd.bookId";

        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getString("bookId"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPublishYear(rs.getString("publishYear"));
                book.setLastPrintYear(rs.getString("lastPrintYear"));
                book.setIsbnNo(rs.getString("isbnNo"));
                book.setNoOfPages(rs.getInt("noOfPages"));
                book.setMainClassificationId(rs.getString("mainClassificationId"));
                book.setMainClassificationName(rs.getString("mainClassificationName"));
                book.setSubClassificationId(rs.getString("subClassificationId"));
                book.setSubclassificationName(rs.getString("subClassificationName"));
                bookSearchList.add(book);
            }

        } catch (SQLException ex) {
            //Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
        }

        return bookSearchList;
    }

}
