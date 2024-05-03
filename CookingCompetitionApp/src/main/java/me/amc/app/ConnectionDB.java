package me.amc.app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {

    private Connection con;
    private String ipAddress;
    private String serverPort;
    private String dbName;
    private String dbUser;
    private String dbPass;

    public ConnectionDB(String ipAddress, String serverPort, String dbName, String dbUser, String dbPass) {
        this.ipAddress = ipAddress;
        this.serverPort = serverPort;
        this.dbName = dbName;
        this.dbUser = dbUser;
        this.dbPass = dbPass;
    }

    public void startConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://"+ipAddress
                    +":"+serverPort+"/"+dbName, dbUser, dbPass);
        } catch (Exception e) {
            System.out.println("Could not establish connection with the Database Server: "+e.getMessage());
        }
    }

    public Connection getConnection() {
        return this.con;
    }

    public void close()  {
        try {
            if(con != null)
                con.close();
        } catch (SQLException e) {
            System.out.println("Could not close connection: "+e.getMessage());
        }
    }

    public String getServerPort() {
        return serverPort;
    }

    public String getDbName() {
        return dbName;
    }

    public String getDbUser() {
        return dbUser;
    }

    public String getDbPass() {
        return dbPass;
    }

    public String getIpAddress() {
        return ipAddress;
    }
}
