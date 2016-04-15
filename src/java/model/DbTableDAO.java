/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashMap;
import java.util.List;
import javax.sql.DataSource;

/**
 *
 * @author sanjay prajapati
 */
public interface DbTableDAO {

    //Set Datasource
    public void setDataSource(DataSource ds);

    //authenticate on login
    public boolean authenticate(String username, String password);
    //Product List 
    public List<product> getProduct();
    //Insert Product    
    public void insertproduct(String producttype, String productnam);
    //Delete Product    
    public void DeleteProduct(String product_id);
    // Edit Product
    public void EditProduct(String product_id, String product_name, String product_type);
    
    public void insertcustomer(String customer_name, String customer_address);
    
    public List<customer> getCustomer();
    
    public void DeleteCustomer(String customer_id);
    
    public void EditCustomer(String customer_id, String customer_name,String customer_address);
    
}
