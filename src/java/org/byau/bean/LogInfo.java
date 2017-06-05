/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.byau.bean;

/**
 *
 * @author Administrator
 */
public class LogInfo {
    private String userid;
    private String username;
    private String logintime;

    public LogInfo(String userid, String username, String logintime) {
        this.userid = userid;
        this.username = username;
        this.logintime = logintime;
    }

    /**
     * @return the userid
     */
    public String getUserid() {
        return userid;
    }

    /**
     * @param userid the userid to set
     */
    public void setUserid(String userid) {
        this.userid = userid;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the logintime
     */
    public String getLogintime() {
        return logintime;
    }

    /**
     * @param logintime the logintime to set
     */
    public void setLogintime(String logintime) {
        this.logintime = logintime;
    }
    
    
}
