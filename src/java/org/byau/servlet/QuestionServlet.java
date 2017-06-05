/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.byau.servlet;

import com.alibaba.fastjson.JSON;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.byau.bean.Person;
import org.byau.bean.Question;
import org.byau.dao.QuestionDAO;
import org.byau.dao.QuestionDAODbUtils;

/**
 *
 * @author Administrator
 */
public class QuestionServlet extends BaseServlet {

    QuestionDAODbUtils questionDao = new QuestionDAODbUtils();
    
    QuestionDAO dao = new QuestionDAO();

    public void selectAll(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        try {
            // System.out.println("test"+questionDao.queryAll());
            request.setAttribute("questions", questionDao.queryAll());
            request.getRequestDispatcher("list_questions_jstl.jsp").forward(request, response);
        } catch (Exception e) {
        }

    }

    public void insert(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {   // 1、接收插入的信息

        try {

            Question question = new Question();
            Map map = request.getParameterMap();
            BeanUtils.populate(question, map);
            QuestionDAO questionDAO = new QuestionDAO();
            boolean flag = false;
            flag = questionDAO.insert(question);
            request.setAttribute("flag", new Boolean(flag));
            String path = "insert_do.jsp";
            request.getRequestDispatcher(path).forward(request, response);

        } catch (Exception e) {
        }
    }

    public void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        boolean flag = false;
        try {
            Question question = new Question();
            Map map = request.getParameterMap();
            BeanUtils.populate(question, map);
            QuestionDAO questionDAO = new QuestionDAO();

            flag = questionDAO.update(question);
            request.setAttribute("flag", new Boolean(flag));
            String path = "update_do.jsp";
            request.getRequestDispatcher(path).forward(request, response);
        } catch (Exception e) {

        }
    }

    public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        boolean flag = false;
        try {

            int questionId = Integer.parseInt(request.getParameter("questionId"));
            System.out.println(questionId);

            flag = questionDao.delete(questionId);
            request.setAttribute("flag", new Boolean(flag));
            String path = "delete.jsp";
            request.getRequestDispatcher(path).forward(request, response);
        } catch (Exception e) {
        }
    }

    public void selectId(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 接收参数
        try {
            int questionId = Integer.parseInt(request.getParameter("questionId"));
            request.setAttribute("question", questionDao.queryByQuestionId(questionId));
            request.getRequestDispatcher("update_jstl.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
        }
    }

    public void getJson(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 接收参数
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control", "no-cache");

        try {

            Person person1 = new Person();
            person1.setName("小王");
            person1.setSex("女");
            person1.setAge(23);

            Person person2 = new Person();
            person2.setName("小张");
            person2.setSex("男");
            person2.setAge(21);

            List<Person> list = new ArrayList<Person>();
            list.add(person1);
            list.add(person2);

            response.getWriter().write(JSON.toJSONString(list));

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
  public void exportExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 接收参数
        response.setContentType("application/vnd.ms-excel");
         response.setHeader("Content-disposition",
                "attachment;filename=" + "data.xls");
         ServletOutputStream out1 = response.getOutputStream();
         out1.flush();
       
         HSSFWorkbook wb2 =dao.getWorkBook();
         wb2.write(out1);

        

    }
  public void page(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 接收参数
            request.setCharacterEncoding("UTF-8");
            int totalPage = dao.getTotalPage();

            String toPage = request.getParameter("pageNO");

            if (toPage == null || toPage.length() == 0) {
                toPage = "1";
            }
            int pageNO = Integer.parseInt(toPage);

            if (pageNO <= 0) {
                pageNO = 1;
            }

            if (pageNO > totalPage) {
                pageNO = totalPage;
            }
            ArrayList<Question> questions = dao.queryByLike(pageNO);
            request.setAttribute("questions", questions);
             request.setAttribute("pageNO", pageNO);
             request.setAttribute("totalPage", totalPage);
            request.getRequestDispatcher("list_Fenye_mvc.jsp").forward(request, response);

        

    }
  public void batchDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 接收参数
        //先删除，后展示
          String ids[] = request.getParameterValues("selectFlag");
          if(ids != null){
             try{
                  boolean flag = dao.batchDeleteQuestion(ids);
             }catch(Exception e){
                 e.printStackTrace();
             }
          }
        request.setAttribute("questions", questionDao.queryAll());
        request.getRequestDispatcher("batch_delete_questions.jsp").forward(request, response);

        

    }
    
    
}
