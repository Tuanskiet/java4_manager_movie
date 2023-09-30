package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import contants.SessionUtils;
import entity.MyUser;


@WebFilter({"/change-password", 
	"/video/like-or-unlike", "/history", "/like-storage", "/sendmail-share-video"})
public class AuthFilter implements HttpFilter{

	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		response.setContentType("text/plain");
        PrintWriter printWriter = response.getWriter();
		String uri = request.getRequestURI();
		MyUser currentUser = (MyUser) request.getSession().getAttribute(SessionUtils.CURRENT_USER);
		String error = "";
		if(currentUser == null ) { //anonymous
			error = response.encodeURL("Please login!");
//			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			printWriter.print("UNAUTHORIZED");
		}else if(!currentUser.isAdmin() && uri.contains("admin")) { // not is admin
			error = response.encodeURL("You don't have permission!");
			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
			printWriter.print("FORBIDDEN");
		}
		
//		if(!error.isEmpty()) {
////			response.sendRedirect("/assignment/sign-in");
////			response.sendRedirect("/assignment/sign-in");
//		}else {
//			
//		}
		chain.doFilter(request, response);
		
		
	}

	

}
