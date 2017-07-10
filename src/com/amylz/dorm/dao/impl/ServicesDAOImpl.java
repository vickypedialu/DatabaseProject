package com.amylz.dorm.dao.impl;

import com.amylz.dorm.Admin;
import com.amylz.dorm.Item;
import com.amylz.dorm.Services;
import com.amylz.dorm.dao.IServicesDAO;
import com.amylz.util.AbstractDAOImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by amylz on 2017/5/23.
 */
public class ServicesDAOImpl extends AbstractDAOImpl implements IServicesDAO {
    public ServicesDAOImpl(Connection conn) {
        super(conn);
    }

    @Override
    public boolean doCreate(Services vo) throws SQLException {
        String sql = "INSERT INTO services(iid,aid,name,credate,status,note)VALUES(?,?,?,?,?,?)";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setInt(1,vo.getItem().getIid());
        super.pstmt.setString(2,vo.getAdmin().getAid());
        super.pstmt.setString(3,vo.getName());
        super.pstmt.setTimestamp(4, new Timestamp(vo.getCredate().getTime()));
        super.pstmt.setInt(5,vo.getStatus());
        super.pstmt.setString(6,vo.getNote());
        return super.pstmt.executeUpdate() > 0;
    }

    @Override
    public boolean doUpdate(Services vo) throws SQLException {
        return false;
    }

    @Override
    public boolean doRemove(Integer id) throws SQLException {
        return false;
    }

    @Override
    public Services findById(Integer id) throws SQLException {
        return null;
    }

    @Override
    public List<Services> findAll() throws SQLException {
        List<Services> all = new ArrayList<Services>();
        String sql ="SELECT sid,iid,aid,name,credate,status,note FROM services";
        super.pstmt = super.conn.prepareStatement(sql);
        ResultSet rs = super.pstmt.executeQuery();
        while (rs.next()){
            Services vo = new Services();
            vo.setSid(rs.getInt(1));
            Item item = new Item();
            item.setIid(rs.getInt(2));
            vo.setItem(item);
            Admin admin = new Admin();
            admin.setAid(rs.getString(3));
            vo.setAdmin(admin);
            vo.setName(rs.getString(4));
            vo.setCredate(rs.getDate(5));
            vo.setStatus(rs.getInt(6));
            vo.setNote(rs.getString(7));
            all.add(vo);
        }
        return all;
    }

    @Override
    public List<Services> findALLBySplit(String column, String keyword, Integer currentpage, Integer linesize) throws SQLException {
        List<Services> all = new ArrayList<Services>();
        String sql = " SELECT s.sid,s.name,s.credate,s.status,a.aid,i.name " +
                " FROM services s,admin a ,item i " +
                " WHERE s.iid= i.iid AND s.aid = a.aid AND s."+ column +" LIKE  ?  LIMIT ?,? ";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,"%"+keyword+"%");
        super.pstmt.setInt(2,(currentpage -1) *linesize);
        super.pstmt.setInt(3,linesize);
        ResultSet rs = super.pstmt.executeQuery();
        while (rs.next()){
            Services vo = new Services();
            vo.setSid(rs.getInt(1));
            vo.setName(rs.getString(2));
            vo.setCredate(rs.getDate(3));
            vo.setStatus(rs.getInt(4));
            Admin admin = new Admin();
            admin.setAid(rs.getString(5));
            vo.setAdmin(admin);
            Item item = new Item();
            item.setName(rs.getString(6));
            vo.setItem(item);
            all.add(vo);
        }
        return all;
    }

    @Override
    public Integer getAllCount(String column, String keyword) throws SQLException {
        String sql = "SELECT COUNT(*) FROM services WHERE "+column +" LIKE ?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,"%"+keyword+"%");
        ResultSet rs = super.pstmt.executeQuery();
        if (rs.next()){
            return rs.getInt(1);
        }
        return 0;
    }
}
