package com.lms.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnection {
    static Connection con = null;
    static Statement stmt = null;
    static PreparedStatement pstmt = null;
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String URL = "jdbc:mysql://localhost/libraryjsp?useSSL=false";
    static final String USER = "root";
    static final String PASSWORD = "manager";
        
    protected static Connection connect(){
        try{
            Class.forName(JDBC_DRIVER);
            System.out.println("JDBC Driver Connection Successful");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException ex) {
            //Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("JDBC Driver Not Found Exception: " + ex.getMessage());
        } catch (SQLException ex) {
            //Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Database Connection Error: " + ex.getMessage());
        }
        
        return con;
    }
    
    protected static void closeConnections(){
        if(stmt != null){
            try{
                stmt.close();
            } catch (SQLException ex) {
                //Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Statement Close Exception: " + ex.getMessage());
            }
        }
        if(pstmt != null){
            try{
                pstmt.close();
            } catch (SQLException ex) {
                //Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("PreparedStatement Close Exception: " + ex.getMessage());
            }
        }
        if(con != null){
            try{
                con.close();
            } catch (SQLException ex) {
                //Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Database Connection Close Exception: " + ex.getMessage());
            }
        }
    } 
}
