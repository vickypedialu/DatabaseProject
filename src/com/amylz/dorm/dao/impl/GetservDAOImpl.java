package com.amylz.dorm.dao.impl;

import com.amylz.dorm.Member;
import com.amylz.dorm.Getserv;
import com.amylz.dorm.Services;
import com.amylz.dorm.dao.IGetservDAO;
import com.amylz.util.AbstractDAOImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by amylz on 2017/5/24.
 */
public class GetservDAOImpl extends AbstractDAOImpl implements IGetservDAO{
    public GetservDAOImpl(Connection conn) {
        super(conn);
    }

    @Override
    public boolean doCreate(Getserv vo) throws SQLException {
        String sql = "INSERT INTO getserv(sid,mid,credate) VALUES (?,?,?)";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setInt(1,vo.getServices().getSid());
        super.pstmt.setString(2,vo.getMember().getMid());
        super.pstmt.setTimestamp(3,new Timestamp(vo.getCredate().getTime()));
        return super.pstmt.executeUpdate() > 0;
    }

    @Override
    public boolean doUpdate(Getserv vo) throws SQLException {
        return false;
    }

    @Override
    public boolean doRemove(Integer id) throws SQLException {
        return false;
    }

    @Override
    public Getserv findById(Integer id) throws SQLException {
        return null;
    }

    @Override
    public List<Getserv> findAll() throws SQLException {
        return null;
    }

    @Override
    public List<Getserv> findALLBySplit(String column, String keyword, Integer currentpage, Integer linesize) throws SQLException {
        List<Getserv> all = new ArrayList<Getserv>();
        String sql =" SELECT g.gid,s.sid,s.name,m.mid,m.name,g.credate,g.findate " +
                " FROM  getserv g,services s,member m " +
                " WHERE g.sid = s.sid  AND g.mid = m.mid  AND g."+column+" LIKE ? LIMIT ?,?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,"%"+keyword+"%");
        super.pstmt.setInt(2,(currentpage-1) * linesize);
        super.pstmt.setInt(3,linesize);
        ResultSet rs = super.pstmt.executeQuery();
        while (rs.next()){
            Getserv vo = new Getserv();
            vo.setGid(rs.getInt(1));
            Services services = new Services();
            services.setSid(rs.getInt(2));
            services.setName(rs.getString(3));
            vo.setServices(services);
            Member member = new Member();
            member.setMid(rs.getString(4));
            member.setName(rs.getString(5));
            vo.setMember(member);
            vo.setCredate(rs.getDate(6));
            vo.setFindate(rs.getDate(7));
            all.add(vo);
            System.out.print(vo.getGid());
        }
        return all;
    }

    @Override
    public Integer getAllCount(String column, String keyword) throws SQLException {
        String sql = "SELECT COUNT(*) FROM getserv WHERE "+column+" LIKE ?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setString(1,"%"+keyword+"%");
        ResultSet rs = super.pstmt.executeQuery();
        if (rs.next()){
            return rs.getInt(1);
        }
        return 0;
    }

    @Override
    public boolean doUpdateByfindate(Integer gid, Date findate) throws SQLException {
        String sql = "UPDATE getserv SET findate=? WHERE gid=?";
        super.pstmt = super.conn.prepareStatement(sql);
        super.pstmt.setTimestamp(1,new Timestamp(findate.getTime()));
        super.pstmt.setInt(2,gid);
        return super.pstmt.executeUpdate() > 0;
    }
}
