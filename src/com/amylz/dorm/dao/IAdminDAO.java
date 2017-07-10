package com.amylz.dorm.dao;

import com.amylz.dorm.Admin;

import java.sql.SQLException;
import java.util.Date;

/**
 * Created by amylz on 2017/5/21.
 */
public interface IAdminDAO extends IDAO<String,Admin>{

    /**
     * 实现用户登录检查操作
     *
     */
    public boolean findLogin(Admin vo)throws SQLException;

    /**
     * 实现用户数据更新操作
     * @param aid
     * @return
     * @throws SQLException
     */
    public boolean doUpdateByLastDate(String aid)throws SQLException;
}
