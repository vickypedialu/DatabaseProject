package com.amylz.dorm.dao.impl;

import com.amylz.dorm.Member;
import com.amylz.dorm.Room;
import com.amylz.dorm.dao.IMemberDAO;
import com.amylz.dorm.dao.IRoomDAO;
import com.amylz.util.AbstractDAOImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by amylz on 2017/5/21.
 */
public class RoomDAOImpl extends AbstractDAOImpl implements IRoomDAO{
    public RoomDAOImpl(Connection conn){super(conn);}

    @Override
    public boolean doCreate(Room vo) throws SQLException {
        String sql  = "INSERT INTO room(rid) VALUES(?)";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,vo.getRid());
        return super.pstmt.executeUpdate() > 0;
    }

    @Override
    public boolean doUpdate(Room vo) throws SQLException {
        return false;
    }

    @Override
    public boolean doRemove(String id) throws SQLException {
        return false;
    }

    @Override
    public Room findById(String rid) throws SQLException {
        return null;
    }

    @Override
    public List<Member> findAllMembers(String id) throws SQLException{
        List<Member> all = new ArrayList<Member>();
        String sql = "SELECT m.mid,m.name,m.EntryYear,m.sex,m.phone FROM member m WHERE m.rid = ?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,id);
    //    System.out.print("id="+id);
        ResultSet rs = super.pstmt.executeQuery();
        while(rs.next()){
            Member vo = new Member();
            vo.setMid(rs.getString(1));
            vo.setName(rs.getString(2));
            vo.setEntryYear(rs.getString(3));
            vo.setSex(rs.getInt(4));
            vo.setPhone(rs.getString(5));
            all.add(vo);
            System.out.print("mid="+vo.getMid());
        }
        return all;
    }

    @Override
    public List<Room> findAll() throws SQLException {
        List<Room> all = new ArrayList<Room>();
        String sql = "SELECT rid,tidy,safe FROM room";
        super.pstmt = super.conn.prepareStatement(sql);
        ResultSet rs = super.pstmt.executeQuery();
        while (rs.next()){
            Room vo = new Room();
            vo.setRid(rs.getString(1));
            vo.setTidy(rs.getInt(2));
            vo.setSafe(rs.getInt(3));
            all.add(vo);
        }
        return all;
    }

    @Override
    public List<Room> findALLBySplit(String column, String keyword, Integer currentpage, Integer linesize) throws SQLException {
        return null;
    }

    @Override
    public Integer getAllCount(String column, String keyword) throws SQLException {
        return null;
    }

    @Override
    public boolean updateRank(String id,int tidy,int safe) throws SQLException{
        String sql = "UPDATE room SET tidy = ?,safe = ? WHERE rid = ?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setInt(1,tidy);
        super.pstmt.setInt(2,safe);
        super.pstmt.setString(3,id);
        return pstmt.executeUpdate() > 0;
    }



}
