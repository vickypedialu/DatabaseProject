package com.amylz.dorm.service;

import com.amylz.dorm.Admin;

import java.sql.SQLException;

/**
 * Created by amylz on 2017/5/21.
 */
public interface IAdminService {
    /**
     * 实现管理员登录检查操作，调用IAdminDAO接口中的findLogin方法
     * @param vo
     * @return
     * @throws Exception
     */
    public boolean login(Admin vo) throws Exception;

    /**
     *
     * @param vo
     * @return
     * @throws Exception
     */
    public boolean insert(Admin vo)throws Exception;

}
