/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.byau.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;
import javax.sql.DataSource;

/**
 *
 * @author Administrator
 */
public class JDBCUtils {

    public static DataSource ds = null;

    static {
        // 新建一个配置文件对象
        Properties prop = new Properties();
        try {
            // 通过类加载器找到文件路径，读配置文件
            InputStream in = new JDBCUtils().getClass().getClassLoader()
                    .getResourceAsStream("jdbc.properties");
            // 把文件以输入流的形式加载到配置对象中
            prop.load(in);
            // 创建数据源对象
            ds = DruidDataSourceFactory.createDataSource(prop);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static DataSource getDataSource() {
	  return ds;
  }

    public static Connection getConnection() {
        Connection conn = null;
        try {
            conn = ds.getConnection();
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }

    public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            //?判断rs 等是否为空
            //1.没有意义
            //2.如果为空会出现空指针异常
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
