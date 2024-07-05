package com.raven.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {

    private static final String JDBC_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String DB_URL = "jdbc:sqlserver://DESKTOP-D0D3PI0\\SQLEXPRESS;Database=MatchMakingProject;IntegratedSecurity=true;encrypt=false;";

    // Database credentials
    private static final String USER = "sa";
    private static final String PASSWORD = "1234";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            
            Class.forName(JDBC_DRIVER);

            
            connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    public static void main(String[] args){
        getConnection();
    }
}
        
        
      


