/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DbTable;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author parth
 */
public class ProductController extends AbstractController {

    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
        DbTable product = (DbTable) context.getBean("DbTable");
        ModelAndView model = new ModelAndView("Addproduct");
        HttpSession session = request.getSession();

        String product_type = request.getParameter("producttype");
        String product_name = request.getParameter("productname");

        if (product_type == null || product_name == null) {

            return model;
        } else {
            product.insertproduct(product_type, product_name);
            session.setAttribute("successmsg", "Product Added Successfully");
            return model;
        }

    }
}
