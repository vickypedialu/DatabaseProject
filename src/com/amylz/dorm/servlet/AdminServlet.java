package com.amylz.dorm.servlet;

import com.amylz.dorm.Admin;
import com.amylz.dorm.factory.ServiceFactory;
import com.amylz.util.MD5Code;
import com.amylz.util.validate.ValidateUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.Date;
/**
 * Created by amylz on 2017/5/21.
 */
@WebServlet(name="adminServlet",urlPatterns="/pages/back/AdminServlet/*")

public class AdminServlet extends HttpServlet{

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        String path = "/pages/errors.jsp";  //错误页面
        String status = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);   //截取最后一个字符串
        if(status != null){
            if(status.equals("login")){
                path = this.login(request);
            }else if("logout".equals(status)){
                path = this.logout(request);
            }else if("reg".equals(status)){
                path  =this.reg(request);
            }
        }
        request.getRequestDispatcher(path).forward(request,response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        this.doGet(request, response);
    }

    public String reg(HttpServletRequest request) {
        String msg = "";
        String aid = request.getParameter("aid");
        String password = request.getParameter("password");
        if (ValidateUtils.validateEmpty(aid) && ValidateUtils.validateEmpty(password)){
            Admin vo = new Admin();
            vo.setAid(aid);
            vo.setPassword(new MD5Code().getMD5ofStr(password+aid)); // 需要加盐处理
            System.out.print(vo.getPassword());
            vo.setLastdate(new Date());
            vo.setStatus(1); // 默认激活
            try {
                if (ServiceFactory.getIAdminServiceInstance().insert(vo)){
                    msg = "管理员注册成功！";
                }else{
                    msg = "管理员注册失败！";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            msg = "数据不能为空！";
        }
        request.setAttribute("msg",msg);
        request.setAttribute("url","/pages/back/admin/admin_insert.jsp");
        return "/pages/forward.jsp";
    }

    public String logout(HttpServletRequest request) {
        request.getSession().invalidate(); // 表示session失效
        request.setAttribute("msg", "你已经成功退出系统，请重新登录！");
        request.setAttribute("url","/login.jsp");
        return "/pages/forward.jsp";
    }

    public String login(HttpServletRequest request) {
        String msg = "";    // 表示提示信息
        String url = "";    // 表示跳转路径
        String aid = request.getParameter("aid");
        String password = request.getParameter("password");
        if(ValidateUtils.validateEmpty(aid) && ValidateUtils.validateEmpty(password)){
            Admin vo = new Admin();
            vo.setAid(aid);
            vo.setPassword(new MD5Code().getMD5ofStr(password+aid));   //加密
     //       System.out.print(vo.getPassword());
            try {
                if (ServiceFactory.getIAdminServiceInstance().login(vo)) {
                    request.getSession().setAttribute("aid",aid);
                    request.getSession().setAttribute("lastdate",vo.getLastdate());
                    msg = "登录成功！";
                    url = "/pages/back/index.jsp";

                } else {
                    msg = "登录失败，错误的用户ID或密码";
                    url = "/login.jsp";

                }
            }catch (Exception e){
                e.printStackTrace();
            }

        }else{
            msg = "数据不能为空";
            url = "/login.jsp";
        }

        request.setAttribute("msg",msg);
        request.setAttribute("url",url);
        return "/pages/forward.jsp";
    }



}
