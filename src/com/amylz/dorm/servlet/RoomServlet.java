package com.amylz.dorm.servlet;

import com.amylz.dorm.factory.ServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "roomServlet",urlPatterns = "/pages/back/room/RoomServlet/*")
public class RoomServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "/pages/errors.jsp"; // 定义错误页面
        String status = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
        if(status != null){
            if ("list".equals(status)){
               path = this.list(request);
            }else if("findRoomMembers".equals(status)){
                try {
                    path = this.findRoomMembers(request);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else if("listRank".equals(status)){
                path = this.listRank(request);
            }else if("Rank".equals(status)){
                try {
                    path = this.Rank(request);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else if("listAll".equals(status)){
                path = this.listAll(request);
            }else if("listRooms".equals(status)){
                path = this.listRooms(request);
            }
        }
        request.getRequestDispatcher(path).forward(request,response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    public String list(HttpServletRequest request) {
        try {
            request.setAttribute("allRooms", ServiceFactory.getIRoomServiceInstance().list());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/pages/back/room/room_list.jsp";
    }

   public String findRoomMembers(HttpServletRequest request) throws Exception {
        String rid = request.getQueryString().substring(request.getQueryString().lastIndexOf("=")+1);
        System.out.print(rid);

            request.setAttribute("allMembersInRoom", ServiceFactory.getIRoomServiceInstance().getAllMembers(rid));
            System.out.print(ServiceFactory.getIRoomServiceInstance().getAllMembers(rid));


        return "/pages/back/room/room_members.jsp";
   }

    public String listRank(HttpServletRequest request) {
        try {
            request.setAttribute("allRooms", ServiceFactory.getIRoomServiceInstance().list());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/pages/back/room/room_rank.jsp";
    }


    public String Rank(HttpServletRequest request) throws Exception {String result = request.getQueryString();
        String rid = result.substring(result.indexOf("=")+1,result.indexOf("&"));
        String tidy = result.substring(result.indexOf("y")+2,result.indexOf("y")+3);
        String safe = result.substring(result.lastIndexOf("=")+1);
        boolean flag = ServiceFactory.getIRoomServiceInstance().updateRank(Integer.parseInt(tidy),Integer.parseInt(safe),rid);
        System.out.print("flag="+flag);
        request.setAttribute("tidy",tidy);
        request.setAttribute("safe",safe);
        request.setAttribute("rid",rid);
        return "/pages/back/room/room_result.jsp";

    }

    public String listAll(HttpServletRequest request) {
        try {
            request.setAttribute("allRooms", ServiceFactory.getIRoomServiceInstance().list());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/pages/back/room/rank_result.jsp";
    }

    public String listRooms(HttpServletRequest request) {
        try {
            request.setAttribute("allRooms", ServiceFactory.getIRoomServiceInstance().list());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/pages/back/member/member_insert.jsp";
    }

}
