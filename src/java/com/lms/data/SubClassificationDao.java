package com.lms.data;

import com.lms.model.SubClassification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SubClassificationDao {

    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;

    public ArrayList subClassificationByMainClassification(String mainClassificationId) {
        String sql = "SELECT * FROM main_classification mc "
                + "JOIN sub_classification sc "
                + "ON mc.mainClassificationId=sc.mainClassificationId "
                + "WHERE sc.mainClassificationId='" + mainClassificationId + "'";

        ArrayList<SubClassification> subClassificationList = new ArrayList<>();

        try {
            con = DbConnection.connect();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                SubClassification subClassification = new SubClassification();
                subClassification.setSubClassificationId(rs.getString("subClassificationId"));
                subClassification.setSubClassificationName(rs.getString("subClassificationName"));
                subClassification.setMainClassificationId(rs.getString("mainClassificationId"));
                subClassification.setMainClassificationName(rs.getString("mainClassificationName"));
                subClassificationList.add(subClassification);
            }

        } catch (SQLException ex) {
//            Logger.getLogger(SubClassificationDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error Exception: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }

        return subClassificationList;
    }

    public ArrayList getAllSubClassification() {
        String sql = "SELECT * FROM sub_classification sc "
                + "JOIN main_classification mc ON sc.mainClassificationId=mc.mainClassificationId ORDER BY sc.mainClassificationId";

        ArrayList<SubClassification> subClassificationList = new ArrayList<>();

        try {
            con = DbConnection.connect();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                SubClassification subClassification = new SubClassification();
                subClassification.setSubClassificationId(rs.getString("subClassificationId"));
                subClassification.setSubClassificationName(rs.getString("subClassificationName"));
                subClassification.setMainClassificationId(rs.getString("mainClassificationId"));
                subClassification.setMainClassificationName(rs.getString("mainClassificationName"));
                subClassificationList.add(subClassification);
            }

        } catch (SQLException ex) {
//            Logger.getLogger(SubClassificationDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error Exception: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }

        return subClassificationList;
    }

    public void addSubClassification(SubClassification subClassification) {
        String sql = "INSERT INTO sub_classification (subClassificationId, subClassificationName, mainClassificationId) "
                + "VALUES (?, ?, ?)";
        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, subClassification.getSubClassificationId());
            pstmt.setString(2, subClassification.getSubClassificationName());
            pstmt.setString(3, subClassification.getMainClassificationId());

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            //Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("PreparedStatement Query Error: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }
    }

    public ArrayList viewSubClassificationById(String subClassificationId) {
        String sql = "SELECT * FROM sub_classification sc "
                + "JOIN main_classification mc "
                + "ON sc.mainClassificationId = mc.mainClassificationId "
                + "WHERE sc.subClassificationId = '" + subClassificationId + "'";

        ArrayList<SubClassification> subClassificationList = new ArrayList<>();
        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                SubClassification subClassification = new SubClassification();
                subClassification.setSubClassificationId(rs.getString("subClassificationId"));
                subClassification.setSubClassificationName(rs.getString("subClassificationName"));
                subClassification.setMainClassificationId(rs.getString("mainClassificationId"));
                subClassification.setMainClassificationName(rs.getString("mainClassificationName"));
                subClassificationList.add(subClassification);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbConnection.closeConnections();
        }
        return subClassificationList;
    }

    public void editSubClassification(SubClassification subClassification) {
        String sql = "UPDATE sub_classification SET "
                + "subClassificationName = ?, "
                + "mainClassificationId = ? "
                + "WHERE subClassificationId = '" + subClassification.getSubClassificationId() + "'";

        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, subClassification.getSubClassificationName());
            pstmt.setString(2, subClassification.getMainClassificationId());
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("SQL Query Error Exception: " + ex);
        } finally {
            DbConnection.closeConnections();
        }
    }

    public void deleteSubClassification(String subClassificationId) {
        String sql = "DELETE FROM sub_classification "
                + "WHERE subClassificationId = '" + subClassificationId + "'";

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

    public ArrayList searchSubClassificationByMainClassificationName(String firstFilterText) {
        String sql = "SELECT * FROM sub_classification sc "
                + "JOIN main_classification mc ON sc.mainClassificationId=mc.mainClassificationId "
                + "WHERE mc.mainClassificationName LIKE '" + firstFilterText + "%' "
                + "ORDER BY sc.mainClassificationId";

        ArrayList<SubClassification> subClassificationList = new ArrayList<>();

        try {
            con = DbConnection.connect();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                SubClassification subClassification = new SubClassification();
                subClassification.setSubClassificationId(rs.getString("subClassificationId"));
                subClassification.setSubClassificationName(rs.getString("subClassificationName"));
                subClassification.setMainClassificationId(rs.getString("mainClassificationId"));
                subClassification.setMainClassificationName(rs.getString("mainClassificationName"));
                subClassificationList.add(subClassification);
            }

        } catch (SQLException ex) {
            System.out.println("SQL Error Exception: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }

        return subClassificationList;
    }

    public ArrayList searchSubClassification(String firstFilterText) {
        String sql = "SELECT * FROM sub_classification sc "
                + "JOIN main_classification mc ON sc.mainClassificationId=mc.mainClassificationId "
                + "WHERE sc.subClassificationId LIKE '" + firstFilterText + "%' "
                + "OR sc.subClassificationName LIKE '" + firstFilterText + "%' "
                + "OR mc.mainClassificationName LIKE '" + firstFilterText + "%' "
                + "ORDER BY sc.mainClassificationId";

        ArrayList<SubClassification> subClassificationList = new ArrayList<>();

        try {
            con = DbConnection.connect();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                SubClassification subClassification = new SubClassification();
                subClassification.setSubClassificationId(rs.getString("subClassificationId"));
                subClassification.setSubClassificationName(rs.getString("subClassificationName"));
                subClassification.setMainClassificationId(rs.getString("mainClassificationId"));
                subClassification.setMainClassificationName(rs.getString("mainClassificationName"));
                subClassificationList.add(subClassification);
            }

        } catch (SQLException ex) {
            System.out.println("SQL Error Exception: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }

        return subClassificationList;
    }

    public ArrayList searchSubClassification(String firstFilterText, String secondFilterText) {
        String sql = "SELECT * FROM sub_classification sc "
                + "JOIN main_classification mc ON sc.mainClassificationId=mc.mainClassificationId "
                + "WHERE mc.mainClassificationName LIKE '" + firstFilterText + "%' "
                + "AND sc.subClassificationName LIKE '" + secondFilterText + "%' "
                + "ORDER BY sc.mainClassificationId";

        ArrayList<SubClassification> subClassificationList = new ArrayList<>();

        try {
            con = DbConnection.connect();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                SubClassification subClassification = new SubClassification();
                subClassification.setSubClassificationId(rs.getString("subClassificationId"));
                subClassification.setSubClassificationName(rs.getString("subClassificationName"));
                subClassification.setMainClassificationId(rs.getString("mainClassificationId"));
                subClassification.setMainClassificationName(rs.getString("mainClassificationName"));
                subClassificationList.add(subClassification);
            }

        } catch (SQLException ex) {
            System.out.println("SQL Error Exception: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }

        return subClassificationList;
    }

}
