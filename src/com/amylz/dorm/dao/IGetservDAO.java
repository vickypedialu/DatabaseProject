package com.amylz.dorm.dao;

import com.amylz.dorm.Getserv;

import java.util.Date;
import java.sql.SQLException;

/**
 * Created by amylz on 2017/5/23.
 */
public interface IGetservDAO extends IDAO<Integer,Getserv> {

    public boolean doUpdateByfindate(Integer gid,Date findate)throws SQLException;
}
