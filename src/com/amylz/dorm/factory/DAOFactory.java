package com.amylz.dorm.factory;

import com.amylz.dorm.dao.*;
import com.amylz.dorm.dao.impl.*;

import java.sql.Connection;

/**
 * Created by amylz on 2017/5/21.
 */
public class DAOFactory {
    public static IAdminDAO getIAdminDAOInstance(Connection conn){
        return new AdminDAOImpl(conn);
    }
    public static IMemberDAO getIMemberDAOInstance(Connection conn){
        return new MemberDAOImpl(conn);
    }
    public static IItemDAO getIItemDAOInstance(Connection conn){
        return  new ItemDAOImpl(conn);
    }
    public static IServicesDAO getIServicesDAOInstance(Connection conn) {
        return new ServicesDAOImpl(conn);
    }
    public static IGetservDAO getIGetservDAOIntance(Connection conn){
        return new GetservDAOImpl(conn);
    }
    public static IRoomDAO getIRoomDAOIntance(Connection conn){
        return new RoomDAOImpl(conn);
    }

}
