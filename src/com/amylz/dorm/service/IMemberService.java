package com.amylz.dorm.service;

import com.amylz.dorm.Member;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by amylz on 2017/5/21.
 */
public interface IMemberService {
    /**
     * 实现数据增加操作
     * @param vo 表示要执行增加的对象
     * @return
     * @throws Exception
     */
    public boolean insert(Member vo) throws Exception;
    public Member search(String id) throws Exception;
    public boolean delete(String id) throws Exception;
    public List<Member> list() throws Exception;
   // public Map<String,Object> listBySplit(String column, String keyWord, int currentPage, int lineSize)throws Exception;

}
