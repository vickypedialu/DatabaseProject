package com.amylz.dorm.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

/**
 * Created by amylz on 2017/5/21.
 * @param <K> 表示主键
 * @param <V> 表示要操作的对象
 */
public interface IDAO<K,V> {
    /* 实现数据增加操作
     * 成功返回true,失败返回false
     */
    public boolean doCreate(V vo)throws SQLException;

    /* 实现数据操作
    * 成功返回true,失败返回false
    */
    public boolean doUpdate(V vo)throws SQLException;

    /* 实现数据删除操作
    * 成功返回true,失败返回false
    */
    public boolean doRemove(K id)throws SQLException;


    /* 根据用户提供的id进行查询
    * 成功返回该数据行中的记录,失败返回空
    */
    public V findById(K id) throws SQLException;


    public List<V> findAll()throws SQLException;

    /** 实现数据分页操作
     *  @param column 表示要查询的列
     *  @param keyword 表示查询关键字
     *  @param currentpage 表示当前页
     *  @param linesize 表示每页显示记录数
     *  查询成功返回满足条件的数据，失败返回空
     */
    public List<V> findALLBySplit(String column, String keyword, Integer currentpage, Integer linesize) throws SQLException;

    /* 实现数据统计操作
    * 成功返回数据量,失败返回0
    */
    public Integer getAllCount(String column, String keyword)throws SQLException;

}
