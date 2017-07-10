package com.amylz.dorm.service;

import com.amylz.dorm.Getserv;

import java.util.Map;

public interface IGetservService {

    /**
     * 实现数据增加操作
     * @param vo
     * @return
     * @throws Exception
     */
    public boolean insert(Getserv vo)throws Exception;

    /**
     * 取得services数据和member表中数据
     * @return
     * @throws Exception
     */
    public Map<String,Object> listByMemberAndServices()throws Exception;


    /**
     * 实现分页操作
     * @param column
     * @param keyWord
     * @param currentPage
     * @param lineSize
     * @return
     * @throws Exception
     */
    public Map<String,Object> listBySplit(String column, String keyWord, int currentPage, int lineSize)throws Exception;

    /**
     * 实现数更新归还日期
     * @param gid
     * @return
     * @throws Exception
     */
    public boolean updateByFindate(int gid)throws Exception;

}
