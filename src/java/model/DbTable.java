/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.HashMap;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author sanjay prajapati
 */
public class DbTable implements DbTableDAO {

    private DataSource dataSource;
    private JdbcTemplate jdbcTemplateObject;

    @Override
    public void setDataSource(DataSource ds) {
        this.dataSource = ds;
        this.jdbcTemplateObject = new JdbcTemplate(dataSource);
    }

    @Override
    public boolean authenticate(String username, String password) {

        boolean status = false;
        String encrypassword = Encrypt.getMD5(password);
        String SQL = "SELECT count(*) as user FROM `login` WHERE username=? AND password=?";
        try {
            status = (boolean) jdbcTemplateObject.queryForObject(SQL, new Object[]{username, encrypassword}, new RowMapper() {

                @Override
                public Object mapRow(ResultSet rs, int i) throws SQLException {
                    int login_status = rs.getInt("user");
                    if (login_status == 1) {
                        return true;
                    } else {
                        return false;
                    }
                }

            });
            return status;
        } catch (EmptyResultDataAccessException e) {
            status = false;
            return status;
        }
    }

    public List<product> getProduct() {
        
        List<product> list = new ArrayList<product>();
        list = jdbcTemplateObject.query("SELECT * FROM `product`", new RowMapper<product>() {
            @Override
            public product mapRow(ResultSet rs, int rowNum) throws SQLException {
                product p = new product();

                p.setId(rs.getInt("id"));
                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_type(rs.getString("product_type"));
                System.out.print("run list ");
                return p;

            }
        });

        return list;
    }

    @Override
    public void insertproduct(String producttype, String productname) {

        String sql = "INSERT INTO `product`(`product_name`, `product_type`) VALUES (?,?)";
        jdbcTemplateObject.update(sql, productname, producttype);
        System.out.println("Created Record::::" + productname);

    }

    @Override
    public void DeleteProduct(String product_id) {
        
        String sql = "DELETE FROM `product` WHERE id = ?";
        jdbcTemplateObject.update(sql, product_id);
          System.out.println("Product Deleted ::::" + product_id);
    }

    @Override
    public void EditProduct(String product_id, String product_name,String product_type) {
      
        String sql = "update product set product_name = ? , product_type = ? where id = ?"; 
         jdbcTemplateObject.update(sql,product_name,product_type, product_id);
         System.out.println("Product Updated ::::" + product_id);
         
    }
    
    @Override
   public void insertcustomer(String customer_name, String customer_address){
   String sql = "INSERT INTO `customer`(`customer_name`, `customer_address`) VALUES (?,?)";
        jdbcTemplateObject.update(sql, customer_name, customer_address);
        System.out.println("Created Record::::" + customer_name);
   }
       
    @Override
   public List<customer> getCustomer() {
        
        List<customer> list = new ArrayList<customer>();
        list = jdbcTemplateObject.query("SELECT * FROM `customer`", new RowMapper<customer>() {
            @Override
            public customer mapRow(ResultSet rs, int rowNum) throws SQLException {
                customer c = new customer();

                c.setId(rs.getInt("id"));
                c.setCustomer_name(rs.getString("customer_name"));
                c.setCustomer_address(rs.getString("customer_address"));
                System.out.print("run list ");
                return c;

            }
        });

        return list;
    }
   
   @Override
    public void DeleteCustomer(String customer_id) {
        
        String sql = "DELETE FROM `customer` WHERE id = ?";
        jdbcTemplateObject.update(sql, customer_id);
          System.out.println("Product Deleted ::::" + customer_id);
    }
    
    @Override
    public void EditCustomer(String customer_id, String customer_name,String customer_address) {
      
        String sql = "update customer set customer_name = ? , customer_address = ? where id = ?"; 
         jdbcTemplateObject.update(sql,customer_name,customer_address, customer_id);
         System.out.println("Product Updated ::::" + customer_id);
         
    }
}
