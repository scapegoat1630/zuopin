/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.byau.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.byau.bean.Question;
import org.byau.util.JDBCUtils;

/**
 *
 * @author Administrator
 */
public class QuestionDAO {

    public boolean insert(Question question) {
        String sql = "INSERT INTO question("
                + "subject,choiceA,choiceB,"
                + "choiceC,choiceD,answer,"
                + "typeid,categoryid ) VALUES(?,?,?,?,?,?,?,?)";
        //得到连接对象
        Connection conn = JDBCUtils.getConnection();
        //定义预编译语句对象，此对象可执行动态sql命令。
        PreparedStatement pstmt = null;
        boolean insertSuccessFlag = false;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, question.getSubject());
            pstmt.setString(2, question.getChoiceA());
            pstmt.setString(3, question.getChoiceB());
            pstmt.setString(4, question.getChoiceC());
            pstmt.setString(5, question.getChoiceD());

            pstmt.setString(6, question.getAnswer());
            pstmt.setString(7, question.getTypeId());
            pstmt.setString(8, question.getCategoryId());

            int i = pstmt.executeUpdate();
            if (i == 1) {
                // 如果插入成功，则肯定能执行到此段代码
                insertSuccessFlag = true;
            }
        } catch (SQLException e) {
            System.out.println("插入操作中出现错误！！！");
            System.out.println(e);
        } finally {
            JDBCUtils.close(conn, pstmt, null);
        }
        return insertSuccessFlag;
    }
    /**
     * 
     * @param question
     * @return     /**
     * 
     * @param question
     * @return 
     */
    
    public boolean insertAll(List<Question> qlist) {
        String sql = "INSERT INTO question("
                + "subject,choiceA,choiceB,"
                + "choiceC,choiceD,answer,"
                + "typeid,categoryid ) VALUES(?,?,?,?,?,?,?,?)";
        //得到连接对象
        Connection conn = JDBCUtils.getConnection();
        //定义预编译语句对象，此对象可执行动态sql命令。
        PreparedStatement pstmt = null;
        boolean insertSuccessFlag = false;
        try {
            for(Question question:qlist){
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, question.getSubject());
            pstmt.setString(2, question.getChoiceA());
            pstmt.setString(3, question.getChoiceB());
            pstmt.setString(4, question.getChoiceC());
            pstmt.setString(5, question.getChoiceD());

            pstmt.setString(6, question.getAnswer());
            pstmt.setString(7, question.getTypeId());
            pstmt.setString(8, question.getCategoryId());
            pstmt.addBatch();
            }
            pstmt.executeBatch();
           
                // 如果插入成功，则肯定能执行到此段代码
                insertSuccessFlag = true;
            
        } catch (SQLException e) {
            System.out.println("插入操作中出现错误！！！");
            System.out.println(e);
        } finally {
            JDBCUtils.close(conn, pstmt, null);
        }
        return insertSuccessFlag;
    }

    // 修改操作
    public boolean update(Question question) {
        String sql = "UPDATE question set subject=?,"
                + "choiceA=?,choiceB=?,choiceC=?,"
                + "choiceD=?,answer=?,typeid=?,"
                + "categoryid=? WHERE questionid=?";
        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;
        boolean updateSuccessFlag = false;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, question.getSubject());
            pstmt.setString(2, question.getChoiceA());
            pstmt.setString(3, question.getChoiceB());
            pstmt.setString(4, question.getChoiceC());
            pstmt.setString(5, question.getChoiceD());

            pstmt.setString(6, question.getAnswer());
            pstmt.setString(7, question.getTypeId());
            pstmt.setString(8, question.getCategoryId());
            pstmt.setInt(9, question.getQuestionId());

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

    /**
     * 删除一条记录
     *
     * @param id1 id1是试题编号
     * @return
     */
    public boolean del(int id1) {
        Connection conn = null;
        PreparedStatement pstmt = null;//语句
        boolean flag = false;
        try {
            //conn=test.DBConnection.getConnection();
            conn = JDBCUtils.getConnection();
            String deleteString = "delete from question "
                    + "where questionid=?";
            pstmt = conn.prepareStatement(deleteString);
            pstmt.setInt(1, id1);
            int i = pstmt.executeUpdate();
            if (i > 0) {
                flag = true;
            } else {
                flag = false;
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e1) {
            System.out.println(e1.getMessage());
            System.out.println("数据库错误");
        } finally {
            JDBCUtils.close(conn, pstmt, null);
        }
        return flag;
    }

    /**
     *
     * @param subject
     * @param choiceA
     * @param choiceB
     * @param choiceC
     * @param choiceD
     * @param answer
     * @param typeid
     * @param categoryid 在试题表添加一条记录
     * @return
     */
    public boolean add(String subject,
            String choiceA, String choiceB,
            String choiceC, String choiceD,
            String answer, String typeid, String categoryid) {
        String sql = "INSERT INTO question("
                + "subject,choiceA,choiceB,"
                + "choiceC,choiceD,answer,"
                + "typeid,categoryid ) VALUES(?,?,?,?,?,?,?,?)";
        //得到连接对象
        Connection conn = JDBCUtils.getConnection();
        //定义预编译语句对象，此对象可执行动态sql命令。
        PreparedStatement pstat = null;
        boolean insertSuccessFlag = false;
        try {
            pstat = conn.prepareStatement(sql);

            pstat.setString(1, subject);
            pstat.setString(2, choiceA);
            pstat.setString(3, choiceB);
            pstat.setString(4, choiceC);
            pstat.setString(5, choiceD);
            pstat.setString(6, answer);
            pstat.setString(7, typeid);
            pstat.setString(8, categoryid);

            int i = pstat.executeUpdate();
            if (i == 1) {
                // 如果插入成功，则肯定能执行到此段代码
                insertSuccessFlag = true;
            }
        } catch (SQLException e) {
            System.out.println("插入操作中出现错误！！！");
            System.out.println(e);
        } finally {
            JDBCUtils.close(conn, pstat, null);
        }
        return insertSuccessFlag;
    }

    /**
     * 更新试题表的记录
     *
     * @param subject
     * @param choiceA
     * @param choiceB
     * @param choiceC
     * @param choiceD
     * @param answer
     * @param typeid
     * @param categoryid
     * @param id
     * @return
     */
    public boolean update(String subject,
            String choiceA, String choiceB,
            String choiceC, String choiceD,
            String answer, String typeid, String categoryid, int id) {
        String updateString = "update question set subject=?,choiceA=?,"
                + "choiceB=?,choiceC=?,choiceD=?,"
                + "answer=?,typeid=?,categoryid=? "
                + " where questionid=?";

        //得到连接对象
        Connection conn = JDBCUtils.getConnection();
        //定义预编译语句对象，此对象可执行动态sql命令。
        PreparedStatement pstat = null;
        boolean insertSuccessFlag = false;
        try {
            pstat = conn.prepareStatement(updateString);

            pstat.setString(1, subject);
            pstat.setString(2, choiceA);
            pstat.setString(3, choiceB);
            pstat.setString(4, choiceC);
            pstat.setString(5, choiceD);
            pstat.setString(6, answer);
            pstat.setString(7, typeid);
            pstat.setString(8, categoryid);
            pstat.setInt(9, id);

            int i = pstat.executeUpdate();
            if (i == 1) {
                // 如果插入成功，则肯定能执行到此段代码
                insertSuccessFlag = true;
            }
        } catch (SQLException e) {
            System.out.println("插入操作中出现错误！！！");
            System.out.println(e);
        } finally {
            JDBCUtils.close(conn, pstat, null);
        }
        return insertSuccessFlag;
    }

    /**
     * 查找一条试题记录 更新之前显示使用
     *
     * @param id
     * @return
     */
    public Question queryByQuestionId(int id) {
        Question question = null;
        String sql = "SELECT questionid,"
                + "subject,choiceA,choiceB,"
                + "choiceC,choiceD,answer,typeid,categoryid"
                + " FROM question "
                + " where questionid=?";
        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            //此处为什么不用while,用while可不可以
            if (rs.next()) {
                question = new Question();
                question.setQuestionId(rs.getInt(1));
                question.setSubject(rs.getString(2));
                question.setChoiceA(rs.getString(3));
                question.setChoiceB(rs.getString(4));
                question.setChoiceC(rs.getString(5));
                question.setChoiceD(rs.getString(6));
                question.setAnswer(rs.getString(7));
                question.setTypeId(rs.getString(8));
                question.setCategoryId(rs.getString(9));
                

            }

        } catch (SQLException e) {
            System.out.println("操作中出现错误！！！");
        } finally {
            JDBCUtils.close(conn, pstmt, rs);
        }
        return question;
    }

    /**
     * 显示全部记录
     *
     * @return
     */
    public ArrayList<Question> ListAll() {
        ArrayList<Question> all = new ArrayList<Question>();
        Question question = null;
        String sql = "SELECT questionid,"
                + "subject,choiceA,choiceB,"
                + "choiceC,choiceD,answer,typeid,"
                + "categoryid  FROM question ";
        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            //此处为什么不用while,用while可不可以
            while (rs.next()) {
                question = new Question();
//                question.setQuestionId(rs.getInt(1));
//                question.setSubject(rs.getString(2));
//                question.setChoiceA(rs.getString(3));
//                question.setChoiceB(rs.getString(4));
//                question.setChoiceC(rs.getString(5));
//                question.setChoiceD(rs.getString(6));
//                question.setAnswer(rs.getString(7));
                question = new Question(rs.getInt(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5),
                        rs.getString(6),
                        rs.getString(7), rs.getString(8),
                        rs.getString(9));

                all.add(question);
            }

        } catch (SQLException e) {
            System.out.println("操作中出现错误！！！");
            System.out.println(e.getMessage());
        } finally {
            JDBCUtils.close(conn, pstmt, rs);
        }
        return all;
    }

    /**
     * 模糊查询记录 执行list_Chaxun.jsp被调用
     *
     * @param keyword
     * @return
     */
    public List<Question> queryByLike(String keyword) {
        //""
        ArrayList<Question> all = new ArrayList<Question>();
        Question question = null;
        String sql = "SELECT questionid,"
                + "subject,choiceA,choiceB,"
                + "choiceC,choiceD,answer,typeid,"
                + "categoryid FROM question q"
                + " where choiceA like ? or "
                + "choiceB like ? or "
                + "choiceC like ? or "
                + "choiceD like ?  ";
        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");
            pstmt.setString(2, "%" + keyword + "%");
            pstmt.setString(3, "%" + keyword + "%");
            pstmt.setString(4, "%" + keyword + "%");

            rs = pstmt.executeQuery();

            while (rs.next()) {
                question = new Question();
//                question.setQuestionId(rs.getInt(1));
//                question.setSubject(rs.getString(2));
//                question.setChoiceA(rs.getString(3));
//                question.setChoiceB(rs.getString(4));
//                question.setChoiceC(rs.getString(5));
//                question.setChoiceD(rs.getString(6));
//                question.setAnswer(rs.getString(7));
//                question.setTypeId(rs.getString(8));
//                question.setCategoryId(rs.getString(9));
                question = new Question(rs.getInt(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5),
                        rs.getString(6),
                        rs.getString(7), rs.getString(8),
                        rs.getString(9));
                all.add(question);
            }

        } catch (SQLException e) {
            System.out.println("操作中出现错误！！！");
            System.out.println(e.getMessage());
        } finally {
            JDBCUtils.close(conn, pstmt, rs);
        }
        return all;
    }

    /**
     * 分页显示记录 list_Fenye.jsp
     *
     * @param pageNO
     * @return
     */
    public ArrayList<Question> queryByLike(int pageNO) {
        ArrayList<Question> all = new ArrayList<Question>();
        Question question = null;
        int offset = (pageNO - 1) * 5;
        String sql = "SELECT questionid,"
                + "subject,choiceA,choiceB,"
                + "choiceC,choiceD,answer,typeid,"
                + "categoryid FROM question"
                + " limit " + offset + ",5";
        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                question = new Question();
//                question.setQuestionId(rs.getInt(1));
//                question.setSubject(rs.getString(2));
//                question.setChoiceA(rs.getString(3));
//                question.setChoiceB(rs.getString(4));
//                question.setChoiceC(rs.getString(5));
//                question.setChoiceD(rs.getString(6));
//                question.setAnswer(rs.getString(7));
//                question.setTypeId(rs.getString(8));
//                question.setCategoryId(rs.getString(9));

                question = new Question(rs.getInt(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5),
                        rs.getString(6),
                        rs.getString(7), rs.getString(8),
                        rs.getString(9));

                all.add(question);
            }

        } catch (SQLException e) {
            System.out.println("操作中出现错误！！！");
            System.out.println(e.getMessage());
        } finally {
            JDBCUtils.close(conn, pstmt, rs);
        }
        return all;
    }

    /**
     * 没有查询时的总页数 list_Fenye.jsp使用
     *
     * @return
     */
    public int getTotalPage() {
        int totalPage = 0;//总页数
        int pageSize = 5; //一页中记录数
        int totalRecord = 0;//总记录数
        String sql = "SELECT count(*) FROM question ";

        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            rs.next();
            totalRecord = rs.getInt(1);

            if (totalRecord % pageSize == 0) {
                totalPage = totalRecord / pageSize;
            } else {
                totalPage = totalRecord / pageSize + 1;
            }

        } catch (SQLException e) {
            System.out.println("数据库查询出错2:" + e.getMessage());
        } finally {
            JDBCUtils.close(conn, pstmt, rs);
        }
        return totalPage;
    }

    /**
     * 批量删除试题时使用的删除方法
     *
     * @param id是所有被删除的试题的questionid
     *
     */
    public boolean batchDeleteQuestion(String[] id) throws Exception {
        String sql = "DELETE FROM question WHERE questionid=?";
        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;
        boolean f = false;
        try {
            pstmt = conn.prepareStatement(sql);

            for (int i = 0; i < id.length; i++) {
                System.out.println(id[i]);
                //System.out.println(count);
                pstmt.setInt(1, Integer.parseInt(id[i]));
                pstmt.executeUpdate();

            }
            f = true;
        } catch (SQLException e) {

            System.out.println("操作中出现错误！！！");
            //throw new Exception("操作中出现错误！！！");
        }
        finally{
             JDBCUtils.close(conn, pstmt, null);
        }
        return f;
    }
    /**
     * 批量删除试题时使用的删除方法
     *
     * @param id是所有被删除的试题的questionid
     *
     */
    public boolean batchDeleteQuestion2(String[] id) throws Exception {
        String sql = "DELETE FROM question WHERE questionid=?";
        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;
        boolean f = false;
        try {
            pstmt = conn.prepareStatement(sql);

            for (int i = 0; i < id.length; i++) {
                //System.out.println(id[i]);
                //System.out.println(count);
                pstmt.setInt(1, Integer.parseInt(id[i]));
                //将命令加到批处理队列
                pstmt.addBatch();

            }
            //一起将批处理队列的内容送给mysql执行
           pstmt.executeBatch();
            f = true;
        } catch (SQLException e) {

            System.out.println("操作中出现错误！！！");
            //throw new Exception("操作中出现错误！！！");
        }
        finally{
             JDBCUtils.close(conn, pstmt, null);
        }
        return f;
    }

    /**
     * 从excel格式的文件中导入试题
     *
     * @param fileName 参数fileName是文件名
     * @throws Exception
     */
    public void importQuestionFromExcel(File f) throws Exception {
         ArrayList<Question> all = new ArrayList<Question>();
        Question question = null;
        String subject = null;
        String choiceA = null;
        String choiceB = null;
        String choiceC = null;
        String choiceD = null;
        String answer = null;
        
        try {
            //通过得到的文件输入流inputstream创建一个HSSFWordbook对象
            HSSFWorkbook hssfworkbook = new HSSFWorkbook(
                    new FileInputStream(f));
            HSSFSheet hssfsheet = hssfworkbook.getSheetAt(0);//第一个工作表
            HSSFRow hssfrow = null;
            HSSFCell cell = null;
            int i = 0;
            //遍历该表格中所有的工作表，i表示工作表的数量 getNumberOfSheets表示工作表的总数
            //  for (int i = 0; i < hssfworkbook.getNumberOfSheets(); i++) {
            //  hssfsheet = hssfworkbook.getSheetAt(i);

            //遍历该行所有的行,j表示行数 getPhysicalNumberOfRows行的总数
            for (int j = 1; j < hssfsheet.getPhysicalNumberOfRows(); j++) {
                hssfrow = hssfsheet.getRow(j);
                //判断是否还存在需要导入的数据
                if (hssfrow == null) {
                    System.out.println("这里已没有数据，在第" + i + "列,第" + j + "行");
                    break;
                }
                /**
                 *                  */
                /**
                 * 将EXCEL中的第 j 行，第一列的值插入到实例中
                 */
                //id=   new Integer((int)hssfrow.getCell( 0).getNumericCellValue()).toString();
                subject = hssfrow.getCell(0).toString().trim();
                
                choiceA = hssfrow.getCell(1).toString().trim();
                choiceB = hssfrow.getCell(2).toString().trim();
                choiceC = hssfrow.getCell(3).toString().trim();
                choiceD = hssfrow.getCell(4).toString().trim();
                answer = hssfrow.getCell(5).toString().trim();
                
                
                
                add(subject, choiceA, choiceB, choiceC, choiceD, answer, "01", "01");
             
               
                i++;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());

        }

    }
    
    
    public void importQuestionFromExcel2(File f) throws Exception {
         List<Question> all = new ArrayList<Question>();
        Question question = null;
        String subject = null;
        String choiceA = null;
        String choiceB = null;
        String choiceC = null;
        String choiceD = null;
        String answer = null;
        
        try {
            //通过得到的文件输入流inputstream创建一个HSSFWordbook对象
            HSSFWorkbook hssfworkbook = new HSSFWorkbook(
                    new FileInputStream(f));
            HSSFSheet hssfsheet = hssfworkbook.getSheetAt(0);//第一个工作表
            HSSFRow hssfrow = null;
            HSSFCell cell = null;
            int i = 0;
            //遍历该表格中所有的工作表，i表示工作表的数量 getNumberOfSheets表示工作表的总数
            //  for (int i = 0; i < hssfworkbook.getNumberOfSheets(); i++) {
            //  hssfsheet = hssfworkbook.getSheetAt(i);

            //遍历该行所有的行,j表示行数 getPhysicalNumberOfRows行的总数
            for (int j = 1; j < hssfsheet.getPhysicalNumberOfRows(); j++) {
                hssfrow = hssfsheet.getRow(j);
                //判断是否还存在需要导入的数据
                if (hssfrow == null) {
                    System.out.println("这里已没有数据，在第" + i + "列,第" + j + "行");
                    break;
                }
                /**
                 *                  */
                /**
                 * 将EXCEL中的第 j 行，第一列的值插入到实例中
                 */
                //id=   new Integer((int)hssfrow.getCell( 0).getNumericCellValue()).toString();
                subject = hssfrow.getCell(0).toString().trim();
                
                choiceA = hssfrow.getCell(1).toString().trim();
                choiceB = hssfrow.getCell(2).toString().trim();
                choiceC = hssfrow.getCell(3).toString().trim();
                choiceD = hssfrow.getCell(4).toString().trim();
                answer = hssfrow.getCell(5).toString().trim();
                Question q=new Question(subject, choiceA, choiceB, choiceC, choiceD, answer, "01", "01");
                all.add(q);
                
                
                
               
                i++;
            }
            insertAll(all);
        } catch (Exception e) {
            System.out.println(e.getMessage());

        }

    }
    public HSSFWorkbook getWorkBook() throws Exception {
        HSSFWorkbook wb =
                new HSSFWorkbook();

        HSSFSheet sheet = wb.createSheet(" sheet1 ");
        HSSFRow row = null;
        HSSFCell cell = null;
        sheet.setColumnWidth(0, 32 * 100);
        sheet.setColumnWidth(1, 32 * 500);
        sheet.setColumnWidth(2, 32 * 300);
        sheet.setColumnWidth(3, 32 * 300);
        sheet.setColumnWidth(4, 32 * 300);
        sheet.setColumnWidth(5, 32 * 300);
        sheet.setColumnWidth(6, 32 * 100);
        
//		sheet.setColumnWidth(5, 32*100);
//		sheet.setColumnWidth(6, 32*100);
//                sheet.setColumnWidth(7, 32*100*8);

//		sheet.setColumnWidth(8, 32*100);
//		sheet.setColumnWidth(9, 32*100);
//		sheet.setColumnWidth(10, 32*100);



        // 单元格样式
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        style.setWrapText(true);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        
        row = sheet.createRow(0);
        cell = row.createCell(0);
        cell.setCellStyle(style);
        cell.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell.setCellValue(new HSSFRichTextString("编号"));

        //row = sheet.createRow(1);
        cell = row.createCell(1);
        cell.setCellStyle(style);
        cell.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell.setCellValue(new HSSFRichTextString("题目"));
        
        cell = row.createCell(2);
        cell.setCellStyle(style);
        cell.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell.setCellValue(new HSSFRichTextString("选项A"));
       
        cell = row.createCell(3);
        cell.setCellStyle(style);
        cell.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell.setCellValue(new HSSFRichTextString("选项B"));

        cell = row.createCell(4);
        cell.setCellStyle(style);
        cell.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell.setCellValue(new HSSFRichTextString("选项C"));

        cell = row.createCell(5);
        cell.setCellStyle(style);
        cell.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell.setCellValue(new HSSFRichTextString("选项D"));
        
        
        
        cell = row.createCell(6);
        cell.setCellStyle(style);
        cell.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell.setCellValue(new HSSFRichTextString("答案"));


         String sql = "SELECT questionid,"
                + "subject,choiceA,choiceB,"
                + "choiceC,choiceD,answer"
                + "  FROM question ";


        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;
        System.out.println(sql);
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            int iRow = 1;
            //写入各条记录，每条记录对应Excel中的一行
            while (rs.next()) {
                row = sheet.createRow((short) iRow);
                for (int j = 1; j <= 7; j++) {
                    cell = row.createCell((j - 1));
                    cell.setCellStyle(style);
                    cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                    cell.setCellValue(new HSSFRichTextString(
                            rs.getObject(j).toString()));
                }
                iRow++;
            }
        } catch (Exception e) {
            System.out.println("excel操作中出现错误！！！");
            System.out.println(e.getMessage());
        } finally {
            JDBCUtils.close(conn, pstmt, rs);
        }
        return wb;

    }
    
    public int getTotalPage(String cond) {
        int totalPage = 0;//总页数
        int pageSize = 7; //一页中记录数
        int totalRecord = 0;//总记录数
        String sql = "SELECT count(*) FROM question "
                + " where choiceA like ? or "
                + "choiceB like ? or "
                + "choiceC like ? or "
                + "choiceD like ? ";
        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            System.out.println("%" + cond + "%");
            pstmt.setString(1, "%" + cond + "%");//"%%"
            pstmt.setString(2, "%" + cond + "%");
            pstmt.setString(3, "%" + cond + "%");
            pstmt.setString(4, "%" + cond + "%");
            rs = pstmt.executeQuery();
            rs.next();
            totalRecord = rs.getInt(1);
            if (totalRecord % pageSize == 0) {
                totalPage = totalRecord / pageSize;
            } else {
                totalPage = totalRecord / pageSize + 1;
            }
        } catch (SQLException e) {
            System.out.println("数据库查询出错2:" + e.getMessage());
        } finally {
             JDBCUtils.close(conn, pstmt, rs);
        }
        return totalPage;
    }
    /**
     * 分页显示记录带查询参数 list_FenyeChaxun.jsp
     *
     * @param pageNO
     * @return
     */
    public ArrayList<Question> queryByLike(String keyword, int pageNO) {
        ArrayList all = new ArrayList();
        Question question = null;
        int offset = (pageNO - 1) * 7;
        String sql = "SELECT questionid,"
                + "subject,choiceA,choiceB,"
                + "choiceC,choiceD,answer,typeid,"
                + "categoryid FROM question q"
                + " where choiceA like ? or "
                + "choiceB like ? or "
                + "choiceC like ? or "
                + "choiceD like ? "
                + "limit " + offset + ",7";
        Connection conn = JDBCUtils.getConnection();
        PreparedStatement pstmt = null;

        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");//%a%
            pstmt.setString(2, "%" + keyword + "%");
            pstmt.setString(3, "%" + keyword + "%");
            pstmt.setString(4, "%" + keyword + "%");

            rs = pstmt.executeQuery();

            while (rs.next()) {
                question = new Question();
//                question.setQuestionId(rs.getInt(1));
//                question.setSubject(rs.getString(2));
//                question.setChoiceA(rs.getString(3));
//                question.setChoiceB(rs.getString(4));
//                question.setChoiceC(rs.getString(5));
//                question.setChoiceD(rs.getString(6));
//                question.setAnswer(rs.getString(7));
//                question.setTypeId(rs.getString(8));
//                question.setCategoryId(rs.getString(9));
                question = new Question(rs.getInt(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5),
                        rs.getString(6),
                        rs.getString(7), rs.getString(8),
                        rs.getString(9));
                all.add(question);
            }

        } catch (SQLException e) {
            System.out.println("操作中出现错误！！！");
            System.out.println(e.getMessage());
        } finally {
            JDBCUtils.close(conn, pstmt, rs);
        }
        return all;
    }
}


