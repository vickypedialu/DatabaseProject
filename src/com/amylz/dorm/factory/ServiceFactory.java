package com.amylz.dorm.factory;

import com.amylz.dorm.service.*;
import com.amylz.dorm.service.impl.*;

/**
 * Created by amylz on 2017/5/21.
 */
public class ServiceFactory {
    public static IAdminService getIAdminServiceInstance(){
        return new AdminServiceImpl();
    }

    public static IMemberService getIMemberServiceInstance(){
        return new MemberServiceImpl();
    }
    public static IItemService getIItemServiceIntance(){
        return new ItemServiceImpl();
    }

    public static IServicesService getIServicesServiceInstance(){
        return new ServicesServiceImpl();
    }

    public static IGetservService getIGetservServiceInstance(){
        return new GetservServiceImpl();
    }
    public static IRoomService getIRoomServiceInstance() {return new RoomServiceImpl();}
}
