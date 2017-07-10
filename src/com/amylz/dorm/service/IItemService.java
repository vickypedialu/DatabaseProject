package com.amylz.dorm.service;

import com.amylz.dorm.Item;

import java.util.List;

public interface IItemService {
    /**
     * 实现分类的增加操作
     * @param vo 表示要执行的vod对象
     * @return 成功返回true,失败返回false
     * @throws Exception
     */
    public boolean insert(Item vo)throws Exception;

    /**
     * 定义数据全部查询操作接口
     * @return
     * @throws Exception
     */
    public List<Item> list()throws Exception;
}
