package api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import contants.SessionUtils;
import entity.MyUser;
import entity.Video;
import service.EmailService;
import service.FavoriteService;
import service.ShareService;
import service.VideoService;
import service.impl.EmailServiceImpl;
import service.impl.FavoriteServiceImpl;
import service.impl.ShareServiceImpl;
import service.impl.VideoServiceImpl;
import utils.PasswordGenerator;

@WebServlet({"/video/like-or-unlike", "/sendmail-share-video"})
public class VideoApi extends HttpServlet{
	
	private static final long serialVersionUID = 3026300151531690750L;
	
	private final VideoService videoService;
	private final FavoriteService favoriteService;
	private final EmailService emailService;
	private final ShareService shareService;
	
	public VideoApi() {
		videoService = new VideoServiceImpl();
		favoriteService = new FavoriteServiceImpl();
		emailService  = new EmailServiceImpl();
		shareService  = new ShareServiceImpl();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		String uri = req.getRequestURI();
		MyUser curentUser = (MyUser) req.getSession().getAttribute(SessionUtils.CURRENT_USER);
		
		if(uri.contains("like-or-unlike")) {
			doLikeAndUnlike(req, resp);
		}else if(uri.contains("sendmail-share-video")) {
			if(curentUser != null) {
				doLikeShareVideo(curentUser, req, resp);	
			}
		}
	}

	private void doLikeShareVideo(MyUser curentUser, HttpServletRequest req, HttpServletResponse resp) {
		String emails = req.getParameter("emails");
		String videoId = req.getParameter("videoId");
		String bodySend = "<a href=\"https://www.youtube.com/watch?v="+ videoId+"\">Nhấp vào đây để xem video</a>";
		try {
			Video video  = videoService.findById(videoId); 
			shareService.insert(curentUser, video, emails);
			emailService.sendEmailsWithManyRecipient(curentUser.getEmail() ,emails, bodySend);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	private void doLikeAndUnlike(HttpServletRequest req, HttpServletResponse resp) {
		String videoId = req.getParameter("id");
		MyUser currentUser = (MyUser) req.getSession().getAttribute(SessionUtils.CURRENT_USER);
		if(currentUser != null) {
			favoriteService.likeOrUnlike(currentUser, videoId);
			System.out.println("do create like ....");
		}
	}
}
