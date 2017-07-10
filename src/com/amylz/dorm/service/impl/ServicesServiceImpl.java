package com.amylz.dorm.service.impl;

import com.amylz.dorm.Services;
import com.amylz.dorm.dbc.DBConn;
import com.amylz.dorm.factory.DAOFactory;
import com.amylz.dorm.service.IServicesService;

import java.util.HashMap;
import java.util.Map;

public class ServicesServiceImpl implements IServicesService {
    private DBConn dbc  = new DBConn();

    @Override
    public boolean insert(Services vo) throws Exception {
        try{
            return DAOFactory.getIServicesDAOInstance(this.dbc.getConn()).doCreate(vo);
        }catch (Exception e){
            throw e;
        }finally {
            this.dbc.close();
        }
    }

    @Override
    public Map<String, Object> findByAdminAndItem() throws Exception {
        try{
           Map<String,Object> map = new HashMap<String, Object>();
            map.put("allAdmins" ,DAOFactory.getIAdminDAOInstance(this.dbc.getConn()).findAll());
            map.put("allItems",DAOFactory.getIItemDAOInstance(this.dbc.getConn()).findAll());
            return map;
        }catch (Exception e){
            throw e;
        }finally {
            this.dbc.close();
        }
    }

    @Override
    public Map<String, Object> listBySplit(String column, String keyWord, int currentPage, int lineSize) throws Exception {
        try{
            Map<String,Object> map = new HashMap<String, Object>();
            map.put("allServices" ,DAOFactory.getIServicesDAOInstance(this.dbc.getConn()).findALLBySplit(column,keyWord,currentPage,lineSize));
            map.put("allCounts",DAOFactory.getIServicesDAOInstance(this.dbc.getConn()).getAllCount(column,keyWord));
            return map;
        }catch (Exception e){
            throw e;
        }finally {
            this.dbc.close();
        }
    }
}
