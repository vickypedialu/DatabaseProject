package com.amylz.dorm.dao;

import com.amylz.dorm.Member;
import com.amylz.dorm.Room;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by amylz on 2017/5/21.
 */
public interface IRoomDAO extends IDAO<String,Room>{
    public List<Member> findAllMembers(String id) throws SQLException;
    public boolean updateRank(String id,int tidy,int safe) throws SQLException;


}
