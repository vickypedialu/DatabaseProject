package com.amylz.dorm.servlet;

import com.amylz.dorm.Member;
import com.amylz.dorm.Getserv;
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
import java.util.Map;

@WebServlet(name = "GetservServlet",urlPatterns = "/pages/back/getserv/GetservServlet/*")
public class GetservServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "/pages/errors.jsp"; // 定义错误页面
        String status = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
        if(status != null){
            if ("insert".equals(status)){
               path = this.insert(request);
            }else if("insertPro".equals(status)){
                path = this.insertPro(request);
            }else if("listSplit".equals(status)){
                path = this.listSplit(request);
            }else if("updateByFindate".equals(status)){
                path = this.updateByFindate(request);
            }

        }
        request.getRequestDispatcher(path).forward(request,response);
    }
    public String updateByFindate(HttpServletRequest request) {
        String msg = "";
        // 接收参数
        int gid = Integer.parseInt(request.getParameter("gid"));
        try {
            if(ServiceFactory.getIGetservServiceInstance().updateByFindate(gid)){
                msg = "登记成功!";
            }else {
                msg = "数据错误，登记失败!";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("msg",msg);
        request.setAttribute("url","/pages/back/getserv/GetservServlet/listSplit");
        return "/pages/forward.jsp";
    }

    public String listSplit(HttpServletRequest request) {
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
            column = "gid";
        }

        try {
            Map<String,Object> map = ServiceFactory.getIGetservServiceInstance().listBySplit(column,keyWord,currentPage,lineSize);
            request.setAttribute("allGetservs",map.get("allGetservs"));
            request.setAttribute("allRecorders",map.get("allGetservCounts"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("url","/pages/back/getserv/GetservServlet/listSplit");
        request.setAttribute("currentPage",currentPage);
        request.setAttribute("lineSize",lineSize);
        return "/pages/back/getserv/getserv_list.jsp";
    }

    public String insertPro(HttpServletRequest request) {
        try {
            Map<String,Object> map = ServiceFactory.getIGetservServiceInstance().listByMemberAndServices();
            request.setAttribute("allMembers",map.get("allMembers"));
            request.setAttribute("allServices",map.get("allServices"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/pages/back/getserv/getserv_insert.jsp";
    }

    public String insert(HttpServletRequest request) {
        String msg = "";
        String url = "";
        // 接收参数
        int sid = Integer.parseInt(request.getParameter("sid"));
        String mid = request.getParameter("mid");
        if (ValidateUtils.validateEmpty(mid)){
            Getserv vo = new Getserv();
            Services services = new Services();
            services.setSid(sid);
            vo.setServices(services); // 设置图书编号
            Member member = new Member();
            member.setMid(mid);
            vo.setMember(member); // 设置用户信息
            vo.setCredate(new Date()); // 表示当前日期
            try {
                if (ServiceFactory.getIGetservServiceInstance().insert(vo)){
                    msg = "数据增加成功！";
                }else {
                    msg = "数据增加失败，请重新增加!";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            msg = "输入的内容不允许为空!";
        }
        request.setAttribute("msg",msg);
        request.setAttribute("url","/pages/back/getserv/GetservServlet/insertPro");
        return "/pages/forward.jsp";
    }
}
