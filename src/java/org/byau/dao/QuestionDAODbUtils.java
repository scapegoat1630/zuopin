/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.byau.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.byau.bean.Question;
import org.byau.util.JDBCUtils;




public class QuestionDAODbUtils {

    public boolean insert(Question question) {
        String sql = "INSERT INTO question(" + 
                "subject,choiceA,choiceB," + "choiceC,choiceD,answer," 
                + "typeid,categoryid ) VALUES(?,?,?,?,?,?,?,?)";
        //Connection conn = DBConnection.getConnection();
        boolean updateSuccessFlag = false;
        Object[] insertParams = {question.getSubject(), question.getChoiceA(),
            question.getChoiceB(), question.getChoiceC(),
            question.getChoiceD(), question.getAnswer(), question.getTypeId(), 
            question.getCategoryId()};

        try {
            QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
            int i = qr.update( sql, insertParams);
            if (i == 1) {
                // 如果插入成功，则肯定能执行到此段代码
                updateSuccessFlag = true;
            }

        } catch (SQLException e) {
            System.out.println("更新操作中出现错误！！！");
            System.out.println(e);
        } 
        return updateSuccessFlag;
    }

    // 修改操作
    public boolean update(Question question) {
        String sql = "UPDATE question set subject=?,"
                + "choiceA=?,choiceB=?,choiceC=?,"
                + "choiceD=?,answer=?,typeid=?,"
                + " categoryid=? WHERE questionid=?";
        
        Object[] updateParams = {question.getSubject(), question.getChoiceA(),
            question.getChoiceB(), question.getChoiceC(),
            question.getChoiceD(), question.getAnswer(),
            question.getTypeId(), question.getCategoryId(), question.getQuestionId()};
        boolean updateSuccessFlag = false;
        try {
          QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
            int i = qr.update(sql, updateParams);
            if (i == 1) {
                // 如果插入成功，则肯定能执行到此段代码
                updateSuccessFlag = true;
            }
        } catch (SQLException e) {
            System.out.println("更新操作中出现错误！！！");
            System.out.println(e);
        } 
        return updateSuccessFlag;
    }
    // 删除操作

    public boolean delete(int id) {
        String sql = "DELETE FROM question WHERE questionid=?";
        //Connection conn = DBConnection.getConnection();
        boolean updateSuccessFlag = false;
        try {
             QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
            int i = qr.update( sql, id);
            if (i == 1) {
                // 如果插入成功，则肯定能执行到此段代码
                updateSuccessFlag = true;
            }
        } catch (SQLException e) {
            System.out.println("更新操作中出现错误！！！");
            System.out.println(e);
        } 
        return updateSuccessFlag;
    }
    // 按ID查询

    public Question queryByQuestionId(int id) {
        Question question = null;
        String sql = "SELECT questionid," 
                + "subject,choiceA,choiceB,"
                + "choiceC,choiceD,answer,typeid,"
                + "categoryid FROM question q"
                + " where questionid=?";
       // Connection conn = DBConnection.getConnection();
      QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            question = (Question) qr.query(sql, new BeanHandler(Question.class),id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return question;
    }

    public List queryAll() {
        List all = null;
        String sql = "SELECT questionid,subject," 
                + "choiceA as choiceA,choiceB as choiceB,"
                + "choiceC as choiceC,"
                + "choiceD as choiceD,"
                + "answer FROM question ";
        //Connection conn = DBConnection.getConnection();
      QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            all = (List) qr.query(sql, new BeanListHandler(Question.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return all;
    }
}

