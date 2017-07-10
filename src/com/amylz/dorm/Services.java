package com.amylz.dorm;


import java.util.Date;
import java.util.List;

/**
 * Created by amylz on 2017/5/23.
 */
public class Services {
    private Integer sid;
    private String name;
    private Date credate;
    private Integer status;
    private String note;
    private Item Item; // 表示一项事务属于一个类别
    private Admin admin;// 表示事务由谁增加 ，aid
    private List<Getserv> Getserv; // ; 表示可以申请多项事务

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCredate() {
        return credate;
    }

    public void setCredate(Date credate) {
        this.credate = credate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public com.amylz.dorm.Item getItem() {
        return Item;
    }

    public void setItem(com.amylz.dorm.Item item) {
        Item = item;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public List<com.amylz.dorm.Getserv> getGetserv() {
        return Getserv;
    }

    public void setGetserv(List<com.amylz.dorm.Getserv> getserv) {
        Getserv = getserv;
    }
}
