package com.amylz.util.validate;

/**
 * Created by amylz on 2017/5/21.
 */
public class ValidateUtils {
    public static boolean validateEmpty(String data){
        if(data == null || "".equals(data)){
            return false;
        }
        return true;
    }

}
