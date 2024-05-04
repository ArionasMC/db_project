package me.amc.app;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

public class AppQuestion {

    private int id;
    private Connection con;
    private String query;

    public AppQuestion(int id, Connection con, String query) {
        this.id = id;
        this.con = con;
        this.query = query;
    }

    public ResultSet getResult() {
        try {
            Statement s = this.con.createStatement();
            return s.executeQuery(this.query);
        } catch(Exception ex) {
            System.out.println("Could not execute query: "+ex.getMessage());
            return null;
        }
    }

    public void printSimpleResult() {
        try {
            ResultSet rs = this.getResult();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnsNumber = rsmd.getColumnCount();
            while(rs.next()) {
                for(int i = 1; i <= columnsNumber; i++) {
                    System.out.print(rs.getString(i));
                    if(i < columnsNumber)
                        System.out.print(", ");
                }
                System.out.println();
            }
            rs.close();
        } catch(Exception ex) {
            System.out.println("Something went wrong: "+ex.getMessage());
        }
    }

    public int getId() {
        return this.id;
    }

    public String getQuery() {
        return this.query;
    }

    public void setQuery(String query) {
        this.query = query;
    }
}
