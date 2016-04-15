/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.sql.DataSource;
import model.product;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author parth
 */
public class ProductManager {
    private DataSource dataSource;
    private JdbcTemplate jdbcTemplateObject;
    
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplateObject = new JdbcTemplate(dataSource);
    }
    public void insertproduct(HashMap hm){
    String producttype = (String) hm.get("producttype");
     String productname = (String) hm.get("productname");
     
     String sql = "INSERT INTO `product`(`id`, `product_name`, `product_type`) VALUES (?,?)";
     jdbcTemplateObject.update(sql,producttype,productname);
     System.out.println("Created Record");
       
    }
    
   
}
