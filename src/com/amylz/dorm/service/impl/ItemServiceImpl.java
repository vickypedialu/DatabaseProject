package com.amylz.dorm.service.impl;


import com.amylz.dorm.Item;
import com.amylz.dorm.dbc.DBConn;
import com.amylz.dorm.factory.DAOFactory;
import com.amylz.dorm.service.IItemService;

import java.util.List;

public class ItemServiceImpl implements IItemService {
    private DBConn dbc = new DBConn();
    @Override
    public boolean insert(Item vo) throws Exception {
        try{
            return DAOFactory.getIItemDAOInstance(this.dbc.getConn()).doCreate(vo);
        }catch (Exception e){
            throw e;
        }finally {
            this.dbc.close();
        }
    }

    @Override
    public List<Item> list() throws Exception {
        try{
            return DAOFactory.getIItemDAOInstance(this.dbc.getConn()).findAll();
        }catch (Exception e){
            throw e;
        }finally {
            this.dbc.close();
        }
    }
}
