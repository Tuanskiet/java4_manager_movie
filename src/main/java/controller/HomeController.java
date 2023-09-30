package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import contants.ErrorMessage;
import contants.SessionUtils;
import dto.VideoDto;
import entity.Favourite;
import entity.MyUser;
import entity.Video;
import service.EmailService;
import service.FavoriteService;
import service.HistoryService;
import service.UserService;
import service.VideoService;
import service.impl.EmailServiceImpl;
import service.impl.FavoriteServiceImpl;
import service.impl.HistoryServiceImpl;
import service.impl.UserServiceImpl;
import service.impl.VideoServiceImpl;
import utils.PasswordGenerator;

@WebServlet({ "/index", "/detail", "/sign-in", "/sign-up",
	"/edit-profile", "/change-password", "/forgot-password", "/logout",
	"/sendmail-reset-pass", "/history", "/like-storage", "/change-language"
	})
public class HomeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6693023028924133491L;
	/**
	 * 
	 */

	private final  UserService userService ;
	private final VideoService videoService;
	private final EmailService emailService  ;
	private final HistoryService historyService;
	private static final int ITEM_PER_PAGE = 6;
	
	public HomeController() {
		userService = new UserServiceImpl();
		videoService = new VideoServiceImpl();
		emailService  = new EmailServiceImpl();
		historyService  = new HistoryServiceImpl();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String servletPath = req.getServletPath();
		MyUser currentUser = (MyUser) req.getSession().getAttribute(SessionUtils.CURRENT_USER);
		
		switch (servletPath) {
		case "/index" :
			getListVideos("default", req, resp);
			req.setAttribute("view", "/views/user/index.jsp");
			req.getRequestDispatcher("/views/layout_user.jsp").forward(req, resp);
			break;
		case "/history" :
			if(currentUser != null) {
				getListVideos("history", req, resp);
				req.setAttribute("view", "/views/user/index.jsp");
				req.getRequestDispatcher("/views/layout_user.jsp").forward(req, resp);
			}
			break;
		case "/like-storage" :
			if(currentUser != null) {
				getListVideos("like-storage", req, resp);
				req.setAttribute("view", "/views/user/index.jsp");
				req.getRequestDispatcher("/views/layout_user.jsp").forward(req, resp);	
			}
			break;
		case "/sign-up":
			doSignUp(req, resp);
			break;
		case "/detail":
			viewDetailPage(req, resp);
			break;
		case "/sign-in":
			doSignIn(req, resp);
			break;
		case "/change-password":
			changePassService(req, resp);
			break;
		case "/forgot-password":
			req.setAttribute("view", "/views/user/forgot-pass.jsp");
			req.getRequestDispatcher("/views/layout_user.jsp").forward(req, resp);
			getListVideos("default", req, resp);
			break;
		case "/logout":
			doLogout(req, resp);
			break;
		case "/sendmail-reset-pass":
			sendMailForForgotPassword(req, resp);
			break;
		case "/change-language":
			doChangeLanguage(req, resp);
			break;
		}
	}
	private void doChangeLanguage(HttpServletRequest req, HttpServletResponse resp) {
		String lang = (String) req.getSession().getAttribute("lang");
		if(lang != null && lang.equals("vi")) {
			req.getSession().setAttribute("lang", "en");
		}else {
			req.getSession().setAttribute("lang", "vi");
		}
		
	}

	private void sendMailForForgotPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bodySend = "Mật khẩu mới của bạn là : ";
		String email = req.getParameter("email");
		String newPass = PasswordGenerator.generateRandomString();
		try {
			MyUser userUpdate = userService.findByEmail(email);
			userService.updatePassword(newPass, userUpdate);
			emailService.sendEmail(email, bodySend + newPass);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	private void changePassService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if(method.equals("POST")){
			String current_pass = req.getParameter("current_pass");
			String new_pass = req.getParameter("new_pass");
			String comfirm_new_pass = req.getParameter("comfirm_new_pass");
			MyUser curentUser = (MyUser) req.getSession().getAttribute(SessionUtils.CURRENT_USER);
			String checkChangePass = checkChangePass(current_pass, new_pass, comfirm_new_pass, curentUser);
			if(checkChangePass.equals("")) {
				//do change pass
				doChangePass(new_pass, curentUser);
//				req.getSession().setAttribute(SessionUtils.CURRENT_USER, userLogin);
				resp.sendRedirect(req.getContextPath() + "/index");	
				return;
			}else {
				req.setAttribute("error", checkChangePass);
				req.setAttribute("current_pass", current_pass);
				req.setAttribute("view", "/views/user/change-pass.jsp");
			}
		}else if(method.equals("GET")){
			req.setAttribute("view", "/views/user/change-pass.jsp");
		}
		req.getRequestDispatcher("/views/layout_user.jsp").forward(req, resp);
		
	}
	private void doChangePass(String new_pass, MyUser currentUser) {
		currentUser.setPassword(new_pass);
		userService.update(currentUser);
		
	}
	private String checkChangePass(String current_pass, String new_pass, String comfirm_new_pass, MyUser curentUser) {
		String error = "";
		if(!curentUser.getPassword().equals(current_pass)) {
			error = ErrorMessage.IN_CORRECT_PASS;
		}else {
			if(!new_pass.equals(comfirm_new_pass)) {
				error =  ErrorMessage.RE_PASSWORD_NOT_MATCH;
			}
		}
		return error;
	}
	private void doSignUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if(method.equals("POST")){
			MyUser userResgiter = new MyUser();
			try {
				BeanUtils.populate(userResgiter, req.getParameterMap());
				String re_password = req.getParameter("re_password");
				
				String checkRes = checkRegister(userResgiter, re_password);
				if(checkRes.equals("")) {
					userService.create(userResgiter);
					req.setAttribute("view", "/views/user/sign-in.jsp");
				}else {
					req.setAttribute("userResgiter", userResgiter);
					req.setAttribute("error", checkRes);
					req.setAttribute("view", "/views/user/sign-up.jsp");
				}
			} catch (Exception e) {
				req.setAttribute("error", e.getMessage());
				e.printStackTrace();
			}
		}else if(method.equals("GET")){
			req.setAttribute("view", "/views/user/sign-up.jsp");
		}
		req.getRequestDispatcher("/views/layout_user.jsp").forward(req, resp);
	}

	private void doLogout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().removeAttribute(SessionUtils.CURRENT_USER);
		resp.sendRedirect(req.getContextPath() + "/index");	
	}

	private void viewDetailPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Video videoDetail = videoService.findById(req.getParameter("id"));
		MyUser currentUser = (MyUser) req.getSession().getAttribute(SessionUtils.CURRENT_USER);
		VideoDto videoDto = convertToVideoDto(videoDetail, currentUser);
		
		if(currentUser != null) {
			historyService.createViewForUser(currentUser, videoDetail);
		}
		
		req.setAttribute("videoDetail", videoDto);
		getListVideos("default", req, resp);
		req.setAttribute("view", "/views/user/detail.jsp");
		req.getRequestDispatcher("/views/layout_user.jsp").forward(req, resp);
	}

	private void doSignIn(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String method = req.getMethod();
		if(method.equals("POST")){
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			MyUser userLogin = userService.login(username, password);
			if (userLogin != null) { // login success
				req.getSession().setAttribute(SessionUtils.CURRENT_USER, userLogin);
				if(userLogin.isAdmin()) {
					resp.sendRedirect(req.getContextPath() + "/admin/users");	
				}else {
					resp.sendRedirect(req.getContextPath() + "/index");	
				}

//				authSuccessFilter.redirectLoginSuccess(req, resp);
				return;
			} else {
				req.setAttribute("error", ErrorMessage.LOGIN_FAIL);
				req.setAttribute("username", username);
				req.setAttribute("password", password);
				req.setAttribute("view", "/views/user/sign-in.jsp");
			}
		}else if(method.equals("GET")){
			req.setAttribute("view", "/views/user/sign-in.jsp");
		}
		req.getRequestDispatcher("/views/layout_user.jsp").forward(req, resp);
	}
	private void getListVideos(String option, HttpServletRequest req, HttpServletResponse resp) {
		int currentPage = 1;
		String page = req.getParameter("page");
		
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		MyUser currentUser = (MyUser) req.getSession().getAttribute(SessionUtils.CURRENT_USER);	
		List<Video> listVideo = new ArrayList<Video>();
		switch (option) {
		case "like-storage":
			listVideo = videoService.findVideoIsLikedByUserId(currentUser.getId());
			break;
		case "history":
			listVideo = videoService.findVideoIsWatchedByUserId(currentUser.getId());
			break;
		default:
			listVideo = videoService.findAll(currentPage, ITEM_PER_PAGE);
			break;
		}
	
		List<VideoDto> listVideoDto = new ArrayList<>();
		
		for (Video video : listVideo) {
			VideoDto videoDto = convertToVideoDto(video, currentUser);
			listVideoDto.add(videoDto);
		}
		int totalItem  = videoService.findAll().size();
		
		
		System.out.println("currentPage : " + currentPage);
//		try {
//			currentPage = Integer.parseInt( req.getParameter("page"));
//		}catch(Exception e) {
//			e.getMessage();
//		}
		req.setAttribute("listVideos", listVideoDto);
		req.setAttribute("totalPages", (int) Math.ceil((double) totalItem / ITEM_PER_PAGE));
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalItems", totalItem);
	} 
	
	
	private String checkRegister(MyUser userResgiter, String re_password) {
		String error = "";
		if(!userResgiter.getPassword().equals(re_password)) {
			error = ErrorMessage.RE_PASSWORD_NOT_MATCH;
			return error;
		}
		MyUser checkUsername = userService.findByUsername(userResgiter.getId());
		if(checkUsername != null) {
			error = ErrorMessage.USERNAME_AREADY_EXIST;
			return error;
		}
		MyUser checkEmail = userService.findByEmail(userResgiter.getEmail());
		if(checkEmail != null) {
			error = ErrorMessage.EMAIL_AREADY_EXIST;
			return error;
		}
		return error;
	}
	
	private VideoDto convertToVideoDto(Video video, MyUser currentUser) {
		VideoDto videoDto = new VideoDto();
		videoDto.setId(video.getId());
		videoDto.setTitle(video.getTitle());
		videoDto.setPoster(video.getPoster());
		videoDto.setViews(video.getViews());
		videoDto.setDescription(video.getDescription());
		videoDto.setTotalLike(videoService.getTotalLike(video.getId()));
		if(currentUser != null) {
			videoDto.setIsLiked(videoService.checkIsLiked(currentUser.getId(), video.getId())); 
		}
		return videoDto;
	}	

}
