package service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.FavoriteDAO;
import dao.HistoryDAO;
import dao.impl.FavoriteDaoImpl;
import dao.impl.HistoryDAOImpl;
import entity.Favourite;
import entity.History;
import entity.MyUser;
import entity.Video;
import service.FavoriteService;
import service.HistoryService;
import service.VideoService;


public class FavoriteServiceImpl implements FavoriteService {

	private VideoService videoService ;
	private FavoriteDAO dao;


	public FavoriteServiceImpl() {
		dao = new FavoriteDaoImpl();
		videoService = new VideoServiceImpl();
	}

	@Override
	public Favourite likeOrUnlike(MyUser user, String videoId) {
		Favourite favourite = findByUserIdAndVideoId(user.getId(), videoId);
		Video videoLike = videoService.findById(videoId);
		if(favourite == null) {
			Favourite newFavourite = new Favourite(user, videoLike, new Date());
			return dao.create(newFavourite);
		}else {
			return dao.delete(favourite);
		}
	}

	public Favourite findByUserIdAndVideoId(String userId, String videoId) {
		// TODO Auto-generated method stub
		return dao.findByUserIdAndVideoId(userId, videoId);
	}
	@Override
	public List<Favourite> getListUserFavouriteByVideo(String videoID) {
		return dao.getListUserFavouriteByVideo(videoID);
	}
}
