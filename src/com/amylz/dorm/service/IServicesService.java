package com.amylz.dorm.service;

import com.amylz.dorm.Services;

import java.util.Map;

public interface IServicesService {
    /**
     * 增加事务详情
     * @param vo 表示要执行数据增加的对象
     * @return 成功返回true,失败返回false
     * @throws Exception
     */
    public boolean insert(Services vo)throws Exception;

    /**
     * 此方法表示执行查询admin表和item中的全部数据
     * @return
     * @throws Exception
     */
    public Map<String,Object> findByAdminAndItem()throws Exception;

    /**
     * 定义分页接口类
     * @param column
     * @param keyWord
     * @param currentPage
     * @param lineSize
     * @return
     * @throws Exception
     */
    public Map<String,Object> listBySplit(String column, String keyWord, int currentPage, int lineSize)throws Exception;
}
