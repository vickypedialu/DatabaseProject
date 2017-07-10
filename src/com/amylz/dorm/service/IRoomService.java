package com.amylz.dorm.service;


import com.amylz.dorm.Room;
import com.amylz.dorm.Member;

import java.util.List;

/**
 * Created by amylz on 2017/5/21.
 */
public interface IRoomService{
    public List<Room> list()throws Exception;
    public List<Member> getAllMembers(String id) throws Exception;
    public boolean updateRank(Integer tidy, Integer safe,String id) throws Exception;

}
