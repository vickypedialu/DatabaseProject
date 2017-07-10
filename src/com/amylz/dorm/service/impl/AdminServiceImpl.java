package com.amylz.dorm.service.impl;

import com.amylz.dorm.Admin;
import com.amylz.dorm.dao.IAdminDAO;
import com.amylz.dorm.dbc.DBConn;
import com.amylz.dorm.factory.DAOFactory;
import com.amylz.dorm.service.IAdminService;

import java.sql.SQLException;

/**
 * Created by amylz on 2017/5/21.
 */
public class AdminServiceImpl implements IAdminService {
    private DBConn dbc = new DBConn();
    @Override
    public boolean login(Admin vo) throws Exception {
        try{
            if(DAOFactory.getIAdminDAOInstance(this.dbc.getConn()).findLogin(vo)) {
                return DAOFactory.getIAdminDAOInstance(this.dbc.getConn()).doUpdateByLastDate(vo.getAid());
            }
            return false;
        }catch (Exception e){
            throw e;
        }finally {
            this.dbc.close();
        }
    }

    @Override
    public boolean insert(Admin vo) throws Exception {
        try{
            if(DAOFactory.getIAdminDAOInstance(this.dbc.getConn()).findById(vo.getAid()) == null){
                return DAOFactory.getIAdminDAOInstance(this.dbc.getConn()).doCreate(vo);
            }
            return false;
        }catch (Exception e){
            throw e;
        }finally {
            this.dbc.close();
        }    }

}
