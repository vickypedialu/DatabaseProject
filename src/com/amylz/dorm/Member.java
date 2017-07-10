package com.amylz.dorm;

import java.io.Serializable;

/**
 * Created by amylz on 2017/5/21.
 */
public class Member implements Serializable {
    private String mid;
    private String name;
    private String EntryYear;
    private Integer sex;
    private String phone;
    private String rid;

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEntryYear() {
        return EntryYear;
    }

    public void setEntryYear(String entryYear) {
        EntryYear = entryYear;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
