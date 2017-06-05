/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.byau.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@WebFilter(filterName = "AdminLoginFilter", urlPatterns = {"/admin/*"})
public class AdminLoginFilter implements Filter {
    
    protected FilterConfig filterConfig;
    
    public void doFilter(ServletRequest servletrequest,
            ServletResponse servletresponse, FilterChain filterchain)
        throws IOException, ServletException
    {
        HttpServletRequest request=(HttpServletRequest)servletrequest;
        HttpServletResponse response = (HttpServletResponse) servletresponse;
        HttpSession session = request.getSession();
        String   loginPage=request.getContextPath()+"/login.jsp";
        
        String login = "";
        try
        {

     login = (String) session.getAttribute("login");


            if (login!= null&&login.equals("success"))
            {

                filterchain.doFilter(servletrequest, servletresponse);
            }
            else
            {
                response.sendRedirect(loginPage);

            }
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
        }
    }

    public void destroy()
    {
        filterConfig = null;
    }
    
    public void init(FilterConfig filterconfig)
        throws ServletException
    {
        filterConfig = filterconfig;
    }
    
}
