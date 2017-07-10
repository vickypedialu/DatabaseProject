package com.amylz.dorm;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by amylz on 2017/5/21.
 */
public class Admin implements Serializable {
    private String aid;
    private String password;
    private Date lastdate;
    private Integer flag;
    private Integer status;

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getLastdate() {
        return lastdate;
    }

    public void setLastdate(Date lastdate) {
        this.lastdate = lastdate;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }


}
