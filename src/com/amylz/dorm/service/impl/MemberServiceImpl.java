package com.amylz.dorm.service.impl;

import com.amylz.dorm.Member;
import com.amylz.dorm.dbc.DBConn;
import com.amylz.dorm.factory.DAOFactory;
import com.amylz.dorm.service.IMemberService;

import java.util.*;

/**
 * Created by amylz on 2017/5/21.
 */
public class MemberServiceImpl implements IMemberService{
    private DBConn dbc = new DBConn();
    @Override
    public boolean insert(Member vo) throws Exception {
        try{
            //表示mid数据不存在
            if(DAOFactory.getIMemberDAOInstance(this.dbc.getConn()).findById(vo.getMid()) == null){
                return DAOFactory.getIMemberDAOInstance(this.dbc.getConn()).doCreate(vo);
            }
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return false;
    }
    public Member search(String id) throws Exception {
        Member rs = null;
        try{
            rs = (DAOFactory.getIMemberDAOInstance(this.dbc.getConn()).findById(id));
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return rs;
    }
    public boolean delete(String id) throws Exception {
    //    Iterator<String> it = ids.iterator();
        try {
      //      while (it.hasNext()) {
        //        String id = it.next();
                if ((DAOFactory.getIMemberDAOInstance(this.dbc.getConn()).findById(id)) != null) {
                    return DAOFactory.getIMemberDAOInstance(this.dbc.getConn()).doRemove(id);
         //       }
            }
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return false;
    }

    @Override
    public List<Member> list() throws Exception {
        try{
            return DAOFactory.getIMemberDAOInstance(this.dbc.getConn()).findAll();
        }catch (Exception e){
            throw e;
        }finally {
            this.dbc.close();
        }
    }



}

