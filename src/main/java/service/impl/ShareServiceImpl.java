package service.impl;

import java.util.Date;
import java.util.List;

import dao.FavoriteDAO;
import dao.ShareDAO;
import dao.impl.FavoriteDaoImpl;
import dao.impl.ShareDaoImpl;
import entity.MyUser;
import entity.Share;
import entity.Video;
import service.ShareService;
import service.VideoService;

public class ShareServiceImpl implements ShareService {

	private VideoService videoService ;
	private ShareDAO dao;


	public ShareServiceImpl() {
		dao = new ShareDaoImpl();
		videoService = new VideoServiceImpl();
	}


	@Override
	public Share insert(MyUser curentUser, Video video, String emails) {
		Share share = new Share();
		share.setUser(curentUser);
		share.setVideo(video);
		share.setEmail(emails);
		share.setShareDate(new Date());
		return dao.create(share);
	}


	@Override
	public List<Share> findByVideo(String videoId) {
		return dao.findByVideo(videoId);
	}

	

}
