package com.amylz.dorm.servlet;

import com.amylz.dorm.Member;
import com.amylz.dorm.dao.IMemberDAO;
import com.amylz.dorm.dbc.DBConn;
import com.amylz.dorm.factory.ServiceFactory;
import com.amylz.util.validate.ValidateUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Created by amylz on 2017/5/21.
 */
@WebServlet(name="memberServlet",urlPatterns="/pages/back/member/MemberServlet/*")
public class MemberServlet extends HttpServlet{

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        String path = "/pages/errors.jsp";  //错误页面
        String status = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);   //截取最后一个字符串
        if (status != null) {
            if ("insert".equals(status)) {
                try {
                    path = this.insert(request);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else if("list".equals(status)){
                path = this.list(request);
            }else if("search".equals(status)){
                try{
                    path = this.search(request);
                }catch(Exception e){
                    e.printStackTrace();
                }
            }else if("delete".equals(status)){
                try {
                    path = this.delete(request);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else if("listRank".equals(status)){
                try {
                    path = this.listRank(request);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else if("Rank".equals(status)){
                try {
                    path = this.Rank(request);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        request.getRequestDispatcher(path).forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        this.doGet(request, response);
    }

    public String insert(HttpServletRequest request) throws Exception {
        String url = "";
        String msg = "";

        String mid = request.getParameter("mid");
        String name = request.getParameter("name");
        String EntryYear = request.getParameter("EntryYear");
        int sex = Integer.parseInt(request.getParameter("sex"));
        String phone = request.getParameter("phone");
        String rid = request.getParameter("rid");
        if(ValidateUtils.validateEmpty(mid) &&
                ValidateUtils.validateEmpty(name)){
            Member vo = new Member();
            vo.setMid(mid);
            vo.setName(name);
            vo.setEntryYear(EntryYear);
            vo.setSex(sex);
            vo.setPhone(phone);
            vo.setRid(rid);
            try {
                if (ServiceFactory.getIMemberServiceInstance().insert(vo)) {
                    url = "/pages/back/member/member_insert.jsp";
                    msg = "学生数据增加成功";
                } else {
                    url = "/pages/back/member/member_insert.jsp";
                    msg = "学生数据增加失败";
                }
            }catch(Exception e){
                e.printStackTrace();
            }

        }else{
            url = "/pages/back/member/member_insert.jsp";
            msg = "数据不能为空";
        }
        request.setAttribute("msg",msg);
        request.setAttribute("url",url);
        return "/pages/forward.jsp";
    }

    public String search(HttpServletRequest request) throws Exception {
        String url = "";
        String msg = "";
        String mid = request.getParameter("mid");
        System.out.print(mid);
        if(ValidateUtils.validateEmpty(mid)) {
            try {
                Member res = ServiceFactory.getIMemberServiceInstance().search(mid);
                if (res != null) {
                    request.setAttribute("result",res);
                    return url =   "/pages/back/member/search_result.jsp";
                   // msg = "搜索到1处学生数据";
                } else {
                    url = "/pages/back/member/search_member.jsp";
                    msg = "未找到相关学生数据";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else{
            url = "/pages/back/member/search_member.jsp";
            msg = "数据不能为空";
        }

        request.setAttribute("msg",msg);
        request.setAttribute("url",url);
        return "/pages/forward.jsp";
    }

    public String delete(HttpServletRequest request) throws Exception {
        String url = "";
        String msg = "";

        String ids[]  = request.getParameterValues("box");
        if(ids != null){
            boolean flag = false;

            for(int i = 0;i < ids.length; i++) {//循环删除被选中的数据
               System.out.print(ids[i]);
               flag = ServiceFactory.getIMemberServiceInstance().delete(ids[i]);
            }
          //  System.out.print(flag);
          //  String sql = "DELETE member WHERE mid in (" + mids + ")";
          //  DBConn conn = new DBConn();
          //  Statement stmt = conn.getConn().createStatement();
            if (flag == true) {
                    url = "/pages/back/member/MemberServlet/list";
                    msg = "学生数据删除成功";
                }
            else {
                    url = "/pages/back/member/MemberServlet/list";
                    msg = "学生数据删除失败";
                }
        }

        request.setAttribute("msg",msg);
        request.setAttribute("url",url);
        return "/pages/forward.jsp";
    }


    public String list(HttpServletRequest request) {
        try {
            request.setAttribute("allMembers", ServiceFactory.getIMemberServiceInstance().list());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/pages/back/member/member_list.jsp";
    }

    public String listRank(HttpServletRequest request) {
        try {
            request.setAttribute("allMembers", ServiceFactory.getIMemberServiceInstance().list());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/pages/back/member/member_rank.jsp";
    }

    public String Rank(HttpServletRequest request) throws Exception {String result = request.getQueryString();
       String mid = result.substring(result.indexOf("=")+1,result.indexOf("=")+2);
       String tidy = result.substring(result.indexOf("y")+2,result.indexOf("y")+3);
       String safe = result.substring(result.lastIndexOf("=")+1);
       System.out.print(mid);
       String name =  ServiceFactory.getIMemberServiceInstance().search(mid).getName();
       request.setAttribute("tidy",tidy);
       request.setAttribute("safe",safe);
       request.setAttribute("name",name);
       return "/pages/back/member/rank_result.jsp";


    }



}


