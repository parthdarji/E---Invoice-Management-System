/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DbTable;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author parth
 */
public class EditProductControlle extends AbstractController {

    public EditProductControlle() {
    }

    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        String product_id = request.getParameter("product_id");
        String product_name = request.getParameter("productname");
        String product_type = request.getParameter("producttype");
        System.out.println("Prdouct id:::::: " + product_name);

        ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");

        HttpSession session = request.getSession();

        DbTable Edit_product = (DbTable) context.getBean("DbTable");
        DbTable productMng = (DbTable) context.getBean("DbTable");

        Edit_product.EditProduct(product_id, product_name, product_type);

        ModelAndView model = new ModelAndView("EditProduct");

        session.setAttribute("successmsg", "Product Updated Successfully");

        model.addObject("list", productMng.getProduct());
        return model;
    }

}
