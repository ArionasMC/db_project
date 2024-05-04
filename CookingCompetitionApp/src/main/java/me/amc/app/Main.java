package me.amc.app;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Main {
    public static void main(String[] args)  {
        System.out.println("Welcome to CookingCompetitionApp!");

        ConnectionDB cdb = new ConnectionDB("localhost","3306","university","root","root");
        cdb.startConnection();

        Connection con = cdb.getConnection();

        AppQuestion instr = new AppQuestion(0, con, "select * from instructor");
        instr.printSimpleResult();

        cdb.close();

    }
}