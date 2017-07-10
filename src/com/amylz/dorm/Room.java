package com.amylz.dorm;

import java.io.Serializable;
import java.util.List;

/**
 * Created by amylz on 2017/5/21.
 */
public class Room implements Serializable {
   private String rid;
   private Integer tidy;
   private Integer safe;
   private List<Member> members;
   private List<Integer> rank;

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public List<Member> getMembers() {
        return members;
    }

    public void setMembers(List<Member> members) {
        this.members = members;
    }

    public List<Integer> getRank() {
        return rank;
    }

    public void setRank(List<Integer> rank) {
        this.rank = rank;
    }

    public Integer getTidy() {
        return tidy;
    }

    public void setTidy(Integer tidy) {
        this.tidy = tidy;
    }

    public Integer getSafe() {
        return safe;
    }

    public void setSafe(Integer safe) {
        this.safe = safe;
    }
}
