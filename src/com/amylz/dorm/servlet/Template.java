package com.amylz.dorm.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by amylz on 2017/5/21.
 */
@WebServlet(name="adminServlet",urlPatterns="/pages/back/AdminServlet/*")
public class Template extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        super.doGet(request, response);
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        String path = "/pages/errors.jsp";  //错误页面
        String status = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);   //截取最后一个字符串
        if (status != null) {
            if ("login".equals(status)) {
                //     path = this.login(request);
            }
        }
        request.getRequestDispatcher(path).forward(request, response);
    }


}


