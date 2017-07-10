package com.amylz.dorm.service.impl;

import com.amylz.dorm.Item;
import com.amylz.dorm.Member;
import com.amylz.dorm.Room;
import com.amylz.dorm.dbc.DBConn;
import com.amylz.dorm.factory.DAOFactory;
import com.amylz.dorm.service.IRoomService;

import java.util.List;

/**
 * Created by amylz on 2017/6/1.
 */
public class RoomServiceImpl implements IRoomService {
    private DBConn dbc = new DBConn();

    @Override
    public List<Room> list() throws Exception {
        try{
            return DAOFactory.getIRoomDAOIntance(this.dbc.getConn()).findAll();
        }catch (Exception e){
            throw e;
        }finally {
            this.dbc.close();
        }
    }

    @Override
    public List<Member> getAllMembers(String id) throws Exception {
        try{
            return DAOFactory.getIRoomDAOIntance(this.dbc.getConn()).findAllMembers(id);
        }catch (Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
    }
    @Override
    public boolean updateRank(Integer tidy, Integer safe,String id) throws Exception {
        try{
            DAOFactory.getIRoomDAOIntance(this.dbc.getConn()).updateRank(id,tidy,safe);

        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return false;
    }
}
