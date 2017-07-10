package com.amylz.dorm.dao.impl;

import com.amylz.dorm.Item;
import com.amylz.dorm.dao.IItemDAO;
import com.amylz.util.AbstractDAOImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class ItemDAOImpl extends AbstractDAOImpl implements IItemDAO {
    public ItemDAOImpl(Connection conn) {
        super(conn);
    }

    @Override
    public boolean doCreate(Item vo) throws SQLException {
        String sql  = "INSERT INTO item(name,note) VALUES(?,?)";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,vo.getName());
        super.pstmt.setString(2,vo.getNote());
        return super.pstmt.executeUpdate() > 0;
    }

    @Override
    public boolean doUpdate(Item vo) throws SQLException {
        return false;
    }

    @Override
    public boolean doRemove(Integer id) throws SQLException {
        return false;
    }

    @Override
    public Item findById(Integer id) throws SQLException {
        Item vo = null;
        String sql = "SELECT iid ,name,note FROM item WHERE iid=?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setInt(1,id);
        ResultSet rs = super.pstmt.executeQuery();
        if (rs.next()){
            vo = new Item();
            vo.setIid(rs.getInt(1));
            vo.setName(rs.getString(2));
            vo.setNote(rs.getString(3));
        }
        return vo;
    }

    @Override
    public List<Item> findAll() throws SQLException {
        List<Item> all = new ArrayList<Item>();
        String sql = "SELECT iid ,name,note FROM item";
        super.pstmt = super.conn.prepareStatement(sql);
        ResultSet rs = super.pstmt.executeQuery();
        while (rs.next()){
            Item vo = new Item();
            vo.setIid(rs.getInt(1));
            vo.setName(rs.getString(2));
            vo.setNote(rs.getString(3));
            all.add(vo);
        }
        return all;
    }

    @Override
    public List<Item> findALLBySplit(String column, String keyword, Integer currentpage, Integer linesize) throws SQLException {
        return null;
    }


    @Override
    public Integer getAllCount(String column, String keyWord) throws SQLException {
        return null;
    }
}
