package com.amylz.dorm;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by amylz on 2017/5/23.
 */
public class Getserv implements Serializable {
    private Integer gid;
    private Services services; // 表示图书编号
    private Member member; // 表示用户id
    private Date credate; // 事务申请日期
    private Date findate; // 事务完成日期

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Services getServices() {
        return services;
    }

    public void setServices(Services services) {
        this.services = services;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Date getCredate() {
        return credate;
    }

    public void setCredate(Date credate) {
        this.credate = credate;
    }

    public Date getFindate() {
        return findate;
    }

    public void setFindate(Date findate) {
        this.findate = findate;
    }
}
