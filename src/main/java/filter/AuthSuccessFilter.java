package filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import contants.SessionUtils;
import entity.MyUser;


//@WebFilter({"/sign-in"})
//public class AuthSuccessFilter implements HttpFilter{ 
//
//	@Override
//	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
//			throws IOException, ServletException {
//		
//			
//		chain.doFilter(request, response);
//	}
//
//	@Override
//	public void destroy() {
//		MyUser currentUser = (MyUser) request.getSession().getAttribute(SessionUtils.CURRENT_USER);
//		request.authenticate(response);
//		if(!currentUser.isAdmin()) {
//			response.sendRedirect("/assignment/index");
//		}else {
//			response.sendRedirect("/assignment/admin");
//		}
//		HttpFilter.super.destroy();
//	}
//	
//	
//}
