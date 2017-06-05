/**
 * @(#)UserDAO.java
 *
 *
 * @author
 * @version 1.00 2009/5/30
 */
package org.byau.dao;


import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.byau.bean.User;
import org.byau.util.JDBCUtils;
import org.byau.util.MD5;

public class UserDAO {

    

    public boolean findByIDAndPassword(
            String userid, String password) {
        //建立连接对象
        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            String sql = "select level from user_table"
                    + "  where userid=? and password=?"
                    + "  ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userid);
            pstmt.setString(2, MD5.getMD5(password));
           

            rs = pstmt.executeQuery();
            if (rs.next()) {
                    result =true;
            } 

        } catch (Exception e) {
            //System.out.println("数据库操作错误");
            System.out.println(e.getMessage());
        } finally {
            JDBCUtils.close(conn, pstmt, rs);
        }
        return result;
    }
    

    

    public boolean updatepPassword(String userid, String pass) {
        String sql = "UPDATE user_table set password=? where userid=? ";
        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;
        boolean updateSuccessFlag = false;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, MD5.getMD5(pass));
            pstmt.setString(2, userid);

            int i = pstmt.executeUpdate();
            if (i == 1) {
                // 如果插入成功，则肯定能执行到此段代码
                updateSuccessFlag = true;
            }

        } catch (SQLException e) {
            System.out.println("更新操作中出现错误！！！");
            System.out.println(e);
        } catch (NoSuchAlgorithmException e) {
            System.out.println("算法错误");
            System.out.println(e);
        } finally {
            JDBCUtils.close(conn, pstmt, null);
        }
        return updateSuccessFlag;
    }
    public boolean updatePhoto(String userID, String photo) {
        String sql = "UPDATE user_table set photo=? where userID=? ";
        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;
        boolean updateSuccessFlag = false;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, photo);
            pstmt.setString(2, userID);

            int i = pstmt.executeUpdate();
            if (i == 1) {
                // 如果插入成功，则肯定能执行到此段代码
                updateSuccessFlag = true;
            }

        } catch (SQLException e) {
            System.out.println("更新操作中出现错误！！！");
            System.out.println(e);
      
        } finally {
            JDBCUtils.close(conn, pstmt, null);
        }
        return updateSuccessFlag;
    }
    
    public User queryByUserID(String id) {
        User user = null;
        String sql = "select * from user_table where userID=?";
        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            //此处为什么不用while,用while可不可以
            if (rs.next()) {
                user = new User();
                user.setUserName(rs.getString("userName"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhoto(rs.getString("photo"));
                user.setLevel(rs.getString("level"));
            }

        } catch (SQLException e) {
            System.out.println("操作中出现错误！！！");
        } finally {
            JDBCUtils.close(conn, pstmt, rs);
        }
        return user;
    }
    
}