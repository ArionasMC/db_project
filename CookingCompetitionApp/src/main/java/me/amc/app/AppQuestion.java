package me.amc.app;

import java.sql.Connection;
import java.sql.ResultSet;
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
