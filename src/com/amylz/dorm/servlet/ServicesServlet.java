package com.amylz.dorm.servlet;

import com.amylz.dorm.Admin;
import com.amylz.dorm.Item;
import com.amylz.dorm.Services;
import com.amylz.dorm.factory.ServiceFactory;
import com.amylz.util.validate.ValidateUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "servicesServlet",urlPatterns = "/pages/back/services/ServicesServlet/*")
public class ServicesServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "/pages/errors.jsp"; // 定义错误页面
        String status = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
        if(status != null){
            if ("insertPro".equals(status)){
                path = this.insertPro(request);
            }else if("insert".equals(status)){
                //System.out.println(path);
                path = this.insert(request,response);
            }else if("listSplit".equals(status)){
                path = this.listSplit(request,response);
            }
        }
        request.getRequestDispatcher(path).forward(request,response);
    }

    public String listSplit(HttpServletRequest request, HttpServletResponse response) {
        int currentPage = 1;
        int lineSize = 6;
        try {
            currentPage = Integer.parseInt(request.getParameter("cp"));
        }catch (Exception e){}
        try {
             lineSize = Integer.parseInt(request.getParameter("ls"));
        }catch (Exception e){}
        String keyWord = request.getParameter("kw");
        String column = request.getParameter("col");
        if(keyWord == null){
            keyWord = "";
        }
        if (column == null){
            column = "name";
        }

        try {
            Map<String,Object> map = ServiceFactory.getIServicesServiceInstance().listBySplit(column,keyWord,currentPage,lineSize);
            request.setAttribute("allServices",map.get("allServices"));
            request.setAttribute("allRecorders",map.get("allCounts"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("url","/pages/back/services/ServicesServlet/listSplit");
        request.setAttribute("currentPage",currentPage);
        request.setAttribute("lineSize",lineSize);
        return "/pages/back/services/services_list.jsp";
    }

    public  String insert(HttpServletRequest request, HttpServletResponse response) {
        // msg url ;
        String msg = "";
        String url = "";
        // 取得页面中的数据
        String name = request.getParameter("name");
        String aid = request.getParameter("aid");
        Integer iid = Integer.parseInt(request.getParameter("iid"));
        String note = request.getParameter("note");
        // 判断数据是否为空
        if(ValidateUtils.validateEmpty(name) && ValidateUtils.validateEmpty(aid)){
            Services vo = new Services();
            vo.setName(name);
            Admin admin = new Admin();
            admin.setAid(aid);
            vo.setAdmin(admin);
            Item item = new Item();
            item.setIid(iid);
            vo.setItem(item);
            vo.setCredate(new Date());
            vo.setStatus(1);
            vo.setNote(note);
            try {
                if (ServiceFactory.getIServicesServiceInstance().insert(vo)){
                    msg = "数据已经增加成功！";
                    url = "/pages/back/services/ServicesServlet/insertPro";
                }else{
                    msg = "你输入的信息有误，请重新输入";
                    url = "/pages/back/services/ServicesServlet/insertPro";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            msg = "你输入的内容为空，请重新输入";
            url = "/pages/back/services/ServicesServlet/insertPro";
        }
        request.setAttribute("msg",msg);
        request.setAttribute("url",url);
        return "/pages/forward.jsp";
    }

    public String insertPro(HttpServletRequest request)  {
        Map<String,Object> map = null;
        try {
            map = ServiceFactory.getIServicesServiceInstance().findByAdminAndItem();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("allItems",map.get("allItems"));
        request.setAttribute("allAdmins",map.get("allAdmins"));
        return "/pages/back/services/services_insert.jsp";
    }
}
