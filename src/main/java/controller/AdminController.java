package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

import entity.Favourite;
import entity.MyUser;
import entity.Report;
import entity.Share;
import entity.Video;
import service.FavoriteService;
import service.ReportService;
import service.ShareService;
import service.UserService;
import service.VideoService;
import service.impl.FavoriteServiceImpl;
import service.impl.ShareServiceImpl;
import service.impl.UserServiceImpl;
import service.impl.VideoServiceImpl;

@WebServlet({ "/admin/users", "/admin/videos", "/admin/reports",
	"/admin/users/edit", "/admin/users/update", "/admin/users/delete",
	"/admin/videos/edit", "/admin/videos/update", "/admin/videos/delete",
	"/admin/videos/create", "/admin/reports/favourite-user", "/admin/reports/share-friends"
})
public class AdminController extends HttpServlet {

	private static final int ITEM_PER_PAGE = 6;
	private final UserService userService;
	private final VideoService videoService;
	private final ReportService reportService;
	private final FavoriteService favoriteService;
	private final ShareService shareService;
	
	public AdminController() {
		userService = new UserServiceImpl();
		videoService = new VideoServiceImpl();
		reportService = new ReportService();
		favoriteService = new FavoriteServiceImpl();
		shareService = new ShareServiceImpl();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String servletPath = req.getServletPath();
		switch (servletPath) {
		case "/admin/users":
			showDataUser(req, resp);
			break;
		case "/admin/users/edit":
			doEditUser(req, resp);
			break;
		case "/admin/users/update":
			doUpdateUser(req, resp);
			break;
		case "/admin/users/delete":
			doDeleteUser(req, resp);
			break;
		case "/admin/videos":
			showDataVideo(req, resp);
			break;
		case "/admin/videos/create":
			doCreateVideo(req, resp);
			break;
		case "/admin/videos/edit":
			doEditVideo(req, resp);
			break;
		case "/admin/videos/update":
			doUpdateVideo(req, resp);
			break;
		case "/admin/videos/delete":
			doDeleteVideo(req, resp);
			break;
		case "/admin/reports":
			initDataReport(req, resp);
			break;
		case "/admin/reports/favourite-user":
			changeDataFavouriteUser(req, resp);
			break;
		case "/admin/reports/share-friends":
			changeDataShareFriendByVideo(req, resp);
			break;
		}

	}

	private void changeDataShareFriendByVideo(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		PrintWriter printWriter = resp.getWriter();
		resp.setContentType("application/json");
		String videoId = req.getParameter("videoId");
		List<Share> shares = shareService.findByVideo(videoId);
		ObjectMapper objectMapper = new ObjectMapper();
		if(shares.isEmpty()) {
			resp.setStatus(404);
		}else {
			String dataRes = objectMapper.writeValueAsString(shares);
			printWriter.print(dataRes);
			printWriter.flush();
		}
	}

	private void changeDataFavouriteUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		PrintWriter printWriter = resp.getWriter();
		resp.setContentType("application/json");
		
		String videoId = req.getParameter("videoId");
		List<Favourite> listUserFavouriteByVideo = favoriteService.getListUserFavouriteByVideo(videoId);
		ObjectMapper objectMapper = new ObjectMapper();
		if(listUserFavouriteByVideo.isEmpty()) {
			resp.setStatus(404);
		}else {
			String dataRes = objectMapper.writeValueAsString(listUserFavouriteByVideo);
			printWriter.print(dataRes);
			printWriter.flush();
		}
		
		
	}

	private void initDataReport(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Report> listFavouriteRP = reportService.getListFavouriteRP();
		Map<String, String> listVideoTitle = videoService.getListVideoTitle();
		List<Favourite> listUserFavouriteByVideo = favoriteService.getListUserFavouriteByVideo("WfGn1yTL8TI");
		List<Share> shares = shareService.findByVideo("WfGn1yTL8TI");
		
		
		req.setAttribute("shares", shares);
		req.setAttribute("listVideoTitle", listVideoTitle);
		req.setAttribute("listFavouriteRP", listFavouriteRP);
		req.setAttribute("listUserFavouriteByVideo", listUserFavouriteByVideo);
		req.setAttribute("view", "/views/admin/report.jsp");
		req.getRequestDispatcher("/views/admin/layout_admin.jsp").forward(req, resp);
	}

	private void showDataVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Video> videos = videoService.findAllWithActiveAndNot(1, ITEM_PER_PAGE);
		int totalItem = videoService.findAll().size();
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {
			e.getMessage();
		}
		req.setAttribute("listVideos", videos);
		req.setAttribute("totalPages", (int) Math.ceil((double) totalItem / ITEM_PER_PAGE));
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalItems", totalItem);
		
		req.setAttribute("view", "/views/admin/manager_video.jsp");
		req.getRequestDispatcher("/views/admin/layout_admin.jsp").forward(req, resp);
		
	}
	

	private void doEditVideo(HttpServletRequest req, HttpServletResponse resp) {
		String videoId = req.getParameter("videoId");
		Video videoEdit  = videoService.findById(videoId);
		responseJsonObject( resp, videoEdit);
		
	}

	private void doDeleteVideo(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String id = req.getParameter("id");
		videoService.delete(id);
    	resp.sendRedirect(req.getContextPath() + "/admin/videos");
		
	}

	private void doUpdateVideo(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Video videoUpdate = new Video();
		try {
			BeanUtils.populate(videoUpdate, req.getParameterMap());
			boolean status = Boolean.parseBoolean(req.getParameter("status"));
			videoUpdate.setActive(status);
			
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		videoService.update(videoUpdate);
    	resp.sendRedirect(req.getContextPath() + "/admin/videos");	
		
	}


	private void doCreateVideo(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		PrintWriter printWriter = resp.getWriter();
		Video newVideo = new Video();
		try {
			BeanUtils.populate(newVideo, req.getParameterMap());
			boolean status = Boolean.parseBoolean(req.getParameter("status"));
			newVideo.setActive(status);
			
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Video checkExist = videoService.findById(newVideo.getId());
		if(checkExist == null) {
			videoService.create(newVideo);
			printWriter.print("CREATED");
		}else {
			printWriter.print("DUPLICATE");
		}
	}

	private void doDeleteUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String id = req.getParameter("id");
		userService.delete(id);
    	resp.sendRedirect(req.getContextPath() + "/admin/users");	
	}

	private void doUpdateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MyUser myUser = new MyUser();
		try {
			BeanUtils.populate(myUser, req.getParameterMap());
			boolean role = Boolean.parseBoolean(req.getParameter("role"));
			myUser.setAdmin(role);
			
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		userService.update(myUser);
    	resp.sendRedirect(req.getContextPath() + "/admin/users");	
		
	}

	private void doEditUser(HttpServletRequest req, HttpServletResponse resp) {
		String userId = req.getParameter("userId");
		MyUser userEdit  = userService.findByUsername(userId);
		responseJsonObject( resp, userEdit);
	}
	


	private void showDataUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<MyUser> listUsers = userService.findAll(1, ITEM_PER_PAGE);
		int totalItem = 0;
		if (listUsers.size() > 0)
			totalItem = listUsers.size();
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {
			e.getMessage();
		}
		req.setAttribute("listUsers", listUsers);
		req.setAttribute("totalPages", (int) Math.ceil((double) totalItem / ITEM_PER_PAGE));
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalItems", totalItem);

		req.setAttribute("view", "/views/admin/manager_user.jsp");
		req.getRequestDispatcher("/views/admin/layout_admin.jsp").forward(req, resp);
	}
	
	
	
	private void responseJsonObject( HttpServletResponse resp, Object data) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			resp.setContentType("application/json");
			String userJson = objectMapper.writeValueAsString(data);
			resp.getWriter().write(userJson);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
