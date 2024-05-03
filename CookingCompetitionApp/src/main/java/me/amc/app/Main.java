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

        try {
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from instructor");

            String id;
            String name;
            String dept_name;
            float salary;
            while(resultSet.next()) {
                id = resultSet.getString("ID");
                name = resultSet.getString("name");
                dept_name = resultSet.getString("dept_name");
                salary = resultSet.getFloat("salary");
                System.out.println(id+", "+name+", "+dept_name+", "+salary);
            }
            resultSet.close();
            statement.close();

        } catch(Exception ex) {
            System.out.println("Could not execute test query!");
        }

        cdb.close();

    }
}