package com.amylz.dorm.service.impl;



import com.amylz.dorm.Getserv;
import com.amylz.dorm.dbc.DBConn;
import com.amylz.dorm.factory.DAOFactory;
import com.amylz.dorm.service.IGetservService;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class GetservServiceImpl implements IGetservService {

    private DBConn dbc = new DBConn();
    @Override
    public boolean insert(Getserv vo) throws Exception {
        try{
            return DAOFactory.getIGetservDAOIntance(this.dbc.getConn()).doCreate(vo);
        }catch (Exception e){
            throw e;
        }
        finally {
            this.dbc.close();
        }
    }

    @Override
    public Map<String, Object> listByMemberAndServices() throws Exception {
        Map<String,Object> map  = new HashMap<String, Object>();
        try{
            map.put("allServices",DAOFactory.getIServicesDAOInstance(this.dbc.getConn()).findAll());
            map.put("allMembers",DAOFactory.getIMemberDAOInstance(this.dbc.getConn()).findAll());
            return map;
        }catch (Exception e){
            throw e;
        }
        finally {
            this.dbc.close();
        }
    }

    @Override
    public Map<String, Object> listBySplit(String column, String keyWord, int currentPage, int lineSize) throws Exception {
        try{
            Map<String,Object> map  = new HashMap<String, Object>();
            map.put("allGetservs",DAOFactory.getIGetservDAOIntance(this.dbc.getConn()).findALLBySplit(column,keyWord,currentPage,lineSize));
            map.put("allGetservCounts",DAOFactory.getIGetservDAOIntance(this.dbc.getConn()).getAllCount(column,keyWord));
            return map;
        }catch (Exception e){
            throw e;
        }
        finally {
            this.dbc.close();
        }
    }

    @Override
    public boolean updateByFindate(int gid) throws Exception {
        try{
            return DAOFactory.getIGetservDAOIntance(this.dbc.getConn()).doUpdateByfindate(gid,new Date());
        }catch (Exception e){
            throw e;
        }finally {
            this.dbc.close();
        }
    }
}
