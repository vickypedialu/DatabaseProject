package com.amylz.dorm.dao.impl;

import com.amylz.dorm.Member;
import com.amylz.dorm.dao.IMemberDAO;
import com.amylz.util.AbstractDAOImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Created by amylz on 2017/5/21.
 */
public class MemberDAOImpl extends AbstractDAOImpl implements IMemberDAO{
    public MemberDAOImpl(Connection conn){super(conn);}
    @Override
    public boolean doCreate(Member vo) throws SQLException {
        String sql = "INSERT INTO member(mid,name,EntryYear,sex,phone,rid) VALUES(?,?,?,?,?,?)";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,vo.getMid());
        super.pstmt.setString(2,vo.getName());
        super.pstmt.setString(3,vo.getEntryYear());
        super.pstmt.setInt(4,vo.getSex());
        super.pstmt.setString(5,vo.getPhone());
        super.pstmt.setString(6,vo.getRid());
        return super.pstmt.executeUpdate() > 0;
    }

    @Override
    public boolean doUpdate(Member vo) throws SQLException {
        String sql = "UPDATE member SET name=?,EntryYear=?,sex=?,phone=? WHERE mid=?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,vo.getMid());
        super.pstmt.setString(2,vo.getName());
        super.pstmt.setString(3,vo.getEntryYear());
        super.pstmt.setInt(4,vo.getSex());
        super.pstmt.setString(5,vo.getPhone());
        return super.pstmt.executeUpdate() > 0;
    }

    @Override
    public boolean doRemove(String id) throws SQLException {
        String sql = "DELETE FROM member WHERE mid=?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,id);
        return pstmt.executeUpdate() > 0;

    }

    @Override
    public Member findById(String id) throws SQLException {
        Member vo = null;
        String sql = "SELECT mid,name,EntryYear,sex,phone,rid FROM member WHERE mid=?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,id);
        ResultSet rs = super.pstmt.executeQuery();
        if(rs.next()){
            vo = new Member();
            vo.setMid(rs.getString(1));
            vo.setName(rs.getString(2));
            vo.setEntryYear(rs.getString(3));
            vo.setSex(rs.getInt(4));
            vo.setPhone(rs.getString(5));
            vo.setRid(rs.getString(6));
        }
        return vo;
    }

    @Override
    public List<Member> findAll() throws SQLException {
        List<Member> all = new ArrayList<Member>();
        String sql = "SELECT mid,name,EntryYear,sex,phone,rid FROM member";
        super.pstmt = super.conn.prepareStatement(sql);
        ResultSet rs = super.pstmt.executeQuery();
        while (rs.next()){
            Member vo = new Member();
            vo.setMid(rs.getString(1));
            vo.setName(rs.getString(2));
            vo.setEntryYear(rs.getString(3));
            vo.setSex(rs.getInt(4));
            vo.setPhone(rs.getString(5));
            vo.setRid(rs.getString(6));
            all.add(vo);
        }
        return all;
    }

    @Override
    public List<Member> findALLBySplit(String column, String keyword, Integer currentpage, Integer linesize) throws SQLException {
        List<Member> all = new ArrayList<Member>();
        String sql = " SELECT m.mid,m.name,m.EntryYear,m.sex,m.phone" + " FROM member m WHERE m."+ column +" LIKE  ?  LIMIT ?,? ";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,"%"+keyword+"%");
        super.pstmt.setInt(2,(currentpage -1) *linesize);
        super.pstmt.setInt(3,linesize);
        ResultSet rs = super.pstmt.executeQuery();
        while (rs.next()){
            Member vo = new Member();
            vo.setMid(rs.getString(1));
            vo.setName(rs.getString(2));
            vo.setEntryYear(rs.getString(3));
            vo.setSex(rs.getInt(4));
            vo.setPhone(rs.getString(5));
            all.add(vo);
        }
        return all;
    }

    @Override
    public Integer getAllCount(String column, String keyword) throws SQLException {
        String sql = "SELECT COUNT(*) FROM member WHERE "+column +" LIKE ?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,"%"+keyword+"%");
        ResultSet rs = super.pstmt.executeQuery();
        if (rs.next()){
            return rs.getInt(1);
        }
        return 0;
    }
}
