/*
  File: ProductInfo.java
  September 2014
  Matthew Brooker 541670.
*/

import java.io.*;
import java.util.*;
import java.sql.*;

/**
 * This program outputs the product details of all
 * the purchases within a given date range, and who
 * made them.
 *
 * @author Matthew Brooker
 */

public class ProductInfo {


    public static void main (String[] args) {
	new ProductInfo().go();
    }

    // This is the function that does all the work
    private void go() {

	// Read pass.dat
	UserPass login = new UserPass();
	String user = login.getUserName();
	String pass = login.getPassWord();
	String host = "silver";

	Connection con = null;
	try {
	    // Register the driver and connect to Oracle
	    DriverManager.registerDriver 
		(new oracle.jdbc.driver.OracleDriver());
	    String url = "jdbc:oracle:thin:@" + host + ":1527:cosc344";
            System.out.println("url: " + url);
	    con = DriverManager.getConnection(url, user, pass);
	    System.out.println("Connected to Oracle");
            
            /* This prepared statement outputs the details of all purchases
               within a given date range, and who made them.
            */
            PreparedStatement pstmt = con.prepareStatement("SELECT a.ssn, a.fname, a.lname, p.productid, " +
"p.product_name, p.price, p.dno " +
"FROM product p, containing c, customer a, shopping_list s " +
"WHERE c.productid = p.productid " +
"AND s.shopping_date = c.shopping_date " +
"AND a.ssn = s.ssn " +
"AND c.shopping_date BETWEEN TO_DATE(?, 'DD-MM-YYYY') AND TO_DATE(?,'DD-MM-YYYY')");


            System.out.println("Please enter two dates on separate lines to specify " +
                               "what time period you wish to check all product's " +
                               "purchased in this form: DD-MM-YYYY. Be sure to type " +
                               "the earlier date first.");
            
            Scanner input = new Scanner(System.in);
            
            if (input.hasNextLine()) {
               String stringDate1 = input.nextLine();           
               pstmt.setString(1, stringDate1);     
            }
            else {
               System.out.println("You didn't enter a date!");
               System.exit(1);
            }

            if (input.hasNextLine()){
               String stringDate2 = input.nextLine();
               pstmt.setString(2, stringDate2);
            
            }
            else {
               System.out.println("You didn't enter a second date!");
               System.exit(1);
            }
       
                  
            ResultSet rslt = pstmt.executeQuery();
            
            // Calls print array which handles the rest of the product output.
            printArray(rslt);      
         
            
	} catch (SQLException e) {
	    System.out.println(e.getMessage());
	    System.exit(1);

	} finally {
	    if (con != null) {
		try {
		    con.close();
		} catch (SQLException e) {
		    quit(e.getMessage());
		}
	    }
	}
    }  // end go()

   /**
    * printArray executes the database extraction using the result set
    * query and puts each selected tuple in an object called Product, to
    * add to an array list of products which are finally printed in
    * appropriate formatting.
    *
    *  @param rslt.
    *
    */
   private void printArray(ResultSet rslt) {

      // The array list of Product objects.
      ArrayList<Product> products = new ArrayList<Product>();

      /* While there is another tuple, store each selected attribute
       * value, create a product object with these attributes, and add
       * it to the arraylist for printing.
       */
      try {    
      while (rslt.next()) {

         String ssn = rslt.getString("ssn");
         String fname = rslt.getString("fname");
         String lname = rslt.getString("lname");
         String productid = rslt.getString("productid");
         String product_name = rslt.getString("product_name");
         double price = rslt.getDouble("price");
         int dno = rslt.getInt("dno");

         Product p = new Product(ssn, fname, lname, productid, product_name, price, dno);
         products.add(p);
         
         } 
      }
      catch (SQLException e) {
         System.out.println(e.getMessage());
         System.exit(1);
      }
      // For the output table heading...
      System.out.println("SSN         FNAME    LNAME       PROD_ID     PRODUCT_NAME" +
         "         PRICE    DNO");
      System.out.println("---         -----    -----       -------     ------------" +
         "         -----    ---");

      /* Print out all products using the getters found in Product class,
         the attributes productid, product_name, price and dno */     
      for (Product pr: products){
         System.out.format("%-11s %-8s %-11s %-11s %-20s %-8.2f %-8d\n",
                           pr.getSsn(), pr.getFname(), pr.getLname(),
                           pr.getId(), pr.getName(), pr.getPrice(), pr.getDno());
      }    
   }

    // Used to output an error message and exit
    private void quit(String message) {
	System.err.println(message);
	System.exit(1);
    }

} 


