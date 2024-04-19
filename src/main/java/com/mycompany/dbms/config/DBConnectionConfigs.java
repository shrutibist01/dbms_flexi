package com.mycompany.dbms.config;
import java.sql.DriverManager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnectionConfigs {
    
    public static Connection getConnection(){
        try{
            try{
                Class.forName("com.mysql.jdbc.Driver");
            }catch (ClassNotFoundException ex){
                Logger.getLogger(DBConnectionConfigs.class.getName()).log(Level.SEVERE,null,ex);
            }
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/proj","root","Satviki@123");
        }catch (SQLException ex){
            Logger.getLogger(DBConnectionConfigs.class.getName()).log(Level.SEVERE,null,ex);            
        }
        return null;
    }
    
}
