package com.amylz.dorm.dao.impl;

import com.amylz.dorm.Admin;
import com.amylz.dorm.dao.IAdminDAO;
import com.amylz.util.AbstractDAOImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * Created by amylz on 2017/5/21.
 */
public class AdminDAOImpl extends AbstractDAOImpl implements IAdminDAO {
    public AdminDAOImpl(Connection conn){
        super(conn);
    }
    @Override
    public boolean findLogin(Admin vo) throws SQLException{
        boolean flag = false;
        String sql = "SELECT lastdate FROM admin WHERE aid=? AND password =?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,vo.getAid());
        super.pstmt.setString(2,vo.getPassword());
        ResultSet rs = super.pstmt.executeQuery();
        if(rs.next()){
            flag = true;
            vo.setLastdate(rs.getTimestamp(1));
        }
        return flag;
    }
    @Override
    public boolean doUpdateByLastDate(String aid) throws SQLException{
        String sql = "UPDATE admin SET lastdate=? WHERE aid=?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(2,aid);
        super.pstmt.setTimestamp(1,new Timestamp(new Date().getTime()));   // 最后一次登录日期
        return super.pstmt.executeUpdate() > 0;
    }


    @Override
    public boolean doCreate(Admin vo) throws SQLException {
        String sql = "INSERT INTO admin(aid,password,lastdate,status) VALUES(?,?,?,?)";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,vo.getAid());
        super.pstmt.setString(2,vo.getPassword());
        super.pstmt.setTimestamp(3,new Timestamp(vo.getLastdate().getTime()));
        super.pstmt.setInt(4,vo.getStatus());
        return super.pstmt.executeUpdate() > 0;
    }

    @Override
    public boolean doUpdate(Admin vo) throws SQLException {
        return false;
    }

    @Override
    public boolean doRemove(String id) throws SQLException {
        return false;
    }

    @Override
    public Admin findById(String id) throws SQLException {
        Admin vo = null;
        String sql = "SELECT aid,password,lastdate,status,flag FROM admin WHERE aid=?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,id);
        ResultSet rs = super.pstmt.executeQuery();
        if (rs.next()){
            vo = new Admin();
            vo.setAid(rs.getString(1));
            vo.setPassword(rs.getString(2));
            vo.setLastdate(rs.getTimestamp(3));
            vo.setStatus(rs.getInt(4));
            vo.setFlag(rs.getInt(5));
        }
        return vo;
    }

    @Override
    public List<Admin> findAll() throws SQLException {
        List<Admin> all = new ArrayList<Admin>();
        String sql = "SELECT aid,password,lastdate,flag,status FROM admin";
        super.pstmt = super.conn.prepareStatement(sql);
        ResultSet rs = super.pstmt.executeQuery();
        while (rs.next()){
            Admin vo = new Admin();
            vo.setAid(rs.getString(1));
            vo.setPassword(rs.getString(2));
            vo.setLastdate(rs.getDate(3));
            vo.setFlag(rs.getInt(4));
            vo.setStatus(rs.getInt(5));
            all.add(vo);
        }
        return all;
    }

    @Override
    public List<Admin> findALLBySplit(String column, String keyword, Integer currentpage, Integer linesize) throws SQLException {
        return null;
    }

    @Override
    public Integer getAllCount(String column, String keyword) throws SQLException {
        return null;
    }
}
