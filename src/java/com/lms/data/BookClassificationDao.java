package com.lms.data;

import com.lms.model.BookClassification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class BookClassificationDao {

    Connection con = null;
    PreparedStatement pstmt = null;

    public void addBookClassification(BookClassification bookClassification) {
        String sql = "INSERT INTO book_classification (subClassificationId, bookId) "
                + "VALUES (?, ?)";

        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bookClassification.getSubClassificationId());
            pstmt.setString(2, bookClassification.getBookId());

            pstmt.executeUpdate();
        } catch (SQLException ex) {
            //Logger.getLogger(BookClassificationDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("PreparedStatement Query Error: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }
    }

    public void updateBookClassification(BookClassification bookClassification) {
        String sql = "UPDATE book_classification SET "
                + "subClassificationId = ? "
                + "WHERE bookId = '" + bookClassification.getBookId() + "'";
        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, bookClassification.getSubClassificationId());
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            //Logger.getLogger(BookClassificationDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("PreparedStatement Query Error: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }
    }

    public void deleteBookClassification(String bookId) {
        Statement stmt = null;
        String sql = "DELETE FROM book_classification "
                + "WHERE bookId = '" + bookId + "'";
        try {
            con = DbConnection.connect();
            stmt = con.createStatement();
            stmt.executeUpdate(sql);

        } catch (SQLException ex) {
            //Logger.getLogger(BookClassificationDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("PreparedStatement Query Error: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }
    }
}
