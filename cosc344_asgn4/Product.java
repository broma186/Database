/*
  File: Product.java
  September 2014
  Matthew Brooker 541670.
*/  
import java.io.*;
import java.util.*;
import java.sql.*;

/**
 * Deals with Product table information relating to query.
 *
 * @author Matthew Brooker
 */

public class Product {

   // Class variables.
   String ssn;
   String fname;
   String lname;
   String productid;
   String product_name;
   double price;
   int dno;

   /**
    * This is the Product constructer that sets the values of objects
    *
    * @param ssn, fname, lname, productid, product_name, price, dno.
    * These parameters are all the sql values from the select statement.
    * They represent the attribute values printed row by row as a table.
    */

   public Product(String ssn, String fname, String lname, String productid,
                  String product_name, double price, int dno) {
      this.ssn = ssn;
      this.fname = fname;
      this.lname = lname;
      this.productid = productid;
      this.product_name = product_name;
      this.price = price;
      this.dno = dno;
   }

   /**
    * These are the getter methods that return the output values.
    *
    * @return ssn, fname, lname, productid, product_name, price, dno.
    */
   public String getSsn() {
      return ssn;
   }

   public String getFname() {
      return fname;
   }

   public String getLname() {
      return lname;
   }
      
   public String getId() {
      return productid;
   }

   public String getName() {
      return product_name;
   }
   
   public double getPrice() {
      return price;
   }

   public int getDno() {
      return dno;
   }



}
