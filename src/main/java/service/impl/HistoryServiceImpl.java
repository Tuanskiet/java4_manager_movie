package service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import dao.HistoryDAO;
import dao.impl.HistoryDAOImpl;
import entity.History;
import entity.MyUser;
import entity.Video;
import service.HistoryService;
import service.VideoService;


public class HistoryServiceImpl implements HistoryService {

	private HistoryDAO dao;
	private VideoService videoService;

	public HistoryServiceImpl() {
		dao = new HistoryDAOImpl();
		videoService = new VideoServiceImpl();
	}

//	@Override
//	public List<History> findByUser(String username) {
//		// TODO Auto-generated method stub
//		return dao.findByUser(username);
//	}
//
//	@Override
//	public List<History> findByUserAndIsLiked(String username) {
//		// TODO Auto-generated method stub
//		return dao.findByUserAndIsLiked(username);
//	}
//
	@Override
	public History findByUserIdAndVideoId(String userId, String videoId) {
		// TODO Auto-generated method stub
		return dao.findByUserIdAndVideoId(userId, videoId);
	}
//
//	@Override
//	public History create(MyUser user, Video video) {
//		History existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
//		if (existHistory == null) {
//			existHistory = new History();
//			existHistory.setUser(user);
//			existHistory.setVideo(video);
////			existHistory.setViewedDate(new Timestamp(System.currentTimeMillis()));
////			existHistory.setIsLiked(Boolean.FALSE);
//			dao.create(existHistory);
//		}
//		return existHistory;
//	}
//
//	@Override
//	public boolean updateLikeOrUnlike(MyUser user, String videoHref) {
//		// TODO Auto-generated method stub
//		Video video = videoService.findByHref(videoHref);
//		History existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
//		
////		if (existHistory.getIsLiked() == Boolean.FALSE) {
////			existHistory.setIsLiked(Boolean.TRUE);
////			existHistory.setLikedDate(new Timestamp(System.currentTimeMillis()));
////		} else {
////			existHistory.setIsLiked(Boolean.FALSE);
////			existHistory.setLikedDate(null);
////		}
//		History updateHistory = dao.update(existHistory);
//		return updateHistory != null ? true : false;
//	}

//	@Override
//	public List<History> findUsersLikedByVideoHref(String href) {
//		// TODO Auto-generated method stub
//		Map<String, Object> params = new HashMap<>();
//		params.put("videoHref",href);
//		return dao.findUsersLikedByVideoHref(params);
//	}

	@Override
	public History createViewForUser(MyUser user, Video video) {
		History checkExist = findByUserIdAndVideoId(user.getId(), video.getId());
		if(checkExist == null) {
			History history = new History(user, video);
			video.setViews(video.getViews() + 1);
			videoService.update(video);
			return dao.create(history);
		}
		return null;
	}

}
