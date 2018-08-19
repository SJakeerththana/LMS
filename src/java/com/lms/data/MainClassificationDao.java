package com.lms.data;

import com.lms.model.MainClassification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MainClassificationDao {
    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    
    public ArrayList getMainClassification(){
        String sql = "SELECT * FROM main_classification";
        ArrayList<MainClassification> mainClassificationList = new ArrayList();
        try{
            con = DbConnection.connect();
            stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                MainClassification mainClassification = new MainClassification();
                mainClassification.setMainClassificationId(rs.getString("mainClassificationId"));
                mainClassification.setMainClassificationName(rs.getString("mainClassificationName"));
                mainClassificationList.add(mainClassification);
            }
            
        } catch (SQLException ex) {
            //Logger.getLogger(BookClassificationDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("PreparedStatement Query Error: " + ex.getMessage());
        }
        finally{
            DbConnection.closeConnections();
        }
        return mainClassificationList;
    }
    
    public void addMainClassification(MainClassification mainClassification) {
        String sql = "INSERT INTO main_classification (mainClassificationId, mainClassificationName) "
                + "VALUES (?, ?)";
        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, mainClassification.getMainClassificationId());
            pstmt.setString(2, mainClassification.getMainClassificationName());
            
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("PreparedStatement Query Error: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }
    }

    public ArrayList viewMainClassificationById(String mainClassificationId) {
        String sql = "SELECT * FROM main_classification "
                + "WHERE mainClassificationId = '" + mainClassificationId + "'";

        ArrayList<MainClassification> mainClassificationList = new ArrayList<>();
        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                MainClassification mainClassification = new MainClassification();
                mainClassification.setMainClassificationId(rs.getString("mainClassificationId"));
                mainClassification.setMainClassificationName(rs.getString("mainClassificationName"));
                mainClassificationList.add(mainClassification);
            }

        } catch (SQLException ex) {
            System.out.println("Error in SQL: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }
        return mainClassificationList;
    }

    public void editMainClassification(MainClassification mainClassification) {
        String sql = "UPDATE main_classification SET "
                + "mainClassificationName = ? "
                + "WHERE mainClassificationId = '" + mainClassification.getMainClassificationId() + "'";
        String x = mainClassification.getMainClassificationName();
        try {
            con = DbConnection.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, mainClassification.getMainClassificationName());
            
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("SQL Query Error Exception: " + ex);
        } finally {
            DbConnection.closeConnections();
        }
    }

    public void deleteMainClassification(String mainClassificationId) {
        String sql = "DELETE FROM main_classification "
                + "WHERE mainClassificationId = '" + mainClassificationId + "'";

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

    public ArrayList searchMainClassification(String searchText) {
        String sql = "SELECT * FROM main_classification "
                + "WHERE mainClassificationId LIKE '" + searchText + "%' "
                + "OR mainClassificationName LIKE '" + searchText + "%' "
                + "ORDER BY mainClassificationId";

        ArrayList<MainClassification> mainClassificationList = new ArrayList<>();

        try {
            con = DbConnection.connect();
            stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                MainClassification mainClassification = new MainClassification();
                mainClassification.setMainClassificationId(rs.getString("mainClassificationId"));
                mainClassification.setMainClassificationName(rs.getString("mainClassificationName"));
                mainClassificationList.add(mainClassification);
            }

        } catch (SQLException ex) {
            System.out.println("SQL Error Exception: " + ex.getMessage());
        } finally {
            DbConnection.closeConnections();
        }

        return mainClassificationList;
    }

    
}
