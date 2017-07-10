package com.amylz.util;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by amylz on 2017/5/21.
 */
public abstract class AbstractDAOImpl {

    protected Connection conn;
    protected PreparedStatement pstmt;

    public AbstractDAOImpl(Connection conn){
        this.conn = conn;
    }

}

